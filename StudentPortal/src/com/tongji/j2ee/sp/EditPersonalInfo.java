package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

public class EditPersonalInfo extends HttpServlet {

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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		
		System.out.println("EditPersonGETGET");
		String ID=request.getParameter("id");
		
		StudentinfoDAO MyStudentDAO=new StudentinfoDAO();
		Studentinfo MyStudentInfo;
	
		MyStudentInfo=MyStudentDAO.findById(ID);
		

		


		request.setAttribute("StudentInfo", MyStudentInfo);

		
		request.getRequestDispatcher("admin.jsp").forward(request, response);

		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("EditPerson!!!!!!!!!!!!!!!!!");

		String ID=request.getParameter("id");
		String Name = request.getParameter("name");
		String Sex = request.getParameter("sex");
		//String Birthday = request.getParameter("birthday");
		String Nation = request.getParameter("nation");
		String Mail = request.getParameter("mail");
		String Address = request.getParameter("address");
		String Phone = request.getParameter("phone");
//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String datetime = formatter.format(new java.util.Date());
		
		StudentinfoDAO MyStudentDAO=new StudentinfoDAO();
		Studentinfo MyStudentInfo;
	
		MyStudentInfo=MyStudentDAO.findById(ID);
		MyStudentInfo.setName(Name);
		MyStudentInfo.setSex(Sex);
		MyStudentInfo.setNation(Nation);
		MyStudentInfo.setEmail(Mail);
		MyStudentInfo.setAddress(Address);
		Date MyDate=new Date();
		MyDate.setDate(20);
		MyDate.setHours(12);
		MyDate.setYear(1990);
		MyDate.setMonth(11);

		MyStudentInfo.setBirthday(MyDate);
		MyStudentInfo.setPhoneNumber(Phone);
		System.out.println(Name);
		System.out.println(Sex);
		Session s = (Session) HibernateSessionFactory.getSession();
		MyStudentDAO.save(MyStudentInfo);	
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
	} catch (Exception e) {

		} finally {
				s.close();
				List<Studentinfo> StudentList = MyStudentDAO.findAll();
				
				
				request.setAttribute("pageNumber", 1);
				
				HttpSession hs = request.getSession();
	
			
				hs.setAttribute("MyStudentList", StudentList);
				
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
//		} catch (Exception e) {

//		} finally {
//			s.close();
		//	request.getRequestDispatcher("admin.jsp").forward(request, response);
//		}
		

		

	}

}
