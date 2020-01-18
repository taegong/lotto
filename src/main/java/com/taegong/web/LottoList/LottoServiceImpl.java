	package com.taegong.web.LottoList;
	
	import java.util.ArrayList;
	import java.util.Collections;
	import java.util.Comparator;
	import java.util.HashMap;
	import java.util.Iterator;
	import java.util.List;
	import java.util.Map;
	import java.util.TreeMap;
	
	import javax.inject.Inject;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;
	import org.springframework.stereotype.Service;

	import com.taegong.web.LottoList.LottoLimit;
import com.taegong.web.member.LottoMemberBean;
import com.taegong.web.member.MemberDAO;
	
	@Repository
	
	public class LottoServiceImpl implements LottoService {
	
		private static final String Point = null;
	
		@Inject
		private LottoDAO lottoDAO;
		private LottoService lottoservice;
		@Inject
		private LottoService service;
	
		@Override
		public int LottoInsert(LottoListBean bean) {
			System.out.println("로또 인서트.");
			return lottoDAO.InsertLottoList(bean);
		}
	
		@Override
		public int CountLottoStart() {
			// TODO Auto-generated method stub
			System.out.println("서비스");
			return lottoDAO.CountLottoStart();
		}
	
		@Override
		public LottoListBean TotalList(int Episode_Lotto) {
			// TODO Auto-generated method stub
			System.out.println("서비스123");
			return lottoDAO.LottoList(Episode_Lotto);
		}
	
		public class Point {
		    private int name;
		    private Integer point;
		 
		    public Point(int name, Integer point) {
		        this.name = name;
		        this.point = point;
		    }
		 
		    public int getName() {
		        return name;
		    }
		 
		    public Integer getPoint() {
		        return point;
		    }
		 
		    @Override
		    public String toString() {
		        return "(" + name + "," + point + ")";
		    }
		 
		}
	
	
		@Override
		public List<String> LottoListCount() {
//			LottoLimit bean = new LottoLimit();
//			LottoLimit bean6 = new LottoLimit();
			List<LottoListBean> list = lottoDAO.LottoListLimit1();
		
		        int lottoNum[] = new int[6];	
		    	List<String> SixOneList = new ArrayList<String>();
		    	List<Integer> xlist = new ArrayList();
		    	LottoLimit bean = new LottoLimit();
		    	List<Integer> limitList = new ArrayList();
		    	List<Integer> limitBeanList = new ArrayList();
		    	System.out.println("=");
		    	//1~3값 세팅
				int threeChk=0;
				int MaxMinOneNum=0;
				for(int one100=0;one100<1000;one100++)
					 first:{
					
					Collections.shuffle(list);
//					Collections.shuffle(list6);
					lottoNum[0]= list.get(0).getNum_One();
					for (int i = 1; i < 46; i++) {
						if (lottoNum[0] == i) {
							lottoNum[1] = (int) (Math.random() * ((lottoNum[0] + 20) - (lottoNum[0] + 1) + 1)) + (lottoNum[0] + 1);
							}
							
						}
					
					for (int i = 1; i < 46; i++) {
						if (lottoNum[1] == i) {
							lottoNum[2] = (int) (Math.random() * ((lottoNum[1] + 5) - (lottoNum[1] + 1) + 1)) + (lottoNum[1] + 1);
							}
							
						}
					
					for (int i = 1; i < 46; i++) {
						if (lottoNum[2] == i) {
							lottoNum[3] = (int) (Math.random() * ((lottoNum[2] + 5) - (lottoNum[2] + 1) + 1)) + (lottoNum[2] + 1);
							}
							
						}
					
					for (int i = 1; i < 46; i++) {
						if (lottoNum[3] == i) {
							lottoNum[4] = (int) (Math.random() * ((lottoNum[2] + 5) - (lottoNum[3] + 1) + 1)) + (lottoNum[3] + 1);
							}
							
						}
					for (int i = 1; i < 46; i++) {
						if (lottoNum[4] == i) {
							lottoNum[5] = (int) (Math.random() * (45 - (lottoNum[4] + 1) + 1)) + (lottoNum[4] + 1);
							
							}
							
							
						}
					if(lottoNum[3]>45)
					{
						System.out.println("다시 돌려라 3 :"+lottoNum[3]);
						break first;
					}
					
					if(lottoNum[4]>45)
					{
						System.out.println("다시 돌려라 4 : "+lottoNum[4]);
						break first;
					}
					
					if(lottoNum[5]>45)
					{
						System.out.println("다시 돌려라 5 : "+lottoNum[5]);
						break first;
					}


				
//					int NumChk =0;
//					List<Integer> Sixlist = new ArrayList<Integer>();
//					Sixlist.add(4);
//					Sixlist.add(14);
//					Sixlist.add(23);
//					Sixlist.add(28);	
//					Sixlist.add(37);
//					Sixlist.add(45);
//					System.out.println(one100+"회추천번호"+lottoNum[0]+"/"+lottoNum[1]+"/"+lottoNum[2]+"/"+lottoNum[3]+"/"+lottoNum[4]+"/"+lottoNum[5]);
//					for(int ten=0;ten<6;ten++)
//					{	
//						
//						if(Sixlist.get(ten)==lottoNum[0])
//						{
//							
//							NumChk=NumChk+1;
//						}
//						
//						else if(Sixlist.get(ten)==lottoNum[1])
//						{
//							NumChk=NumChk+1;
//						}
//						
//					else if(Sixlist.get(ten)==lottoNum[2])
//						{
//							NumChk=NumChk+1;
//						}
//						
//						else if(Sixlist.get(ten)==lottoNum[3])
//						{
//							NumChk=NumChk+1;
//						}
//						
//						else if(Sixlist.get(ten)==lottoNum[4])
//						{
//							NumChk=NumChk+1;
//						}
//						
//						else if(Sixlist.get(ten)==lottoNum[5])
//						{
//							NumChk=NumChk+1;
//						}
//						
//						else {
//						}
//						
//						
//					}
					
//					if(NumChk>=4)
//					{
//						threeChk = threeChk+1;
//						xlist.add(NumChk);
					
					
//						SixOneList.add(lottoNum[0]+" / "+lottoNum[1]+" / "+lottoNum[2]+" / "+lottoNum[3]+" / "+lottoNum[4]+" / "+lottoNum[5]);
						for(int totalnum=0;totalnum<6;totalnum++) {
							
							limitList.add(lottoNum[totalnum]);	
						}
						
						for(int topserch=0;topserch<limitList.size();topserch++) {
							
							
							if(limitList.get(topserch)==1) {
								bean.setOne(bean.getOne()+1);
							}
							
							 if(limitList.get(topserch)==2) {
								bean.setTwo(bean.getTwo()+1);
							}
							
							if(limitList.get(topserch)==3) {
								bean.setThree(bean.getThree()+1);
							}
							
							 if(limitList.get(topserch)==4) {
								bean.setFour(bean.getFour()+1);
							}
							
							 if(limitList.get(topserch)==5) {
								bean.setFive(bean.getFive()+1);
							}
							
							if(limitList.get(topserch)==6) {
								bean.setSix(bean.getSix()+1);
							}
							
							 if(limitList.get(topserch)==7) {
								bean.setSeven(bean.getSeven()+1);
							}
							
							 if(limitList.get(topserch)==8) {
								bean.setEight(bean.getEight()+1);
							}
							
							 if(limitList.get(topserch)==9) {
								bean.setNine(bean.getNine()+1);
							}
							
							 if(limitList.get(topserch)==10) {
								bean.setTen(bean.getTen()+1);
							}
							
							 if(limitList.get(topserch)==11) {
								bean.setOne1(bean.getOne1()+1);
							}
							
							 if(limitList.get(topserch)==12) {
								bean.setOne2(bean.getOne2()+1);
							}
							
							 if(limitList.get(topserch)==13) {
								bean.setOne3(bean.getOne3()+1);
							}
							
							 if(limitList.get(topserch)==14) {
								bean.setOne4(bean.getOne4()+1);
							}
							
							 if(limitList.get(topserch)==15) {
								bean.setOne5(bean.getOne5()+1);
							}
							
							 if(limitList.get(topserch)==16) {
								bean.setOne6(bean.getOne6()+1);
							}
							
							 if(limitList.get(topserch)==17) {
								bean.setOne7(bean.getOne7()+1);
							}
							
							 if(limitList.get(topserch)==18) {
								bean.setOne8(bean.getOne8()+1);
							}
							
							 if(limitList.get(topserch)==19) {
								bean.setOne9(bean.getOne9()+1);
							}
							
							 if(limitList.get(topserch)==20) {
								bean.setTwo0(bean.getTwo0()+1);
							}
							
							 if(limitList.get(topserch)==21) {
								bean.setTwo1(bean.getTwo1()+1);
							}
							
							 if(limitList.get(topserch)==22) {
								bean.setTwo2(bean.getTwo2()+1);
							}
							
							 if(limitList.get(topserch)==23) {
								bean.setTwo3(bean.getTwo3()+1);
							}
							
							 if(limitList.get(topserch)==24) {
								bean.setTwo4(bean.getTwo4()+1);
							}
							
							 if(limitList.get(topserch)==25) {
								bean.setTwo5(bean.getTwo5()+1);
							}
							
							 if(limitList.get(topserch)==26) {
								bean.setTwo6(bean.getTwo6()+1);
							}
							
							 if(limitList.get(topserch)==27) {
								bean.setTwo7(bean.getTwo7()+1);
							}
							
							 if(limitList.get(topserch)==28) {
								bean.setTwo8(bean.getTwo8()+1);
							}
							
							 if(limitList.get(topserch)==29) {
								bean.setTwo9(bean.getTwo9()+1);
							}
							
							 if(limitList.get(topserch)==30) {
								bean.setThree0(bean.getThree0()+1);
							}
							
							 if(limitList.get(topserch)==31) {
								bean.setThree1(bean.getThree1()+1);
							}

							 if(limitList.get(topserch)==32) {
								bean.setThree2(bean.getThree2()+1);
							}
							
							 if(limitList.get(topserch)==33) {
								bean.setThree3(bean.getThree3()+1);
							}
							
							 if(limitList.get(topserch)==34) {
								bean.setThree4(bean.getThree4()+1);
							}
							
							 if(limitList.get(topserch)==35) {
								bean.setThree5(bean.getThree5()+1);
							}
							
							 if(limitList.get(topserch)==36) {
								bean.setThree6(bean.getThree6()+1);
							}
							
							 if(limitList.get(topserch)==37) {
								bean.setThree7(bean.getThree7()+1);
							}
							
							 if(limitList.get(topserch)==38) {
								bean.setThree8(bean.getThree8()+1);
							}
							
							 if(limitList.get(topserch)==39) {
								bean.setThree9(bean.getThree9()+1);
							}
							
							
							 if(limitList.get(topserch)==40) {
								bean.setFour0(bean.getFour0()+1);
							}
							
							 if(limitList.get(topserch)==41) {
								bean.setFour1(bean.getFour1()+1);
							}
							
							 if(limitList.get(topserch)==42) {
								bean.setFour2(bean.getFour2()+1);
							}
							
							 if(limitList.get(topserch)==43) {
								bean.setFour3(bean.getFour3()+1);
							}
							
							 if(limitList.get(topserch)==44) {
								bean.setFour4(bean.getFour4()+1);
							}
							
							 if(limitList.get(topserch)==45) {
								bean.setFour5(bean.getFour5()+1);
							}
							
							
						}
						
						
					}
				System.out.println("끝");
				
				ArrayList<Point> arrayList = new ArrayList<LottoServiceImpl.Point>();
				
				arrayList.add(new Point(1, bean.getOne()));
				arrayList.add(new Point(2, bean.getTwo()));
				arrayList.add(new Point(3, bean.getThree()));
				arrayList.add(new Point(4, bean.getFour()));
				arrayList.add(new Point(5, bean.getFive()));
				arrayList.add(new Point(6, bean.getSix()));
				arrayList.add(new Point(7, bean.getSeven()));
				arrayList.add(new Point(8, bean.getEight()));
				arrayList.add(new Point(9, bean.getNine()));
				arrayList.add(new Point(10, bean.getTen()));
				
				arrayList.add(new Point(11, bean.getOne1()));
				arrayList.add(new Point(12, bean.getOne2()));
				arrayList.add(new Point(13, bean.getOne3()));
				arrayList.add(new Point(14, bean.getOne4()));
				arrayList.add(new Point(15, bean.getOne5()));
				arrayList.add(new Point(16, bean.getOne6()));
				arrayList.add(new Point(17, bean.getOne7()));
				arrayList.add(new Point(18, bean.getOne8()));
				arrayList.add(new Point(19, bean.getOne9()));
				
				arrayList.add(new Point(20, bean.getTwo0()));
				arrayList.add(new Point(21, bean.getTwo1()));
				arrayList.add(new Point(22, bean.getTwo2()));
				arrayList.add(new Point(23, bean.getTwo3()));
				arrayList.add(new Point(24, bean.getTwo4()));
				arrayList.add(new Point(25, bean.getTwo5()));
				arrayList.add(new Point(26, bean.getTwo6()));
				arrayList.add(new Point(27, bean.getTwo7()));
				arrayList.add(new Point(28, bean.getTwo8()));
				arrayList.add(new Point(29, bean.getTwo9()));
				
				arrayList.add(new Point(30, bean.getThree0()));
				arrayList.add(new Point(31, bean.getThree1()));
				arrayList.add(new Point(32, bean.getThree2()));
				arrayList.add(new Point(33, bean.getThree3()));
				arrayList.add(new Point(34, bean.getThree4()));
				arrayList.add(new Point(35, bean.getThree5()));
				arrayList.add(new Point(36, bean.getThree6()));
				arrayList.add(new Point(37, bean.getThree7()));
				arrayList.add(new Point(38, bean.getThree8()));
				arrayList.add(new Point(39, bean.getThree9()));
				
				arrayList.add(new Point(40, bean.getFour0()));
				arrayList.add(new Point(41, bean.getFour1()));
				arrayList.add(new Point(42, bean.getFour2()));
				arrayList.add(new Point(43, bean.getFour3()));
				arrayList.add(new Point(44, bean.getFour4()));
				arrayList.add(new Point(45, bean.getFour5()));
				
				for (Point p : arrayList) {
		            System.out.print(p);
		        }
		        System.out.println();
		 
		 
		        // 오름차순 정렬
		        AscendingObj ascending = new AscendingObj();
		        Collections.sort(arrayList, ascending);
		 
		        System.out.print("Point 오름차순 - ");
		        for (Point p : arrayList) {
		            System.out.print(p);
		        }
		        
		        List<Integer> shuffleList = new ArrayList<Integer>();
		        
		        shuffleList.add(arrayList.get(20).name);
		        shuffleList.add(arrayList.get(21).name);
		        shuffleList.add(arrayList.get(22).name);
		        shuffleList.add(arrayList.get(23).name);
		        shuffleList.add(arrayList.get(24).name);
		        shuffleList.add(arrayList.get(25).name);
		        shuffleList.add(arrayList.get(26).name);
		        shuffleList.add(arrayList.get(27).name);
		        shuffleList.add(arrayList.get(28).name);
		        shuffleList.add(arrayList.get(29).name);
		        shuffleList.add(arrayList.get(30).name);
		        shuffleList.add(arrayList.get(44).name);
		        shuffleList.add(arrayList.get(31).name);
		        shuffleList.add(arrayList.get(18).name);
		        
		        
		        System.out.println();

		        for(int shuffleFor=0; shuffleFor<shuffleList.size(); shuffleFor++) {
		        	Collections.shuffle(shuffleList);
		        	SixOneList.add(shuffleList.get(0)+" / "+shuffleList.get(1)+" / "+ shuffleList.get(2)+" / "+shuffleList.get(3)+"/"+ shuffleList.get(4)+"/"+shuffleList.get(5));
		        	
		        }
		        	
				
				
			return SixOneList;
		}
		
		public static int Maxmin(int lottoNum,int MaxMinOneNum) {
			
			{
				if(lottoNum <1 || lottoNum>45)
				{
				do

				{
					System.out.println("반복문전" + lottoNum);
					lottoNum = (int) (Math.random() * ((MaxMinOneNum + 10) - (MaxMinOneNum- 5) + 1)) + (MaxMinOneNum - 5);
					System.out.println("반복문후" + lottoNum);

				} while (lottoNum < 1 || lottoNum >45);

				System.out.println("END" + lottoNum);

			}
			
				
			}
			return lottoNum;
		}
	
		// String 내림차순
	//	class DescendingObj implements Comparator<Point> {
	//	 
	//	    @Override
	//	    public int compare(Point o1, Point o2) {
	//	        return o2.getName().compareTo(o1.getName());
	//	    }
	//	 
	//	}
		
		 
		// Integer 내림차순
		class AscendingObj implements Comparator<Point> {
		 
		    @Override
		    public int compare(Point o1, Point o2) {
		        return o2.getPoint().compareTo(o1.getPoint());
		    }
		 
		}


		@Override
		public List<LottoListBean> SerchLottoList() {
			List<LottoListBean> list = lottoDAO.LottoListLimit1();
			Collections.shuffle(list);
			int num_one = list.get(0).getNum_One();
			System.out.println("서비스 여기? "+num_one);
			List<LottoListBean> serchlist = lottoDAO.SerchLottoList(num_one);
			return serchlist;
		}
	
		@Override
		public List<LottoListBean> OneStNumring(){
			
			return lottoDAO.OneStNumring();
		}

		@Override
		public List<LottoListBean> TwoNumring() {
			
			return lottoDAO.TwoNumring();
		}

		@Override
		public List<LottoListBean> ThreeNumring() {
			
			return lottoDAO.ThreeNumring();
		}

		@Override
		public List<LottoListBean> fourNumring() {
			// TODO Auto-generated method stub
			return lottoDAO.FourNumring();
		}

		@Override
		public List<LottoListBean> fiveNumring() {
			// TODO Auto-generated method stub
			return lottoDAO.FiveNumring();
		}

		@Override
		public List<LottoListBean> sixNumring() {
			// TODO Auto-generated method stub
			return lottoDAO.sixNumring();
		}
	
	}