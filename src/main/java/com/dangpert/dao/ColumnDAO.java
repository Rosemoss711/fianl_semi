package com.dangpert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.dangpert.dto.ColumnDTO;

public class ColumnDAO {
	private BasicDataSource bds;

	public ColumnDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNewSeq() throws Exception{
		String sql = "select column_seq.nextval from dual";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int column_seq = rs.getInt(1);
			return column_seq;			
		}
	}
	
	public ArrayList<ColumnDTO> selectAllMain() throws Exception{
		String sql = "select * from tbl_column";

		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ColumnDTO> list = new ArrayList<>();
			while(rs.next()) {
				int column_seq = rs.getInt("column_seq");
				String column_title = rs.getString("column_title");
				String column_content = rs.getString("column_content");
				String column_date = rs.getString("column_date");
				String column_src = rs.getString("column_src");
				
				list.add(new ColumnDTO(column_seq, column_title, column_content, column_date, column_src));
			}
			return list;
		}
	}
	
	public ArrayList<ColumnDTO> selectAll(int start, int end) throws Exception{
		String sql = "select * from (select tbl_column.*, row_number() over(order by column_seq desc) as num from tbl_column)"
				+ " where num between ? and ?";

		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ColumnDTO> list = new ArrayList<>();
			while(rs.next()) {
				int column_seq = rs.getInt("column_seq");
				String column_title = rs.getString("column_title");
				String column_content = rs.getString("column_content");
				String column_date = this.getStringDate(rs.getTimestamp("column_date"));
				String column_src = rs.getString("column_src");
				list.add(new ColumnDTO(column_seq,column_title,column_content,column_date, column_src));
			}
			return list;
		}
	}

	public int delete(int column_seq) throws Exception{
		String sql = "delete from tbl_column where column_seq = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1, column_seq);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public int modify(ColumnDTO dto, String nowSrc) throws Exception{
		String sql = "update tbl_column set column_title=?, column_content=?, column_src=? where column_seq=?";

		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			if(dto.getColumn_src() == null){
				pstmt.setInt(4, dto.getColumn_seq());
				pstmt.setString(1, dto.getColumn_title());
				pstmt.setString(2, dto.getColumn_content());
				pstmt.setString(3, nowSrc);
				int rs = pstmt.executeUpdate();
				return rs;
			}else {
				pstmt.setInt(4, dto.getColumn_seq());
				pstmt.setString(1, dto.getColumn_title());
				pstmt.setString(2, dto.getColumn_content());
				pstmt.setString(3, dto.getColumn_src());
				int rs = pstmt.executeUpdate();
				return rs;
			}
		}
	}

	public int write(ColumnDTO dto) throws Exception{
		String sql = "insert into tbl_column values(?,?,?,sysdate,?)";


		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, dto.getColumn_seq());
			pstmt.setString(2, dto.getColumn_title());
			pstmt.setString(3, dto.getColumn_content());
			pstmt.setString(4, dto.getColumn_src());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public ColumnDTO selectBySeq(int column_seq) throws Exception{
		String sql = "select * from tbl_column where column_seq = ?";

		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, column_seq);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String column_title = rs.getString("column_title");
				String column_content = rs.getString("column_content");
				String column_date = this.getStringDate(rs.getTimestamp("column_date"));
				String column_src = rs.getString("column_src");
				ColumnDTO dto = new ColumnDTO(column_seq,column_title,column_content,column_date, column_src);
				return dto;
			}
			return null;
		}
	}
	
	public String selectBySeqNowSrc(int column_seq) throws Exception{
		String sql = "select * from tbl_column where column_seq = ?";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, column_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String column_src = rs.getString("column_src");
				return column_src;
			}
			return null;
		}
	}
	
	public String getStringDate(Timestamp date) {
		// 1900년 02월 02일 00시 00분 00초
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		return sdf.format(date);
	}
	
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
		String sql = "select count(*) as totalCnt from tbl_column";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int totalCnt = rs.getInt("totalCnt"); 
			int recordCntPerPage = 4; 
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
