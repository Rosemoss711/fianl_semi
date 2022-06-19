package com.dangpert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.dangpert.dto.GymCouponDTO;
import com.dangpert.dto.GymFolderDTO;
import com.dangpert.dto.GymInfoDTO;
import com.dangpert.dto.GymPriceDTO;
import com.dangpert.dto.GymProgramDTO;
import com.dangpert.dto.UserDTO;
import com.dangpert.dto.UsergymInterestDTO;
//import com.dangpert.dto.UsergymInterestDTO;

public class GymDAO {
	private BasicDataSource bds;
	
	public GymDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

	public String createCoupon() { // 쿠폰 생성
		int n = 16; // n자리 쿠폰 
		char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < n; i++) {
			char ch = chs[rd.nextInt(chs.length)];
			sb.append(ch);
		}
		return sb.toString();
	}
	
	public int getNewSeq() throws Exception{ // gym_seq 생성
		String sql = "select gym_seq.nextval from dual";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	/* INFO CRUD */
	
	public int addInfo(UserDTO userDTO, GymInfoDTO gymInfoDTO, String extraAddr) throws Exception { // info insert
		String sql = "insert all into tbl_gym values(?, ?) into tbl_gym_info values(gym_seq.currval, ?, ?, ?, ?, ?, ?, ?, ?, ?) into tbl_gym_price values(gym_seq.currval, gym_price_seq.nextval, ?, ?) select * from dual";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			if(gymInfoDTO.getGym_extraAddr().equals(gymInfoDTO.getGym_detailAddr())) {
				pstmt.setInt(1, gymInfoDTO.getGym_seq());
				pstmt.setInt(2, userDTO.getUser_seq());
				pstmt.setString(3, gymInfoDTO.getGym_name());
				pstmt.setString(4, gymInfoDTO.getGym_phone());
				pstmt.setString(5, gymInfoDTO.getGym_postcode());
				pstmt.setString(6, gymInfoDTO.getGym_roadAddr());
				pstmt.setString(7, gymInfoDTO.getGym_detailAddr());
				pstmt.setString(8, extraAddr);
				pstmt.setString(9, gymInfoDTO.getGym_time());
				pstmt.setString(10, gymInfoDTO.getGym_comment());
				pstmt.setString(11, gymInfoDTO.getGym_src_main());
				pstmt.setString(12, gymInfoDTO.getGym_month());
				pstmt.setInt(13, gymInfoDTO.getGym_price());
				
				return pstmt.executeUpdate();
				
			}else {
			pstmt.setInt(1, gymInfoDTO.getGym_seq());
			pstmt.setInt(2, userDTO.getUser_seq());
			pstmt.setString(3, gymInfoDTO.getGym_name());
			pstmt.setString(4, gymInfoDTO.getGym_phone());
			pstmt.setString(5, gymInfoDTO.getGym_postcode());
			pstmt.setString(6, gymInfoDTO.getGym_roadAddr());
			pstmt.setString(7, gymInfoDTO.getGym_detailAddr());
			pstmt.setString(8, gymInfoDTO.getGym_extraAddr());
			pstmt.setString(9, gymInfoDTO.getGym_time());
			pstmt.setString(10, gymInfoDTO.getGym_comment());
			pstmt.setString(11, gymInfoDTO.getGym_src_main());
			pstmt.setString(12, gymInfoDTO.getGym_month());
			pstmt.setInt(13, gymInfoDTO.getGym_price());
			
			}
			return pstmt.executeUpdate();
		}
	}
	
	public ArrayList<GymInfoDTO> selectAllGym() throws Exception { // 전체 리스트
		String sql = "select * from tbl_gym_info join tbl_gym_price using(gym_seq)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<GymInfoDTO> list = new ArrayList<GymInfoDTO>();
			while(rs.next()) {
				int gym_seq = rs.getInt("gym_seq");
				String gym_name = rs.getString("gym_name");
				String gym_phone = rs.getString("gym_phone");
				String gym_postcode= rs.getString("gym_postcode");
				String gym_roadAddr = rs.getString("gym_roadAddr");
				String gym_detailAddr = rs.getString("gym_detailAddr");
				String gym_extraAddr = rs.getString("gym_extraAddr");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				String gym_time = rs.getString("gym_time");
				String gym_comment = rs.getString("gym_comment");
				String gym_src_main = rs.getString("gym_src_main");
					
				list.add(new GymInfoDTO(gym_seq, gym_name,gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, gym_month, gym_price, gym_time, gym_comment, gym_src_main));
			}
			return list;
		}
	}
	
	public ArrayList<GymInfoDTO> selectAllGymNoPrice() throws Exception { // 가격 없는 리스트
		String sql = "select * from tbl_gym_info";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<GymInfoDTO> list = new ArrayList<GymInfoDTO>();
			while(rs.next()) {
				int gym_seq = rs.getInt("gym_seq");
				String gym_name = rs.getString("gym_name");
				String gym_phone = rs.getString("gym_phone");
				String gym_postcode= rs.getString("gym_postcode");
				String gym_roadAddr = rs.getString("gym_roadAddr");
				String gym_detailAddr = rs.getString("gym_detailAddr");
				String gym_extraAddr = rs.getString("gym_extraAddr");
				String gym_time = rs.getString("gym_time");
				String gym_comment = rs.getString("gym_comment");
				String gym_src_main = rs.getString("gym_src_main");
					
				list.add(new GymInfoDTO(gym_seq, gym_name,gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, null, 0, gym_time, gym_comment, gym_src_main));
			}
			return list;
		}
	}
	
	public ArrayList<GymInfoDTO> selectLocationList(String searchLocation) throws Exception{ // 장소검색 후 리스트 가져오기
		String sql= "select * from tbl_gym_info join tbl_gym_price using(gym_seq) where gym_roadAddr like '%'||?||'%'";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, searchLocation);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymInfoDTO> list = new ArrayList<>();
			while(rs.next()) {
				int gym_seq = rs.getInt("gym_seq");
				String gym_name = rs.getString("gym_name");
				String gym_phone = rs.getString("gym_phone");
				String gym_postcode = rs.getString("gym_postcode");
				String gym_roadAddr = rs.getString("gym_roadAddr");
				String gym_detailAddr = rs.getString("gym_detailAddr");
				String gym_extraAddr = rs.getString("gym_extraAddr");
				String gym_time = rs.getString("gym_time");
				String gym_comment = rs.getString("gym_comment");
				String gym_src_main = rs.getString("gym_src_main");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				list.add(new GymInfoDTO(gym_seq, gym_name,gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, gym_month, gym_price, gym_time, gym_comment, gym_src_main));
			}
			return list;
		}
	}
	
	public ArrayList<GymInfoDTO> selectSeqList(int gym_seq) throws Exception{ // seq 로 리스트 받아오기
		String sql = "select * from tbl_gym_info g join tbl_gym_price p on g.gym_seq = p.gym_seq join tbl_gym_folder f on g.gym_seq = f.gym_seq where g.gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymInfoDTO> list = new ArrayList<>();
			while(rs.next()) {
				String gym_name = rs.getString("gym_name");
				String gym_phone = rs.getString("gym_phone");
				String gym_postcode = rs.getString("gym_postcode");
				String gym_roadAddr = rs.getString("gym_roadAddr");
				String gym_detailAddr = rs.getString("gym_detailAddr");
				String gym_extraAddr = rs.getString("gym_extraAddr");
				String gym_time = rs.getString("gym_time");
				String gym_comment = rs.getString("gym_comment");
				String gym_src_main = rs.getString("gym_src_main");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				list.add(new GymInfoDTO(gym_seq, gym_name,gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, gym_month, gym_price, gym_time, gym_comment, gym_src_main));

			}
			return list;
		}
	}
	
	public GymInfoDTO selectSeq(int gym_seq) throws Exception{
		String sql = "select * from tbl_gym_info g join tbl_gym_price p on g.gym_seq = p.gym_seq where g.gym_seq = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String gym_name = rs.getString("gym_name");
				String gym_phone = rs.getString("gym_phone");
				String gym_postcode = rs.getString("gym_postcode");
				String gym_roadAddr = rs.getString("gym_roadAddr");
				String gym_detailAddr = rs.getString("gym_detailAddr");
				String gym_extraAddr = rs.getString("gym_extraAddr");
				String gym_time = rs.getString("gym_time");
				String gym_comment = rs.getString("gym_comment");
				String gym_src_main = rs.getString("gym_src_main");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				return new GymInfoDTO(gym_seq, gym_name,gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, gym_month, gym_price, gym_time, gym_comment, gym_src_main);
			}
			return null;
		}
	}
	
	public int modifyInfo(GymInfoDTO gymInfoDTO, String gymSrcMainNow) throws Exception{
		String sql = "update tbl_gym_info set gym_name=?, gym_phone=?, gym_postcode=?, gym_roadAddr=?, gym_detailAddr=?, gym_extraAddr=?, gym_time=?, gym_comment=?, gym_src_main=? where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			if(gymInfoDTO.getGym_src_main() == null) {
				pstmt.setString(1, gymInfoDTO.getGym_name());
				pstmt.setString(2, gymInfoDTO.getGym_phone());
				pstmt.setString(3, gymInfoDTO.getGym_postcode());
				pstmt.setString(4, gymInfoDTO.getGym_roadAddr());
				pstmt.setString(5, gymInfoDTO.getGym_detailAddr());
				pstmt.setString(6, gymInfoDTO.getGym_extraAddr());
				pstmt.setString(7, gymInfoDTO.getGym_time());
				pstmt.setString(8, gymInfoDTO.getGym_comment());
				pstmt.setString(9, gymSrcMainNow);
				pstmt.setInt(10, gymInfoDTO.getGym_seq());
			}else {
				pstmt.setString(1, gymInfoDTO.getGym_name());
				pstmt.setString(2, gymInfoDTO.getGym_phone());
				pstmt.setString(3, gymInfoDTO.getGym_postcode());
				pstmt.setString(4, gymInfoDTO.getGym_roadAddr());
				pstmt.setString(5, gymInfoDTO.getGym_detailAddr());
				pstmt.setString(6, gymInfoDTO.getGym_extraAddr());
				pstmt.setString(7, gymInfoDTO.getGym_time());
				pstmt.setString(8, gymInfoDTO.getGym_comment());
				pstmt.setString(9, gymInfoDTO.getGym_src_main());
				pstmt.setInt(10, gymInfoDTO.getGym_seq());
			}
			return pstmt.executeUpdate();
		}
	}
	
	public int delete(int gym_seq) throws Exception{
		String sql = "delete from tbl_gym where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			return pstmt.executeUpdate();
		}
	}
	
	/* 가격 CRUD */
	
	public int addPrice(GymPriceDTO gymPriceDTO) throws Exception{
		String sql = "insert into tbl_gym_price values(?, gym_price_seq.nextval, ?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gymPriceDTO.getGym_seq());
			pstmt.setString(2, gymPriceDTO.getGym_month());
			pstmt.setInt(3, gymPriceDTO.getGym_price());
			
			return pstmt.executeUpdate();
		}
	}
	
	public int modifyPrice(GymPriceDTO gymPriceDTO, int price_seq) throws Exception{
		String sql = "update tbl_gym_price set gym_month=?, gym_price=? where gym_seq=? and gym_price_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, gymPriceDTO.getGym_month());
			pstmt.setInt(2, gymPriceDTO.getGym_price());			
			pstmt.setInt(3, gymPriceDTO.getGym_seq());
			pstmt.setInt(4, price_seq);
			
			return pstmt.executeUpdate();
		}
	}
	
	public ArrayList<GymPriceDTO> selectAllPrice() throws Exception{
		String sql = "select * from tbl_gym_price";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymPriceDTO> list = new ArrayList<>();
			while(rs.next()) {
				int gym_seq = rs.getInt("gym_seq");
				int gym_price_seq = rs.getInt("gym_price_seq");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				list.add(new GymPriceDTO(gym_seq, gym_price_seq, gym_month, gym_price));
			}
			return list;
		}
	}
	
	public ArrayList<GymPriceDTO> selectSeqPrice(int gym_seq) throws Exception{
		String sql = "select * from tbl_gym_price where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymPriceDTO> list = new ArrayList<>();
			while(rs.next()) {
				int gym_price_seq = rs.getInt("gym_price_seq");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				list.add(new GymPriceDTO(gym_seq, gym_price_seq, gym_month, gym_price));
			}
			return list;
		}
	}
	
	public GymPriceDTO selectSeqPriceDTO(int gym_seq) throws Exception{
		String sql = "select * from tbl_gym_price where gym_seq=?";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int gym_price_seq = rs.getInt("gym_price_seq");
				String gym_month = rs.getString("gym_month");
				int gym_price = rs.getInt("gym_price");
				
				return new GymPriceDTO(gym_seq, gym_price_seq, gym_month, gym_price);
			}
			return null;
		}
	}
	
	public int findGymManager(int gym_seq) throws Exception {
		String sql = "select user_seq from tbl_gym where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("user_seq");
			}
			return 0;
		}
	}
	
	/* 쿠폰 CRD */
	
	public int addCoupon(GymCouponDTO gymCouponDTO) throws Exception{
		String sql = "insert into tbl_gym_coupon values(?, ?, gym_coupon_seq.nextval, ?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, gymCouponDTO.getGym_seq());
			pstmt.setInt(2, gymCouponDTO.getUser_seq());
			pstmt.setInt(3, gymCouponDTO.getGym_price_seq());
			pstmt.setInt(4, gymCouponDTO.getCoupon_seq());
			pstmt.setString(5, gymCouponDTO.getGym_coupon_number());
			
			return pstmt.executeUpdate();
		}
	}
	
	public GymCouponDTO selectCouponByUserSeq(int user_seq) throws Exception{
		String sql = "select * from tbl_gym_coupon where user_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, user_seq);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int gym_seq = rs.getInt("gym_seq");
				int gym_price_seq = rs.getInt("gym_price_seq");
				int gym_coupon_seq = rs.getInt("gym_coupon_seq");
				String gym_coupon_number = rs.getString("gym_coupon_number");
				
				return new GymCouponDTO(gym_seq, user_seq, gym_price_seq, gym_coupon_seq, gym_coupon_number);
			}
			return null;
		}
	}
	
	/* 상세사진 CRUD */
	
	public int addDetailPic(ArrayList<GymFolderDTO> list) throws Exception{
		String sql = "insert into tbl_gym_folder values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			for(int i=0; i < list.size() ; i++) {
				pstmt.setString(1, list.get(i).getGym_src());
				pstmt.setInt(2, list.get(i).getGym_seq());
			}
				return pstmt.executeUpdate();
			}
		}
	
	public int addPic(GymFolderDTO dto) throws Exception{
		String sql = "insert into tbl_gym_folder values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			if(dto.getGym_src() == null) {
				return 0;
			}else {
				pstmt.setInt(1, dto.getGym_seq());
				pstmt.setString(2, dto.getGym_src());
			}
			
			return pstmt.executeUpdate();
		}
	}
	
	public ArrayList<GymFolderDTO> selectSeqDetailPic(int gym_seq) throws Exception{
		String sql = "select * from tbl_gym_folder where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
		
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymFolderDTO> list = new ArrayList<>();
			while(rs.next()) {
				String gym_src = rs.getString("gym_src");
				list.add(new GymFolderDTO(gym_seq, gym_src));
			}
			return list;
		}
	}
	
	public int modifyPicDTO(GymFolderDTO dto) throws Exception{
		String sql = "update tbl_gym_folder set gym_src=? where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			if(dto.getGym_src() == null) {
				return 0;
			}else {
				pstmt.setString(1, dto.getGym_src());
				pstmt.setInt(2, dto.getGym_seq());
			}
				return pstmt.executeUpdate();
			}
		}
	
	public int modifyPic(ArrayList<GymFolderDTO> dto) throws Exception{
		String sql = "update tbl_gym_folder set gym_src=? where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			for(int i=0; i < dto.size() ; i++) {
				pstmt.setString(1, dto.get(i).getGym_src());
				pstmt.setInt(2, dto.get(i).getGym_seq());
			}
				return pstmt.executeUpdate();
			}
		}
	
	/* 운영프로그램 CRUD */
	
	public int addProgram(GymProgramDTO dto) throws Exception {
		String sql = "insert into tbl_gym_program values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, dto.getGym_seq());
			pstmt.setString(2, dto.getGym_program());
			
			return pstmt.executeUpdate();
		}
	}
	
	public ArrayList<GymProgramDTO> selectSeqProgram(int gym_seq) throws Exception{
		String sql = "select * from tbl_gym_program where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
		
			pstmt.setInt(1, gym_seq);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<GymProgramDTO> list = new ArrayList<>();
			while(rs.next()) {
				String gym_program = rs.getString("gym_program");
				list.add(new GymProgramDTO(gym_seq, gym_program));
			}
			return list;
		}
	}
	
