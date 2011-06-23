package com.tongji.j2ee.sp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Notify;
import model.NotifyDAO;

public class NotifyList {
	NotifyDAO notifyDAO = new NotifyDAO();
	public List allNotes;
	
	public List originList;
	
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
		originList = notifyDAO.findAll();
		for(int i = originList.size() - 1; i != -1;--i){
			allNotes.add(originList.get(i));
		}
		pageItems = 12;
		allItems = allNotes.size();
		
		currentPage = (Integer) request
				.getAttribute("pageNumber");
		pages = allItems/pageItems + (allItems%pageItems>0?1:0);
		
	}
	
	public NotifyList(int i) {
		super();
		// TODO Auto-generated constructor stub
		originList = notifyDAO.findAll();
		for(int it = originList.size() - 1; it != -1;--it){
			allNotes.add(originList.get(it));
		}
		pageItems = 12;
		allItems = allNotes.size();
		
		iSymbol = i;
		
		currentPage = 1;
		pages = allItems/pageItems + ((allItems%pageItems>0)?1:0);
		
	}

	public List getCurrentList(int curPage){
		int curItem = (curPage-1) * pageItems;
		
		//下一句有bug
		if(0 == pages){
			return allNotes;
		}
		
		List curList = allNotes.subList(curItem, (curPage==pages)?(allItems):(curItem + pageItems));
		return curList;
	}
}
