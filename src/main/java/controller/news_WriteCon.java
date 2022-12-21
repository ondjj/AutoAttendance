package controller;

import java.io.File;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.news_DAO;
import dto.News_DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/news_Write.do")
public class news_WriteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/news_Write.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String saveDirectory = request.getServletContext().getRealPath("/uploads");

		// 업로드 디렉토리의 물리적인 경로를 확인함
		ServletContext application = getServletContext();

		// web.xml에서 매개변수로 설정한 첨부 파일 최대 용량 대입시킴
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		// 파일 업로드 실행
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		if (mr == null) {
			JSFunction.alertLocation(response, "첨부 파일 제한 용량 초과", "/news_Write.do");
		}
		
		// 폼에서 입력한 값을 dto 객체에 저장
		News_DTO dto = new News_DTO();
		dto.setNews_writer(mr.getParameter("n_writer"));
		dto.setNews_subject(mr.getParameter("n_subject"));
		dto.setNews_content(mr.getParameter("n_content"));
		
		String fileName = mr.getFilesystemName("img_ofile");
		// 기존 파일이 있는 경우 날짜/시간 데이터를 이용하여 [파일명(날짜/시간).확장자]를 만들어서 저장함
		if (fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			// 파일명 변경						  경로 + 가운데 구분자 "/" + 파일명
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			
			dto.setNews_oimg(fileName);
			dto.setNews_simg(newFileName);
			
		}
		
		// dao를 통해서 db에 게시물 내용 저장
		news_DAO dao = new news_DAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		
		// 입력이 성공했으면 공지사항 리스트로 이동, 실패했으면 원상복귀
		if (result == 1) {
			response.sendRedirect("./news_List.do");
			System.out.println("뉴스 등록완료");
		}else {
			response.sendRedirect("./news_Write.do");
			System.out.println("뉴스 등록실패");
		}
		

	}
}
