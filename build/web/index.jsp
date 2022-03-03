<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <%@include file="links.jsp"%>
        <link href="CSS/form.css" rel="stylesheet">

        <title>Login page</title>
    </head>

    <body style="background: radial-gradient(white,skyblue);">

    <div class="container text-center mt-5">     
        <form action="login" method="post">
            <input class="input-field text-center" placeholder="Enter name" type="text" name ="username"><br>
            <input class="input-field text-center" placeholder="Enter password" type="password" name="password"><br>
            <button class="button" type="submit">LOG IN</button>
        </form>
    </div>    
        
   
  
    </div>
        
        
        
        
        <script>
        function myFunction() {
  var x = document.getElementById("registrationform");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

</script>
</body>
</html>
