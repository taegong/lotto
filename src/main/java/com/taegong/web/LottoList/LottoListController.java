package com.taegong.web.LottoList;

import java.awt.Point;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegong.web.LottoList.LottoLimit;
import com.taegong.web.member.MemberService;

@Controller
public class LottoListController {
	
	@Inject
	private LottoService lottoservice;
	
	@RequestMapping(value = "/lottomain",method = RequestMethod.GET)
	public String LottoMain(LottoListBean bean,Model model)
	{
	
		try {
			 
	           int Episode_Lotto = 0;
	           Episode_Lotto = lottoservice.CountLottoStart();
	          
	        	model.addAttribute("LottoTal",lottoservice.TotalList(Episode_Lotto));
	        	model.addAttribute("lastEp",lottoservice.CountLottoStart());
	        	System.out.println(bean.getEpisode_Lotto());
	        	
	        	System.out.println("여기?");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "LottoList/LottoMain";
	}
	
	@RequestMapping(value = "/lottomain/{Episode_Lotto}",method = RequestMethod.POST)
	@ResponseBody
	public Object LsottoListButton(@RequestParam Map<String, Object> paramMap,int Episode_Lotto,  Model model)
	{
		int result = 0;
		try {
			 
	           System.out.println(Episode_Lotto);
	        	model.addAttribute("LottoTal",lottoservice.TotalList(Episode_Lotto));
	        	model.addAttribute("lastEp",Episode_Lotto);
	        	
	        	System.out.println("여기?");
	    
	        	
	        	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
		
	}
	
	@RequestMapping(value = "/lottomain/{Episode_Lotto}",method = RequestMethod.GET)
	public Object LsottoListButton1(@RequestParam Map<String, Object> paramMap,@PathVariable int  Episode_Lotto ,LottoListBean bean , Model model) {
		
		try {
	    	
	        	model.addAttribute("LottoTal",lottoservice.TotalList(Episode_Lotto));
	        	model.addAttribute("lastEp",lottoservice.CountLottoStart());
	        	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "LottoList/LottoMain";
		
}
	
	@RequestMapping(value = "/lottolimitr",method = RequestMethod.GET)
		public String LottoLimitr(LottoListBean bean,Model model ) {
//		List<Integer> list = lottoservice.LottoListLimit1();
		
		List<String> ListCount = lottoservice.LottoListCount();
		List<LottoListBean> list = lottoservice.SerchLottoList();
		
//List list1=lottoservice.LottoListCount();
////		int arr[] = lottoservice.LottoSixCho();
//		for(int i =0; i<list1.size();i++) {
//			System.out.println(list1);
//		}
		model.addAttribute("OneStlist",lottoservice.OneStNumring());
		model.addAttribute("Twolist",lottoservice.TwoNumring());
		model.addAttribute("Threelist",lottoservice.ThreeNumring());
		model.addAttribute("Fourlist",lottoservice.fourNumring());
		model.addAttribute("fivelist",lottoservice.fiveNumring());
		model.addAttribute("sixlist",lottoservice.sixNumring());
		model.addAttribute("list",list);
		model.addAttribute("LottoLimit",ListCount);
		

		return "LottoList/LottoMain2";
	}

}
