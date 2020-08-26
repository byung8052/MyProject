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
        <td>쌀요리</td>
        <td>면요리</td>
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
            String query = "select * from japan";
            rs = stmt.executeQuery(query);
            //04단계 :Query실행 끝
            //05단계 :Query실행결과 사용
            // 한번 호출되면 밑으로 내려간다. 전체 리스트를 보여줄때는 주석처리 해야 전체 리스트가 나온다.
            //             System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
            //---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
            while (rs.next()) {
    %>
 
    <tr>
        <td><%=rs.getString("ssal")%></td>
        <td><%=rs.getString("myun")%></td>
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
출처:<a href="https://blog.naver.com/503house/221401795055">https://blog.naver.com/503house/221401795055</a>
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