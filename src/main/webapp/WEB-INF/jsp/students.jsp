<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Гуртківці</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sidemenu.css">
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
</head>

<body>


<jsp:include page="${contextPath}/resources/jsp/side-menu.jsp"></jsp:include>
<div class = "container" style="margin-left:350px;margin-top:50px;">



<div>
  <h2>  Всього гуртківців: ${fn:length(allStudents)} </h2>
  <h2>  Гуртківці </h2>
<div id="filter-buttons-container">
        <button class="filter-button active" onclick="filterSelection('all')"> Всі</button>
        </br>
        <p>Клас</p>
        <c:forEach begin="1" end="11" step="1" var="row">
        <button class="filter-button" onclick="filterSelection('${row}')"> ${row}</button>
        </c:forEach>
        </br>
        <p>Стать</p>
        <button class="filter-button" onclick="filterSelection('Чоловік')"> Чоловік</button>
        <button class="filter-button" onclick="filterSelection('Жінка')"> Жінка</button>
  <table id="student_table">
    <thead>
    <th>ID</th>
    <th>Ім'я</th>
    <th>Прізвище</th>
    <th>Стать</th>
    <th>Дата народження</th>
    <th>Номер телефону</th>
    <th>Адреса</th>
    <th>Школа</th>
    <th>Клас</th>
    <th>Інші гуртки</th>
    </thead>
    <c:forEach items="${allStudents}" var="student">
      <tr class="filter ${student.form} ${student.gender}">
        <td>${student.id}</td>
        <td>${student.name}</td>
        <td>${student.surname}</td>
        <td>${student.gender}</td>
        <td>${student.birthdate}</td>
        <td>${student.phone}</td>
        <td>${student.adress}</td>
        <td>${student.school}</td>
        <td>${student.form}</td>
        <td>${student.otherClasses}</td>
        <td>
         <form action="${pageContext.request.contextPath}/admin/edit-student" method="get">
                          <input type="hidden" name="studentId" value="${student.id}"/>
                          <button type="submit">Edit</button>
                        </form>

          <form action="${pageContext.request.contextPath}/admin/students" method="post">
            <input type="hidden" name="userId" value="${student.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button type="submit">Delete</button>
          </form>

        </td>


      </tr>
    </c:forEach>
  </table>


  <script src="https://cdn.sheetjs.com/xlsx-0.19.3/package/dist/xlsx.full.min.js"></script>
       <button id="btn-export"><b>Експортувати в Excel</b></button>

          <script>
          const name = 'student_table';

          const exportButton = document.getElementById('btn-export');

          const table = document.getElementById(name);

          exportButton.addEventListener('click', () => {
            const wb = XLSX.utils.table_to_book(table, {sheet: 'sheet-1'});
            XLSX.writeFile(wb, name+'.xlsx');
          });

          </script>

<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filter");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    AddClass(x[i], "hide");
    if (x[i].className.indexOf(c) > -1) RemoveClass(x[i], "hide");
  }
}

function AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}


function RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}


var btnContainer = document.getElementById("filter-buttons-container");
var btns = btnContainer.getElementsByClassName("filter-button");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName(" active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>
</div>
</body>
</html>