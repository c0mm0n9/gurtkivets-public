<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Аккаунт</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
  <div class="main-menu">
    <div>

    <a href="/">Головна</a>
    <sec:authorize access="hasRole('ROLE_USER')">
      <a href="/account"  class="active">Панель Акаунта</a>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="/admin">Адмін панель</a>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_STAFF')">
        <a href="/employee">Панель працівника</a>
        </sec:authorize>
      </div>
        <div>
        <sec:authorize access="isAuthenticated()">
        <a>Вітаємо: ${pageContext.request.userPrincipal.name}</a>
        </sec:authorize>
          <sec:authorize access="!isAuthenticated()">
              <a href="/login">Увійти</a>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
              <a href="/registration">Зареєструватися</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
              <a href="/logout">Вийти</a>
            </sec:authorize>
        </div>
   </div>

   <div class="sub-menu">
    <div>
    <a href="/account/add-student">Додати гуртківця</a>
    <a href="/account/add-parents">Додати батьків</a>
  </div>
  </div>


<div class="container">


<img
     src="http://localhost:8080/file/image/${diploma}" style = " max-width: 30%;
     height: auto;">

     </div>




     </body>
     </html>