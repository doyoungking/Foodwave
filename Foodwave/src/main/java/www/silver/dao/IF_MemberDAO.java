package www.silver.dao;

import www.silver.vo.MemberVO;

public interface IF_MemberDAO {
	public MemberVO selectOne(String id) throws Exception;
}
