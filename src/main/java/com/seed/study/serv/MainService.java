package com.seed.study.serv;

import java.util.ArrayList;

import com.seed.study.vo.InsertUser;
import com.seed.study.vo.MainVo;

public interface MainService {

	ArrayList<MainVo> selectList() throws Exception;

	int insertUser1(InsertUser iu);

	int insertUser2(InsertUser iu);

	int deleteUser1(int userNum);

	int deleteUser2(int userNum);
}
