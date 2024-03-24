<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Змагання</title>
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


    <h2>${contest.name}</h2>
    <h3><i class='bx bx-calendar' ></i> ${contest.date_start}</h3>
    <d>${contest.description}</d>
<div>
<c:if test="${contest.registration_open}">
    <button onclick="location.href='/contest-register?id=${contest.id}'" type="button">
             Зареєструватися</button>
                 </c:if>

                 <c:if test="${!contest.registration_open}">
                 <h3>Результати: </h3>
                                                    <table class="main-table">
                                                                         <th>
                                                                                  Ім'я
                                                                                  </th>
                                                                                  <th>
                                                                                  Прізвище
                                                                                  </th>
                                                                                <c:forEach items="${results}" var="result">
                                                                                 <tr>
                                                                                    <td>${result.student.name} </td>
                                                                                    <td>${result.student.surname} </td>
                                                                                    <td>${result.details} </td>

                                                                                   </c:forEach>
                                                                          </td>
                                                                          </table>


                 </c:if>
</div>

    <h3> Зареєстровані учасники </h3>
     <table class="main-table">
                          <th>
                                   Ім'я
                                   </th>
                                   <th>
                                   Прізвище
                                   </th>
                                 <c:forEach items="${contest.contestants}" var="contestant">
                                  <tr>
                                     <td>${contestant.name} </td>
                                     <td> ${contestant.surname}</td>

                                    </c:forEach>
                           </td>
                           </table>




   </div>

</body>
</html>