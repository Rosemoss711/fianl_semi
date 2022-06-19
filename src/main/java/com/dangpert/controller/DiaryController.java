package com.dangpert.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.dangpert.dao.DiaryDAO;
import com.dangpert.dao.UserDAO;
import com.dangpert.dto.DiaryDTO;
import com.dangpert.dto.UserDTO;
import com.dangpert.dto.UserDataDTO;


@WebServlet("*.diary")
public class DiaryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		
		if(uri.equals("/diaryWrite.diary")) {	// 다이어리 작성
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO)session.getAttribute("loginSession");
			
			int user_seq = dto.getUser_seq();			
			String diary_content = request.getParameter("diary_content");
			String diary_part = request.getParameter("diary_part");
			int diary_weight = Integer.parseInt(request.getParameter("diary_weight")); // 무게
			int user_weight = Integer.parseInt(request.getParameter("user_weight")); // 유저 몸무게
			
			UserDAO userDAO = new UserDAO();
			DiaryDAO dao = new DiaryDAO();
			
			try {
				int rs1 = userDAO.weightModify(user_seq, user_weight);
				int rs2 = dao.insert(dto.getUser_seq(), diary_content, diary_part, diary_weight);
				
				if(rs2 > 0) {
					System.out.println("일기올리기 성공");
					response.sendRedirect("/toDiarypage.diary");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(uri.equals("/diaryModify.diary")) {
			HttpSession session = request.getSession();
			UserDTO user_dto = (UserDTO)session.getAttribute("loginSession");
			DiaryDAO dao = new DiaryDAO();
			UserDAO userDAO = new UserDAO();
			
			int user_seq = user_dto.getUser_seq();	
			int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
			String diary_content = request.getParameter("diary_content");
			String diary_part = request.getParameter("diary_part");
			int diary_weight = Integer.parseInt(request.getParameter("diary_weight")); // 무게
			int user_weight = Integer.parseInt(request.getParameter("user_weight")); // 유저 몸무게
			
			try {
				int rs = dao.update(new DiaryDTO(diary_seq, user_seq, null, diary_content, diary_part, diary_weight));
				int rs2 = userDAO.weightModify(user_seq, user_weight);
				
				if(rs > 0) {
					System.out.println("다이어리 수정 완료");
					
					response.sendRedirect("/toDiaryDetail.diary?diary_seq="+diary_seq);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		} else if(uri.equals("/toDiarypage.diary")) {		// 다이어리 목록 띄우기
			HttpSession session = request.getSession();
			UserDTO user_dto = (UserDTO)session.getAttribute("loginSession");
			DiaryDAO dao = new DiaryDAO();
			
			try {
				ArrayList<DiaryDTO> list = dao.select(user_dto.getUser_seq());
				request.setAttribute("list", list);
								
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/user/myPage_diary.jsp").forward(request, response);
		} else if(uri.equals("/diaryDelete.diary")) {	// 다이어리 삭제
			int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
			System.out.println("diary_seq : " + diary_seq);
			
			DiaryDAO dao = new DiaryDAO();
			try {
				int rs = dao.delete(diary_seq);
				if(rs > 0) {
					response.sendRedirect("/toDiarypage.diary");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/toDiaryDetail.diary")) {
			int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
			System.out.println("diary_seq : " + diary_seq);
			HttpSession session = request.getSession();
			UserDTO user_dto = (UserDTO)session.getAttribute("loginSession");
			DiaryDAO dao = new DiaryDAO();
			UserDAO userDAO = new UserDAO();
			try {
				UserDataDTO dataDTO = userDAO.DataSelect(user_dto.getUser_seq());
				DiaryDTO dto = dao.selectBySeq(diary_seq);
				
				request.setAttribute("dataDTO", dataDTO);
				request.setAttribute("dto", dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/user/myPage_diary_detail.jsp").forward(request, response);
			
		}
	}
	
	
}
