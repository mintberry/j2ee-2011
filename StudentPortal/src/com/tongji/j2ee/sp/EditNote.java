package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notify;
import model.NotifyDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class EditNote extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("TEST");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String datetime = formatter.format(new java.util.Date());
		
		Date date = new Date();
        Timestamp tsig = new Timestamp(date.getTime());
		
		NotifyDAO notifyDAO = new NotifyDAO();
		Notify newNote = new Notify();
		
		newNote.setTitle(title);
		newNote.setContent(content);
		newNote.setAuthor(author);
		newNote.setDatetime(tsig);
//have to set id
		
		
		Session s = (Session) HibernateSessionFactory.getSession();
		
		//notifyDAO.save(newNote);
		notifyDAO.attachDirty(newNote);
		try {
			Transaction ts = s.beginTransaction();
			ts.commit();
		} catch (Exception e) {

		} finally {
			s.close();
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		

		

	}

}
