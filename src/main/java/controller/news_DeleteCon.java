package controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.news_DAO;
import dto.News_DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/news_Delete.do")
public class news_DeleteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("num", request.getParameter("num"));
		
		String num = request.getParameter("num");
		news_DAO dao = new news_DAO();
		News_DTO dto = dao.selectView(num);
		int result = dao.deletePost(num);
		dao.close();
		
		
		if (result == 1) {
			String saveFileName = dto.getNews_simg();
			FileUtil.deleteFile(request, "/uploads", saveFileName);  
		}
		
		JSFunction.alertLocation(response, "공지사항 삭제 완료", "./news_List.do");
	}

}
