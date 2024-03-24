<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Додати змагання</title>
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

      <h2>Редагувати змагання</h2>
      <div>
        <form:form method="POST" modelAttribute="contest">
                 <form:input type="hidden" path="id" value="${id}"/>
               <label>Назва змагання</label>
               <div>
                <form:input type="text" path="name" required="true" value="${name}"/>
                </div>
                <label>Дата початку</label>
                <div>
                                <form:input type="date" path="date_start" required="true" value="${date_start}"/>
                                </div>
                                <label>Опис</label>
                <div>
                                <form:input type="text" path="description" required="true" value="${description}"/>
                                </div>
                                <div>

                </div>
                                <div style="text-align:left; width:70%;">
<label>Відкрити реєстрацію</label>
                                <form:checkbox  path="registration_open" />
                                </div>


                    <div>

                    <label> Учасники: </label>

                <table>

                                <c:forEach items="${contestants}" var="contestant">
                                  <tr>
                                  <td><input type="checkbox" name="contestants" id="${contestant.id}" value="${contestant.id}"/></td>
                                   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                                                                            <script>
                                                                                            $(document).ready(function() {
                                                                                              var contestants = ${contestant.id};
                                                                                              $("#"+contestants).prop("checked", true);

                                                                                            });
                                                                                            </script>
                                  <td>${contestant.name}</td>
                                </tr>
                                </c:forEach>
                                </table>

                                <label> Результати: </label>

                                                <table>

                                                                <c:forEach items="${results}" var="result">
                                                                  <tr>
                                                                  <td>${result.student.name}</td>
                                                                  <td>${result.student.surname}</td>
                                                                  <td>
                                                                  <input type="hidden" name="results" required="false" value="${result.id}"/>
                                                                  <input type="text" name="results" required="false" value="${result.details}"/>
                                                                  <input type="hidden" name="results" required="false" value="${result.student.id}"/>
                                                                  <input type="hidden" name="results" required="false" value="${result.contest.id}"/>
                                                                  </td>

                                                                </tr>
                                                                </c:forEach>
                                                                </table>
                <button type="submit">Зберегти</button>
                       </form:form>
                      </div>
                      </div>
                      </div>
      </body>

      </html>