package com.tongji.j2ee.sp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.NotifyDAO;

public class NotifyList {
	NotifyDAO notifyDAO = new NotifyDAO();
	public List allNotes;
	
	public int iSymbol;                                   //0 admin, 1 student, 2 teacher
	
	public int currentPage;                               //当前页
	public int pageItems;                                 //每页条目数
	public int allItems;                                  //总条目数
	public NotifyDAO getNotifyDAO() {
		return notifyDAO;
	}

	public void setNotifyDAO(NotifyDAO notifyDAO) {
		this.notifyDAO = notifyDAO;
	}

	public List getAllNotes() {
		return allNotes;
	}

	public void setAllNotes(List allNotes) {
		this.allNotes = allNotes;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageItems() {
		return pageItems;
	}

	public void setPageItems(int pageItems) {
		this.pageItems = pageItems;
	}

	public int getAllItems() {
		return allItems;
	}

	public void setAllItems(int allItems) {
		this.allItems = allItems;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int pages;                                     //页数

	public NotifyList(HttpServletRequest request) {
		super();
		// TODO Auto-generated constructor stub
		allNotes = notifyDAO.findAll();
		pageItems = 12;
		allItems = allNotes.size();
		
		currentPage = (Integer) request
				.getAttribute("pageNumber");
		pages = allItems/pageItems + (allItems%pageItems>0?1:0);
		
	}
	
	public NotifyList(int i) {
		super();
		// TODO Auto-generated constructor stub
		allNotes = notifyDAO.findAll();
		pageItems = 12;
		allItems = allNotes.size();
		
		iSymbol = i;
		
		currentPage = 1;
		pages = allItems/pageItems + (allItems%pageItems>0?1:0);
		
	}

	public List getCurrentList(){
		int curItem = (currentPage-1) * pageItems;
		List curList = allNotes.subList(curItem, currentPage==pages?(allItems):curItem + pageItems);
		return curList;
	}
}
