<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Додати гурток</title>
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


  <h2>  Всього батьків: ${fn:length(allParents)} </h2>
  <h2>Батьки</h2>
    <div>
    <table>
        <thead>
        <th>ID</th>
        <th>Ім'я</th>
        <th>Прізвище</th>
        <th>Стать</th>
        <th>Номер телефону</th>
        <th>Місце роботи</th>
        <th>Службовий номер телефону</th>
        </thead>
        <c:forEach items="${allParents}" var="parent">
          <tr>
            <td>${parent.id}</td>
            <td>${parent.name}</td>
            <td>${parent.surname}</td>
            <td>${parent.gender}</td>
            <td>${parent.phone}</td>
            <td>${parent.job}</td>
            <td>${parent.jobPhone}</td>
          
              <td>
                <form action="${pageContext.request.contextPath}/admin/edit-parent" method="get">
                  <input type="hidden" name="parentId" value="${parent.id}"/>
                  <button type="submit">Edit</button>
                </form>



                <form action="${pageContext.request.contextPath}/admin/parents" method="post">
                  <input type="hidden" name="parentId" value="${parent.id}"/>
                  <input type="hidden" name="action" value="delete"/>
                  <button type="submit">Delete</button>
                </form>
              </td>
          </tr>
        </c:forEach>
      </table>
    </div>

</div>
</body>
</html>