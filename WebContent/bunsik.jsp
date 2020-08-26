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
	background-image:url("data:image/jpeg;base64,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");
	background-size:cover;
	background-repeat: no-repeat;
	opacity:0.9;
}

h3{
	color:#2EFEF7;
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
        <td>면</td>
        <td>쌀요리</td>
        <td>튀김</td>

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
            String query = "select * from bunsik";
            rs = stmt.executeQuery(query);
            //04단계 :Query실행 끝
            //05단계 :Query실행결과 사용
            // 한번 호출되면 밑으로 내려간다. 전체 리스트를 보여줄때는 주석처리 해야 전체 리스트가 나온다.
            //             System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
            //---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
            while (rs.next()) {
    %>
 
    <tr>
        <td><%=rs.getString("myun")%></td>
        <td><%=rs.getString("ssal")%></td>
        <td><%=rs.getString("tigim")%></td>

 
 
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