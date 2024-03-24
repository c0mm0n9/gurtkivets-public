<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Користувачі</title>
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
  <h2>  Всього користувачів: ${fn:length(allUsers)} </h2>
  <h2>  Користувачі </h2>
  <table id="user_table">
    <thead>
    <th>ID</th>
    <th>UserName</th>
    <th>Email</th>
    <th>Roles</th>
    </thead>
    <c:forEach items="${allUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>
          <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
        </td>
        <td>
          <form action="${pageContext.request.contextPath}/admin/users" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button type="submit">Delete</button>
          </form>
          <form action="${pageContext.request.contextPath}/admin/edit-user" method="get">
            <input type="hidden" name="userId" value="${user.id}"/>
            <button type="submit">Edit</button>
          </form>
        </td>

      </tr>
    </c:forEach>
  </table>

  <script src="https://cdn.sheetjs.com/xlsx-0.19.3/package/dist/xlsx.full.min.js"></script>
     <button id="btn-export"><b>Експортувати в Excel</b></button>

        <script>
        const name = 'user_table';

        const exportButton = document.getElementById('btn-export');

        const table = document.getElementById(name);

        exportButton.addEventListener('click', () => {
          const wb = XLSX.utils.table_to_book(table, {sheet: 'sheet-1'});
          XLSX.writeFile(wb, name+'.xlsx');
        });

        </script>

</div>
</body>
</html>