package com.tongji.j2ee.sp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Courses;
import model.CoursesDAO;
import model.StudentCourse;
import model.StudentCourseDAO;
import model.Studentinfo;
import model.StudentinfoDAO;
import model.Teacherinfo;
import model.TeacherinfoDAO;


public class TeacherMessage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String course_id = request.getParameter("course_id");
		CoursesDAO coursesDAO = new CoursesDAO();
		Courses course = coursesDAO.findById(course_id);
		
		String subject = request.getParameter("subject");
		Teacherinfo teacherinfo = (Teacherinfo)session.getAttribute("user");
		subject =  "(" + course.getName() + ")" + teacherinfo.getName() + ":" + subject;
				
		String content = request.getParameter("content");
		
		Vector<String> to = new Vector<String>();
		StudentCourseDAO studentCourseDAO = new StudentCourseDAO();
		StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
		List<StudentCourse> studentCourseList = studentCourseDAO.findByCourseId(course_id);
		List<Studentinfo> studentinfoList = new ArrayList<Studentinfo>();
		for(StudentCourse instance : studentCourseList){
			studentinfoList.add(studentinfoDAO.findById(instance.getSId()));
		}
		for(Studentinfo instance : studentinfoList){
			to.add(instance.getEmail());
		}
		
		
		SendMailServlet sendMailServlet = new SendMailServlet();
		if(!sendMailServlet.sendMails(to, subject, content)){
			request.getRequestDispatcher("EmailFailure.html").forward(request, response);
		}else{
			request.getRequestDispatcher("EmailSuccess.html").forward(request, response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
