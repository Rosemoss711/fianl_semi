package com.dangpert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.dangpert.dto.DiaryDTO;

public class DiaryDAO {

private BasicDataSource bds;

	public DiaryDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insert(int user_seq, String diary_content, String diary_part, int diary_weight) throws Exception {	// 다이어리 작성
		String sql = "insert into tbl_diary values(diary_seq.nextval, ?, default, ?, ?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, user_seq);
			pstmt.setString(2, diary_content);
			pstmt.setString(3, diary_part);
			pstmt.setInt(4, diary_weight);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int update(DiaryDTO dto) throws Exception {	// 다이어리 수정
		String sql = "update tbl_diary set diary_content=?, diary_part=?, diary_weight=? where diary_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, dto.getDiary_content());
			pstmt.setString(2, dto.getDiary_part());
			pstmt.setInt(3, dto.getDiary_weight());
			pstmt.setInt(4, dto.getDiary_seq());
			
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public ArrayList<DiaryDTO> select(int user_seqc) throws Exception {	// 목록에 띄울 다이어리 정보 가져오기
		String sql = "select * from tbl_diary where user_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, user_seqc);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<DiaryDTO> list = new ArrayList<DiaryDTO>();
			while(rs.next()) {
				int diary_seq = rs.getInt("diary_seq");
				int user_seq = user_seqc;
				String diary_date = rs.getString("diary_date");
				String diary_content = rs.getString("diary_content");
				String diary_part = rs.getString("diary_part");
				int diary_weight = rs.getInt("diary_weight");
				
				list.add(new DiaryDTO(diary_seq, user_seq, diary_date, diary_content, diary_part, diary_weight));
			}
			return list;
		}
	}
	
	public DiaryDTO selectBySeq(int diary_seq) throws Exception {	// 다이어리 시퀀스를 이용해 해당 다이어리 내용 불러오기
		String sql = "select * from tbl_diary where diary_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, diary_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int user_seq = rs.getInt("user_seq");
				String diary_date = rs.getString("diary_date");
				String diary_content = rs.getString("diary_content");
				String diary_part = rs.getString("diary_part");
				int diary_weight = rs.getInt("diary_weight");
				
				DiaryDTO dto = new DiaryDTO(diary_seq, user_seq, diary_date, diary_content, diary_part, diary_weight);
				return dto;
			}
			return null;
		}
	}
	
	public int delete(int diary_seq) throws Exception {		// 다이어리 삭제
		String sql = "delete from tbl_diary where diary_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, diary_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
}
