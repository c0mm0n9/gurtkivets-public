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

<body>


<jsp:include page="${contextPath}/resources/jsp/side-menu.jsp"></jsp:include>

<div style="margin-left:350px;margin-top:50px;">


<div class="container">

  <h2>Гуртківці</h2>
  <table>
    <thead>
    <th>Ім'я</th>
    <th>Прізвище</th>
    <th>Стать</th>
    <th>Дата народження</th>
    <th>Номер телефону</th>
    <th>Адреса</th>
    <th>Школа</th>
    <th>Клас</th>
    <th>Інші гуртки</th>
    <th>Гуртки</th>
    <th>Дії</th>
    </thead>
    <c:forEach items="${allStudents}" var="student">
      <tr>
        <td>${student.name}</td>
        <td>${student.surname}</td>
        <td>${student.gender}</td>
        <td>${student.birthdate}</td>
        <td>${student.phone}</td>
        <td>${student.adress}</td>
        <td>${student.school}</td>
        <td>${student.form}</td>
        <td>${student.otherClasses}</td>
        <td>
          <c:if test="${fn:length(student.classes) gt 0}">


          <table>
            <thead>
            <th>Назва</th>
            </thead>
            <c:forEach items="${student.classes}" var="classes">
              <tr>
                  <td>${classes.name}</td>
              <td>
                  <form action="${pageContext.request.contextPath}/classes/details" method="get">
                    <input type="hidden" name="classesId" value="${classes.id}"/>
                    <button type="submit">Детальніше</button>
                  </form>
                  <form action="${pageContext.request.contextPath}/account" method="post">
                                <input type="hidden" name="classesId" value="${classes.id}"/>
                                <input type="hidden" name="studentId" value="${student.id}"/>
                                <input type="hidden" name="action" value="leave"/>
                                <button type="submit">Залишити</button>
                              </form>
                </td>
              </tr>
            </c:forEach>
          </table>
        </c:if>

        </td>
        <td>
                 <form action="${pageContext.request.contextPath}/account/edit-student" method="get">
                                  <input type="hidden" name="studentId" value="${student.id}"/>
                                  <button type="submit">Edit</button>
                                </form></td>
      </tr>
    </c:forEach>
  </table>

  <h2>Батьки</h2>
  <table>
      <thead>
      <th>Ім'я</th>
      <th>Прізвище</th>
      <th>Стать</th>
      <th>Номер телефону</th>
      <th>Місце працевлаштування</th>
      <th>Службовий номер телефону</th>
      <th>Дії</th>
      </thead>
      <c:forEach items="${allParents}" var="parent">
        <tr>
          <td>${parent.name}</td>
          <td>${parent.surname}</td>
          <td>${parent.gender}</td>
          <td>${parent.phone}</td>
          <td>${parent.job}</td>
          <td>${parent.jobPhone}</td>
                   <td>
                                  <form action="${pageContext.request.contextPath}/account/edit-parent" method="get">
                                    <input type="hidden" name="parentId" value="${parent.id}"/>
                                    <button type="submit">Edit</button>
                                  </form>
                                  </td>
                  </tr>
      </c:forEach>
    </table>


      <h2>Випускники</h2>
      <table>
        <thead>
        <th>Ім'я</th>
        <th>Прізвище</th>
        <th>Дата народження</th>
        <th>Дата випуску</th>
        <th>Дії</th>
        </thead>
        <c:forEach items="${allGraduates}" var="graduates">
          <tr>
            <td>${graduates.name}</td>
            <td>${graduates.surname}</td>
            <td>${graduates.birthdate}</td>
            <td>${graduates.graduation_date}</td>
     <!--       <td>
                     <form action="${pageContext.request.contextPath}/account/diploma" method="get">
                                                           <input type="hidden" name="graduatesId" value="${graduates.id}"/>
                                                           <button type="submit">Отримати диплом</button>
                                                         </form></td> -->
          </tr>
        </c:forEach>
      </table>




</div>
</div>




</body>
</html>