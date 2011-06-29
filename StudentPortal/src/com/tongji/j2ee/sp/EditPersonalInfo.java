package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.Studentinfo;
import model.StudentinfoDAO;

import model.StudentCourse;
import model.StudentCourseDAO;



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

		
		String Way=request.getParameter("act");
		System.out.println(Way);
		String ID=request.getParameter("id");
		String Name = request.getParameter("name");
		String Sex = request.getParameter("sex");
		String Birthday = request.getParameter("birthday");
		String Nation = request.getParameter("nation");
		String Mail = request.getParameter("mail");
		String Address = request.getParameter("address");
		String Phone = request.getParameter("phone");

//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String datetime = formatter.format(new java.util.Date());
		
	
		StudentinfoDAO MyStudentDAO=new StudentinfoDAO();
		Studentinfo MyStudentInfo;
	
		Session s = (Session) HibernateSessionFactory.getSession();
		if (Way.equalsIgnoreCase("edit"))
		{
			System.out.println("编辑!");
		MyStudentInfo=MyStudentDAO.findById(ID);
		MyStudentInfo.setName(Name);
		MyStudentInfo.setSex(Sex);
		MyStudentInfo.setNation(Nation);
		MyStudentInfo.setEmail(Mail);
		MyStudentInfo.setAddress(Address);
		
		String TempString[]=Birthday.split("年");
		int Year=Integer.parseInt(TempString[0]);
		System.out.println(Year);
		
		String TempString1[]=TempString[1].split("月");
		int Month=Integer.parseInt(TempString1[0]);
		System.out.println(Month);
		String TempString2[]=TempString1[1].split("日");
		int Day=Integer.parseInt(TempString2[0]);
		
		System.out.println(Day);
		
		
		Date MyDate=new Date();
		MyDate.setDate(Day);
		MyDate.setYear(Year);
		MyDate.setMonth(Month-1);
		

		
		//System.out.println(MyDate.getYear());
		MyStudentInfo.setBirthday(MyDate);
		MyStudentInfo.setPhoneNumber(Phone);
		System.out.println(Name);
		System.out.println(Sex);
		
		MyStudentDAO.save(MyStudentInfo);	
		}
		else if (Way.equalsIgnoreCase("add"))
		{
			System.out.println("添加!");
			MyStudentInfo=new Studentinfo();
			MyStudentInfo.setSId(ID);
			MyStudentInfo.setPassword("1234");
			MyStudentInfo.setPinCode("1234");
			MyStudentInfo.setName(Name);
			MyStudentInfo.setSex(Sex);
			MyStudentInfo.setNation(Nation);
			MyStudentInfo.setEmail(Mail);
			MyStudentInfo.setAddress(Address);
			String TempString[]=Birthday.split("年");
			int Year=Integer.parseInt(TempString[0]);
			
			System.out.println(Year);
			String TempString1[]=TempString[1].split("月");
			int Month=Integer.parseInt(TempString1[0]);
			String TempString2[]=TempString1[1].split("日");
			int Day=Integer.parseInt(TempString2[0]);
			
			
			Date MyDate=new Date();

			
			
			MyDate.setDate(Day);
			MyDate.setYear(Year);
			MyDate.setMonth(Month-1);
			


			MyStudentInfo.setBirthday(MyDate);
			MyStudentInfo.setPhoneNumber(Phone);
			System.out.println(Name);
			System.out.println(Sex);
			
			MyStudentDAO.save(MyStudentInfo);
			
			ServletContext sc = request.getSession().getServletContext();
			String filePath = "";
			
			filePath = sc.getRealPath("/") + "file/"+ID+"/";

			
			
			File file = new File(filePath);
			file.mkdirs(); 
			
		}
		else if (Way.equalsIgnoreCase("delete"))
		{
			MyStudentInfo=MyStudentDAO.findById(ID);
			StudentCourseDAO MyStudentCourseDAO=new StudentCourseDAO();
			
			
			List<StudentCourse> StudentCourseList=MyStudentCourseDAO.findBySId(ID);
			for (int i = 0; i < StudentCourseList.size(); i++) {
				StudentCourse temp = (StudentCourse) StudentCourseList.get(i);
				MyStudentCourseDAO.delete(temp);
			}
			
			MyStudentDAO.delete(MyStudentInfo);
		}
		
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
	} catch (Exception e) {

		} finally {
				s.close();
				List<Studentinfo> StudentList = MyStudentDAO.findAll();
				
				
				request.setAttribute("pageNumber", 1);
				request.setAttribute("Jump", 2);
				HttpSession hs = request.getSession();
	
				 if (!Way.equalsIgnoreCase("delete"))
				 {
				hs.setAttribute("StudentID", ID);
				MyStudentInfo=MyStudentDAO.findById(ID);
				hs.setAttribute("StudentName", MyStudentInfo.getName());
				hs.setAttribute("Sex", MyStudentInfo.getSex());

				Date TempDate=MyStudentInfo.getBirthday();
				String TempString;
				TempString=String.format("%d年%d月%d日", TempDate.getYear(),TempDate.getMonth()+1,TempDate.getDate());
				hs.setAttribute("StudentBirthday", TempString);
				hs.setAttribute("StudentNation", MyStudentInfo.getNation());
				hs.setAttribute("StudentAddress", MyStudentInfo.getAddress());
				hs.setAttribute("StudentEmail", MyStudentInfo.getEmail());
				hs.setAttribute("StudentPhone", MyStudentInfo.getPhoneNumber());
				
				 }
			
				hs.setAttribute("MyStudentList", StudentList);
				
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}

	}
}

