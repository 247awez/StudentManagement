
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<!DOCTYPE html>
        <%@include file="links.jsp" %>

<div class="p-3" style="width: 280px;display: inline-block; background-color: skyblue">
    <a href="personalDetails.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto  text-decoration-none">
        <link rel="stylesheet" href="CSS/navbar.css">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">Menu</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto" >
      <li class="nav-item">
        <a href="personalDetails.jsp" class="nav-link text-white" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          Personal Details
        </a>
      </li>
      <li>
        <a href="booksBorrowed.jsp" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
          Books Borrowed
        </a>
      </li>
      <li>
        <a href="scoreboard.jsp" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
          Scoreboard
        </a>
      </li>
      <li>
        <a href="currentYearSubject.jsp" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          Current Year Subjects
        </a>
      </li>
      <li>
          <form action="logout" method="post" class="text-center">
              <button type="submit " class="btn">Logout</button>
              
          </form>  
      </li>
    </ul>
    <hr>
  </div>