package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CalendarDAO;
import dto.CalendarDTO;


@WebServlet("/CalendarCon.do")
public class CalendarCon extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		
		CalendarDAO dao = new CalendarDAO();
		CalendarDTO dto = new CalendarDTO();
		
		//JSONArray jsonArr = new JSONArray();
		//List<Map<String, Object>> jsonArr = new ArrayList<>();
		
		if(num.equals("0")) { // Load All Calendar Data    (R)
			
			String jsonArr = dao.load_calendar();
			
			//jsonArr = (JSONArray) dao.load_calendar();
			// jsonArr = dao.load_calendar();
			
			System.out.println(jsonArr);
			
			PrintWriter pw = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			log(jsonArr);
			pw.print(jsonArr);
			pw.flush();
			
		}else if(num.equals("1")){ // Resize Calendar   (U)
			System.out.println("getParameter"+request.getParameter("id"));
			String resize_id = request.getParameter("id");
			String resize_start = request.getParameter("start");
			String resize_end = request.getParameter("end");
			
			String result = dao.resize_calendar(resize_id, resize_start, resize_end);
			
			PrintWriter pw = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			log(result);
			pw.print(result);
			pw.flush();
			
		}else if(num.equals("2")) { // Update Calendar   (U)
			System.out.println("getParameter"+request.getParameter("id"));
			dto.setNum(Integer.parseInt(request.getParameter("id")));
			dto.setTitle(request.getParameter("title"));
			dto.setDescription(request.getParameter("description"));
			dto.setStart(request.getParameter("start"));
			dto.setEnd(request.getParameter("end"));
			dto.setBackgroundcolor(request.getParameter("backgroundColor"));
			if(request.getParameter("allDay").equals("true")) {
				dto.setAllday(1);
			}else {
				dto.setAllday(0);
			}
			
			String result = dao.update_calendar(dto);
			
			PrintWriter pw = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			log(result);
			pw.print(result);
			pw.flush();
		}else if(num.equals("3")) { // Delete Calendar   (D)
			System.out.println("getParameter"+request.getParameter("id"));
			String id = request.getParameter("id");
			
			String result = dao.delete_calendar(id);
			
			PrintWriter pw = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			log(result);
			pw.print(result);
			pw.flush();
		}else if(num.equals("4")) { // Add Calendar   (C)
			System.out.println("add Calendar 진입");
			dto.setTitle(request.getParameter("title"));
			dto.setDescription(request.getParameter("description"));
			dto.setStart(request.getParameter("start"));
			dto.setEnd(request.getParameter("end"));
			dto.setBackgroundcolor(request.getParameter("backgroundColor"));
			dto.setTextcolor(request.getParameter("textColor"));
			if(request.getParameter("allDay").equals("true")) {
				dto.setAllday(1);
			}else {
				dto.setAllday(0);
			}
			
			String result = dao.insert_calendar(dto);
			
			PrintWriter pw = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			log(result);
			pw.print(result);
			pw.flush();
		}
	
	
	
	
	}
	
	
}
