package com.dangpert.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangpert.dao.InformationDAO;
import com.dangpert.dto.InformationDTO;
import com.dangpert.dto.UserDTO;

@WebServlet("*.info")
public class InformationController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		response.setCharacterEncoding("utf-8");
	    request.setCharacterEncoding("utf-8");
		
		if(uri.equals("/toInformation.info")) { //FAQ페이지 요청
			InformationDAO dao = new InformationDAO();
			try {
				ArrayList<InformationDTO> list = dao.selectAll();

				request.setAttribute("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}			
			request.getRequestDispatcher("/user/information.jsp").forward(request, response);
		}else if(uri.equals("/write.info")) { // FAQ글쓰기페이지 요청
			response.sendRedirect("/manager/write.jsp");
		}else if(uri.equals("/writeProc.info")) { // FAQ글쓰기 요청
			UserDTO dto = (UserDTO)request.getSession().getAttribute("loginSession");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");

			System.out.println(qna_title + " : " + qna_content);

			InformationDAO dao = new InformationDAO();
			try {
				int rs = dao.write(new InformationDTO(0,qna_title,qna_content));
				
				if(rs > 0) {

					response.sendRedirect("/toInformation.info");

				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/view.info")) { //FAQ내용 페이지 요청
			int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
			System.out.println("qna_seq : " + qna_seq);
			
			InformationDAO dao = new InformationDAO();
			try {
				InformationDTO dto = dao.selectBySeq(qna_seq);
				request.setAttribute("dto", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/user/view.jsp").forward(request, response);
			
		}else if(uri.equals("/modify.info")) {// FAQ수정 페이지 요청
			int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
			
			System.out.println("qna_seq : " + qna_seq);

			InformationDAO dao = new InformationDAO();
			try {
				InformationDTO dto = dao.selectBySeq(qna_seq);
				System.out.println(dto.toString());
				request.setAttribute("dto", dto);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/manager/modify.jsp").forward(request, response);

		}else if(uri.equals("/modifyProc.info")) { // FAQ수정 요청
			int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");

			System.out.println("qna_title : " + qna_title);
			
			System.out.println(qna_title);
			
			InformationDAO dao = new InformationDAO();
			try {
				int rs = dao.modify(new InformationDTO(qna_seq,qna_title,qna_content));
				if(rs>0) {
					response.sendRedirect("/view.info?qna_seq="+qna_seq);
				} 
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/deleteProc.info")) {// FAQ삭제 요청
			int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
			System.out.println("qna_seq :" + qna_seq);

			InformationDAO dao = new InformationDAO();
			
			try {
				int rs = dao.delete(qna_seq);
				if(rs > 0) {
					// 삭제완료 후에는 게시글 목록을 요청
					response.sendRedirect("/toInformation.info");
				}
			}catch(Exception e) {	
				e.printStackTrace();
			}
		}
	}
}