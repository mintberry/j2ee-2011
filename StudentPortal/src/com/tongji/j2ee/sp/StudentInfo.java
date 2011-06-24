package com.tongji.j2ee.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;


import model.Files;
import model.FilesDAO;
import model.StudentCourseFile;
import model.StudentCourseFileDAO;


public class StudentInfo extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String s_id = request.getParameter("s_id");
		String c_id = request.getParameter("c_id");
		
		StudentCourseFileDAO studentCourseFileDAO = new StudentCourseFileDAO();
		List<StudentCourseFile> studentCourseFiles = studentCourseFileDAO.findBySId(s_id);
		List<StudentCourseFile> tempFiles = new ArrayList<StudentCourseFile>();
		for(StudentCourseFile instance : studentCourseFiles){
			if(instance.getCourseId().equals(c_id)){
				tempFiles.add(instance);
			}
		}
		
		FilesDAO filesDAO = new FilesDAO();
		List<Files> files = new ArrayList<Files>();
		for(StudentCourseFile instance : tempFiles){
			files.add(filesDAO.findById(instance.getFId()));		
		}
		
		
		request.setAttribute("files", files);
		
		
		request.getRequestDispatcher("studentInfo.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
