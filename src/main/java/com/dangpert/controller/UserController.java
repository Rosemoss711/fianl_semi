package com.dangpert.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangpert.dao.FoodDAO;
import com.dangpert.dao.GymDAO;
import com.dangpert.dao.UserDAO;
import com.dangpert.dto.FoodDTO;
import com.dangpert.dto.GymInfoDTO;
import com.dangpert.dto.UserDTO;
import com.dangpert.dto.UserDataDTO;
import com.dangpert.dto.UserfoodInterestDTO;
import com.dangpert.dto.UsergymInterestDTO;
import com.dangpert.mail.SendMail;
import com.dangpert.utils.EncryptionUtils;
import com.google.gson.Gson;
import com.google.gson.annotations.Until;

@WebServlet("*.user")
public class UserController extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();

		if (uri.equals("/signup.user")) { // 회원가입 요청
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");

			UserDAO dao = new UserDAO();
			try {
				user_pw = EncryptionUtils.getSHA512(user_pw);
				System.out.println("user 암호화 비밀번호 :" + user_pw);
				int rs = dao.insert(new UserDTO(0, user_id, user_pw, user_name, user_phone, null, null, null));

				if (rs > 0) {
					UserDTO dto = dao.selectByUserId(user_id);
					int rs2 = dao.userDataInsert(dto);
					if (rs2 > 0) {
						response.sendRedirect("/user/login.jsp");
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/idCheckPopup.user")) { // 팝업 띄우기
			response.sendRedirect("/user/popup.jsp");

		} else if (uri.equals("/idCheck.user")) { // 아이디 체크
			String user_id = request.getParameter("user_id");
			System.out.println(user_id);
			SendMail sm = new SendMail();
			UserDAO dao = new UserDAO();
			try {
				boolean rs = dao.idCheck(user_id);
				if (rs) {
					request.setAttribute("rs", "ok");
					int RanNum = sm.compare(user_id);
					request.setAttribute("compareNum", RanNum);
				} else {
					request.setAttribute("rs", "no");
				}

				request.setAttribute("user_id", user_id);
				request.getRequestDispatcher("/user/popup.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/compare.user")) { // 유저 인증
			String user_id = request.getParameter("compareUser");

			request.setAttribute("user_id", user_id);
			request.getRequestDispatcher("/user/popup.jsp").forward(request, response);

		} else if (uri.equals("/login.user")) { // 로그인 페이지 요청
			response.sendRedirect("/user/login.jsp");
		} else if (uri.equals("/loginOk.user")) { // 로그인 확인
			String user_id = request.getParameter("user_id");
	         String user_pw = request.getParameter("user_pw");

	         UserDAO dao = new UserDAO();
	         try {
	            System.out.println(user_pw);
	            user_pw = EncryptionUtils.getSHA512(user_pw);
	            
	            UserDTO dto = dao.loginOk(user_id, user_pw);
	            if (dto != null) {
	               int rs = dao.userLogin(dto.getUser_seq());
	               if (rs > 0) {
	                  System.out.println("로그인 성공!");
	                  request.setAttribute("rs", true);
	                  HttpSession session = request.getSession();
	                  session.setAttribute("loginSession", dto);
	               }
	            } else {
	               System.out.println("로그인 실패!");
	               System.out.println(user_pw);
	               request.setAttribute("rs", false);
	            }
	            request.getRequestDispatcher("/home").forward(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
		} else if (uri.equals("/toSignup.user")) { // 회원가입 페이지 요청
			response.sendRedirect("/user/signup.jsp");

		} else if (uri.equals("/userModify.user")) { // 수정페이지 유저 정보 뿌려주기
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("loginSession");
			UserDAO dao = new UserDAO();
			try {
				UserDataDTO data_dto = dao.DataSelect(dto.getUser_seq());

				request.setAttribute("dto", dto);
				request.setAttribute("data_dto", data_dto);

			} catch (Exception e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("/user/myPage_user_modify.jsp").forward(request, response);

		} else if (uri.equals("/userDataModify.user")) { // 유저 정보 변경
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("loginSession");

			String user_pw = request.getParameter("user_pw");
			int weight = Integer.parseInt(request.getParameter("weight"));
			int final_weight = Integer.parseInt(request.getParameter("final_weight"));
			UserDAO dao = new UserDAO();
			System.out.println("user_pw : " + user_pw);

			try {
				if (!user_pw.equals("empty")) { // 변경 비밀번호가 있을때
					user_pw = EncryptionUtils.getSHA512(user_pw);
					int rs = dao.update(user_pw, dto.getUser_seq());
					System.out.println("rs : " + rs);
					int rs2 = dao.DataUpdate(weight, final_weight, dto.getUser_seq());
					System.out.println("rs2 : " + rs2);
					if (rs > 0 && rs2 > 0) {
						UserDataDTO data_dto = dao.DataSelect(dto.getUser_seq());
						request.setAttribute("dto", dto);
						request.setAttribute("data_dto", data_dto);
					}
				} else { // 변경 비밀번호가 없을때
					int rs2 = dao.DataUpdate(weight, final_weight, dto.getUser_seq());
					if (rs2 > 0) {
						UserDataDTO data_dto = dao.DataSelect(dto.getUser_seq());
						request.setAttribute("dto", dto);
						request.setAttribute("data_dto", data_dto);
					}
				}
				request.getRequestDispatcher("/user/myPage_user_modify.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/userDiary.user")) { // 유저 일기장 페이지 요청
			response.sendRedirect("/toDiarypage.diary");

		} else if (uri.equals("/logout.user")) { // 로그아웃 요청
			HttpSession session = request.getSession();
			session.getAttribute("loginSession");
			session.removeAttribute("loginSession");
			response.sendRedirect("/home");

		} else if (uri.equals("/toMypage.user")) { // 마이 페이지 요청
			 HttpSession session = request.getSession();
	         UserDTO dto = (UserDTO)session.getAttribute("loginSession");
	         UserDAO dao = new UserDAO();
	         FoodDAO dao2 = new FoodDAO();
	         GymDAO dao3 = new GymDAO(); 
	         
	         try {
	        	 UserDataDTO dataDTO = dao.DataSelect(dto.getUser_seq());
	        	 
	            ArrayList<UserfoodInterestDTO> listInterest = dao2.interestFood(dto.getUser_seq());
//	            ArrayList<FoodDTO> listPromo = dao2.selectPromo();
	            ArrayList<FoodDTO> list = dao2.selectHellin();
	            ArrayList<UsergymInterestDTO> ugi_dto = dao3.interestGym(dto.getUser_seq());
	            ArrayList<GymInfoDTO> gym_dto = dao3.selectAllGym();
	            ArrayList<FoodDTO> listPromo = dao2.selectAllFood();
	            
	            
	            int userWeight = dataDTO.getFinal_weight()-dataDTO.getWeight();
	            System.out.println("userWeight :" + userWeight);
	            request.setAttribute("userWeight", userWeight);
	            request.setAttribute("listInterest", listInterest);
	            request.setAttribute("listPromo", listPromo);
	            request.setAttribute("list", list);
	            request.setAttribute("ugi_dto", ugi_dto);
	            request.setAttribute("gym_dto", gym_dto);
	            request.setAttribute("dto", dto);
	   
	            
	         }catch(Exception e) {
	            e.printStackTrace();
	         }

			
			request.getRequestDispatcher("/user/myPage_user.jsp").forward(request, response);
		} else if (uri.equals("/userDiaryWrite.user")) { // 일기쓰기 페이지 요청
			response.sendRedirect("/user/myPage_diary_write.jsp");

		} else if (uri.equals("/search.user")) { // manager 유저 검색
			UserDAO dao = new UserDAO();
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			try {
				HashMap map = dao.getPageNavi(curPage);

				ArrayList<UserDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/manager/search.jsp").forward(request, response);

		} else if (uri.equals("/managerUpdate.user")) { // 회원 수정버튼 눌렀을때 ajax 실행

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

		} else if (uri.equals("/pwOk.user")) { // 수정페이지 비밀번호 확인
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("loginSession");
			String user_pw = request.getParameter("beforPw");
			UserDAO dao = new UserDAO();

			try {
				request.setAttribute("user_pw", user_pw);
				System.out.println(user_pw);
				user_pw = EncryptionUtils.getSHA512(user_pw);
				System.out.println(user_pw);

				if (user_pw.equals(dto.getUser_pw())) {
					request.setAttribute("rs", "ok");
					UserDataDTO data_dto = dao.DataSelect(dto.getUser_seq());
					request.setAttribute("data_dto", data_dto);
					request.setAttribute("dto", dto);
				} else {
					UserDataDTO data_dto = dao.DataSelect(dto.getUser_seq());
					request.setAttribute("rs", "no");
					request.setAttribute("data_dto", data_dto);
					request.setAttribute("dto", dto);
				}

				request.getRequestDispatcher("/user/myPage_user_modify.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/userDelete.user")) { // 회원 탈퇴
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("loginSession");
			UserDAO dao = new UserDAO();

			try {
				int rs = dao.delete(dto.getUser_seq());
				if (rs > 0) {
					session.removeAttribute("loginSession");
					response.sendRedirect("/home");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/searchPwPopup.user")) { // 유저 비밀번호 찾기 팝업
			response.sendRedirect("/user/searchPw.jsp");
		} else if (uri.equals("/searchUserPw.user")) { // 유저 비밀번호 찾기 / 변경
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");

			UserDAO dao = new UserDAO();
			SendMail sm = new SendMail();

			try {
				UserDTO dto = dao.searchUserPw(user_id, user_name, user_phone);
				if (dto == null) {
					request.setAttribute("rs", "no");
				} else {
					String randomPw = sm.randomPw(user_id);
					System.out.println(randomPw);

					// 시연할때 쓸 것들 만드는용
					// String randomPw = "asd123";

					randomPw = EncryptionUtils.getSHA512(randomPw);
					int rs = dao.randomPwUpdate(user_id, randomPw);
					System.out.println(rs);
					if (rs > 0) {
						request.setAttribute("rs", "ok");
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/user/searchPw.jsp").forward(request, response);
		} else if (uri.equals("/managerSearch.user")) {
			String user_name = request.getParameter("user_name");
			UserDAO dao = new UserDAO();
			ArrayList<UserDTO> list = new ArrayList<UserDTO>();
			try {
				list = dao.selectByName(user_name);
				Gson gson = new Gson();
				String rs = gson.toJson(list);

				response.getWriter().append(rs);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/searchIdPopup.user")) { // 유저 아이디 찾기 팝업
			response.sendRedirect("/user/searchId.jsp");
		} else if (uri.equals("/searchUserId.user")) { // 유저 이메일찾기
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			
			UserDAO dao = new UserDAO();
			
			try {
				String user_id = dao.searchUserId(user_name, user_phone);
				if(user_id == null) {
					request.setAttribute("rs", "no");
				} else {
					request.setAttribute("rs", "ok");
					StringBuffer sb = new StringBuffer();
					sb.append(user_id);
					sb.replace(5, user_id.length()-7, "****");
					
					System.out.println("user_id : " + sb);
					request.setAttribute("user_id", sb);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/user/searchId.jsp").forward(request, response);
			
		}

	}
}
