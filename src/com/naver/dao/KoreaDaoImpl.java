package com.naver.dao;


import java.sql.*;
import java.util.ArrayList;

import com.naver.dao.KoreaDao;
import com.naver.db.DB;
import com.naver.dto.KoreaDto;

public class KoreaDaoImpl implements KoreaDao{

	@Override
	public void insert(KoreaDto dto) {
		// 디비 연결
		// 쿼리 만들고
		// 쿼리 실행

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DB.conn(); 
			String sql = "INSERT INTO korea (밥류,찜류,찌개류) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBab());
			pstmt.setString(2, dto.getJjim());
			pstmt.setString(3, dto.getJjigae());
			
			int count = pstmt.executeUpdate();
			if (count == 0) {
				System.out.println("데이터 입력 실패");
			} else {
				System.out.println("데이터 입력 성공");
			}

		} catch (Exception e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
				if( pstmt != null && !pstmt.isClosed()){
                    pstmt.close();
                }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}



	@Override
	public ArrayList<KoreaDto> select() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 전달 변수(dto 담을 그릇)
		ArrayList<KoreaDto> list = new ArrayList<KoreaDto>();
		try {
			conn = DB.conn();
			String sql = "SELECT * FROM korea";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				KoreaDto dto = new KoreaDto();
				dto.setBab(rs.getString("bab"));
				dto.setJjim(rs.getString("jjim"));
				dto.setJjigae(rs.getString("jjigae"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if( rs != null && !rs.isClosed()){
                    rs.close();
                }
				if( pstmt != null && !pstmt.isClosed()){
                    pstmt.close();
                }
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

//	@Override
//	public void update(KoreaDto dto) {

//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = DB.conn(); 
//			String sql = "UPDATE user SET jumsu=? WHERE  id=?";
//			pstmt = conn.prepareStatement(sql);
//			
////			pstmt.setInt(1, dto.getJumsu());
//			pstmt.setString(2, dto.getId());
//			
//			int count = pstmt.executeUpdate();
//			if (count == 0) {
//				System.out.println("데이터 입력 실패");
//			} else {
//				System.out.println("데이터 입력 성공");
//			}
//
//		} catch (Exception e) {
//			System.out.println("에러: " + e);
//		} finally {
//			try {
//				if (conn != null && !conn.isClosed()) {
//					conn.close();
//				}
//				if( pstmt != null && !pstmt.isClosed()){
//                    pstmt.close();
//                }
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//	}

}