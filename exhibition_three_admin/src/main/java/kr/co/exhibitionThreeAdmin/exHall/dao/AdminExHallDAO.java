package kr.co.exhibitionThreeAdmin.exHall.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.exhibitionThreeAdmin.exHall.domain.AdminExHallDomain;
import kr.co.exhibitionThreeAdmin.exHall.vo.AdminExHallVO;
import kr.co.exhibitionThreeAdmin.exhibition.vo.ExhibitionVO;
import kr.co.exhibitionThreeAdmin.mybatis.MyBatisFramework;
import kr.co.exhibitionThreeAdmin.search.vo.SearchVO;

@Component
public class AdminExHallDAO {
	
	//전체 글 수
	public int getTotalRows(ExhibitionVO eVO) {
		int cntRows =0;
		
		return cntRows;
	}
	
	//전시장 조회
	public List<AdminExHallDomain> selectExHall(SearchVO sVO) throws PersistenceException{
		List<AdminExHallDomain> list = null;
			
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("kr.co.exhbitionThreeAdmin.exHall.selectExHall", sVO); 	
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	//전시장 수정
	public int updateExHall(AdminExHallVO eVO) {
		int cnt =0;
		
		return cnt;
	}
	
	//전시장 삭제
	public int deleteExHall(int exHallNum) {
		int cnt =0;
		
		return cnt;
	}
	
	//전시장 추가
	public int insertExHall(AdminExHallVO eVO) {
		int cnt =0;
		
		return cnt;
	}
	
	//전시장 상세
	public AdminExHallVO selectExHallDetail(int exHallNum) {
		AdminExHallVO eVO = null;
		
		return eVO;
	}
	
}