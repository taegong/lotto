package com.taegong.web.home;
public class Criteria {
    
/*
	int page : 현재 페이지 번호
	int perPageNum : 한 페이지당 보여줄 게시글의 갯수
	int getPageStart() : 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
*/

    private int page;
    private int perPageNum;
    
    public int getPageStart() {
    	
    	//현재 페이지의 게시글 시작 번호 = (현재 페이지 번호 - 1) * 페이지당 보여줄 게시글 갯수
    	//오버페이지 방지 
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
    	//시작 초기페이지 1을 변수에 저장
        this.page = 1;
        //보여질 페이지 갯수 
        this.perPageNum = 20;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
    	//페이지가 0이라면 1을 대입 
        if(page == 0) {
            this.page = 1;
        } else {
        	//0이 아니라면 페이지에 대입
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        //한 페이지당 보여줄 게시글의 갯수가 일치 하지 않을 경우 기존에 대입해놓 값 대입
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }
    


}