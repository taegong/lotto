package com.taegong.web.LottoList;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.taegong.web.LottoList.LottoServiceImpl.Point;
import com.taegong.web.LottoList.LottoLimit;
import com.taegong.web.member.LottoMemberBean;

@Service
public interface LottoService {
	
//	//회원가입
//	void insertMember(TichuMemberBean bean);
	
	//아이디 중복체크
	
	int LottoInsert(LottoListBean bean);
	

	int CountLottoStart();
	
	LottoListBean TotalList(int Episode_Lotto);
	
	List<LottoListBean> SerchLottoList();
	
	List<String>  LottoListCount();
	
	List<LottoListBean> OneStNumring();
	
	List<LottoListBean> TwoNumring();
	
	List<LottoListBean> ThreeNumring();
	
	List<LottoListBean> fourNumring();
	
	List<LottoListBean> fiveNumring();
	
	List<LottoListBean> sixNumring();

}