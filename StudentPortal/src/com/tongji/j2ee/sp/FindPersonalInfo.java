package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;
import model.StudentinfoDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class FindPersonalInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FindPersonalInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

System.out.println("FindPerson!!!!!!!!!!!!!!!!!");

String ID=request.getParameter("XiaZaiWenJian");
System.out.println(ID);



//DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String datetime = formatter.format(new java.util.Date());

StudentinfoDAO MyStudentDAO=new StudentinfoDAO();
Studentinfo MyStudentInfo;

MyStudentInfo=MyStudentDAO.findById(ID);
HttpSession hs = request.getSession();
hs.setAttribute("StudentID", ID);
hs.setAttribute("StudentName", MyStudentInfo.getName());
hs.setAttribute("Sex", MyStudentInfo.getSex());

Date TempDate=MyStudentInfo.getBirthday();
String TempString;
TempString=String.format("%d年%d月%d日", TempDate.getYear(),TempDate.getMonth()+1,TempDate.getDate());
hs.setAttribute("StudentBirthday", TempString);
hs.setAttribute("StudentNation", MyStudentInfo.getNation());
hs.setAttribute("StudentAddress", MyStudentInfo.getAddress());

hs.setAttribute("StudentPhone", MyStudentInfo.getPhoneNumber());
Session s = (Session) HibernateSessionFactory.getSession();
MyStudentDAO.save(MyStudentInfo);	
	try {
		Transaction ts = s.beginTransaction();
		ts.commit();
} catch (Exception e) {

} finally {
		s.close();

		request.setAttribute("pageNumber", 1);
		
		request.setAttribute("Jump", 2);
		
		
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

//NotifyDAO notifyDAO = new NotifyDAO();
//Notify newNote = new Notify();

//System.out.println(content);

//newNote.setTitle(title);
//newNote.setContent(content);
//newNote.setAuthor(author);
//newNote.setDatetime(tsig);


//have to set id



//notifyDAO.save(newNote);
//	notifyDAO.attachDirty(newNote);
//	try {
//		Transaction ts = s.beginTransaction();
//		ts.commit();
//} catch (Exception e) {

//} finally {
//	s.close();
//	request.getRequestDispatcher("admin.jsp").forward(request, response);
//}




}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
