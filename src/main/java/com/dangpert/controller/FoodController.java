package com.dangpert.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.ChannelSender;

import com.dangpert.dao.FoodDAO;
import com.dangpert.dto.FoodDTO;
import com.dangpert.dto.FoodFolderDTO;
import com.dangpert.dto.UserDTO;
import com.dangpert.dto.UserfoodInterestDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.food")
public class FoodController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		request.setCharacterEncoding("utf-8");

		if (uri.equals("/list.food")) { // 식품 비회원 리스트 요청
			FoodDAO dao = new FoodDAO();

			try {
				ArrayList<FoodDTO> listPromo = dao.selectPromo();
				ArrayList<FoodDTO> list = dao.selectHellin();
				
				request.setAttribute("listPromo", listPromo);
				request.setAttribute("list", list);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/food/foodGuestList.jsp").forward(request, response);
			
		}else if (uri.equals("/modifyList.food")) { // 식품 프로모션 관리자페이지 요청
			FoodDAO dao = new FoodDAO();

			int curPage = Integer.parseInt(request.getParameter("curPage"));
			try {
				HashMap map = dao.getPageNavi(curPage);

				ArrayList<FoodDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/food/foodModifyList.jsp").forward(request, response);
			
		} else if (uri.equals("/add.food")) { // 식품 프로모션 등록 페이지 요청
			response.sendRedirect("/food/foodAdd.jsp");
		} else if (uri.equals("/addProc.food")) { // 식품 프로모션 등록 요청
			FoodDAO dao = new FoodDAO();

			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;

			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
						new DefaultFileRenamePolicy());

				String food_com = multi.getParameter("food_com");
				String food_name = multi.getParameter("food_name");
				String food_title = multi.getParameter("food_title");
				int food_price = Integer.parseInt(multi.getParameter("food_price"));

				String food_src = multi.getFilesystemName("food_src");

				int food_seq = dao.getNewSeq();

				int rs = dao.insert(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, food_src));
				int rsFile = dao.addPic(new FoodFolderDTO(food_seq, food_src));

				if (rs > 0 && rsFile > 0) {
					System.out.println("식품 저장 성공");
					response.sendRedirect("/modifyList.food?curPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/modify.food")) { // 식품 프로모션 수정페이지 요청
			FoodDAO dao = new FoodDAO();
			int food_seq = Integer.parseInt(request.getParameter("food_seq"));

			try {
				FoodDTO dto = dao.selectSeq(food_seq);
				System.out.println(dto);
				request.setAttribute("dto", dto);

				FoodFolderDTO dtoPic = dao.selectPic(food_seq);
				System.out.println(dtoPic);
				request.setAttribute("dtoPic", dtoPic);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/food/foodModify.jsp").forward(request, response);
			
		} else if (uri.equals("/modifyProc.food")) { // 식품 프로모션 수정 요청
			FoodDAO dao = new FoodDAO();
			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
//			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;

			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
						new DefaultFileRenamePolicy());

				int food_seq = Integer.parseInt(multi.getParameter("food_seq"));
				String food_com = multi.getParameter("food_com");
				String food_name = multi.getParameter("food_name");
				String food_title = multi.getParameter("food_title");
				int food_price = Integer.parseInt(multi.getParameter("food_price"));
				
				String food_src = multi.getFilesystemName("food_src");

				int rs = dao.modify(new FoodDTO(food_seq, food_com, food_name, food_title, food_price, food_src));
				int rsFile = dao.modifyPic(new FoodFolderDTO(food_seq, food_src));
				
				if (rs > 0 || rsFile > 0) {
					System.out.println("수정 성공");
					response.sendRedirect("/modifyList.food?curPage=1");
				}else if (rs > 0){
					System.out.println("수정 성공");
					response.sendRedirect("/modifyList.food?curPage=1");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(uri.equals("/deleteProc.food")) { // 식품 프로모션 삭제 요청
			FoodDAO dao = new FoodDAO();
			int food_seq = Integer.parseInt(request.getParameter("food_seq"));
			System.out.println(food_seq);
			
			try {
				int rs = dao.delete(food_seq);
				
				if(rs > 0) {
					System.out.println("삭제 성공");
					response.sendRedirect("/modifyList.food?curPage=1");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/interest.food")) {
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO)session.getAttribute("loginSession");
			System.out.println(request.getParameter("food_seq"));
			int food_seq = Integer.parseInt(request.getParameter("food_seq"));
			FoodDAO dao = new FoodDAO();
			
			try {
				int rs = dao.insertInterestFood(food_seq, dto.getUser_seq());
			
				
				if (rs>0) {
					response.sendRedirect("/listLogin.food");
					System.out.println("푸드 프로모션 즐겨찾기");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/delInterest.food")){
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO)session.getAttribute("loginSession");
			int food_seq = Integer.parseInt(request.getParameter("food_seq"));
			FoodDAO dao = new FoodDAO();
			
			try {
				int rs = dao.delInterestFood(food_seq, dto.getUser_seq());
						
				if (rs > 0) {
					System.out.println("푸드 프로모션 즐겨찾기 삭제 성공");
					response.sendRedirect("/listLogin.food");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/listLogin.food")) { //로그인 시 푸드 리스트
			HttpSession session = request.getSession(); 
			UserDTO dto = (UserDTO)session.getAttribute("loginSession");
			FoodDAO dao = new FoodDAO();
			System.out.println("loginSession : " + dto);
			try {
				ArrayList<UserfoodInterestDTO> listInterest = dao.interestFood(dto.getUser_seq());
				ArrayList<FoodDTO> listPromo = dao.selectPromo();
				ArrayList<FoodDTO> list = dao.selectHellin();
					
				System.out.println("size: "+listInterest.size());
				
				request.setAttribute("listInterest", listInterest);
				request.setAttribute("listPromo", listPromo);
				request.setAttribute("list", list);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/food/foodList.jsp").forward(request, response);
		}
	}
}
