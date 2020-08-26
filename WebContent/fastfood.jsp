<%@page import="com.naver.db.DBConfig"%>
<%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
 
<%-- <%=request.getRequestURI()%> --%>
<style>
.container{
	background-image:url("https://post-phinf.pstatic.net/MjAxOTA4MjZfMjI3/MDAxNTY2ODA4OTMzOTE3.QiJURCDvJdERnuigTW_GA8Zf7VP3T1hqxNkahzOE1AQg.drJSSgQzzpBAm4_y7OyVzIhN3Y8TP4_GpNgNItvVowkg.JPEG/%ED%8C%A8%EC%8A%A4%ED%8A%B8%ED%91%B8%EB%93%9C1.jpg?type=w1200");
	background-size:cover;
	background-repeat: no-repeat;
	opacity:0.9;
}

h3{
	color:#000000;
}

.color{
	background:#04B404;
}

</style>

<br>
음식 리스트
<br>
<table width="100%" border="1">
    <tr class="color">
        <td>햄버거</td>
        <td>치킨</td>
        <td>피자</td>

    </tr>
 
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        //JDBC 프로그램 순서
        //01단계 :드라이버 로딩 시작
        Class.forName("com.mysql.jdbc.Driver");
        //01단계 :드라이버 로딩 끝
        try {
            //02단계 :DB연결(Connection)시작
            // DB연결후 리턴값을 받는다.
            conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_USER, DBConfig.DB_PW);
            //02단계 :DB연결(Connection)끝
//             System.out.println(conn + "<-- conn korea.jsp");
            // DB 연결이 성공 되었는지 안되었는지 판단하라
//             if (conn != null) {
//                 out.println("01 DB연결 성공");
//             } else {
//                 out.println("02 DB연결 실패");
//             }
            //03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
            stmt = conn.createStatement();
            //04단계 :Query실행 시작
            String query = "select * from fastfood";
            rs = stmt.executeQuery(query);
            //04단계 :Query실행 끝
            //05단계 :Query실행결과 사용
            // 한번 호출되면 밑으로 내려간다. 전체 리스트를 보여줄때는 주석처리 해야 전체 리스트가 나온다.
            //             System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
            //---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
            while (rs.next()) {
    %>
 
    <tr>
        <td><%=rs.getString("hamburger")%></td>
        <td><%=rs.getString("chicken")%></td>
        <td><%=rs.getString("pizza")%></td>

 
 
    </tr>
 
    <%
        /* out.println(rs.getString("m_id") + "<-- m_id 필드=컬럼 값 in tb_member테이블 <br>");
            out.println(rs.getString("m_pw") + "<-- m_pw 필드=컬럼 값 in tb_member테이블 <br>");
            out.println(rs.getString("m_level") + "<-- m_level 필드=컬럼 값 in tb_member테이블 <br>");
            out.println(rs.getString("m_name") + "<-- m_name 필드=컬럼 값 in tb_member테이블 <br>");
            out.println(rs.getString("m_email") + "<-- m_email 필드=컬럼 값 in tb_member테이블 <br><br>"); */
            }
            //---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 끝
 
        } catch (SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            // 6. 사용한 Statement 종료
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            if (stmt != null)
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
 
            // 7. 커넥션 종료
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
        }
    %>
 
</table>
<body>
<div class="container">
<a href="index.html" target="_blank">룰렛 돌리기</a>
<h3>*숫자 순서*</h3><br>
<h3>123</h3><br>
<h3>567</h3><br>
<h3>890</h3><br>
<h3>가끔씩 꽝이 나올 경우도 있음</h3>
<!-- 출처:<a href="https://m.blog.naver.com/skin_24/220228656971">https://m.blog.naver.com/skin_24/220228656971</a> -->
<br>
<br>
<br> <!-- 사진이 다 안 나와서 띄워쓰기를 하였음 -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
</body>