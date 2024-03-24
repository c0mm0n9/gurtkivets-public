<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Гуртки</title>
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
   <h2>Список гуртків</h2>
   <table class="main-table">
    <thead>
    <th>Назва</th>
    <th>Тип</th>
    <th>Викладач</th>
    </thead>
    <c:forEach items="${allClasses}" var="classes">
      <tr>
          <td>${classes.name}</td>
          <td>${classes.typeClass.name}</td>
      <td>  <c:forEach items="${classes.staff}" var="staff">  
          ${staff.name}
          ${staff.surname}
      </c:forEach>
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
</body>

