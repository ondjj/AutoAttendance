package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/MemberUpdateCon.do")
public class MemberUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
//		파일
		String realFolder = "";
		String saveFolder = "uploads";
		String encType = "utf-8";
		int maxSize = 1024 * 1024;
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			System.out.println(realFolder);
		
		
		memberDTO mdto = new memberDTO();
		
		mdto.setId(multi.getParameter("id"));
		
		String pass1 = multi.getParameter("password1");
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
		
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		
		mdao.updateMemer(mdto);
		
		
		request.setAttribute("kr_name", multi.getParameter("kr_name"));
		request.setAttribute("en_name", multi.getParameter("en_name"));
		request.setAttribute("code_id", multi.getParameter("id"));
		request.setAttribute("key", multi.getParameter("admin_key"));
		request.setAttribute("gender", multi.getParameter("gender"));
		request.setAttribute("pass", pass1);
		request.setAttribute("age", multi.getParameter("age"));
		request.setAttribute("date", multi.getParameter("col_reg_date"));
		request.setAttribute("priNum", multi.getParameter("private_num"));
		request.setAttribute("phNum", multi.getParameter("phone_num"));
		request.setAttribute("email", multi.getParameter("email"));
		request.setAttribute("address", multi.getParameter("address"));
		request.setAttribute("face", multi.getFilesystemName("id_picture"));
		request.setAttribute("face_real", multi.getOriginalFileName("id_picture"));
		
		String id = (String) request.getAttribute("code_id");
		if(!(session.getAttribute("id").equals("admin"))) {
			RequestDispatcher dis = request.getRequestDispatcher("AdminDashBoard.do");
			dis.forward(request, response);
		}else if(session.getAttribute("id").equals("admin")) {
			RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("MainPage.jsp");
			dis.forward(request, response);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
