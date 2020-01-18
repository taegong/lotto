package com.taegong.web.home;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.taegong.web.board.LottoBoardBean;
@Repository

public class HomeServiceImpl implements HomeService{

	@Inject
	private HomeDAO homeDAO;
	//회원가입 아이디 중복체크

	@Override
	public List<LottoBoardBean> MainSum() {
		// TODO Auto-generated method stub
		
      	
		return homeDAO.MainSum();
	}
	
	

}