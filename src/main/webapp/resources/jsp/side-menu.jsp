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
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sidemenu.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
</head>

<div class="sidemenu">


 <button class="dropdown-button">
      <i class='bx bx-home'></i>
      Головне меню
       <i  id="arrowIcon" class='bx bxs-left-arrow'></i>
</button>
                                               <div class="dropdown-container">
        <a class="side-sub-item" href="/"> Головна</a>
        <a class="side-sub-item" href="/news"> Новини</a>
        <a class="side-sub-item" href="/contests"> Змагання</a>
</div>


<sec:authorize access="hasRole('ROLE_ADMIN')">

         <button class="dropdown-button">
          <i class='bx bx-shield'></i>Адмін Панель
          <i  id="arrowIcon" class='bx bxs-left-arrow'></i>
                           </button>
                           <div class="dropdown-container">
        <a  class="side-sub-item" href="/admin"> Головна </a>
         <a class="side-sub-item" href="/admin/users">Користувачі</a>
         <a class="side-sub-item" href="/admin/students">Гуртківці</a>
         <a class="side-sub-item" href="/admin/parents">Батьки</a>
         <a class="side-sub-item" href="/admin/staff">Працівники</a>
         <a class="side-sub-item" href="/admin/classes">Заняття</a>
         <a class="side-sub-item" href="/admin/types-class">Типи гуртків</a>
         <a class="side-sub-item" href="/admin/rooms">Кабінети</a>
         <a class="side-sub-item" href="/admin/graduates">Випускники</a>
         <a class="side-sub-item" href="/admin/contests">Змагання</a>
         <a class="side-sub-item" href="/admin/all-news">Новини</a>
         </div>

      </sec:authorize>


       <sec:authorize access="hasRole('ROLE_STAFF')">




                    <button class="dropdown-button">
                               <i class='bx bx-briefcase' ></i></i>Панель працівника
                              <i id="arrowIcon" class='bx bxs-left-arrow'></i>
                                               </button>
                                               <div class="dropdown-container">
                   <a class="side-sub-item" href="/employee"> Головна </a>
                   <a class="side-sub-item" href="/employee/edit-info">Додати дані</a>
                   <a class="side-sub-item" href="/employee/add-classes">Додати гурток</a>
                    </div>

              </sec:authorize>


    <sec:authorize access="hasRole('ROLE_USER')">
 <button class="dropdown-button">
     <i  class='bx bx-user' ></i>Панель аккаунта
     <i id="arrowIcon" class='bx bxs-left-arrow'></i>
</button>
                                               <div class="dropdown-container">
        <a class="side-sub-item" href="/account"> Головна</a>
            <a class="side-sub-item" href="/account/add-student">Додати гуртківця</a>
            <a class="side-sub-item" href="/account/add-parents">Додати батьків</a>
               </div>
      </sec:authorize>









</div>

<script>
var dropdown = document.getElementsByClassName("dropdown-button");



var i;
for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");

    var arrowIcon = this.querySelector(".bx.bxs-left-arrow");
        if (arrowIcon) {
          arrowIcon.classList.remove("bxs-left-arrow");
          arrowIcon.classList.add("bxs-down-arrow");
        }else{
        var arrowIcon = this.querySelector(".bx.bxs-down-arrow");
         arrowIcon.classList.add("bxs-left-arrow");
                  arrowIcon.classList.remove("bxs-down-arrow");
        }

    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }

  });
}
</script>

</html>