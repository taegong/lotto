package com.taegong.web.home;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.LottoList.LottoListBean;
import com.taegong.web.board.LottoBoardBean;

@Repository
public class HomeDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	//크롤링 해서 최신 회차가 있으면 저장
	public int InsertLottoList(LottoListBean bean) {
		System.out.println("===> 저장");
		return ConSql.insert("LottoMapper.InsertLotto", bean);
	}
	//시작 번호 들고 오기
	public String CountLottoStart(LottoListBean bean) {
		System.out.println("시작 번호 들고 오기");
		return ConSql.selectOne("LottoMapper.lottoCount");
	}
	//최신회차 들고 오기
	public LottoListBean LottoList(String Episode_Lotto) {
		System.out.println("회차?! : "+Episode_Lotto);
		return ConSql.selectOne("LottoMapper.lottototalList",Episode_Lotto);
	}
	//
	public List<LottoListBean> LottoListLimit1(){
		System.out.println("여기");
		return ConSql.selectList("LottoMapper.lottototalListLimt1");
	}
	
	public List<LottoListBean> LottoListLimit2(){
		return ConSql.selectList("LottoMapper.lottototalListLimt2");
	}
	
	public List<LottoListBean> LottoListLimit3(){
		return ConSql.selectList("LottoMapper.lottototalListLimt3");
	}
	
	public List<LottoListBean> LottoListLimit4(){
		return ConSql.selectList("LottoMapper.lottototalListLimt4");
	}
	
	public List<LottoListBean> LottoListLimit5(){
		return ConSql.selectList("LottoMapper.lottototalListLimt5");
	}
	
	public List<LottoListBean> LottoListLimit6(){
		return ConSql.selectList("LottoMapper.lottototalListLimt6");
	}
	
	public List<LottoListBean> SerchLottoList(int num_one){
		System.out.println("DAO여기");
		return ConSql.selectList("LottoMapper.SerchLottoList",num_one);
	}
	
	public List<LottoBoardBean> MainSum(){
		
		System.out.println("DAO111");
		 return ConSql.selectList("LottoMainMapper.mainSumnail");
	}
	
}