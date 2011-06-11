package com.tongji.j2ee.sp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.CourseFile;
import model.CourseFileDAO;
import model.Courses;
import model.CoursesDAO;
import model.StudentCourseFile;
import model.StudentCourseFileDAO;
import model.Studentinfo;

public class CourseInfo extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String courseId = request.getParameter("id");
		
		CoursesDAO coursesDAO = new CoursesDAO();
		Courses course = coursesDAO.findById(courseId);
		request.setAttribute("course", course);
		
		CourseFileDAO courseFileDAO = new CourseFileDAO();
		List<CourseFile> courseFiles = courseFileDAO.findByCourseId(courseId);
		request.setAttribute("courseFiles", courseFiles);
		
		List<StudentCourseFile> studentCourseFiles = new ArrayList<StudentCourseFile>();
		StudentCourseFileDAO studentCourseFileDAO = new StudentCourseFileDAO();
		List<StudentCourseFile> tempCourseFiles = studentCourseFileDAO.findByCourseId(courseId);
		Studentinfo studentinfo = (Studentinfo) session.getAttribute("user");
		for(StudentCourseFile instance : tempCourseFiles){
			if(instance.getSId().equals(studentinfo.getSId())){
				studentCourseFiles.add(instance);
			}
		}
		request.setAttribute("studentCourseFiles", studentCourseFiles);
		
		request.getRequestDispatcher("courseInfo.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
