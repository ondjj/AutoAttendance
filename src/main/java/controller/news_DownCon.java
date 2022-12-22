package controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.news_DAO;
import fileupload.FileUtil;

@WebServlet("/news_Download.do")
public class news_DownCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매개변수 받기
		String oimg = request.getParameter("oimg"); // 원본 파일명
		String simg = request.getParameter("simg"); // 저장된 파일명
		int num = Integer.parseInt(request.getParameter("num")); // 게시물 번호
		
		// 파일 다운로드 호출
		FileUtil.download(request, response, "/uploads", simg, oimg);
		
//		// 해당 게시물 다운로드 수 증가
		news_DAO dao = new news_DAO();
		dao.downCountPlus(num);
		dao.close();
	}

}
