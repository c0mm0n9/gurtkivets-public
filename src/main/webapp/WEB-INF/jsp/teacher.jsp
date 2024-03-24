<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Панель працівника</title>

  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sidemenu.css">
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
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
<h2>Працівник<h2>
  <h3>Персональні дані</h3>
  <table>
    <thead>
    <th>Ім'я</th>
    <th>Прізвище</th>
    <th>Номер телефону</th>
    <th>Адреса</th>
    </thead>
      <tr>
        <td>${staff.name}</td>
        <td>${staff.surname}</td>
        <td>${staff.phone}</td>
        <td>${staff.adress}</td>
      </tr>
  </table>
</div>

<div>
  <h2>  Всього занять: ${fn:length(staffClasses)} </h2>
  <h2>Заняття</h2>
    <table >
        <thead>
        <th>ID</th>
        <th>Назва</th>
        <th>Опис</th>
        <th>Розклад</th>
        <th>Кількість учнів</th>
       <!-- <th>Дії</th>-->
        </thead>
        <c:forEach items="${staffClasses}" var="classes">
          <tr>
              <td>${classes.id}</td>
              <td>${classes.name}</td>
              <td>${classes.description}</td>
<td>
<table >
<th>День</th>
<th>Час початку</th>
<th>Час закінчення</th>
<th>Кабінет</th>
<c:forEach items="${classes.schedules}" var="schedule">
<tr>
<td>
${schedule.day}
</td>
<td>
${schedule.time_start}
</td>
<td>
${schedule.time_end}
</td>
<td>
${schedule.room.name}
</td>
</tr>
      </c:forEach>
</table>
          <td>  
              ${fn:length(classes.student)}
          </td>
        <td>
             <form action="${pageContext.request.contextPath}/employee/edit-classes" method="get">
                <input type="hidden" name="classesId" value="${classes.id}"/>
                <button type="submit">Edit</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
        </table>
        </div>
  </body>
  </html>