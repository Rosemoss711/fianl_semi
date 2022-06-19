package com.dangpert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.dangpert.dto.FoodDTO;
import com.dangpert.dto.FoodFolderDTO;
import com.dangpert.dto.UserfoodInterestDTO;

public class FoodDAO {
	private BasicDataSource bds;
	
	public FoodDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNewSeq() throws Exception{
		String sql = "select food_seq.nextval from dual";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public FoodFolderDTO selectPic(int food_seq) throws Exception{
		String sql = "select * from tbl_food_folder where food_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, food_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int foodSeq = rs.getInt("food_seq");
				String food_src = rs.getString("food_src");
				
				return new FoodFolderDTO(foodSeq, food_src);
			}
			return null;
		}
	}
	
	public int modifyPic(FoodFolderDTO dto) throws Exception{
		String sql = "update tbl_food_folder set food_src=? where food_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			if(dto.getFood_src() == null) {
				return 0;
			}else {
				pstmt.setString(1, dto.getFood_src());
				pstmt.setInt(2, dto.getFood_seq());
			}
			
			System.out.println("DAO" + dto.toString());
			
			return pstmt.executeUpdate();
		}
	}
	
	public int delete(int food_seq) throws Exception{
		String sql = "delete from tbl_food where food_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, food_seq);
			
			return pstmt.executeUpdate();
		}
	}
	
	public int addPic(FoodFolderDTO dto) throws Exception{
		String sql = "insert into tbl_food_folder values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, dto.getFood_seq());
			pstmt.setString(2, dto.getFood_src());
			
			return pstmt.executeUpdate();
		}
	}
	
	public FoodDTO selectSeq(int food_seq) throws Exception{
		String sql = "select * from tbl_food where food_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, food_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String food_com = rs.getString("food_com");
				String food_name = rs.getString("food_name");
				String food_title = rs.getString("food_title");
				int food_price = rs.getInt("food_price");
				
				return new FoodDTO(food_seq, food_com, food_name, food_title, food_price, null);
			}
			return null;
		}
	}
	
	public ArrayList<FoodDTO> selectAllFood() throws Exception{
		String sql = "select * from tbl_food join tbl_food_folder using(food_seq)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FoodDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int food_seq = rs.getInt("food_seq");
				String food_com = rs.getString("food_com");
				String food_name = rs.getString("food_name");
				String food_title = rs.getString("food_title");
				int food_price = rs.getInt("food_price");
				String food_src = rs.getString("food_src");
				
				list.add(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, food_src));
			}
			return list;
		}
	}
	
	public ArrayList<FoodDTO> selectPromo() throws Exception{
		String sql = "select * from tbl_food f join tbl_food_folder p on f.food_seq = p.food_seq and food_name not like '%헬린이%'";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FoodDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int food_seq = rs.getInt("food_seq");
				String food_com = rs.getString("food_com");
				String food_name = rs.getString("food_name");
				String food_title = rs.getString("food_title");
				int food_price = rs.getInt("food_price");
				String food_src = rs.getString("food_src");
				
				list.add(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, food_src));
			}
			return list;
		}
	}
	
	public ArrayList<FoodDTO> selectHellin() throws Exception{
		String sql = " select * from tbl_food f join tbl_food_folder p on f.food_seq = p.food_seq and food_name like '%헬린이%'";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FoodDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int food_seq = rs.getInt("food_seq");
				String food_com = rs.getString("food_com");
				String food_name = rs.getString("food_name");
				String food_title = rs.getString("food_title");
				int food_price = rs.getInt("food_price");
				String food_src = rs.getString("food_src");
				
				list.add(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, food_src));
			}
			return list;
		}
	}
	
	public ArrayList<FoodDTO> selectAll(int start, int end) throws Exception{
		String sql = "select * from (select tbl_food.*, row_number() over (order by food_seq desc) as num from tbl_food) where num between ? and ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FoodDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int food_seq = rs.getInt("food_seq");
				String food_com = rs.getString("food_com");
				String food_name = rs.getString("food_name");
				String food_title = rs.getString("food_title");
				int food_price = rs.getInt("food_price");
				
				list.add(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, null));
			}
			return list;
		}
	}
	
	public int modify(FoodDTO dto) throws Exception {
		String sql = "update tbl_food set food_com=?, food_name=?, food_title=?, food_price=? where food_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, dto.getFood_com());
			pstmt.setString(2, dto.getFood_name());
			pstmt.setString(3, dto.getFood_title());
			pstmt.setInt(4, dto.getFood_price());
			pstmt.setInt(5, dto.getFood_seq());
			
			return pstmt.executeUpdate();
		}
	}
	
	public int insert(FoodDTO dto) throws Exception{
		String sql = "insert into tbl_food values(?, ?, ?, ?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, dto.getFood_seq());
			pstmt.setString(2, dto.getFood_com());
			pstmt.setString(3, dto.getFood_name());
			pstmt.setString(4, dto.getFood_title());
			pstmt.setInt(5, dto.getFood_price());
			
			return pstmt.executeUpdate();
		}
	}
	
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
		String sql = "select count(*) as totalCnt from tbl_food";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
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
	
	public int insertInterestFood(int food_seq , int user_seq) throws Exception{
		String sql = "insert into user_food_interest values (? , ? )";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, food_seq);
			pstmt.setInt(2, user_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
		
	}
	
	public ArrayList<UserfoodInterestDTO> interestFood(int user_seq) throws Exception{
		String sql = "select * from user_food_interest where user_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1,user_seq);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<UserfoodInterestDTO> list = new ArrayList<UserfoodInterestDTO>();
			
			while(rs.next()) {
				int food_seq = rs.getInt("food_seq");
				
				list.add(new UserfoodInterestDTO(food_seq, user_seq));
			}
			return list;
		}
	}
	
	public int delInterestFood(int food_seq, int user_seq) throws Exception {
		String sql = "delete from user_food_interest where food_seq=? and user_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, food_seq);
			pstmt.setInt(2, user_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
			
		}
		
	}
}