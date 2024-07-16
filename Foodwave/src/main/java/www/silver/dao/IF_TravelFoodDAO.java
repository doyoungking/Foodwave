package www.silver.dao;

import java.util.List;

import www.silver.vo.PageVO;
import www.silver.vo.TravelFoodVO;
import www.silver.vo.tf_commentVO;

public interface IF_TravelFoodDAO {
	public void insertdao(TravelFoodVO tvo) throws Exception;

	public List<TravelFoodVO> selectAll(PageVO pagevo) throws Exception;

	public void deletedao(TravelFoodVO tvo) throws Exception;

	public TravelFoodVO selectupdate(int no) throws Exception;

	public void updatedao(TravelFoodVO tvo) throws Exception;

	public List<TravelFoodVO> search(PageVO pagevo) throws Exception;

	public void insertcom(tf_commentVO tfvo) throws Exception;

	public List<tf_commentVO> selectcom(int no) throws Exception;
	
	public void like(TravelFoodVO tvo) throws Exception;
	public int getTotalcnt() throws Exception;
	public int getTotalcnt2(PageVO pagevo) throws Exception;
	public void saveAttach(String filename) throws Exception;
//	public void saveAttach2(String filename) throws Exception;
	public List<String> getFilenames(String no) throws Exception;
}
