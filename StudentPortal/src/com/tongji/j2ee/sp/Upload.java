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

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.FilesDAO;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;

public class Upload extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String filedir = "/file/" + (String)session.getAttribute("userId") + "/";
		
		String message = "";
		long maxsize = 1024*1024*20;			//设置允许上传文件的总长度为20兆
		
		//String filedir="D:/file/";			
		
		int k=0;
		try{			
			SmartUpload myup=new SmartUpload();
			myup.initialize(this,request,response);
		    myup.setTotalMaxFileSize(maxsize);                     			//设置允许上传文件的总长度
		    myup.upload();                                         			//上传文件
		    
		    Files files=myup.getFiles();                        			//获取所有的上传文件
		    int count=files.getCount();										//获取上传文件数量
		    
		    Date date=new Date();		    								//获取当前时间
		    boolean mark=false;
		    FilesDAO fileDao=new FilesDAO();
		    for(int i=0;i<count;i++){               						//逐个获取上传的文件
		    	File file=files.getFile(i);
		        if(!file.isMissing()){                   					//如果有文件
		        	mark=true;
		        	int filesize=file.getSize();
		        	if(filesize==0)
		        		message+="<li>文件 <b><font color='red'>"+file.getFilePathName()+"</font></b> 的大小为0！本系统不允许上传0字节的文件！</li><br>";
		        	else{
		        		String filename=file.getFileName();				
		        		String location = filedir + filename;
		        		String fileinfo = myup.getRequest().getParameter("fileinfo"+(i+1));
		        		Date updatetime = date;
		        		
		        		model.Files filebean=new model.Files();
		        		filebean.setName(filename);
		        		filebean.setLocation(location);
		        		filebean.setFilesize(filesize);
		        		filebean.setDescription(fileinfo);
		        		filebean.setUpdateDate(updatetime);
		        		
		        		fileDao.save(filebean);													//保存文件信息到数据库中
		        		file.saveAs(location, File.SAVEAS_VIRTUAL);								//保存文件到磁盘的指定目录下
		        		message+="文件 <b><font color='red'>"+file.getFilePathName()+"</font></b> 上传成功！<br>";
		        		
		        		Session s = (Session) HibernateSessionFactory.getSession();
		        		try {
		        			Transaction ts = s.beginTransaction();
		        			ts.commit();
		        		} catch (Exception e) {
		        			
		        		} finally {
		        			s.close();
		        		}
		        	}		        	
		        }
		    }    	
		}catch(java.lang.SecurityException e1){
			k=-1;
			message="上传的文件总大小不允许超过"+(maxsize/1024/1024)+"兆！<br>";
		    e1.printStackTrace();
		}
		catch(Exception e2){
			k=-1;
		    message="文件上传失败！<br>";
		    e2.printStackTrace();
		}
		catch(java.lang.OutOfMemoryError e3){
			k=-1;
			message="您上传的文件太大！<br>";
			e3.printStackTrace();
		}
		if(k<=0)
			message+="<a href='javascript:window.history.go(-1)'>>> 返回重试</a><br>";
		
		request.setAttribute("message",message);		
		RequestDispatcher rd=request.getRequestDispatcher("fileMessage.jsp");
		rd.forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
