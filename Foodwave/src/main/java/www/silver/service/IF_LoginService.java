package www.silver.service;

import www.silver.vo.MemberVO;

public interface IF_LoginService {
	public MemberVO login(String id) throws Exception;
	
}
