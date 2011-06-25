package com.tongji.j2ee.sp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

public class LoginServlet extends HttpServlet {

	// when to initialize the DAO is a problem
	private StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
	private Studentinfo studentinfo;
	private TeacherinfoDAO teacherinfoDAO = new TeacherinfoDAO();
	private Teacherinfo teacherinfo;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession hs = request.getSession();

		String id = request.getParameter("userID");
		String password = request.getParameter("password");

		hs.setAttribute("userId", id); // 保存文件时用

		// for student_id
		if (id.length() == 6) {
			studentinfo = studentinfoDAO.findById(id);
			if (studentinfo == null) {
				request.setAttribute("errorInformation", "用户名不存在");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} else {
				if (password.equals(studentinfo.getPassword())) {
					hs.setAttribute("user", studentinfo);
					if (studentinfo.getEmail().equals("")) {
						// hs.setAttribute("user", studentinfo);
						request.getRequestDispatcher("register.jsp").forward(
								request, response);
					} else {
						// find the course_id in the relation table
						StudentCourseDAO studentCourseDAO = new StudentCourseDAO();
						List<StudentCourse> myCourses = studentCourseDAO
								.findBySId(studentinfo.getSId());

						// find the courses in the courses table
						CoursesDAO coursesDAO = new CoursesDAO();
						List myCoursesInfo = (List) new java.util.ArrayList();
						for (int i = 0; i < myCourses.size(); i++) {
							Courses temp = coursesDAO.findById(myCourses.get(i)
									.getCourseId());
							myCoursesInfo.add(temp);
						}

						// to implement the course schedule
						Courses emptyCourse = new Courses();
						emptyCourse.setName("");
						ArrayList<Courses> courseSchedule = new ArrayList();
						for (int i = 0; i < 35; ++i) {
							Courses temp = findCourseByTime(i + 1, myCourses,
									coursesDAO);
							if (temp != null) {
								courseSchedule.add(temp);
							} else {
								courseSchedule.add(emptyCourse);
							}
						}

						request.setAttribute("pageNumber", 1);
						NotifyList lns = new NotifyList(1);
						System.out.println("allitems" + lns.allItems);
						hs.setAttribute("noteli", lns); // 保存到session

						// TODO:可以考虑放到session里
						// hs.setAttribute("myCourses", myCoursesInfo);
						// hs.setAttribute("schedule", courseSchedule);
						request.setAttribute("myCourses", myCoursesInfo);
						request.setAttribute("schedule", courseSchedule);
						request.getRequestDispatcher("student.jsp").forward(
								request, response);
						// request.getRequestDispatcher("courseList.jsp").forward(
						// request, response);
					}

				} else {
					request.setAttribute("errorInformation", "密码错误");
					request.getRequestDispatcher("index.jsp").forward(request,
							response);
				}
			}
		}

		// for teacher_id
		if (id.length() == 10) {
			teacherinfo = teacherinfoDAO.findById(id);
			if (teacherinfo == null) {
				request.setAttribute("errorInformation", "用户名不存在");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
				return;
			} else {

				if (password.equals(teacherinfo.getPassword())) {
					hs.setAttribute("user", teacherinfo);
					if (teacherinfo.getTId().equals("0000000007")) {
						request.setAttribute("pageNumber", 1);
						request.setAttribute("Jump",1);
						NotifyList lns = new NotifyList(0);
						System.out.println("allitems" + lns.allItems);
						hs.setAttribute("noteli", lns);
						
						
				List<Studentinfo> StudentList = studentinfoDAO.findAll();
					
						
						hs.setAttribute("MyStudentList", StudentList);
						hs.setAttribute("StudentID", null);
						hs.setAttribute("StudentName", null);
						hs.setAttribute("Sex",null);
						hs.setAttribute("StudentBirthday", null);
						hs.setAttribute("StudentNation",null);
						hs.setAttribute("StudentAddress", null);
						hs.setAttribute("StudentEmail",null);
						hs.setAttribute("StudentPhone",null);
						
						request.getRequestDispatcher("admin.jsp").forward(
								request, response);
						return;
					}
					if (teacherinfo.getEmail().equals("")) {
						request.getRequestDispatcher("register.jsp").forward(
								request, response);
					} else {
						// 载入教师页面
						CoursesDAO studentCourseDAO = new CoursesDAO();
						List<Courses> myCourses = studentCourseDAO
								.findByTId(teacherinfo.getTId());

						// find the courses in the courses table
						CoursesDAO coursesDAO = new CoursesDAO();

						// to implement the course schedule
						Courses emptyCourse = new Courses();
						emptyCourse.setName("");
						ArrayList<Courses> courseSchedule = new ArrayList();
						for (int i = 0; i < 35; ++i) {
							Courses temp = findCourseByTime(i + 1, coursesDAO,
									myCourses);
							if (temp != null) {
								courseSchedule.add(temp);
							} else {
								courseSchedule.add(emptyCourse);
							}
						}

						request.setAttribute("pageNumber", 1);
						NotifyList lns = new NotifyList(2);
						System.out.println("allitems" + lns.allItems);
						hs.setAttribute("noteli", lns); // 保存到session

						// TODO:可以考虑放到session里
						// hs.setAttribute("myCourses", myCoursesInfo);
						// hs.setAttribute("schedule", courseSchedule);
						request.setAttribute("myCourses", myCourses);
						request.setAttribute("schedule", courseSchedule);
						request.getRequestDispatcher("teacher.jsp").forward(
								request, response);
					}

				} else {

					request.setAttribute("errorInformation", "密码错误");
					request.getRequestDispatcher("index.jsp").forward(request,
							response);
				}
			}
		}

