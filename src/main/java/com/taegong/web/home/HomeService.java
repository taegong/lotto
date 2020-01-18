package com.taegong.web.home;

import java.util.List;
import com.taegong.web.member.*;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.taegong.web.board.LottoBoardBean;
@Service
public interface HomeService {
	
	List<LottoBoardBean> MainSum();
}
