<%@page import="com.naver.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDto dto = (MemberDto)session.getAttribute("member");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>내사이트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="main.nhn">검색사이트</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
<% if (dto == null) { %>
    <li class="nav-item">
      <a class="nav-link" href="login.nhn">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="join.nhn">회원가입</a>
    </li>
<% } else { %>
    <li class="nav-item">
      <a class="nav-link" href="logout.nhn">로그아웃</a>
    </li>

    <li class="nav-item">
      <a class="nav-link" href="search.nhn">음식 선택하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="food.nhn">맛집 검색</a>
    </li>
<% } %>
  </ul>
</nav>


</body>
</html>
