package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.data_lib_DAO;
import fileupload.FileUtil;

@WebServlet("/data_lib_download.do")
public class data_lib_DownCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매개변수 받기
		String ofile = request.getParameter("ofile"); // 원본 파일명
		String sfile = request.getParameter("sfile"); // 저장된 파일명
		int num = Integer.parseInt(request.getParameter("num")); // 게시물 번호
		
		// 파일 다운로드 호출
		FileUtil.download(request, response, "/uploads", sfile, ofile);
		
//		// 해당 게시물 다운로드 수 증가
		data_lib_DAO dao = new data_lib_DAO();
		dao.downCountPlus(num);
		dao.close();
	}

}
