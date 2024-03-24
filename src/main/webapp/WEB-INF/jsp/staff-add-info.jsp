<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Адмін панель</title>
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
      <form:form method="POST" modelAttribute="staffForm">
        <h2>Додати дані</h2>
        <label>Ім'я</label>
        <div>
            <form:input
              type="text"
              path="name"
              placeholder="Ім'я"
              autofocus="true"
              required="true"
            ></form:input>
            <form:errors path="name"></form:errors>
            ${nameError}
          </div>
          <label>Прізвище</label>
          <div>
            <form:input
              type="text"
              path="surname"
              placeholder="Прізвище"
              autofocus="true"
              required="true"
            ></form:input>
            <form:errors path="surname"></form:errors>
            ${surnameError}
          </div>
          <label>Номер телефону</label>
          <div>
            <form:input
              type="text"
              path="phone"
              placeholder="номер телефону"
              autofocus="true"
              required="true"
            ></form:input>
            <form:errors path="phone"></form:errors>
            ${phoneError}
          </div>
          <label>Адреса проживання</label>
          <div>
            <form:input
              type="text"
              path="adress"
              placeholder="Адреса проживання"
              autofocus="true"
              required="true"
            ></form:input>
            <form:errors path="adress"></form:errors>
            ${adressError}
          </div>
          <form:input type="hidden" path="id" value="${id}"/>
        <button type="submit">Додати</button>
      </form:form>
      
      </div>
    </div>
    </body>
      </html>