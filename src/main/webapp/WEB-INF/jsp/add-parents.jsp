<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Додати батьків</title>
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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>


<jsp:include page="${contextPath}/resources/jsp/side-menu.jsp"></jsp:include>
<div class = "container" style="margin-left:350px;margin-top:50px;">
<div class="container">
        <h2>Додати інформацію про батьків</h2>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
          $(document).ready(function() {
            if("${parentQty}"==1){
                $('#form-1').show();
                $('#form-2').hide();
                $('#form-type').hide();
              }

            $('input[type="radio"][name="form-type"]').change(function() {
              var formType = $(this).val();
              if (formType === 'form-1') {
                $('#form-1').show();
                $('#form-2').show();
              }
               else {
                $('#form-1').show();
                $('#form-2').hide();
                $('#form-2 input[type="text"], #form-2 textarea').val('');
              }

            });
          });

  $(document).ready(function() {
    $('#submit-both-forms').click(function(e) {
      e.preventDefault(); // prevent default form submission

      // submit form-1
      $('#form-1').submit();


      // submit form-2
      $('#form-2').submit();

    });
  });

</script>
        <div id="form-type" style="display:block; width:30%; justify-content: start;">
                    <div style="display:flex; justify-content: start;">
                      <input type="radio" name="form-type" value="form-1"  checked>
                      <label>Повна родина</label>
                    </div>
                    <div style="display:flex; justify-content: start; ">
                      <input type="radio" name="form-type" value="form-2">
                      <label>Неповна родина</label>
                    </div>
        </div>


        <form method="POST">
          <div>
          <h2>Батько\Мати</h2>
          <label>Ім'я</label>
          <div>
          <input type="text" id="parent1-name" name="parent1-name" />
        </div>
        <label>Прізвище</label>
        <div>
          <input type="text" id="parent1-surname" name="parent1-surname" />
        </div>
        <div>
          <label>Стать</label>
          <div>
            <select id="parent1-gender" name="parent1-gender">
              <option value="Чоловік">Чоловіча</option>
              <option value="Жінка">Жіноча</option>
              </select>
          </div>
          </div>
          <label>Номер телефону</label>
          <div>
              <input type="text" id="parent1-phone" name="parent1-phone" />
              </div>
              <label>Місце працевлаштування</label>
              <div>

                  <input type="text" id="parent1-job" name="parent1-job" />
                  </div>
                  <label>Службовий номер телефону</label>
                  <div>
              <input type="text" id="parent1-jobPhone" name="parent1-jobPhone" />
                      </div>
        </div>
          <div id="form-2">
            <h2>Батько\Мати</h2>
          <label>Ім'я</label>
          <div>
          <input type="text" id="parent2-name" name="parent2-name" />
        </div>
        <label>Прізвище</label>
        <div>
          <input type="text" id="parent2-surname" name="parent2-surname" />
        </div>
        <div>
          <label>Стать</label>
          <div>
            <select id="parent2-gender" name="parent2-gender">
              <option value="Чоловік">Чоловіча</option>
              <option value="Жінка">Жіноча</option>
              </select>
          </div>
          </div>
          <label>Номер телефону</label>
          <div>
              <input type="text" id="parent2-phone" name="parent2-phone" />
              </div>
              <label>Місце працевлаштування</label>
              <div>

                  <input type="text" id="parent2-job" name="parent2-job" />
                  </div>
                  <label>Службовий номер телефону</label>
                  <div>
              <input type="text" id="parent2-jobPhone" name="parent2-jobPhone" />
                        </div>

        </div>
          <input type="submit" value="Submit" />
      </form>







    
    </div>
    
  </body>
</html>
