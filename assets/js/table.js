let select;
function onClick(line){
    const arr = document.getElementsByClassName('main-container')[0].getElementsByTagName("tr");
    for(let i=0; i<arr.length; i++) arr[i].bgColor="";
    arr[line].bgColor="#c6ff94"; select=line;
    line=document.getElementsByClassName('main-container')[0].getElementsByTagName("tr")[line].getElementsByTagName("td")[0].innerHTML;
    document.getElementsByName("line")[0].setAttribute("value", line);
}

function editClick() {
    let line=document.getElementsByName("line")[0].getAttribute("value");
    if(line==="") alert("Выберите строку");
    else document.getElementsByClassName('editRecord')[0].style.display='block';
    let arr=document.getElementsByClassName('main-container')[0].getElementsByTagName("tr")[select].getElementsByTagName("td");
    for(let i=1;i<arr.length;i++)
        document.getElementsByClassName("editRecord")[0].getElementsByTagName("input")[i+1].setAttribute("value", arr[i].innerHTML);
}