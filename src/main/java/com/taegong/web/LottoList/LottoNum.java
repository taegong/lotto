package com.taegong.web.LottoList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class LottoNum {
	public static void main(String[] args) {
			
			int lottoNum[] = new int[6];				//로또 번호를 담을 배열을 생성한다
			List<Integer> list = new ArrayList<Integer>();
			list.add(4);
			list.add(5);
			list.add(1);
			list.add(9);
			list.add(7);
			Collections.shuffle(list);
			lottoNum[0] = 47;

			

		for(int i=0;  i < lottoNum.length; i++) {
				System.out.println(lottoNum[i]);
			}
		}
	
	public static int Maxmin(int lottoNum,int MaxMinOneNum) {
		

		{
			do

			{
				System.out.println("반복문" + lottoNum);
				lottoNum = (int) (Math.random() * (MaxMinOneNum - 1 + 1)) + 39;
				System.out.println("반복문" + lottoNum);

			} while (lottoNum > 45);

			System.out.println("END" + lottoNum);

		}
			
		return lottoNum;
	}
}

