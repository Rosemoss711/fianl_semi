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

import com.dangpert.dao.PartDAO;
import com.dangpert.dto.PartDTO;
import com.dangpert.dto.PartFolderDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.part")
public class PartController extends HttpServlet {
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
		
		if(uri.equals("/listSign.part")) {  // 전체 페이지 요청
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);
			PartDAO dao = new PartDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);
				
				ArrayList<PartDTO> list = dao.selectAll(curPage*10-9, curPage*10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/part/partListSign.jsp").forward(request, response);
			
		} else if (uri.equals("/toList.part")) {  // 전체보기 페이지
			response.sendRedirect("/part/partList.jsp");
		} else if (uri.equals("/list.part")) {  // 근육별 페이지 요청
			String part_class = request.getParameter("part_class");
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(part_class + " : " + curPage);
			PartDAO dao = new PartDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);
				
				ArrayList<PartDTO> list = dao.selectAllPart(part_class, curPage*10-9, curPage*10);
				
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/part/partListSign.jsp").forward(request, response);
			
			
		} else if (uri.equals("/toPartInsert.part")) {  // 파트 입력 페이지 이동
			response.sendRedirect("/part/partAdd.jsp");
		} else if (uri.equals("/insert.part")) { // part 입력 받아주기
			
			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;
			
			PartDAO dao = new PartDAO();
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
				int part_seq = dao.getNewSeq();
				String part_title = multi.getParameter("part_title");
				String part_content = multi.getParameter("part_content");
				String part_class = multi.getParameter("part_class");
				String part_src = multi.getFilesystemName("part_src");
				System.out.println(part_src);
				int rs1 = dao.insert(new PartDTO(part_seq, part_title, part_content, part_class));
				if(rs1 > 0) {
					int rs2 = dao.insertPartFolder(part_seq, part_src);
					if (rs2 > 0) {
						System.out.println("파트 입력 성공");
						response.sendRedirect("/listSign.part?curPage=1");
					}
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/partModify.part")) { // 파트 수정
			PartDAO dao = new PartDAO();
			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			System.out.println(dir);

			if (!dir.exists()) {
				dir.mkdirs();
			}
			
			int maxSize = 1024 * 1024 * 10;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
				int part_seq = Integer.parseInt(multi.getParameter("part_seq"));
				System.out.println("part_seq : "+part_seq);
				String part_title = multi.getParameter("part_title");
				System.out.println("part_title : "+part_title);
				String part_content = multi.getParameter("part_content");
				System.out.println("part_content : " + part_content);
				String part_class = multi.getParameter("part_class");
				System.out.println("part_content : " + part_content);
				String part_src = multi.getFilesystemName("part_src");
				System.out.println("part_src : " + part_src);
				int rs1 = dao.modify(new PartDTO(part_seq, part_title, part_content, part_class));
				System.out.println("rs1 : " + rs1);
				if(rs1 > 0) {
					int rs2 = dao.modifyPartFolder(part_seq, part_src);
					System.out.println("rs2 : " + rs2);
					if(rs2 > 0) {
						System.out.println("파트 수정 성공");
						response.sendRedirect("/partDetail.part?part_seq="+part_seq);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (uri.equals("/partDetail.part")) { // 파트 디테일 페이지
			int part_seq = Integer.parseInt(request.getParameter("part_seq"));
			
			PartDAO dao = new PartDAO();
			
			try {
				PartDTO dto = dao.selectBySeq(part_seq);
				PartFolderDTO FolderDTO = dao.selectBySeqFolder(part_seq);
				request.setAttribute("dto", dto);
				request.setAttribute("FolderDTO", FolderDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/part/partDetail.jsp").forward(request, response); 
		} else if (uri.equals("/toPartModify.part")) { // 파트 수정페이지 이동
			int part_seq = Integer.parseInt(request.getParameter("part_seq"));
			PartDAO dao = new PartDAO();
			System.out.println("part_seq : " + part_seq);
			try {
				PartDTO dto = dao.selectBySeq(part_seq);
				PartFolderDTO FolderDTO = dao.selectBySeqFolder(part_seq);
				
				request.setAttribute("dto", dto);
				request.setAttribute("FolderDTO", FolderDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/part/partModify.jsp").forward(request, response);
			
		} else if (uri.equals("/delete.part")) { // 파트 삭제
			int part_seq = Integer.parseInt(request.getParameter("part_seq"));
			PartDAO dao = new PartDAO();
			
			try {
				int rs = dao.delete(part_seq);
				if(rs > 0) {
					System.out.println("파트 삭제 완료");
					response.sendRedirect("/listSign.part?curPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
