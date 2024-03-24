<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Головна</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


</head>


<body>

 <jsp:include page="${contextPath}/resources/jsp/menu.jsp"></jsp:include>






<div class="block">

<div class="foreground-gradient">
<div class="left-centered">

<div>
<h1>
Gurtkivets
</h1>
<p>
Система управління закладами позашкільної освіти
</p>



</div>
<img src="https://cdn3d.iconscout.com/3d/premium/thumb/education-7092162-5753353.png?f=webp"/>
</div>
</div>

<div class="background-gradient-1">

    </div>
</div>
</div>
</div>
</div>


<div class = "section">
<div class="section-header">
<h2> Останні Новини </h2>
</div>

<div class = "carousel-wrapper">
<div class = "carousel-card-wrapper">
<ul class="carousel" data-target="carousel">
<c:forEach items="${news}" var="n">
        <li class="card" data-target="card">
         <a href="news?id=${n.id}"> <h3>${n.title}</h3> </a><h5><i class='bx bx-calendar' ></i> ${n.publish_date}</h5><p>${n.text}</p>
        </li>
        </c:forEach>

      </ul>

</div>

</div>
</div>


</div>

<div class = "section">
<div class="section-header">
<h2> Гуртки сьогодні </h2>
<a href="/classes">Усі гуртки</a>
</div>
<div id="filter-buttons-container">
        <button class="filter-button" onclick="filterSelection('all')"> Всі</button>
        <c:forEach items="${typeClasses}" var="type">
        <button class="filter-button" onclick="filterSelection('${type.name}')"> ${type.name}</button>
        </c:forEach>

</div>
<div>
     <table class="main-table">
        <thead>
        <th>Назва</th>
        <th>Тип</th>
        <th>Викладач</th>
        <th>Розклад на сьогодні</th>
        </thead>
        <c:forEach items="${allClasses}" var="classes">
          <tr class="filter ${classes.typeClass.name}">
              <td>${classes.name}</td>
              <td>${classes.typeClass.name}</td>
          <td>  <c:forEach items="${classes.staff}" var="staff">
              ${staff.name}
              ${staff.surname}
          </c:forEach>
          </td>
          <td>
                      <table>

                      <c:forEach items="${classes.schedules}" var="schedule">
                      <tr>
                      <td>
                      ${schedule.time_start}
                      -
                      ${schedule.time_end}
                      </td>

                      </tr>
                            </c:forEach>
                      </table>
                      </td>

          <td>
              <form action="${pageContext.request.contextPath}/classes/details" method="get">
                <input type="hidden" name="classesId" value="${classes.id}"/>
                <button type="submit">Детальніше</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>

</div>

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
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>

</body>
</html>