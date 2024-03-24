<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Гуртки</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sidemenu.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
</head>

<body>


<jsp:include page="${contextPath}/resources/jsp/side-menu.jsp"></jsp:include>

<div style="margin-left:350px;margin-top:50px;">
<div>
<h2>  Всього занять: ${fn:length(allClasses)} </h2>
<h2>Заняття</h2>
  <table id="classes_table">
      <thead>
      <th>ID</th>
      <th>Назва</th>
      <th>Опис</th>
      <th>Тип</th>
      <th>Розклад</th>
      <th>Викладач</th>
      <th>Кількість учнів</th>
      <th>Дії</th>
      </thead>
      <c:forEach items="${allClasses}" var="classes">
        <tr>
            <td>${classes.id}</td>
            <td>${classes.name}</td>
            <td>${classes.description}</td>
            <td>${classes.typeClass.name}</td>
            <td>
            <table>
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
            </td>

        <td>  <c:forEach items="${classes.staff}" var="staff">  
            ${staff.name}
            ${staff.surname}
        </c:forEach>
        </td>
        <td>  
            ${fn:length(classes.student)}
        </td>
        <td>
            <form action="${pageContext.request.contextPath}/admin/edit-classes" method="get">
              <input type="hidden" name="classesId" value="${classes.id}"/>
              <button type="submit">Edit</button>
            </form>
            <form action="${pageContext.request.contextPath}/admin/classes" method="post">
              <input type="hidden" name="classesId" value="${classes.id}"/>
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
            const name = 'classes_table';

            const exportButton = document.getElementById('btn-export');

            const table = document.getElementById(name);

            exportButton.addEventListener('click', () => {
              const wb = XLSX.utils.table_to_book(table, {sheet: 'sheet-1'});
              XLSX.writeFile(wb, name+'.xlsx');
            });

            </script>

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
      </table>
      </div>
            </div>
  

</body>
</html>