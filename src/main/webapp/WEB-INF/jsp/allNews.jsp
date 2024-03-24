<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Новини</title>

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
      <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200;6..12,300;6..12,400;6..12,500;6..12,600;6..12,700;6..12,800;6..12,900&display=swap" rel="stylesheet">
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</head>

<body>

<jsp:include page="${contextPath}/resources/jsp/menu.jsp"></jsp:include>

<div class="container">

    <div class="section">
       <h2>Новини</h2>

     <c:forEach items="${allnews}" var="news">
    <div class="item" style="margin-top:15px;">
         <a href="news?id=${news.id}"> <h3>${news.title}</h3> </a><h4><i class='bx bx-calendar' ></i> ${news.publish_date}</h4>


    </div>
     </c:forEach>
       </div>

</div>
</body>

