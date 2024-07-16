package www.silver.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import www.silver.dao.IF_MemberDAO;
import www.silver.vo.MemberVO;
@Service
public class LoginServiceImpl implements IF_LoginService{
	@Inject
	IF_MemberDAO memberdao;
	@Override
	public MemberVO login(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberdao.selectOne(id);
	}

}
