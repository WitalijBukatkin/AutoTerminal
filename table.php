<?php session_start() ?>
<html>
<head>
    <meta charset="utf-8"/>
    <link href="assets/css/main.css" rel="stylesheet">
    <link href="assets/css/table.css" rel="stylesheet">
    <link href="assets/css/record.css" rel="stylesheet">
    <script src="assets/js/table.js"></script>
</head>
<body>
<div class="main-container">
    <div class="close"><a href="index.php" type="submit">&times;</a></div>
    <?php
        $_SESSION["tname"]=$_GET["tname"];
        switch($_SESSION["tname"]){
            case 1:
                $name="Рейсы"; break;
            case 2:
                $name="Маршруты"; break;
            case 3:
                $name="Автобусы"; break;
            case 4:
                $name="Водители"; break;
            case 5:
                $name="Кондуктора"; break;
            case 6:
                $name="Дни движения"; break;
            case 7:
                $name="Остановки"; break;
            case 8:
                $name="Пункты назначения"; break;
        }
        print "<h2>$name</h2>";
    ?>
    <div class="table">
        <?php
            $db=new mysqli("localhost:3306", "root");
            $db->select_db("autoterminal");
            $db->set_charset('utf8');
            print "<div align='center'>";
                print "<table>\n<tr>";
                switch($_SESSION["tname"]){
                    case 1:
                        $query=$db->query("select id, `Время отправления`, `Время прибытия`, `Маршрут`, `Автобус`, `Цена`, 
                        (select `Фамилия` from `Водители` where id=`Рейсы`.`Водитель`) `Водитель`, (select `Фамилия` from `Кондуктора` where id=`Рейсы`.`Кондуктор`) `Кондуктор`  from `Рейсы`;");
                        break;
                    case 2:
                        $query=$db->query("select id, `Пункт отправления`, (select `Пункт назначения` from `Пункты назначения` where id=`Маршруты`.`Пункт назначения`) `Пункт назначения`, 
                        (select `День` from `Дни движения` where id=`Маршруты`.`День`) `День`, `Время в пути`  from `Маршруты`");
                        break;
                    default:
                        $query=$db->query("select * from `$name`");
                        break;
                }
                for($i=0; $array=$query->fetch_field(); $i++)
                    print "<th>".$th[$i]=$array->name."</th>";
                print "</tr>";
                for($i=1; $array=$query->fetch_row(); $i++) {
                    print "<tr onclick=\"onClick($i);\">";
                    foreach ($array as $item)
                        print "<td>$item</td>";
                    print "</tr>";
                }
                print "</table>\n</div>";
            ?>
    </div>
    <div align="right" class="menuButton">
        <button id="addButton" onclick="document.getElementsByClassName('addRecord')[0].style.display='block'">Добавить</button>
        <button style="margin-right: 20px" id="editButton" onclick="editClick();">Изменить</button>
    </div>

    <div class="addRecord record">
        <form class="form" action="assets/php/handler.php" method="post">
            <div class="close">
                <a onclick="document.getElementsByClassName('addRecord')[0].style.display='none'">&times;</a>
            </div>
            <div class="container">
                <?php
                    for($i=1; $i<count($th); $i++)
                        print "<label><b>$th[$i]</b><input type=\"text\" name=\"field[]\"></label>";
                ?>
                <div align="right" class="button">
                    <button type="submit">Добавить</button>
                    <button onclick="document.getElementsByClassName('addRecord')[0].style.display='none'">Отмена</button>
                </div>
            </div>
        </form>
    </div>
    <div class="editRecord record">
        <form class="form" action="assets/php/handler.php" method="post">
            <input style="display: none" type="text" name="line" value="">
            <input style="display: none" type="text" name="remove">
            <div class="close">
                <a onclick="document.getElementsByClassName('editRecord')[0].style.display='none'">&times;</a>
            </div>
            <div class="container">
                <?php
                    for($i=1; $i<count($th); $i++)
                        print "<label><b>$th[$i]</b><input type=\"text\" name=\"field[]\" required></label>";
                ?>
                <div align="right" class="button">
                    <button type="submit" onclick="document.getElementsByName('remove')[0].setAttribute('value', '1')">Удалить</button>
                    <button type="submit">Изменить</button>
                    <button onclick="document.getElementsByClassName('editRecord')[0].style.display='none'">Отмена</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <?php
        if(isset($_SESSION["message-error"])) {
            print("<script>alert('" . $_SESSION["message-error"] . "');</script>");
            session_destroy();
        }
    ?>
</body>
</html>