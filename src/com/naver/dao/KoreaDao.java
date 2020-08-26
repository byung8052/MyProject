package com.naver.dao;

import java.util.ArrayList;

import com.naver.dto.KoreaDto;

public interface KoreaDao {

	// 데이터 넣고 
	public void insert(KoreaDto dto);

	// 전체 데이터 가져오기
	public ArrayList<KoreaDto> select();
}