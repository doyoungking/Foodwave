package www.silver.hom;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import www.silver.service.IF_TravelFoodService;
import www.silver.util.FileDataUtil;
import www.silver.vo.PageVO;
import www.silver.vo.TravelFoodVO;
import www.silver.vo.tf_commentVO;

@Controller

public class TravelFoodController {
	@Inject
	IF_TravelFoodService tservice;
	@Inject
	FileDataUtil filedatautil;// util 객체가 컨테이너 에 등록되어야하는데 Controller 역할 하니까 스캔방법으로 servlet에 추가 

	@GetMapping(value = "/")
	public String home(Model model,@ModelAttribute PageVO pagevo) throws Exception {
		List<TravelFoodVO> all = tservice.selectAll(pagevo);
		model.addAttribute("allListTF", all);
		return "home";
	}

	@GetMapping(value = "input")
	public String input() {
		return "inputForm";
	}

	@RequestMapping(value = "/inputSave", method = RequestMethod.POST)
	public String inputSave(@ModelAttribute TravelFoodVO tvo,MultipartFile[] file) throws Exception {
		// @RequestParam 은 파라미터 1개씩받아서 3개 사용해야됨
		// 클라이언트가 전송한 파라미터 확인가능 @modlAttribute 통해서 자동 매핑
		// (vo 변수 이름이 파라미터와 동일하면 spring 자동으로매핑해줌 )
//		System.out.println(file.length);
//		for(int i=0; i<file.length;i++) {
//			System.out.println(file[i].getOriginalFilename());
//		}
		String[]filename=filedatautil.fileUpload(file);

		
		for(int i=0;i<filename.length;i++) {
			System.out.println(filename[i]);
			
		}

		tvo.setFilename(filename);
		tservice.insert(tvo);
		
	

		return "redirect:tList";
	}

	@RequestMapping(value = "/tList", method = RequestMethod.GET)
	public String tList(Model model,@ModelAttribute PageVO pagevo) throws Exception {
		if(pagevo.getPage()==null) {
			pagevo.setPage(1);
		}
		System.out.println("현재 페이지번호:"+pagevo.getPage());
//		pagevo.setTotalCount(61);// Test 하기위ㅣ해서 강제로 전체 튜플의수 입력함
		pagevo.setTotalCount(tservice.getTotalcnt());
		
		pagevo.prt();
		List<TravelFoodVO> allList = tservice.selectAll(pagevo);
		model.addAttribute("allListTF", allList);
		model.addAttribute("pagevo", pagevo);
		System.out.println(tservice.getTotalcnt());
		return "tfList";
	}

//	@RequestMapping(value = "/search", method = RequestMethod.GET)
//	public String search(@RequestParam ("restaurant") String ser, Model model) throws Exception {
////		if(pagevo.getPage()==null) {
////			pagevo.setPage(1);
////		}
////		pagevo.setTotalCount(tservice.getTotalcnt2());
////		System.out.println(tservice.getTotalcnt2());
//		List<TravelFoodVO> allsearch = tservice.search(ser);
//		model.addAttribute("searchTF", allsearch);
////		model.addAttribute("pagevo", pagevo);
////		model.addAttribute("allListTF", allsearch);
//		return "searchresult";
////		return "tfList";
//	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@ModelAttribute PageVO pagevo, Model model) throws Exception {
		System.out.println(pagevo.getSearchKeyword());
		if(pagevo.getPage()==null) {
			pagevo.setPage(1);
		}
		System.out.println(pagevo.getPerPageNum());
		pagevo.setTotalCount(tservice.getTotalcnt2(pagevo));
//		System.out.println(tservice.getTotalcnt2());
		List<TravelFoodVO> allsearch = tservice.search(pagevo);
		model.addAttribute("searchTF", allsearch);
		model.addAttribute("pagevo", pagevo);
		
//		model.addAttribute("allListTF", allsearch);
		return "searchresult";
//		return "tfList";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String del(@ModelAttribute TravelFoodVO tvo) throws Exception {
		tservice.delete(tvo);
		return "redirect:tList";
	}

	@GetMapping(value = "/update")
	public String selectupdate(@RequestParam("no") int no, Model model) throws Exception {
		TravelFoodVO tvo = tservice.selectupdate(no);
		model.addAttribute("modvo", tvo);

		return "updateForm";
	}

	@PostMapping(value = "/updateSave")
	public String update(@ModelAttribute TravelFoodVO tvo) throws Exception {
		tservice.update(tvo);
		return "redirect:tList";
	}


	@GetMapping(value = "/tfDetail")
	public String tfDetail(@RequestParam("no") int no, Model model) throws Exception {
		TravelFoodVO tfv = tservice.selectupdate(no);
		List<tf_commentVO> all = tservice.selectcom(no);
		model.addAttribute("selcom", all);
		model.addAttribute("comvo", tfv);
		List<String> attachList = tservice.getFilenames(String.valueOf(no));
		System.out.println(attachList);
		model.addAttribute("attach",attachList);
		
		return "tfDetailForm";
	}

	@PostMapping(value = "/commentSave")
	public String save(@ModelAttribute tf_commentVO tfvo, Model model) throws Exception {
		tservice.insertcom(tfvo);
		model.addAttribute("no", tfvo.getC_no());
		return "redirect:tfDetail";
	}

	@RequestMapping(value = "/likeup", method = RequestMethod.GET)
	public String likeup(@ModelAttribute TravelFoodVO tvo) throws Exception {
		tservice.like(tvo);
		return "redirect:tList";
	}


}
