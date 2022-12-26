package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ClassDAO;
import dto.ClassDTO;
import dto.memberDTO;


@WebServlet("/ClassJoinCon.do")
public class ClassJoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		파일
		
		
		String realFolder = "";
		String saveFolder = "/uploads";
		String encType = "utf-8";
		int maxSize = 1024 * 1024;
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("실제 저장될 위치:" + realFolder);
		
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			
			System.out.println(realFolder);
		
			memberDTO mdto = new memberDTO();
		
			ClassDTO cdto = new ClassDTO();
			
			cdto.setSubject(multi.getParameter("subject"));
			cdto.setLecture_check(multi.getParameter("check"));
			cdto.setLecture_name(multi.getParameter("lecture_name"));
			cdto.setSubject_img(multi.getFilesystemName("subject_img"));
			cdto.setSubject_saveImg(multi.getOriginalFileName("subject_img"));
			cdto.setClass_date(multi.getParameter("class_date"));
			cdto.setProfessor(multi.getParameter("professor"));
			
			ClassDAO cdao = new ClassDAO();
			cdao.insertClass(cdto);
			String subject = URLEncoder.encode(multi.getParameter("subject"), "UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.sendRedirect("ClassView.do?subject=" + subject );
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
