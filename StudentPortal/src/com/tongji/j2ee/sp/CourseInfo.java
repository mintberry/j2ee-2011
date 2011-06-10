package com.tongji.j2ee.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jgroups.blocks.LogicalLink.AllLinksDown;

import com.jspsmart.upload.Request;

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
		Studentinfo studentinfo = (Studentinfo) request.getAttribute("user");
		for(StudentCourseFile instance : tempCourseFiles){
			if(instance.getSId() == studentinfo.getSId()){
				studentCourseFiles.add(instance);
			}
		}
		request.setAttribute("studentCourseFiles", studentCourseFiles);
		
		request.getRequestDispatcher("courseInfo.jsp").forward(request, response);
		
	}

			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
