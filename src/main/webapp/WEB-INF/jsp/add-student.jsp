<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Додати гуртківця</title>
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
      <form:form method="POST" modelAttribute="studentForm">
        <h2>Додати гуртківця</h2>
        <label>Ім'я</label>
        <div>
          <form:input
            type="text"
            path="name"
            placeholder="Ім'я"
            autofocus="true"
            required="true"
maxlength="45"
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
maxlength="45"
          ></form:input>
          <form:errors path="surname"></form:errors>
          ${surnameError}
        </div>
        <label>Стать</label>
        <div>
          <select id="gender" name="gender">
            <option value="Чоловік">Чоловіча</option>
            <option value="Жінка">Жіноча</option>
            </select>
        </div>
        <label>Дата народження</label>
        <div>
          
          <form:input
            type="date"
            id = "datePicker"
            path="birthdate"
            placeholder="Birthdate"
            autofocus="true"
            required="true"
maxlength="45"
          ></form:input>
          <form:errors path="birthdate"></form:errors>
          ${birthdateError}
        </div>
        <label>Номер телефону</label>
        <div>
          <form:input
            type="text"
            path="phone"
            id="phoneNumber"
            placeholder="Номер телефону"
            autofocus="true"
            required="true"
maxlength="45"
          ></form:input>
          <form:errors path="phone"></form:errors>
          ${phoneError}
        </div>
        <script src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
        <script>
            $('#phoneNumber').inputmask("+38 (099) 999-99-99");
        </script>

        <label>Адреса проживання</label>
        <div>
          <form:input
            type="text"
            path="adress"
            placeholder="Адреса проживання"
            autofocus="true"
            required="true"
maxlength="45"
          ></form:input>
          <form:errors path="adress"></form:errors>
          ${adressError}
        </div>
        <label>Навчальний заклад</label>
        <div>
          <form:input
            type="text"
            path="school"
            placeholder="Навчальний заклад"
            autofocus="true"
            required="true"
maxlength="45"
          ></form:input>
          <form:errors path="school"></form:errors>
          ${schoolError}
        </div>
          
        <label>Клас</label>
          <div>
          <select id="form" name="form">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
          </select>
        </div>
        
        <label>Оберіть гуртки</label>
        <table>
        <c:forEach items="${allClasses}" var="classes">
          <tr>
          <td><input type="checkbox" name="class" value="${classes.id}"/></td>
          <td>${classes.name}</td>
        </tr>
        </c:forEach>
        </table>

        <label>Інші гуртки</label>
        <div>
          <form:input
            type="text"
            path="otherClasses"
            placeholder="Інші гуртки"
            autofocus="true"
maxlength="255"
          ></form:input>
          <form:errors path="otherClasses"></form:errors>
          ${otherClassesError}
        </div>
        

        


        <button type="submit">Додати</button>
      </form:form>
    </div>

    <script>
    $(function(){
        var dtToday = new Date();

        var month = dtToday.getMonth() + 1;
        var day = dtToday.getDate();
        var year = dtToday.getFullYear()-4;

        if(month < 10)
            month = '0' + month.toString();
        if(day < 10)
            day = '0' + day.toString();

        var maxDate = year + '-' + month + '-' + day;
        var minDate = year-14    + '-' + month + '-' + day;
        $('#datePicker').attr('max', maxDate);
        $('#datePicker').attr('min', minDate);
    });
    </script>


    <script src="/path/to/jquery-input-mask-phone-number.js"></script>
    <script>
    $('#phoneNumber').usPhoneFormat();
    </script>

  </body>
</html>
