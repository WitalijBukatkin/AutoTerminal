<?php
/**
 * Created by PhpStorm.
 * User: vitalijbukatkin
 * Date: 18.06.2018
 * Time: 17:38
 */

session_start();

$db=new mysqli("localhost:3306", "root");
$db->select_db("autoterminal");
$db->set_charset('utf8');

$fields=$_POST["field"];
$line=$_POST["line"];
$tname=$_SESSION["tname"];

header("Location: ../../table.php?tname=".$tname);

switch($_SESSION["tname"]){
    case "1":
        $name="Рейсы"; break;
    case "2":
        $name="Маршруты"; break;
    case "3":
        $name="Автобусы"; break;
    case "4":
        $name="Водители"; break;
    case "5":
        $name="Кондуктора"; break;
    case "6":
        $name="Дни движения"; break;
    case "7":
        $name="Остановки"; break;
    case "8":
        $name="Пункты назначения"; break;
}

if($line==null){
    switch($tname){
        case "1":
            $query="insert into `Рейсы` values(null, '$fields[0]', '$fields[1]', '$fields[2]', '$fields[3]', '$fields[4]', (select id from `Водители` where `Фамилия`='$fields[5]'), (select id from `Кондуктора` where `Фамилия`='$fields[6]'));";
            break;
        case "2":
            $query="insert into `Маршруты` values(null, '$fields[0]', (select id from `Пункты назначения` where `Пункт назначения`='$fields[1]'), (select id from `Дни движения` where `День`='$fields[2]'), '$fields[3]')";
            break;
        default:
            $query="insert into `$name` values(null";
            foreach($fields as $i)
                $query.=", '$i'";
            $query.=")";
            break;
    }
    print $query;
    if(!$db->query($query))
        $_SESSION["message-error"]="Не могу добавить строку в таблицу";
}
else{
    if($_POST['remove']=='1'){
        $query="delete from `$name` where `id`='$line'";
        if(!$db->query($query))
            $_SESSION["message-error"]="Не могу удалить эту строку!";
    }
    else {
        switch($tname){
            case "1":
                $query="update `Рейсы` set `Время отправления`='$fields[0]', `Время прибытия`='$fields[1]',	`Маршрут`='$fields[2]',	`Автобус`='$fields[3]',	`Цена`='$fields[4]',
                `Водитель`=(select id from `Водители` where `Фамилия`='$fields[5]'),	`Кондуктор`=(select id from `Кондуктора` where `Фамилия`='$fields[6]') where `id`='$line'";
                break;
            case "2":
                $query="update `Маршруты` set `Пункт отправления`='$fields[0]',	`Пункт назначения`=(select id from `Пункты назначения` where `Пункт назначения`='$fields[1]'),	`День`=(select id from `Дни движения` where `День`='$fields[2]'),	`Время в пути`='$fields[3]'  where `id`='$line'";
                break;
            case "3":
                $query="update `Автобусы` set `Марка`='$fields[0]',	`Номер`='$fields[1]',	`Число мест`='$fields[2]' where `id`='$line'";
                break;
            case "4":
                $query="update `Водители` set `Фамилия`='$fields[0]',	`Имя`='$fields[1]',	`Отчество`='$fields[2]' where `id`='$line'";
                break;
            case "5":
                $query="update `Кондуктора` set `Фамилия`='$fields[0]',	`Имя`='$fields[1]',	`Отчество`='$fields[2]' where `id`='$line'";
                break;
            case "6":
                $query="update `Дни движения` set `День`='$fields[0]' where `id`='$line'";
                break;
            case "7":
                $query="update `Остановки` set `Остановка`='$fields[0]', `Маршрут`='$fields[1]'  where `id`='$line'";
                break;
            case "8":
                $query="update `Пункты назначения` set `Пункт назначения`='$fields[0]' where `id`='$line'";
                break;
        }
        if (!$db->query($query))
            $_SESSION["message-error"] = "Не могу обновить строку в таблице";
    }
}