<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp" %>
<% if (dto == null) { %>
<script> 
	alert("로그인을 하면 이용 가능 합니다."); 
	location.href='login.nhn';
</script>
<% } %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<style>
footer{
    font-size: 20px;
    text-align: center;
}
    
h3{   
    text-align: center;
    color: #000000;
}
    
body{
    background-image: url('data:image/jpeg;base64,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');
    background-repeat:no-repeat;
    background-position : center;
    background-size:cover;
}    

.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
</style>
</head>

    
<body>
<div class="container">					
<h3>음식 종류 선택</h3>
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>한식</th>
        <th>중식</th>
        <th>일식</th>
        <th>비싼건 싫다,분식</th>
        <th>빨리 먹는게 좋다,패스트푸드</th>
      </tr>
    </thead>
    <tbody>
        <td><a href="korea.nhn">이동</a></td>
        <td><a href="china.nhn">이동</a></td>
        <td><a href="japan.nhn">이동</a></td>
        <td><a href="bunsik.nhn">이동</a></td>
        <td><a href="fastfood.nhn">이동</a></td>
      </tr>

    
    </tbody>
  </table>

 
</div>
<footer>
결정 장애 인 당신을 위한 랜덤 선택 사이트<br>
단, 2일 이상 연속으로 같은 음식이 나와서 질린다?다른 거 뜰 때 까지 돌리세요 ^^
</footer>
<!--container end.//-->
</body>
</html>