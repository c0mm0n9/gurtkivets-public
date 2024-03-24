<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Додати гурток</title>
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
    <form method="POST">
      <h2>Додати гурток</h2>
      <label>Назва</label>
      <div>
        <input type="text" id="name" name="name" required="true"/>
        </div>
        <label>Опис</label>
        <div>
        <input type="text" id="description" name="description" required="true"/>
    </div>
    <label>
    Тип гуртка
    </label>
    <div>
    <select name="typeClassId"> <c:forEach items="${typesClass}" var="type"> <option value="${type.id}">${type.name}</option> </c:forEach> </select>
    </div>

<!--    <label>Розклад</label>
        <div>
        <table>
            <thead>
                <tr>
                    <th>День тижня</th>
                    <th>Час</th>
                    <th>Кабінет</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="daysOfWeek" value="${['Понеділок', 'Вівторок', 'Середа', 'Четвер', 'П`ятниця', 'Субота', 'Неділя']}" />
                <c:forEach items="${daysOfWeek}" var="dayOfWeek" varStatus="loop">
                    <tr>
                        <td>${dayOfWeek}</td>
                        <td><input type="time" name="values" value="" /></td>
                        <td><input type="text" name="values" value="" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    var max_fields = 21;
    var wrapper = $(".container1");
    var add_button = $(".add_form_field");

    var x = 0;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
          var htmlString = '<tr>';
          htmlString+='<td><select name="values">'; //add input box
	  htmlString+='<option value="MONDAY">Понеділок</option>'
	  htmlString+='<option value="TUESDAY">Вівторок</option>'
	  htmlString+='<option value="WEDNESDAY">Середа</option>'
	  htmlString+='<option value="THURSDAY">Четвер</option>'
	  htmlString+='<option value="FRIDAY">П\'ятниця</option>'
	  htmlString+='<option value="SATURDAY">Субота</option>'
	  htmlString+='<option value="SUNDAY">Неділя</option>'
	  htmlString+='</select></td>';
          htmlString+='<td><input type="time" name="values"/></td>'; //add input box
          htmlString+='<td><input type="time" name="values"/></td>'; //add input box
          htmlString+='<td> <select name="values"> <c:forEach items="${roomList}" var="room"> <option value="${room.id}">${room.name}</option> </c:forEach> </select> </td>';
          htmlString+='<td><a href="#" class="delete">Delete</a><td></tr>';
	  $(wrapper).append(htmlString);
        } else {
            alert('You Reached the limits')
        }
    });

    $(wrapper).on("click", ".delete", function(e) {
        e.preventDefault();
        $(this).parent('td').parent('tr').remove();
        x--;
    })
});
</script>
<button class="add_form_field">Додати День +</button>
<table class="container1">
    <th>День тижня</th>
    <th>Час Початку</th>
    <th>Час Закінчення</th>
    <th>Кабінет</th>
</table>
<div>

</div>

      <button type="submit">Додати</button>
    </form>
    
    </div>



</body>

</html>