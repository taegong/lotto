package com.taegong.web.LottoList;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.home.Criteria;

@Repository
public class LottoListDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	//회원가입 dao
	public int InsertLottoList(LottoListBean bean) {
		System.out.println("===> 로또");
		return ConSql.insert("LottoMapper.InsertLotto", bean);
	}
	
	public int CountLottoStart() {
		System.out.println("시작 번호 들고 오기");
		return ConSql.selectOne("LottoMapper.lottoCount");
	}
	
	public LottoListBean LottoList(int Episode_Lotto) {
		System.out.println("회차"+Episode_Lotto);
		return ConSql.selectOne("LottoMapper.lottototalList",Episode_Lotto);
	}
	
	public List<LottoListBean> LottoListLimit(){
		System.out.println("로또리스트");
		return ConSql.selectList("LottoMapper.lottototalListLimt");
	}
	
	
	
}