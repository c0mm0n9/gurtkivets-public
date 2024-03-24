<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/menu.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


</head>





<div class="main-menu">
    <div>
        <a href="/">Головна</a>
        <a href="/news">Новини</a>
        <a href="/contests">Змагання</a>



    </div>
    <div id="right-menu">

        <div>
            <sec:authorize access="isAuthenticated()">

                <a>Вітаємо: ${pageContext.request.userPrincipal.name}</a>

                <div class="dropdown" >
                    <i class='bx bx-menu' color="white"></i>

                    <div class="dropdown-content" float="right">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a class="dropdown-item" href="/admin"> <i class='bx bx-shield'></i> Адмін Панель </a>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_STAFF')">
                        <a class="dropdown-item" href="/employee"> <i class='bx bx-briefcase' ></i> Панель працівника </a>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_USER')">
                        <a class="dropdown-item" href="/account"> <i class='bx bx-user' ></i> Панель аккаунта </a>
                        </sec:authorize>

                        <a class="dropdown-item" href="/logout" style="margin-left:10vw;"> Вийти <i class='bx bx-log-out' ></i> </a>
                    </div>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <a href="/login">Увійти</a>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <a href="/registration">Зареєструватися</a>
            </sec:authorize>

        </div>





    </div>



</div>

</div>
</html>