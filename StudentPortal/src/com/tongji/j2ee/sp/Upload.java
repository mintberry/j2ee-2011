package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.ast.tree.Case2Node;

import model.FilesDAO;
import model.StudentCourseFile;
import model.StudentCourseFileDAO;
import model.Studentinfo;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;

public class Upload extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		if(user instanceof Studentinfo){
			
		}
		
		String id = request.getParameter("filedir");
		String courseId = request.getParameter("courseId");
		String filedir = request.getParameter("filedir");
			// 学生是学号
			// 老师是课程号
		
		filedir = "/file/" + filedir + "/";
		


		String message = "";
		long maxsize = 1024 * 1024 * 20; // 设置允许上传文件的总长度为20兆

		// String filedir="D:/file/";

		int k = 0;
		try {
			SmartUpload myup = new SmartUpload();
			myup.initialize(this, request, response);
			myup.setTotalMaxFileSize(maxsize); // 设置允许上传文件的总长度
			myup.upload(); // 上传文件

			Files files = myup.getFiles(); // 获取所有的上传文件
			int count = files.getCount(); // 获取上传文件数量

			Date date = new Date(); // 获取当前时间
			boolean mark = false;

			FilesDAO fileDao = new FilesDAO();
			StudentCourseFileDAO studentCourseFileDAO = new StudentCourseFileDAO();

			File file = files.getFile(0);
			int filesize = file.getSize();
			if (filesize == 0)
				message += "<li>文件 <b><font color='red'>"
						+ file.getFilePathName()
						+ "</font></b> 的大小为0！本系统不允许上传0字节的文件！</li><br>";
			else {
				String filename = file.getFileName();
				String location = filedir + filename;
				//String fileinfo = myup.getRequest().getParameter(
				//		"fileinfo"+1);
				Date updatetime = date;

				// fill the file-table
				model.Files filebean = new model.Files();
				filebean.setName(filename);
				filebean.setLocation(location);
				filebean.setFilesize(filesize);
				//filebean.setDescription(fileinfo);
				filebean.setUpdateDate(updatetime);
				fileDao.save(filebean);

				
				
				
				// fill the student-file-table
				StudentCourseFile studentCourseFile = new StudentCourseFile();
				studentCourseFile.setFId(filebean.getFId());
				studentCourseFile.setCourseId(courseId);
				studentCourseFile.setSId(id);
				studentCourseFileDAO.save(studentCourseFile);

				file.saveAs(location, File.SAVEAS_VIRTUAL); // 保存文件到磁盘的指定目录下
				message += "文件 <b><font color='red'>" + file.getFilePathName()
						+ "</font></b> 上传成功！<br>";

				Session s = (Session) HibernateSessionFactory.getSession();
				try {
					Transaction ts = s.beginTransaction();
					ts.commit();
				} catch (Exception e) {

				} finally {
					s.close();
				}
			}
		} catch (java.lang.SecurityException e1) {
			k = -1;
			message = "上传的文件总大小不允许超过" + (maxsize / 1024 / 1024) + "兆！<br>";
			e1.printStackTrace();
		} catch (Exception e2) {
			k = -1;
			message = "文件上传失败！<br>";
			e2.printStackTrace();
		} catch (java.lang.OutOfMemoryError e3) {
			k = -1;
			message = "您上传的文件太大！<br>";
			e3.printStackTrace();
		}

		if (k <= 0)
			message += "<a href='javascript:window.history.go(-1)'>>> 返回重试</a><br>";

		request.setAttribute("message", message);
		RequestDispatcher rd = request.getRequestDispatcher("fileMessage.jsp");
		rd.forward(request, response);
	}
	
	private void doStudent(){
		
	}
	
	private void doTeacher(){
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
