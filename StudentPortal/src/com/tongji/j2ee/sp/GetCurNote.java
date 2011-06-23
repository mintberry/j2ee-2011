package com.tongji.j2ee.sp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notify;
import model.NotifyDAO;

public class GetCurNote extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int noteid = Integer.parseInt(request.getParameter("noteid"));

		NotifyDAO notifyDAO = new NotifyDAO();
		Notify note = notifyDAO.findById(noteid);
		
		request.setAttribute("title", note.getTitle());
		request.setAttribute("content", note.getContent());
		request.setAttribute("author", note.getAuthor());
		request.setAttribute("noteid", noteid);
		
		//System.out.println("testedit:" + note.getTitle());
		request.getRequestDispatcher("changenote.jsp").forward(request, response);
	}

}
