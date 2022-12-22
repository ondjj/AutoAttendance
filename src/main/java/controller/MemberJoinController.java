package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/MemberJoinController.do")
public class MemberJoinController extends HttpServlet {
       

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		파일
		
		
		String realFolder = "";
		String saveFolder = "uploads";
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
			
//		인적사항
			
			mdto.setId(multi.getParameter("id"));
			String pass1 = multi.getParameter("password1");
			String pass2 = multi.getParameter("password2");
			mdto.setPassword(pass1);
			mdto.setPrivate_num(multi.getParameter("private_num"));
			mdto.setKr_name(multi.getParameter("kr_name"));
			mdto.setEn_name(multi.getParameter("en_name"));
			mdto.setId_picture(multi.getFilesystemName("id_picture"));
			mdto.setId_savePicture(multi.getOriginalFileName("id_picture"));
			mdto.setPhone_num(multi.getParameter("phone_num"));
			mdto.setEmail(multi.getParameter("email"));
			mdto.setAddress(multi.getParameter("address"));
			mdto.setAdmin_key(multi.getParameter("admin_key"));
			mdto.setAge(Integer.valueOf(multi.getParameter("age")));
			mdto.setCollege_year(Integer.valueOf(multi.getParameter("col_reg_date")));
			mdto.setGender(multi.getParameter("gender"));
			
			if(pass1.equals(pass2)) {
				MemberDAO mdao = new MemberDAO();
				mdao.insertMember(mdto);
				
				request.setAttribute("id", mdto.getId());
//				RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
				RequestDispatcher dis = request.getRequestDispatcher("manager_stuColRegister.jsp");
				dis.forward(request, response);
			}
			else {
				request.setAttribute("msg", "패스워드가 일치하지않습니다.");
				RequestDispatcher dis = request.getRequestDispatcher("401.jsp");
				dis.forward(request, response);
			}
		
		}catch(Exception e) {
			System.out.println("파일 업로드 호출 오류");
			e.printStackTrace();
		}
	}

}
