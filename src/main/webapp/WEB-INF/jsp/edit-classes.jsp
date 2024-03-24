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
<c:if test="${hasConflicts == true}">
<script>
$(document).ready(function() {
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

});
</script>
<div id="myModal" class="modal">
<div class="modal-content">

		<span class="close">&times;</span>
		<h2> Помилка! </h2>
		<h3> Перевірте дані на коректність </h3>
		<c:forEach items="${conflicts}" var="conflict">
    <p>${conflict}</p>
    </c:forEach>
  </div>

</div>
</c:if>


   <div class = "container">
    <form method="POST">
      <input type="hidden" name="id" value="${classes.id}"/>

      <h2>Редагувати гурток</h2>
      <label>Назва</label>
      <div>
        <input type="text" id="name" name="name" required="true" value="${classes.name}"/>
        </div>
        <label>Опис</label>
        <div>
        <input type="text" id="description" name="description" required="true" value="${classes.description}"/>
    </div>

      <label>
        Тип гуртка
        </label>
        <div>
        <select name="typeClassId">

        <c:forEach items="${typesClass}" var="type">
        <c:choose>
        <c:when test="${type.equals(classes.typeClass)}"> <option selected value="${type.id}">${type.name}</option>  </c:when>
           <c:otherwise> <option value="${type.id}">${type.name}</option> </c:otherwise>
        </c:choose>
        </c:forEach> </select>
        </div>

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
              htmlString+='<td><input type="hidden" name="values" required="true" value="0"/></td>'
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


<div class ="container1">
    <label>Розклад</label>
    <button class="add_form_field">Додати День +</button>
        <table>
                    <th>День</th>
                    <th>Час початку</th>
                    <th>Час закінчення</th>
                    <th>Кабінет</th>
                    <th></th>
                    <c:forEach items="${classes.schedules}" var="schedule">
                    <tr>
                    <td>
                    <select id="schedule_day${schedule.id}" name="values"><option value="MONDAY">Понеділок</option><option value="TUESDAY">Вівторок</option><option value="WEDNESDAY">Середа</option><option value="THURSDAY">Четвер</option><option value="FRIDAY">П'ятниця</option><option value="SATURDAY">Субота</option><option value="SUNDAY">Неділя</option></select>



                    </td>
                    <td>
                    <input type="time" name="values" required="true" value="${schedule.time_start}"/>
                    </td>
                    <td>
                    <input type="time" name="values" required="true" value="${schedule.time_end}"/>
                    </td>
                    <td>
                    <select id="$schedule_room{schedule.id}" name="values"> <c:forEach items="${roomList}" var="room"> <option value="${room.id}">${room.name}</option> </c:forEach> </select>
                    </td>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                                                <script>
var day ="${schedule.day}";


                                                                var room ="${schedule.room.id}";
                                                                var id = "${schedule.id}"
                                                                $("#schedule_day"+id).val(room).change()
$("#schedule_day"+id).val(day).change()
                                                                </script>

                    <td><a href="#" class="delete">Delete</a><td>
<td><input type="hidden" name="values" required="true" value="${schedule.id}"/></td>
                    </tr>


                          </c:forEach>
                    </table>
        </div>
        </div>

        <label>Редагувати гуртківців</label>
                <table>
                <c:forEach items="${classes.student}" var="student">
                  <tr>
                  <td><input type="checkbox" name="students" id="${student.id}" value="${student.id}"/></td>
                  <td>${student.name}</td>
                  <td>${student.surname}</td>
                                         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                                         <script>
                                                         $(document).ready(function() {
                                                           var students = ${student.id};
                                                           $("#"+students).prop("checked", true);

                                                         });
                                                         </script>
                </c:forEach>
                </table>
        <label>Обрати заявки для прийняття в гурток</label>
                        <table>
                        <c:forEach items="${classes.studentRequests}" var="student">
                          <tr>
                          <td><input type="checkbox" name="studentRequests" id="${student.id}" value="${student.id}"/></td>
                          <td>${student.name}</td>
                          <td>${student.surname}</td>
                                                 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                                                 <script>
                                                                 $(document).ready(function() {
                                                                   var students = ${student.id};
                                                                   $("#"+students).prop("checked", false);

                                                                 });
                                                                 </script>
                        </c:forEach>
                        </table>
      <button type="submit">Зберегти</button>
    </form>
    
    </div>



</body>

</html>