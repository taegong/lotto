package com.taegong.web.home;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.taegong.web.LottoList.LottoListBean;
import com.taegong.web.LottoList.LottoService;
import com.taegong.web.board.LottoBoardBean;
import com.taegong.web.board.BoardService;

import java.util.regex.Matcher;

import java.util.regex.Pattern;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private LottoService lottoservice;
	@Inject
	private HomeService homeService;
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public String main(LottoListBean bean,Model model)
	{
		try {
			 //jsoup 크롤링
			 Document EpLast = Jsoup.connect("https://www.nlotto.co.kr/common.do?method=main").get();
	            //System.out.println(doc);
	            Elements Episode ;
	           Episode = EpLast.select("#lottoDrwNo");
	           System.out.println(Episode.text()+"123");
	           int LastEp = 0;
	           if(!"".equals(Episode.text())) {
	        	   LastEp = Integer.parseInt(Episode.text());
	        	   System.out.println("공백이 없다면"+LastEp);
	           }else
	           {
	        	   LastEp = lottoservice.CountLottoStart();
	        	   System.out.println("공백이 있다면"+LastEp);
	           }
	          
	           int StrStart  = lottoservice.CountLottoStart();
	           System.out.println(StrStart+"시작값");
	            System.out.println(Episode.text()+"마지막회차");
	        	if(StrStart < LastEp) {
	        		System.out.println("들어 옵니까?");
	    	for(int i=StrStart+1;i <= LastEp;i++)
	    	{

	    	
	    			
	    		Document doc = Jsoup.connect("https://www.nlotto.co.kr/gameResult.do?method=byWin&drwNo="+i).get();
	            //System.out.println(doc);
	            Elements contents ;
	           contents = doc.select(".win_result h4 strong");
	            
	            String[] RoundContent = contents.text().split("회");
	            System.out.println(RoundContent[0]+"당첨결과");
	            bean.setEpisode_Lotto(Integer.parseInt(RoundContent[0]));	
	            contents = doc.select(".ball_645");
	            String Lotto = contents.text();
	            System.out.println("번호 확인"+Lotto);
	            String[] LottoSix = Lotto.split("\\s");
	            System.out.println("=========================== 시작");
	            System.out.println(bean.getEpisode_Lotto()+" : 회차");
	            bean.setTotal_Num(Lotto);
	            System.out.println(bean.getTotal_Num()+" : 번호");
	            bean.setNum_One(Integer.parseInt(LottoSix[0]));
	            System.out.println(bean.getNum_One()+" : 1번호");
	            bean.setNum_Two(Integer.parseInt(LottoSix[1]));
	            System.out.println(bean.getNum_Two()+" : 2번호");
	            bean.setNum_Three(Integer.parseInt(LottoSix[2]));
	            System.out.println(bean.getNum_Three()+" : 3번호");
	            bean.setNum_Four(Integer.parseInt(LottoSix[3]));
	            System.out.println(bean.getNum_Four()+" : 4번호");
	            bean.setNum_Five(Integer.parseInt(LottoSix[4]));
	            System.out.println(bean.getNum_Five()+" : 5번호");
	            bean.setNum_Six(Integer.parseInt(LottoSix[5]));
	            System.out.println(bean.getNum_Six()+" : 6번호");
	            bean.setNum_bonus(Integer.parseInt(LottoSix[6]));
	            System.out.println(bean.getNum_bonus()+" : 보너스번호");
	            //총당첨금
	            contents = doc.select("tbody");
	            String priceAll = contents.text();
	            String[] priceOne = priceAll.split("\\s");
	            String TotalPrice = priceOne[1].replace("원", "");
	            bean.setNum_One_Price(TotalPrice);
	            //총인원
	            contents = doc.select("tbody");
	            int PreceOneS =Integer.parseInt(priceOne[2]);
	            bean.setNum_One_Price_Inwon(PreceOneS);
	            
	            //1인금액
	            bean.setNum_OP_price(priceOne[3]);
	            int result = lottoservice.LottoInsert(bean);
	           
	            System.out.println("=========================== 끝");
	            System.out.println("=========회차종료========================");
          }
	    	
		}
	        	  ArrayList<String> Imgsrc = new ArrayList<String>();
	        	  List<LottoBoardBean> ImgContent =  homeService.MainSum();
	        	for(int src=0; src<ImgContent.size(); src++)
	        	{	
	        	String ImgSrcVo = ImgContent.get(src).getTb_board_content();
	        	Pattern image_source_grabber = Pattern.compile("<img.+?src=[\"|'](.+)?[\"|'].+?>");
	        	 Matcher captured = image_source_grabber.matcher(ImgSrcVo);
	        	 ImgContent.get(src).setTb_board_content("");
	        	 
	        	 while(captured.find()) {
	        		 ImgContent.get(src).setTb_board_content(captured.group(1));
	        		 
	        	 }
	        	
	        	 
	        	 
	        	}
	        	 
	        	 for(int t =0; t<ImgContent.size();t ++) {
	        		 if(ImgContent.get(t).getTb_board_content()=="")
	        		 {
	        		 ImgContent.get(t).setTb_board_content("/resources/img/123.jpg");
	        		 }
	        		 
	        	 }
	        	 System.out.println("라스팡"+LastEp);
	        	model.addAttribute("MainSum",ImgContent);
	        	model.addAttribute("LottoTal",lottoservice.TotalList(LastEp));
	        	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); //오류 출력(방법은 여러가지)
		}
		return "home";
	}
	
	
}