		// TODO:for admin_id
	}

	private static Courses findCourseByTime(int iTime,
			List<StudentCourse> mycourses, CoursesDAO coursesDAO) {
		for (int i = 0; i < mycourses.size(); i++) {
			Courses temp = coursesDAO.findById(mycourses.get(i).getCourseId());
			if (((temp.getSchedule0() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule1() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule2() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule3() - 1) % 35 + 1) == iTime) {
				return temp;
			}
			// myCoursesInfo.add(temp);
		}
		return null;
	}

	private static Courses findCourseByTime(int iTime, CoursesDAO coursesDAO,
			List<Courses> mycourses) {
		for (int i = 0; i < mycourses.size(); i++) {
			Courses temp = coursesDAO.findById(mycourses.get(i).getCourseId());
			if (((temp.getSchedule0() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule1() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule2() - 1) % 35 + 1) == iTime
					|| ((temp.getSchedule3() - 1) % 35 + 1) == iTime) {
				return temp;
			}
			// myCoursesInfo.add(temp);
		}
		return null;
	}

	public static void setUpStudent(HttpServletRequest request,
			HttpServletResponse response, HttpSession hs, int icurpage) {
		StudentCourseDAO studentCourseDAO = new StudentCourseDAO();
		List<StudentCourse> myCourses = studentCourseDAO.findBySId(hs
				.getAttribute("userId"));

		// find the courses in the courses table
		CoursesDAO coursesDAO = new CoursesDAO();
		List myCoursesInfo = (List) new java.util.ArrayList();
		for (int i = 0; i < myCourses.size(); i++) {
			Courses temp = coursesDAO.findById(myCourses.get(i).getCourseId());
			myCoursesInfo.add(temp);
		}

		// to implement the course schedule
		Courses emptyCourse = new Courses();
		emptyCourse.setName("");
		ArrayList<Courses> courseSchedule = new ArrayList();
		for (int i = 0; i < 35; ++i) {
			Courses temp = findCourseByTime(i + 1, myCourses, coursesDAO);
			if (temp != null) {
				courseSchedule.add(temp);
			} else {
				courseSchedule.add(emptyCourse);
			}
		}

		request.setAttribute("pageNumber", icurpage);
		// NotifyList lns = new NotifyList(1); //暂时不需要新建，因为都在session里了
		// System.out.println("allitems" + lns.allItems);
		// hs.setAttribute("noteli", lns); // 保存到session

		// TODO:可以考虑放到session里
		// hs.setAttribute("myCourses", myCoursesInfo);
		// hs.setAttribute("schedule", courseSchedule);
		request.setAttribute("myCourses", myCoursesInfo);
		request.setAttribute("schedule", courseSchedule);
	}

	public static void setUpTeacher(HttpServletRequest request,
			HttpServletResponse response, HttpSession hs, int icurpage) {
		CoursesDAO studentCourseDAO = new CoursesDAO();
		List<Courses> myCourses = studentCourseDAO.findByTId(hs
				.getAttribute("userId"));

		// find the courses in the courses table
		CoursesDAO coursesDAO = new CoursesDAO();

		// to implement the course schedule
		Courses emptyCourse = new Courses();
		emptyCourse.setName("");
		ArrayList<Courses> courseSchedule = new ArrayList();
		for (int i = 0; i < 35; ++i) {
			Courses temp = findCourseByTime(i + 1, coursesDAO, myCourses);
			if (temp != null) {
				courseSchedule.add(temp);
			} else {
				courseSchedule.add(emptyCourse);
			}
		}

		request.setAttribute("pageNumber", icurpage);
//		request.setAttribute("pageNumber", 1);
//		NotifyList lns = new NotifyList(1);
//		System.out.println("allitems" + lns.allItems);
//		hs.setAttribute("noteli", lns); // 保存到session

		// TODO:可以考虑放到session里
		// hs.setAttribute("myCourses", myCoursesInfo);
		// hs.setAttribute("schedule", courseSchedule);
		request.setAttribute("myCourses", myCourses);
		request.setAttribute("schedule", courseSchedule);
	}

	public static void setUpAdmin(HttpServletRequest request,
			HttpServletResponse response, HttpSession hs, int icurpage) {
		request.setAttribute("pageNumber", icurpage);

		// NotifyList lns = new NotifyList(0);
		// System.out.println("allitems" + lns.allItems);
		// hs.setAttribute("noteli", lns);
	}
}
