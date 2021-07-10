package com.seed.study.serv;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seed.study.dao.MainDao;
import com.seed.study.vo.InsertUser;
import com.seed.study.vo.MainVo;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	private MainDao mainDao;

	@Override
	public ArrayList<MainVo> selectList() throws Exception {
		System.out.println("서비스 리스트 함수실행");
		return mainDao.selectList();
	}

	@Override
	public int insertUser1(InsertUser iu) {
		System.out.println("서비스 인서트유저1 실행");
		return mainDao.insertUser1(iu);
	}

	@Override
	public int insertUser2(InsertUser iu) {
		return mainDao.insertUser2(iu);
	}

	@Override
	public int deleteUser1(int userNum) {
		System.out.println("유저삭제 실행");
		return mainDao.deleteUser1(userNum);
	}

	@Override
	public int deleteUser2(int userNum) {
		return mainDao.deleteUser2(userNum);
	}

}
