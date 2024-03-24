<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Головна</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


</head>


<body>

 <jsp:include page="${contextPath}/resources/jsp/menu.jsp"></jsp:include>
   <div class="section">


    <h2>${contest.name}</h2>
    <h3>${contest.date_start}</h3>
    <p>${contest.description}</p>

    <h3>Зареєструвати гуртківця</h3>
      <table>
        <thead>
        <th>Ім'я</th>
        <th>Прізвище</th>
        </thead>
        <c:forEach items="${allStudent}" var="student">
          <tr>
            <td>${student.name}</td>
            <td>${student.surname}</td>


            <td>
            <form action="${pageContext.request.contextPath}/contest-register" method="post">
            <input type="hidden" name="action" value="add"/>
                        <input type="hidden" name="studentId" value="${student.id}"/>
                         <input type="hidden" name="contestId" value="${contest.id}"/>

                        <button type="submit">Зареєструвати</button>
                      </form>

                  </td>
          </tr>
        </c:forEach>
      </table>
      <h3>Відмінити реєстрацію</h3>
      <table>
              <thead>
              <th>Ім'я</th>
              <th>Прізвище</th>
              </thead>
              <c:forEach items="${registeredStudent}" var="student">
                <tr>
                  <td>${student.name}</td>
                  <td>${student.surname}</td>


                  <td>
                  <form action="${pageContext.request.contextPath}/contest-register" method="post">
                  <input type="hidden" name="action" value="delete"/>
                              <input type="hidden" name="studentId" value="${student.id}"/>
                               <input type="hidden" name="contestId" value="${contest.id}"/>

                              <button type="submit">Відмінити</button>
                            </form>

                        </td>
                </tr>
              </c:forEach>
            </table>

   </div>

</body>
</html>