//	public int modifyProgram(GymProgramDTO dto) throws Exception{
//		String sql = "update tbl_gym_program set gym_program=? where gym_seq=?";
//		
//		try(Connection con = bds.getConnection();
//			PreparedStatement pstmt = con.prepareStatement(sql);){
//				
//				pstmt.setInt(1, dto.getGym_seq());
//				pstmt.setString(2, dto.getGym_program());
//				
//				return pstmt.executeUpdate();
//		}
//	}
	
	public int modifyProgram(ArrayList<GymProgramDTO> list) throws Exception{
		String sql = "update tbl_gym_program set gym_program=? where gym_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			System.out.println(list.toString());
			
			for(int i=0; i < list.size() ; i++) {
				pstmt.setString(1, list.get(i).getGym_program());
				pstmt.setInt(2, list.get(i).getGym_seq());
			}
			return pstmt.executeUpdate();
		}
	}
	
	/* 즐겨찾기 */
	
	public int insertInterestGym(int gym_seq, int user_seq) throws Exception { //즐겨찾기 추가
		String sql = "insert into user_gym_interest values(?, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setInt(1, gym_seq);
			pstmt.setInt(2, user_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public ArrayList<UsergymInterestDTO> interestGym(int user_seq) throws Exception{ //즐겨찾기 리스트 
		String sql = "select * from user_gym_interest where user_seq=?";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, user_seq);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<UsergymInterestDTO> list = new ArrayList<UsergymInterestDTO>();
			
			while(rs.next()){
				int gym_seq = rs.getInt("gym_seq");
				
				list.add(new UsergymInterestDTO(gym_seq, user_seq));
			}
			return list;
		}
	}
	
	public int delInterestGym(int gym_seq, int user_seq) throws Exception { //즐겨찾기 삭제
		String sql = "delete from user_gym_interest where gym_seq=? and user_seq=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, gym_seq);
			pstmt.setInt(2, user_seq);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
}