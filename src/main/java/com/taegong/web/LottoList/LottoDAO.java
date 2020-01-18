package com.taegong.web.LottoList;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.home.Criteria;

@Repository
public class LottoDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	public int InsertLottoList(LottoListBean bean) {
		System.out.println("===> 로또");
		return ConSql.insert("LottoMapper.InsertLotto", bean);
	}
	
	public int CountLottoStart() {
		System.out.println("시작 번호 들고 오기");
		return ConSql.selectOne("LottoMapper.lottoCount");
	}
	
	public LottoListBean LottoList(int LastEp) {
		System.out.println("456"+LastEp);
		return ConSql.selectOne("LottoMapper.lottototalList",LastEp);
	}
	
	public List<LottoListBean> LottoListLimit1(){
		System.out.println("123============");
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
	
	public List<LottoListBean> OneStNumring()
	{
		
		return ConSql.selectList("LottoMapper.OneStNumring");
	}
	
	public List<LottoListBean> TwoNumring()
	{
		
		return ConSql.selectList("LottoMapper.TwoNumring");
	}

	
	public List<LottoListBean> ThreeNumring()
	{
		
		return ConSql.selectList("LottoMapper.ThreeNumring");
	}
	
	public List<LottoListBean> FourNumring()
	{
		
		return ConSql.selectList("LottoMapper.FourNumring");
	}
	
	public List<LottoListBean> FiveNumring()
	{
		
		return ConSql.selectList("LottoMapper.FiveNumring");
	}
	
	
	public List<LottoListBean> sixNumring()
	{
		
		return ConSql.selectList("LottoMapper.SixNumring");
	}
	
	
	
	
	
}