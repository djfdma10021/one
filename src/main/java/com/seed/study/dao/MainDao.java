package com.seed.study.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seed.study.vo.InsertUser;
import com.seed.study.vo.MainVo;

@Repository("mainDao")
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String Namespace = "mainMapper";

	public ArrayList<MainVo> selectList() throws Exception {
		return (ArrayList) sqlSession.selectList(Namespace + ".selectList");
	}

	public int insertUser1(InsertUser iu) {
		return sqlSession.insert(Namespace + ".insertUser1", iu);
	}

	public int insertUser2(InsertUser iu) {
		return sqlSession.insert(Namespace + ".insertUser2", iu);
	}

	public int deleteUser1(int userNum) {
		System.out.println("userNum : " + userNum);
		return sqlSession.insert(Namespace + ".deleteUser1", userNum);
	}

	public int deleteUser2(int userNum) {
		return sqlSession.insert(Namespace + ".deleteUser2", userNum);
	}
}
