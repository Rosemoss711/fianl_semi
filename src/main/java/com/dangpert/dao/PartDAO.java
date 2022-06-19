package com.dangpert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.dangpert.dto.PartDTO;
import com.dangpert.dto.PartFolderDTO;

public class PartDAO {

	private BasicDataSource bds;

	public PartDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PartDTO> selectAll(int start, int end) throws Exception { // 파트 페이징
		String sql = "select *"
				+ " from (select tbl_part.*, row_number() over(order by part_seq desc) as num from tbl_part)"
				+ " where num between ? and ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PartDTO> list = new ArrayList<PartDTO>();

			while (rs.next()) {
				int part_seq = rs.getInt("part_seq");
				String part_title = rs.getString("part_title");
				String part_content = rs.getString("part_content");
				String part_class = rs.getString("part_class");

				list.add(new PartDTO(part_seq, part_title, part_content, part_class));
			}
			return list;
		}
	}
	
	public ArrayList<PartDTO> selectAllPart(String part_class, int start, int end) throws Exception { // 파트별 전체출력
		String sql = " select * from (select tbl_part.*, row_number() over(order by part_seq desc) as num from tbl_part)"
				+ " where num between ? and ? and part_class=?";
	
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(3, part_class);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<PartDTO> list = new ArrayList<PartDTO>();
			while(rs.next()) {
				int part_seq = rs.getInt("part_seq");
				String part_title = rs.getString("part_title");
				String content = rs.getString("part_title");
				
				list.add(new PartDTO(part_seq, part_title, content, part_class));
			}
			return list;
		}
	}

	public int insert(PartDTO dto) throws Exception { // 파트 입력
		String sql = "insert into tbl_part values(?, ?, ?, ?)";

		try (Connection con = bds.getConnection(); 
			 PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, dto.getPart_seq());
			pstmt.setString(2, dto.getPart_title());
			pstmt.setString(3, dto.getPart_content());
			pstmt.setString(4, dto.getPart_class());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public int delete(int part_seq) throws Exception { // 파트 삭제
		String sql = "delete from tbl_part where part_seq=?";

		try (Connection con = bds.getConnection(); 
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, part_seq);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public int modify(PartDTO dto) throws Exception { // 파트 수정
		String sql = "update tbl_part set part_title=?, part_content=?, part_class=? where part_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getPart_title());
			pstmt.setString(2, dto.getPart_content());
			pstmt.setString(3, dto.getPart_class());
			pstmt.setInt(4, dto.getPart_seq());
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int getNewSeq() throws Exception{ // part_seq 생성
		String sql = "select part_seq.nextval from dual";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	
	public PartDTO selectBySeq(int seq) throws Exception { // 파트 시퀀스로찾기
		String sql = "select * from tbl_part where part_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, seq);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("part_title");
				String content = rs.getString("part_content");
				String part_class = rs.getString("part_class");
				
				return new PartDTO(seq, title, content, part_class);
			}
			return null;
		}
	}
	
	public PartFolderDTO selectBySeqFolder(int seq) throws Exception { // 시퀀스로 폴더 src 찾기
		String sql = "select * from tbl_part_folder where part_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql) ) {
			
			pstmt.setInt(1, seq);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String src = rs.getString("part_src");
				
				return new PartFolderDTO(seq, src);
			}
			return null;
		}
	}
	
	
	
	
	public int insertPartFolder(int part_seq, String src) throws Exception { // 폴더 업데이트
		String sql = "insert into tbl_part_folder values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, part_seq);
			pstmt.setString(2, src);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int modifyPartFolder(int part_seq, String src) throws Exception { // 폴더 주소값 변경
		String sql = "update tbl_part_folder set part_src=? where part_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, src);
			pstmt.setInt(2, part_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
	
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
		String sql = "select count(*) as totalCnt from tbl_part";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int totalCnt = rs.getInt("totalCnt"); 
			int recordCntPerPage = 10; 
			int naviCntPerPage = 5; 
			int pageTotalCnt = 0; 
		
			if(totalCnt % recordCntPerPage > 0) { 
				pageTotalCnt = totalCnt / recordCntPerPage + 1;
			}else {
				pageTotalCnt = totalCnt / recordCntPerPage;
			}
			
			
			if(curPage < 1) { 
				curPage = 1;
			}else if(curPage > pageTotalCnt) { 
				curPage = pageTotalCnt; 
			}					
		
			int startNavi = ((curPage-1) / naviCntPerPage) * naviCntPerPage + 1;
			int endNavi = startNavi + naviCntPerPage - 1;
			
			
			if(pageTotalCnt < endNavi) {
				endNavi = pageTotalCnt;  
			}
			
			boolean needPrev = true;
			boolean needNext = true;
			
			if(startNavi == 1) {
				needPrev = false;
			}
			if(endNavi == pageTotalCnt) {
				needNext = false;
			}
		
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);
			
			return map;
		}
	}
	
	
	
	
	
	
}
