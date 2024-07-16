package www.silver.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import www.silver.vo.MemberVO;

@Repository
public class MemberDAOImpl implements IF_MemberDAO{
	public static String mapperQuery= "www.silver.dao.IF_MemberDAO";
	@Inject
	SqlSession sqlsession;
	@Override
	public MemberVO selectOne(String id) throws Exception {
		// TODO Auto-generated method stub
		//mapping
		return sqlsession.selectOne(mapperQuery+".selectone",id);
	}

}
