<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Гурток</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</head>
<body>
<jsp:include page="${contextPath}/resources/jsp/menu.jsp"></jsp:include>

   <div class="section">
    <h1>Гурток ${classes.name}</h1>
    <h1>Опис:</h1>
    <h3>${classes.description}</h3>

    <c:forEach items="${classes.staff}" var="staff">
    <h1>Викладач:</h1><h3>
            ${staff.name}
            ${staff.surname}
        </c:forEach>
    </h3>
    <h1>Розклад:</h1>
    <div>
     <table class="main-table">
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
    </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
          $(document).ready(function() {
            $('.schedule-cell').each(function() {
              var jsonData = JSON.parse($(this).text());
              var allKeys = [];


$.each(jsonData, function(index, value) {
  $.each(value, function(key, value) {
    if ($.inArray(key, allKeys) === -1) {
      allKeys.push(key);
    }
  });
});

var htmlString = "<table><thead><tr>";


$.each(allKeys, function(index, value) {
  htmlString += "<th>" + value + "</th>";
});


htmlString += "</tr></thead><tbody>";


$.each(jsonData, function(index, value) {
  htmlString += "<tr>";


  $.each(allKeys, function(index, key) {
  
    if (value.hasOwnProperty(key)) {

      if (value[key] == null || typeof value[key] === 'undefined') {
        value[key] = '';
      }
      htmlString += "<td>" + value[key] + "</td>";
    } else {

      htmlString += "<td></td>";
    }
  });


  htmlString += "</tr>";
});


htmlString += "</tbody></table>";
              $(this).html(htmlString);
            });
          });
        </script>
</body>