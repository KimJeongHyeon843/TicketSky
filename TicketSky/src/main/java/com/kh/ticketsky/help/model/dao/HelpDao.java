package com.kh.ticketsky.help.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Notice;

public interface HelpDao{

	List<Consult> selectConsultList(SqlSessionTemplate sqlSession);
	
	int consultInsert(SqlSessionTemplate sqlSession, Consult consult);

	int noticeEnroll(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Map<String, Object>> selectNoticeList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage,
			int numPerPage);

	int selectNoticeCount(SqlSessionTemplate sqlSession);

	Map<String, Object> selectNoticeOne(SqlSessionTemplate sqlSession, int noticeNo);

	Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo);

	int modifyEnd(SqlSessionTemplate sqlSession, Notice notice);

	int noticeDelete(SqlSessionTemplate sqlSession, int noticeNo);

	Map<String, Object> faqSelectOne(SqlSessionTemplate sqlSession, int faqno);
	
}
