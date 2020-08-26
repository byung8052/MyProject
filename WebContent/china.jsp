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
        <td>면류</td>
        <td>고기류</td>
        <td>나머지</td>

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
            String query = "select * from china";
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
        <td><%=rs.getString("gogi")%></td>
        <td><%=rs.getString("namugi")%></td>

 
 
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
출처:<a href="https://m.blog.naver.com/skin_24/220228656971">https://m.blog.naver.com/skin_24/220228656971</a>
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