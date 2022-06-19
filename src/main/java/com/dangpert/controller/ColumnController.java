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

import com.dangpert.dao.ColumnDAO;
import com.dangpert.dto.ColumnDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.column")
public class ColumnController extends HttpServlet {
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

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		if (uri.equals("/toColumnPage.column")) { // column 페이지 요청
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			ColumnDAO dao = new ColumnDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);
				
				ArrayList<ColumnDTO> list = dao.selectAll(curPage*4-3,curPage*4);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/column/columnList.jsp").forward(request, response);
		} else if (uri.equals("/write.column")) { // column 글쓰기페이지 요청
			response.sendRedirect("/column/columnWrite.jsp");
		} else if (uri.equals("/register.column")) { // column 글쓰기 요청

			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;
			
			ColumnDAO dao = new ColumnDAO();
			
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
				int column_seq = dao.getNewSeq();
				String column_title = multi.getParameter("column_title");
				String column_content = multi.getParameter("column_content");
				String column_src = multi.getFilesystemName("column_src");
				System.out.println(column_src);
				int rs1 = dao.write(new ColumnDTO(column_seq, column_title,column_content,null,column_src));
				if(rs1 > 0) {
					System.out.println("컬럼 입력 성공");
					response.sendRedirect("/toColumnPage.column?curPage=1");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/view.column")) { // column 내용 요청
			int column_seq = Integer.parseInt(request.getParameter("column_seq"));

			System.out.println("column_seq : " + column_seq);

			ColumnDAO dao = new ColumnDAO();
			try {
				ColumnDTO dto = dao.selectBySeq(column_seq);
				request.setAttribute("dto", dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/column/columnView.jsp").forward(request, response);

		} else if (uri.equals("/modify.column")) {// column 수정 페이지 요청
			int column_seq = Integer.parseInt(request.getParameter("column_seq"));
			
			System.out.println("column_seq : " + column_seq);

			ColumnDAO dao = new ColumnDAO();
			try {
				ColumnDTO dto = dao.selectBySeq(column_seq);
				request.setAttribute("dto", dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/column/columnModify.jsp").forward(request, response);

		} else if (uri.equals("/modifyProc.column")) { // column 수정 요청

			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;
			
			ColumnDAO dao = new ColumnDAO();
			
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
				int column_seq = Integer.parseInt(multi.getParameter("column_seq"));
				String column_title = multi.getParameter("column_title");
				String column_content = multi.getParameter("column_content");
				String column_src = multi.getFilesystemName("column_src");
				
				String nowSrc = dao.selectBySeqNowSrc(column_seq);
				
				System.out.println(nowSrc);
				int rs1 = dao.modify(new ColumnDTO(column_seq, column_title,column_content,null,column_src), nowSrc);
				System.out.println("rs1 : " + rs1);
				if(rs1 > 0) {
						System.out.println("컬럼 수정 성공");
						response.sendRedirect("/view.column?column_seq="+column_seq);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		} else if (uri.equals("/deleteProc.column")) {// column 삭제 요청
			int column_seq = Integer.parseInt(request.getParameter("column_seq"));
			System.out.println("column_seq :" + column_seq);

			ColumnDAO dao = new ColumnDAO();

			try {
				int rs = dao.delete(column_seq);
				if (rs > 0) {
					// 삭제완료 후에는 게시글 목록을 요청
					response.sendRedirect("/toColumnPage.column?curPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
}
