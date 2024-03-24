<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Увійти</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


</head>


<body>

 <jsp:include page="${contextPath}/resources/jsp/menu.jsp"></jsp:include>
  <form method="POST" action="/reset-password">
  <div class="container">
<div class="centered">
<div class="input-wrapper">
    <h2>Введіть новий пароль</h2>
   <label>Пароль</label>
    <div class="input-box">

      <i class='bx bx-user'></i>
<input type="hidden" name="token" value="${token}"/>
      <input name="newPassword" type="password" placeholder="newPassword"
             autofocus="true"/>
            </div>


      <button type="submit">Змінити</button>
      <div>

  </form>

</div>
</div>
</div>
</div>
</body>
</html>
