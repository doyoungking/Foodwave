package www.silver.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import www.silver.dao.IF_TravelFoodDAO;
import www.silver.vo.PageVO;
import www.silver.vo.TravelFoodVO;
import www.silver.vo.tf_commentVO;

@Service
public class TravelFoodServiceImpl implements IF_TravelFoodService {
	@Inject
	IF_TravelFoodDAO tdao;

	@Override
	public void insert(TravelFoodVO tvo) throws Exception {
		tdao.insertdao(tvo);// travelFood 테이블에 저장할
		//tf_attach 에 저장해야한다 .. 해야할작업 > 테이블,dao,mapper작업 
		String[] filename = tvo.getFilename();
		for(String fname : filename) {
			tdao.saveAttach(fname);
		}

		
	}

	@Override
	public List<TravelFoodVO> selectAll(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return tdao.selectAll(pagevo);
	}

	@Override
	public void delete(TravelFoodVO tvo) throws Exception {
		tdao.deletedao(tvo);
	}

	@Override
	public TravelFoodVO selectupdate(int no) throws Exception {
		// TODO Auto-generated method stub
		return tdao.selectupdate(no);
	}

	@Override
	public void update(TravelFoodVO tvo) throws Exception {
		tdao.updatedao(tvo);

	}

	@Override
	public List<TravelFoodVO> search(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return tdao.search(pagevo);
	}

	@Override
	public void insertcom(tf_commentVO tfvo) throws Exception {
		// TODO Auto-generated method stub
		tdao.insertcom(tfvo);
	}

	@Override
	public List<tf_commentVO> selectcom(int no) throws Exception {
		// TODO Auto-generated method stub
		return tdao.selectcom(no);
	}

	@Override
	public void like(TravelFoodVO tvo) throws Exception {
		// TODO Auto-generated method stub
		tdao.like(tvo);
	}

	@Override
	public int getTotalcnt() throws Exception {
		// TODO Auto-generated method stub
		return tdao.getTotalcnt();
	}

	@Override
	public int getTotalcnt2(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return tdao.getTotalcnt2(pagevo);
	}

	@Override
	public List<String> getFilenames(String no) throws Exception {
		// TODO Auto-generated method stub
		return tdao.getFilenames(no);
	}

	

	

}
