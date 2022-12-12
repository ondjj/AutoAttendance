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

import dao.data_lib_DAO;
import dto.data_lib_DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/data_lib_write.do")
public class data_lib_WriteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/Data_lib_Write.jsp").forward(request, response);
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
			JSFunction.alertLocation(response, "첨부 파일 제한 용량 초과", "/data_lib_write.do");
		}

		// 폼에서 입력한 값을 dto 객체에 저장
		data_lib_DTO dto = new data_lib_DTO();

		dto.setData_writer(mr.getParameter("name"));
		dto.setData_subject(mr.getParameter("subject"));
		dto.setData_content(mr.getParameter("content"));

		String fileName = mr.getFilesystemName("ofile");
		// 기존 파일이 있는 경우 날짜/시간 데이터를 이용하여 [파일명(날짜/시간).확장자]를 만들어서 저장함
		if (fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			// 파일명 변경						  경로 + 가운데 구분자 "/" + 파일명
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setData_ofile(fileName);
			dto.setData_sfile(newFileName);
		}
		
		// dao를 통해서 db에 개시물 내용 저장
		data_lib_DAO dao = new data_lib_DAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		// 입력이 성공했으면 게시판 리스트로 이동, 실패했으면 원상복귀
		if (result == 1) {
			response.sendRedirect("./data_lib_list.do");
		} else {
			response.sendRedirect("./data_lib_write.do");
		}

	}
}
