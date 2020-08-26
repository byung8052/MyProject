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
.color{
	background:#04B404;
}

.container{
	background-image:url("data:image/jpeg;base64,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");
	background-size:cover;
	background-repeat: no-repeat;
	opacity:0.9;
}

h3{
	color:#2EFEF7;
}
</style>

<br>
음식 리스트
<br>
<table width="100%" border="1">
    <tr class="color">
        <td>밥류</td>
        <td>찜류</td>
        <td>찌개류</td>

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
            String query = "select * from korea";
            rs = stmt.executeQuery(query);
            //04단계 :Query실행 끝
            //05단계 :Query실행결과 사용
            // 한번 호출되면 밑으로 내려간다. 전체 리스트를 보여줄때는 주석처리 해야 전체 리스트가 나온다.
            //             System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
            //---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
            while (rs.next()) {
    %>
 
    <tr>
        <td><%=rs.getString("bab")%></td>
        <td><%=rs.getString("jjim")%></td>
        <td><%=rs.getString("jjigae")%></td>

 
 
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