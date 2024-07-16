package www.silver.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import www.silver.vo.PageVO;
import www.silver.vo.TravelFoodVO;
import www.silver.vo.tf_commentVO;

@Repository
public class TravelFoodDAOImpl implements IF_TravelFoodDAO {
	private static String mapperQuery = "www.silver.dao.IF_TravelFoodDAO";// namespace 동일함
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertdao(TravelFoodVO tvo) throws Exception {
		sqlSession.insert(mapperQuery + ".insert", tvo);

	}

	@Override
	public List<TravelFoodVO> selectAll(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".select",pagevo);
	}

	@Override
	public void deletedao(TravelFoodVO tvo) throws Exception {
		sqlSession.delete(mapperQuery + ".delete", tvo);

	}

	@Override
	public TravelFoodVO selectupdate(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".selectone", no);
	}

	@Override
	public void updatedao(TravelFoodVO tvo) throws Exception {
		sqlSession.update(mapperQuery + ".update", tvo);

	}

	@Override
	public List<TravelFoodVO> search(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".search",pagevo);
	}

	@Override
	public void insertcom(tf_commentVO tfvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".incom", tfvo);
	}

	@Override
	public List<tf_commentVO> selectcom(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selcom",no);
	}

	@Override
	public void like(TravelFoodVO tvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".likeup",tvo);
	}

	@Override
	public int getTotalcnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".getTotalcnt");
	}
	@Override
	public int getTotalcnt2(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".getTotalcnt2",pagevo);
	}
	@Override
	public void saveAttach(String filename) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".saveFile",filename);
	}

	@Override
	public List<String> getFilenames(String no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".getFiles",no);
	}
//
//	@Override
//	public void saveAttach2(String filename) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.insert(mapperQuery+".saveFile",filename);
//	}

	
	

	

	

}
