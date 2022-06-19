package com.dangpert.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangpert.dao.UserDAO;
import com.dangpert.dto.UserDTO;
import com.dangpert.mail.SendMail;
import com.google.gson.Gson;

@WebServlet("*.manager")
public class ManagerController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		
		if(uri.equals("/userSerch.manager")) { // 유저 검색 페이지
			
			UserDAO dao = new UserDAO();
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			
			try {
				HashMap map = dao.getPageNavi(curPage);
				
				ArrayList<UserDTO> list = dao.selectAll(curPage*10-9,curPage*10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/manager/search.jsp").forward(request, response);
			
			
		} else if (uri.equals("/managerUpdate.manager")) { //회원 수정버튼 눌렀을때 ajax 실행
			
			int user_seq = Integer.parseInt(request.getParameter("user_seq"));
			System.out.println(user_seq);
			UserDAO dao = new UserDAO();
			try {
				UserDTO dto = dao.selectBySeq(user_seq);
				Gson gson = new Gson();
				String rs = gson.toJson(dto);
				response.getWriter().append(rs);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (uri.equals("/toSendmail.manager")) { // 유저 메일보내기 페이지 이동
			response.sendRedirect("/manager/sendmail.jsp");
			
		} else if (uri.equals("/sendMail.manager")) { // 전체 유저 메일 보내기
			String title = request.getParameter("mail-title");
			String content = request.getParameter("mail-content");
			UserDAO UserDao = new UserDAO();
			try {
				
				ArrayList<UserDTO> userList = UserDao.selectAllMail();
				SendMail sm = new SendMail();
				
				if(userList.size() > 0) {
					for(UserDTO dto : userList) {
						String user_id = dto.getUser_id();
						String user_name = dto.getUser_name();
						sm.sendMail(title, content, user_id, user_name);
					}
					System.out.println("전체 메일 보내기 성공");
				} else {
					System.out.println("메일을 보낼 유저가 업습니다.");
				}
				response.sendRedirect("/toSendmail.manager");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (uri.equals("/user_update.manager")) { // 유저정보 수정해주기
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			String user_auth = request.getParameter("user_auth");
			
			
			System.out.println(user_id + " : " + user_name + " : " + user_phone + " : "+ user_auth);
			UserDAO dao = new UserDAO();
			try {
				int rs = dao.manager_userUpdate(new UserDTO(0, user_id, null, user_name, user_phone, null, user_auth, null));
				if (rs > 0) {
					System.out.println("업데이트 성공");
					response.sendRedirect("/userSerch.manager?curPage=1");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
	
	} 

}
