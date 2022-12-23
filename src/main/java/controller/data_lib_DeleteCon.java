package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.data_lib_DAO;
import dto.data_lib_DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/data_lib_delete.do")
public class data_lib_DeleteCon extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setAttribute("num", request.getParameter("num"));
      
      String num = request.getParameter("num");
      data_lib_DAO dao = new data_lib_DAO();
      data_lib_DTO dto = dao.selectView(num);
      int result = dao.deletePost(num);
      dao.close();
      
      if (result == 1) {
         String saveFileName = dto.getData_sfile();
         FileUtil.deleteFile(request, "/uploads", saveFileName);
      }
      JSFunction.alertLocation(response, "삭제 완료", "./data_lib_list.do");
   }

}