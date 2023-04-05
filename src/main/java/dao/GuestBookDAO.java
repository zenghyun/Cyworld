package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GuestBookLikeVO;
import vo.GuestBookVO;

public class GuestBookDAO {
	// SqlSession
	SqlSession sqlSession;
	// SI방식
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 방명록 전체 조회
	public List<GuestBookVO> selectList(int idx){
		List<GuestBookVO> list = sqlSession.selectList("gb.guestbook_list", idx);
		return list;
	}
	
	// 작성된 방명록 갯수 구하기
	public int selectCountNum(int idx) {
		int res = sqlSession.selectOne("gb.countNum", idx);
		return res;
	}
	
	// 새 방명록 추가
	public int insert(GuestBookVO vo) {
		int res = sqlSession.insert("gb.guestbook_insert", vo);
		return res;
	}
	
	// 방명록 삭제
	public int delete(GuestBookVO vo) {
		int res = sqlSession.delete("gb.guestbook_delete", vo);
		return res;
	}
	
	// 방명록 삭제 후 삭제한 방명록 번호보다 큰 번호들을 조회
	public List<GuestBookVO> selectListDelete(HashMap<String, Integer> map) {
		List<GuestBookVO> list = sqlSession.selectList("gb.guestbook_list_delete", map);
		return list;
	}
	
	// 방명록 삭제 후 삭제한 방명록 번호보다 큰 번호들을 1씩 감소시켜서 갱신
	public int updateRefMinus(GuestBookVO vo) {
		int res = sqlSession.update("gb.guestbook_update_ref_minus", vo);
		return res;
	}

	// 수정을 위한 방명록 한 건 조회
	public GuestBookVO selectOne(GuestBookVO vo) {
		GuestBookVO updateVo = sqlSession.selectOne("gb.guestbook_one", vo);
		return updateVo;
	}
	
	// 방명록 수정
	public int update(GuestBookVO vo) {
		int res = sqlSession.update("gb.guestbook_update", vo);
		return res;
	}
	
	/////////////////// 좋아요 구역 /////////////////////
	
	// 좋아요를 이미 눌렀는지 확인하기 위한 조회
	public GuestBookLikeVO selectOneLike(GuestBookLikeVO vo) {
		GuestBookLikeVO likeVo = sqlSession.selectOne("gbl.selectLike", vo);
		return likeVo;
	}
	
	// 방명록 좋아요 추가
	public int insertLike(GuestBookLikeVO vo) {
		int res = sqlSession.insert("gbl.addLike", vo);
		return res;
	}
	
	// 방명록 좋아요 취소
	public int deleteLike(GuestBookLikeVO vo) {
		int res = sqlSession.delete("gbl.cancleLike", vo);
		return res;
	}
	
	// 방명록 좋아요 갯수 구하기 -->
	public int selectLikeCountNum(GuestBookLikeVO vo) {
		int res = sqlSession.selectOne("gbl.likeCountNum", vo);
		return res;
	}
	
	// --> 구해낸 방명록 좋아요 갯수를 보여주기위해 컬럼에 작성하기
	public int updateLikeNum(GuestBookVO vo) {
		int res = sqlSession.update("gbl.likeNum", vo);
		return res;
	}
	
	// 방명록 삭제시 해당 좋아요 내역도 모두 삭제
	public int deleteLikeAll(HashMap<String, Integer> map) {
		int res = sqlSession.delete("gbl.deleteLikeAll", map);
		return res;
	}
}