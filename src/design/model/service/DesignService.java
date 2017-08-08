package design.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import design.model.dao.DesignDAO;
import design.model.vo.Design;
import design.model.vo.DesignPart;
import part.model.vo.Part;

public class DesignService {

	public DesignService() {
	}

	// 부품 가격 출력
	public int designPartPrice(String id) {
		Connection con = getConnection();
		int price = new DesignDAO().designPartPrice(con, id);
		close(con);
		return price;
	}

	public ArrayList<Design> selectList() {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().designList(con);
		close(con);
		return list;
	}

	public HashMap<String, Design> designMap() {
		Connection con = getConnection();
		HashMap<String, Design> list = new DesignDAO().designMap(con);
		close(con);
		return list;
	}

	public Design designSelect(String id) {
		Connection con = getConnection();
		Design design = new DesignDAO().selectOne(con, id);
		close(con);
		return design;
	}

	public ArrayList<Design> selectTitle(String title) {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().selectTitle(con, title);
		close(con);
		return list;
	}

	public int insertDesign(Design d) {
		Connection con = getConnection();
		int result = new DesignDAO().insertDesign(con, d);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateDesign(Design d) {
		Connection con = getConnection();
		int result = new DesignDAO().updateDesign(con, d);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteDesign(String id) {
		Connection con = getConnection();
		int result = new DesignDAO().deleteDesign(con, id);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Design> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new DesignDAO().getListCount(con);
		close(con);
		return listCount;
	}

	public void addReadCount(String dId) {
		Connection con = getConnection();
		int result = new DesignDAO().addReadCount(con, dId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
	}

	public ArrayList<Design> selectTop5() {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().designTop5(con);
		close(con);
		return list;
	}
	
	public ArrayList<Design> selectRecent10() {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().selectRecent10(con);
		close(con);
		return list;
	}

	public int insertDesignPart(ArrayList<DesignPart> deplist) {
		Connection con = getConnection();
		int[] result = new DesignDAO().insertDesignPart(con, deplist);
		int result2 = 0;
		for(int i = 0; i< result.length ; i++){
			if (result[i] != -3) {
			//  executeBatch의 리턴값은 int[]. 각각의 int값은 
            // "0" 이상 -- 정상적인 처리 :  테이블의 변경된 행수를 나타낸다. 
            // "-2" -- 정상적인 처리, 변경된 행수가 불분명하다. 
            // "-3" -- 실행 실패
				
				if(i == result.length -1){
					commit(con);
					result2 = 1;
				} else{
					continue;
				}
			} else {
				rollback(con);
			}
		}
		close(con);
		return result2;
	}

	public ArrayList<Part> selectDesignPartList(String dId) {
		Connection con = getConnection();
		ArrayList<Part> list = new DesignDAO().selectDesignPartList(con, dId);
		close(con);
		return list;
	}

	public int updateDesignPart(String dId, ArrayList<DesignPart> deplist) {
		Connection con = getConnection();
		int[] result = new DesignDAO().updateDesignPart(con, dId, deplist);
		int result2 = 0;
		for(int i = 0; i< result.length ; i++){
			if (result[i] != -3) {
			//  executeBatch의 리턴값은 int[]. 각각의 int값은 
            // "0" 이상 -- 정상적인 처리 :  테이블의 변경된 행수를 나타낸다. 
            // "-2" -- 정상적인 처리, 변경된 행수가 불분명하다. 
            // "-3" -- 실행 실패
				
				if(i == result.length -1){
					commit(con);
					result2 = 1;
				} else{
					continue;
				}
			} else {
				rollback(con);
			}
		}
		close(con);
		return result2;
	}

	public int likechk(String did, String mid) {
		Connection con = getConnection();
		int chk = new DesignDAO().likechk(con, did, mid);
		close(con);

		return chk;
	}

	public int insertLike(String mid, String did) {
		Connection con = getConnection();
		int result = new DesignDAO().insertLike(con, mid, did);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteLike(String mid, String did) {
		Connection con = getConnection();
		int result = new DesignDAO().deleteLike(con, mid, did);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertDesignReview(String dId, String mid, String content) {
		Connection con = getConnection();
		int result = new DesignDAO().insertDesignReview(con, dId, mid, content);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Object updateDesignReview(String reviewCode, String updtContent) {
		Connection con = getConnection();
		int result = new DesignDAO().updateDesignReview(con, reviewCode, updtContent);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Object deleteDesignReview(String reviewCode) {
		Connection con = getConnection();
		int result = new DesignDAO().deleteDesignReview(con, reviewCode);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
