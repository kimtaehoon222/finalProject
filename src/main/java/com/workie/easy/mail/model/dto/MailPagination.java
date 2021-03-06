package com.workie.easy.mail.model.dto;

public class MailPagination {

public static MailPageInfo getPageInfo(int listCount, int currentPage, int mailLimit) {
		
		// * maxPage : 총 페이지 수
		int maxPage = (int)Math.ceil((double)listCount/mailLimit);
		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
		//int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		//int endPage = startPage + pageLimit - 1;
		
		/*if(maxPage < endPage) {
			endPage = maxPage;
		}*/
		
		MailPageInfo mpi = new MailPageInfo(currentPage, listCount, maxPage, mailLimit);
		
		return mpi;
		
	}

}
