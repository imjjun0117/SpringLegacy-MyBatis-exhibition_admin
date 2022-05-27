package kr.co.exhibitionThreeAdmin.member.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.exhibitionThreeAdmin.member.domain.MemberDomain;
import kr.co.exhibitionThreeAdmin.mybatis.MyBatisFramework;
import kr.co.exhibitionThreeAdmin.search.vo.SearchVO;

@Component
public class AdminMemberDAO {
	
	public int selectTotalCount()throws PersistenceException{
		int totalCnt = 0;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		totalCnt = ss.selectOne("kr.co.exhibitionThreeAdmin.member.totalCnt");
		return totalCnt;
	}//selectTotalCount
	
	public List<MemberDomain> selectMember(SearchVO sVO) throws PersistenceException {
		List<MemberDomain> list = null;
		//핸들러 얻기
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		//쿼리문 수행
		list = ss.selectList("kr.co.exhibitionThreeAdmin.member.selectMember",sVO);
		
		return list;
	}//selectMember
}//class