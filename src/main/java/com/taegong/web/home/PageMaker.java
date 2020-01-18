package com.taegong.web.home;

public class PageMaker {
	  private Criteria cri;
	    private int totalCount;
	    private int startPage;
	    private int endPage;
	    private boolean prev;
	    private boolean next;
	    private int displayPageNum = 10;
	    
	    public Criteria getCri() {
	        return cri;
	    }
	    public void setCri(Criteria cri) {
	        this.cri = cri;
	    }
	    public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcData();
	    }
	    
	    private void calcData() {
	        //현재 보여질 페이지갯수
	        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
	        //토탈 페이지가 몇페이지로 나누어질 것인가
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
	        //현재페이지 갯수가 총페이지 보다 클경우 총페이지 값을 현재 보여질 페이지 갯수를 저장한다.
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	        
	        //(현재 보여질 갯수 - 보여져야 되는 갯수 )+1
	        startPage = (endPage - displayPageNum) + 1;
	        
	        if(startPage < 0 )
	        {
	        	System.out.println("음수?");
	        	this.startPage = 1;
	        } else {
	        	System.out.println("양수?");
	        	this.startPage = startPage;
	        }
	        
	        //보고 있는 페이지가 1페이지냐 아니냐를 판단하여 참 거짓을 반환(이전페이지)
	        prev = startPage == 1 ? false : true;
	        //다음페이지
	        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	        
	    }
	    
	    public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }


}
