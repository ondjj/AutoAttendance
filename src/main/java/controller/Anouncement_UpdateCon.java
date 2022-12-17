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

import dao.AnouncementDAO;
import dto.AnouncementDTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/Anouncement_Update.do")
public class Anouncement_UpdateCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		AnouncementDAO dao = new AnouncementDAO();
		AnouncementDTO dto = dao.selectView(num);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/Anouncement_Update.jsp").forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드 처리 ====
		// 업로드 디렉터리의 물리적 경로 확인
		String saveDirectory = request.getServletContext().getRealPath("/uploads");
		
		// 초기화 매개변수로 설정한 첨부 파일 최대 용량 확인
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		// 파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if (mr == null) {
			// 파일 업로드 실패
			JSFunction.alertBack(response, "첨부 파일 제한 용량 초과");
			return;
		}
		
		// 파일 업로드 외 처리 ====
		// 수정 내용을 매개변수에서 가져옴
		String num = mr.getParameter("num");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String A_writer = mr.getParameter("A_writer");
		String A_subject = mr.getParameter("A_subject");
		String A_content = mr.getParameter("A_content");
		
		// DTO에 저장
		AnouncementDTO dto = new AnouncementDTO();
		dto.setAnounce_num(num);
		dto.setAnounce_writer(A_writer);
		dto.setAnounce_subject(A_subject);
		dto.setAnounce_content(A_content);
		
		// 원본 파일명과 저장된 파일 이름 설정
		String fileName = mr.getFilesystemName("A_ofile");
		if (fileName != null) {
			// 첨부 파일이 있을 경우 파일명 변경
			// 새로운 파일명 생성
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			// 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			// DTO에 저장
			dto.setAnounce_ofile(fileName);
			dto.setAnounce_sfile(newFileName);
			
			// 기존 파일 삭제
			FileUtil.deleteFile(request, "/uploads", prevSfile);
		} else {
			
			// 첨부 파일이 없으면 기존 이름 유지
			dto.setAnounce_ofile(prevOfile);
			dto.setAnounce_sfile(prevSfile);
		}
		
		// DB에 수정 내용 반영
		AnouncementDAO dao = new AnouncementDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if (result == 1) {
			response.sendRedirect("Anouncement_View.do?num=" + num);
		}
	}

}
