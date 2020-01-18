//	package com.taegong.web.LottoList;
//	
//	import java.util.ArrayList;
//	import java.util.Collections;
//	import java.util.Comparator;
//	import java.util.HashMap;
//	import java.util.Iterator;
//	import java.util.List;
//	import java.util.Map;
//	import java.util.TreeMap;
//	
//	import javax.inject.Inject;
//	
//	import org.springframework.beans.factory.annotation.Autowired;
//	import org.springframework.stereotype.Repository;
//	import org.springframework.stereotype.Service;
//
//	import com.taegong.web.LottoList.LottoLimit;
//import com.taegong.web.member.LottoMemberBean;
//import com.taegong.web.member.MemberDAO;
//	
//	@Repository
//	
//	public class LottoServiceImpl implements LottoService {
//	
//		private static final String Point = null;
//	
//		@Inject
//		private LottoDAO lottoDAO;
//		private LottoService lottoservice;
//		@Inject
//		private LottoService service;
//	
//		@Override
//		public int LottoInsert(LottoListBean bean) {
//			System.out.println("로또 인서트.");
//			return lottoDAO.InsertLottoList(bean);
//		}
//	
//		@Override
//		public int CountLottoStart() {
//			// TODO Auto-generated method stub
//			System.out.println("서비스");
//			return lottoDAO.CountLottoStart();
//		}
//	
//		@Override
//		public LottoListBean TotalList(int Episode_Lotto) {
//			// TODO Auto-generated method stub
//			System.out.println("서비스123");
//			return lottoDAO.LottoList(Episode_Lotto);
//		}
//	
//		public class Point {
//		    private int name;
//		    private Integer point;
//		 
//		    public Point(int name, Integer point) {
//		        this.name = name;
//		        this.point = point;
//		    }
//		 
//		    public int getName() {
//		        return name;
//		    }
//		 
//		    public Integer getPoint() {
//		        return point;
//		    }
//		 
//		    @Override
//		    public String toString() {
//		        return "(" + name + "," + point + ")";
//		    }
//		 
//		}
//	
//	
//		@Override
//		public List<String> LottoListCount() {
////			LottoLimit bean = new LottoLimit();
////			LottoLimit bean6 = new LottoLimit();
//			List<LottoListBean> list = lottoDAO.LottoListLimit1();
//		
//		        int lottoNum[] = new int[6];	
//		    	List<String> SixOneList = new ArrayList<String>();
//		    	List<Integer> xlist = new ArrayList();
//		    	LottoLimit bean = new LottoLimit();
//		    	List<Integer> limitList = new ArrayList();
//		    	System.out.println("=");
//		    	//1~3값 세팅
//				int threeChk=0;
//				int MaxMinOneNum=0;
//				for(int one100=0;one100<10;one100++)
//					 first:{
//					
//					Collections.shuffle(list);
////					Collections.shuffle(list6);
//					lottoNum[0]= list.get(0).getNum_One();
//					for (int i = 1; i < 46; i++) {
//						if (lottoNum[0] == i) {
//							lottoNum[1] = (int) (Math.random() * ((lottoNum[0] + 20) - (lottoNum[0] + 1) + 1)) + (lottoNum[0] + 1);
//							}
//							
//						}
//					
//					for (int i = 1; i < 46; i++) {
//						if (lottoNum[1] == i) {
//							lottoNum[2] = (int) (Math.random() * ((lottoNum[1] + 5) - (lottoNum[1] + 1) + 1)) + (lottoNum[1] + 1);
//							}
//							
//						}
//					
//					for (int i = 1; i < 46; i++) {
//						if (lottoNum[2] == i) {
//							lottoNum[3] = (int) (Math.random() * ((lottoNum[2] + 5) - (lottoNum[2] + 1) + 1)) + (lottoNum[2] + 1);
//							}
//							
//						}
//					
//					for (int i = 1; i < 46; i++) {
//						if (lottoNum[3] == i) {
//							lottoNum[4] = (int) (Math.random() * ((lottoNum[2] + 5) - (lottoNum[3] + 1) + 1)) + (lottoNum[3] + 1);
//							}
//							
//						}
//					for (int i = 1; i < 46; i++) {
//						if (lottoNum[4] == i) {
//							lottoNum[5] = (int) (Math.random() * (45 - (lottoNum[4] + 1) + 1)) + (lottoNum[4] + 1);
//							
//							}
//							
//							
//						}
//					if(lottoNum[3]>45)
//					{
//						System.out.println("다시 돌려라 3 :"+lottoNum[3]);
//						break first;
//					}
//					
//					if(lottoNum[4]>45)
//					{
//						System.out.println("다시 돌려라 4 : "+lottoNum[4]);
//						break first;
//					}
//					
//					if(lottoNum[5]>45)
//					{
//						System.out.println("다시 돌려라 5 : "+lottoNum[5]);
//						break first;
//					}
//
//
//				
////					int NumChk =0;
////					List<Integer> Sixlist = new ArrayList<Integer>();
////					Sixlist.add(4);
////					Sixlist.add(14);
////					Sixlist.add(23);
////					Sixlist.add(28);	
////					Sixlist.add(37);
////					Sixlist.add(45);
////					System.out.println(one100+"회추천번호"+lottoNum[0]+"/"+lottoNum[1]+"/"+lottoNum[2]+"/"+lottoNum[3]+"/"+lottoNum[4]+"/"+lottoNum[5]);
////					for(int ten=0;ten<6;ten++)
////					{	
////						
////						if(Sixlist.get(ten)==lottoNum[0])
////						{
////							
////							NumChk=NumChk+1;
////						}
////						
////						else if(Sixlist.get(ten)==lottoNum[1])
////						{
////							NumChk=NumChk+1;
////						}
////						
////					else if(Sixlist.get(ten)==lottoNum[2])
////						{
////							NumChk=NumChk+1;
////						}
////						
////						else if(Sixlist.get(ten)==lottoNum[3])
////						{
////							NumChk=NumChk+1;
////						}
////						
////						else if(Sixlist.get(ten)==lottoNum[4])
////						{
////							NumChk=NumChk+1;
////						}
////						
////						else if(Sixlist.get(ten)==lottoNum[5])
////						{
////							NumChk=NumChk+1;
////						}
////						
////						else {
////						}
////						
////						
////					}
//					
////					if(NumChk>=4)
////					{
////						threeChk = threeChk+1;
////						xlist.add(NumChk);
//					
//						bean.setEight(bean.getEight()+1);
//						System.out.println(bean.getEight()+"확인");
////						if(lottoNum[0]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[0]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[0]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[0]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[0]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[0]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[0]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[0]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[0]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						
////						else if(lottoNum[0]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[0]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[0]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[0]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[0]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[0]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[0]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[0]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[0]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[0]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[0]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[0]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[0]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[0]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[0]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[0]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[0]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[0]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[0]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[0]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[0]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[0]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[0]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[0]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[0]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[0]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[0]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[0]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[0]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[0]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[0]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[0]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[0]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[0]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[0]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[0]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[0]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
////						
////						
////						if(lottoNum[1]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[1]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[1]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[1]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[1]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[1]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[1]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[1]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[1]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						else if(lottoNum[1]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[1]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[1]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[1]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[1]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[1]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[1]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[1]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[1]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[1]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[1]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[1]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[1]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[1]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[1]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[1]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[1]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[1]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[1]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[1]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[1]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[1]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[1]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[1]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[1]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[1]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[1]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[1]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[1]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[1]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[1]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[1]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[1]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[1]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[1]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[1]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[1]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
////						
////						//------------------------
////						
////						
////						if(lottoNum[2]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[2]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[2]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[2]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[2]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[2]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[2]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[2]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[2]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						
////						else if(lottoNum[2]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[2]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[2]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[2]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[2]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[2]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[2]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[2]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[2]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[2]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[2]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[2]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[2]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[2]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[2]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[2]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[2]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[2]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[2]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[2]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[2]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[2]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[2]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[2]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[2]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[2]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[2]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[2]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[2]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[2]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[2]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[2]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[2]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[2]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[2]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[2]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[2]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
////						
//////---------------------------
////						
////						if(lottoNum[3]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[3]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[3]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[3]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[3]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[3]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[3]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[3]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[3]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						
////						else if(lottoNum[3]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[3]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[3]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[3]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[3]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[3]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[3]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[3]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[3]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[3]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[3]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[3]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[3]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[3]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[3]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[3]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[3]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[3]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[3]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[3]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[3]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[3]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[3]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[3]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[3]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[3]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[3]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[3]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[3]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[3]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[3]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[3]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[3]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[3]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[3]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[3]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[3]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
////						
////						//---------------------------1
////						
////						if(lottoNum[4]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[4]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[4]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[4]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[4]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[4]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[4]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[4]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[4]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						else if(lottoNum[4]==1)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////						
////						else if(lottoNum[4]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[4]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[4]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[4]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[4]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[4]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[4]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[4]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[4]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[4]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[4]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[4]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[4]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[4]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[4]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[4]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[4]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[4]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[4]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[4]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[4]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[4]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[4]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[4]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[4]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[4]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[4]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[4]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[4]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[4]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[4]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[4]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[4]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[4]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[4]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[0]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[4]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
////						
////						
////						/////
////						
////						if(lottoNum[5]==1)
////						{
////							bean.setOne(bean.getOne()+1);
////						}
////						else if(lottoNum[5]==2)
////						{
////							bean.setOne(bean.getTwo()+1);
////						}
////
////
////						else if(lottoNum[5]==3)
////						{
////							bean.setOne(bean.getThree()+1);
////						}
////						
////						else if(lottoNum[5]==4)
////						{
////							bean.setOne(bean.getFour()+1);
////						}
////						
////						else if(lottoNum[5]==5)
////						{
////							bean.setOne(bean.getFive()+1);
////						}
////						
////						else if(lottoNum[5]==6)
////						{
////							bean.setOne(bean.getSix()+1);
////						}
////						
////						else if(lottoNum[5]==7)
////						{
////							bean.setOne(bean.getSeven()+1);
////						}
////						
////						else if(lottoNum[5]==8)
////						{
////							bean.setOne(bean.getEight()+1);
////						}
////						else if(lottoNum[5]==9)
////						{
////							bean.setOne(bean.getNine()+1);
////						}
////						else if(lottoNum[5]==10)
////						{
////							bean.setOne(bean.getTen()+1);
////						}
////						
////						else if(lottoNum[5]==11)
////						{
////							bean.setOne(bean.getOne1()+1);
////						}
////						else if(lottoNum[5]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						
////						else if(lottoNum[5]==12)
////						{
////							bean.setOne(bean.getOne2()+1);
////						}
////						else if(lottoNum[5]==13)
////						{
////							bean.setOne(bean.getOne3()+1);
////						}
////						
////						else if(lottoNum[5]==14)
////						{
////							bean.setOne(bean.getOne4()+1);
////						}
////						
////						else if(lottoNum[5]==15)
////						{
////							bean.setOne(bean.getOne5()+1);
////						}
////						
////						else if(lottoNum[5]==16)
////						{
////							bean.setOne(bean.getOne6()+1);
////						}
////						
////						else if(lottoNum[5]==17)
////						{
////							bean.setOne(bean.getOne7()+1);
////						}
////						
////						else if(lottoNum[5]==18)
////						{
////							bean.setOne(bean.getOne8()+1);
////						}
////						
////						else if(lottoNum[5]==19)
////						{
////							bean.setOne(bean.getOne9()+1);
////						}
////						
////						else if(lottoNum[5]==20)
////						{
////							bean.setOne(bean.getTwo0()+1);
////						}
////						
////						else if(lottoNum[5]==21)
////						{
////							bean.setOne(bean.getTwo1()+1);
////						}
////						
////						else if(lottoNum[5]==22)
////						{
////							bean.setOne(bean.getTwo2()+1);
////						}
////						
////						else if(lottoNum[5]==23)
////						{
////							bean.setOne(bean.getTwo3()+1);
////						}
////						
////						else if(lottoNum[5]==24)
////						{
////							bean.setOne(bean.getTwo4()+1);
////						}
////						
////						else if(lottoNum[5]==25)
////						{
////							bean.setOne(bean.getTwo5()+1);
////						}
////						
////						else if(lottoNum[5]==26)
////						{
////							bean.setOne(bean.getTwo6()+1);
////						}
////						
////						else if(lottoNum[5]==27)
////						{
////							bean.setOne(bean.getTwo7()+1);
////						}
////						
////						else if(lottoNum[5]==28)
////						{
////							bean.setOne(bean.getTwo8()+1);
////						}
////						
////						else if(lottoNum[5]==29)
////						{
////							bean.setOne(bean.getTwo9()+1);
////						}
////						
////						else if(lottoNum[5]==30)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[5]==31)
////						{
////							bean.setOne(bean.getThree1()+1);
////						}
////						
////						else if(lottoNum[5]==32)
////						{
////							bean.setOne(bean.getThree2()+1);
////						}
////						
////						else if(lottoNum[5]==33)
////						{
////							bean.setOne(bean.getThree3()+1);
////						}
////						
////						else if(lottoNum[5]==34)
////						{
////							bean.setOne(bean.getThree4()+1);
////						}
////						
////						else if(lottoNum[5]==35)
////						{
////							bean.setOne(bean.getThree5()+1);
////						}
////						
////						else if(lottoNum[5]==36)
////						{
////							bean.setOne(bean.getThree6()+1);
////						}
////						
////						else if(lottoNum[5]==37)
////						{
////							bean.setOne(bean.getThree7()+1);
////						}
////						else if(lottoNum[5]==38)
////						{
////							bean.setOne(bean.getThree0()+1);
////						}
////						
////						else if(lottoNum[5]==39)
////						{
////							bean.setOne(bean.getThree9()+1);
////						}
////						
////						else if(lottoNum[5]==40)
////						{
////							bean.setOne(bean.getFour0()+1);
////						}
////						
////						else if(lottoNum[5]==41)
////						{
////							bean.setOne(bean.getFour1()+1);
////						}
////						
////						else if(lottoNum[5]==42)
////						{
////							bean.setOne(bean.getFour2()+1);
////						}
////						
////						else if(lottoNum[5]==43)
////						{
////							bean.setOne(bean.getFour3()+1);
////						}
////						
////						else if(lottoNum[5]==44)
////						{
////							bean.setOne(bean.getFour4()+1);
////						}
////						
////						else if(lottoNum[5]==45)
////						{
////							bean.setOne(bean.getFour5()+1);
////						}
//					System.out.println("확인들어 갑니다."+bean.getFive()+"==============");
//						SixOneList.add(lottoNum[0]+"/"+lottoNum[1]+"/"+lottoNum[2]+"/"+lottoNum[3]+"/"+lottoNum[4]+"/"+lottoNum[5]);
////						System.out.println(one100+"회 x값 : "+NumChk);
////					
////					}
//					
//					System.out.println("threeChk값 : "+threeChk);
//					
//					}
////				for(int i =0; i<xlist.size();i++) {
////					System.out.println(xlist.get(i));
////				}
////				
//				
//			return SixOneList;
//		}
//		
//		public static int Maxmin(int lottoNum,int MaxMinOneNum) {
//			
//			{
//				if(lottoNum <1 || lottoNum>45)
//				{
//				do
//
//				{
//					System.out.println("반복문전" + lottoNum);
//					lottoNum = (int) (Math.random() * ((MaxMinOneNum + 10) - (MaxMinOneNum- 5) + 1)) + (MaxMinOneNum - 5);
//					System.out.println("반복문후" + lottoNum);
//
//				} while (lottoNum < 1 || lottoNum >45);
//
//				System.out.println("END" + lottoNum);
//
//			}
//			
//				
//			}
//			return lottoNum;
//		}
//	
//		// String 내림차순
//	//	class DescendingObj implements Comparator<Point> {
//	//	 
//	//	    @Override
//	//	    public int compare(Point o1, Point o2) {
//	//	        return o2.getName().compareTo(o1.getName());
//	//	    }
//	//	 
//	//	}
//		
//		 
//		// Integer 내림차순
//		class AscendingObj implements Comparator<Point> {
//		 
//		    @Override
//		    public int compare(Point o1, Point o2) {
//		        return o2.getPoint().compareTo(o1.getPoint());
//		    }
//		 
//		}
//
//
//		@Override
//		public List<LottoListBean> SerchLottoList() {
//			List<LottoListBean> list = lottoDAO.LottoListLimit1();
//			Collections.shuffle(list);
//			int num_one = list.get(0).getNum_One();
//			System.out.println("서비스 여기? "+num_one);
//			List<LottoListBean> serchlist = lottoDAO.SerchLottoList(num_one);
//			return serchlist;
//		}
//	
//		@Override
//		public List<LottoListBean> OneStNumring(){
//			
//			return lottoDAO.OneStNumring();
//		}
//
//		@Override
//		public List<LottoListBean> TwoNumring() {
//			
//			return lottoDAO.TwoNumring();
//		}
//
//		@Override
//		public List<LottoListBean> ThreeNumring() {
//			
//			return lottoDAO.ThreeNumring();
//		}
//
//		@Override
//		public List<LottoListBean> fourNumring() {
//			// TODO Auto-generated method stub
//			return lottoDAO.FourNumring();
//		}
////
//		@Override
//		public List<LottoListBean> fiveNumring() {
//			// TODO Auto-generated method stub
//			return lottoDAO.FiveNumring();
//		}
//
//		@Override
//		public List<LottoListBean> sixNumring() {
//			// TODO Auto-generated method stub
//			return lottoDAO.sixNumring();
//		}
//	
//	}