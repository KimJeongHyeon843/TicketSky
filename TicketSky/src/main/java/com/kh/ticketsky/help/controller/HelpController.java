package com.kh.ticketsky.help.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.help.model.service.HelpService;
import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Faq;
import com.kh.ticketsky.help.model.vo.Notice;

import net.sf.json.JSONArray;

@Controller
public class HelpController {
	
	Logger logger = LoggerFactory.getLogger(HelpController.class);

	@Autowired
	HelpService service;

	// 상담 화면 이동(내역)
	@RequestMapping("/help/consult.do")
	public String selectList(Model model)
	{
		List<Consult> list=service.selectConsultList();
		model.addAttribute("list",list);
		logger.debug("list:"+list);
		return "help/consult";
	}
	
	@RequestMapping("/help/helpHome.do")
	public String helpHome() {
		return "help/helpHome";
	}

	@RequestMapping("/help/consultInsert.do")
	public String consultInsert(Model model,Consult consult) {
/*		int result =service.consultInsert(consult);
		String msg="";
		if(result>0)
		{
			msg="demo가 등록 되었습니다.";
		}
		else
		{
			msg="등록 실패!";
		}
		String loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg"; */
		return "help/consultInsert";
	}
	
	@RequestMapping("/help/faqHome.do")
	public String faqSelectOne(int faqno)
	{
		Map<String,Object> map=service.faqSelectOne(faqno);
		map.put("faqno", faqno);
		return "help/faq";
	}
	
	@RequestMapping("/help/ticketHelp.do")
	public String ticketHelp() {
		return "help/ticketHelp";
	}
	
	@RequestMapping("/help/ticketCancel.do")
	public String ticketCancel() {
		return "help/ticketCancel";
	}
	
	@RequestMapping("/help/ticketRefund.do")
	public String ticketRefund() {
		return "help/ticketRefund";
	}
	
	@RequestMapping("/help/noticeHome.do")
	public ModelAndView noticeHome() {
		ModelAndView mv=new ModelAndView();
		int total = service.selectNoticeCount();
		
		mv.addObject("totalContents",total);
		mv.setViewName("help/notice");
		return mv;
/*		return "help/notice";*/
	}
	
	@RequestMapping("/help/noticeView.do")
	public void noticeView(int cateNo,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage,HttpServletResponse response) throws Exception {
//		ModelAndView mv = new ModelAndView();
		String cno="";
		if(cateNo!=0) cno="cate";
		
		Map<String, Object> map=new HashMap();
		map.put("cateNo", cateNo);
		map.put("cno", cno);
		int total = service.selectNoticeCount();
		int numPerPage=10; // 출력개수
		List<Map<String,Object>> list=service.selectNoticeList(map,cPage,numPerPage);
		String pagebar=Page.getPageNotice(cPage, numPerPage,total);
		
		JSONArray jsonArr= new JSONArray();
		jsonArr.add(list);
		jsonArr.add(pagebar);
		
		response.setContentType("apllication/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
/*		mv.addObject("totalContents",total);
		mv.setViewName("help/notice");
		return mv;*/
	}
	
	//공지사항 글쓰기
	@RequestMapping("/help/noticeAdmin.do")
	public String noticeAdmin() {
		return "help/noticeAdmin";
	}
	
	@RequestMapping("/help/noticeForm.do")
	public String noticeForm(Model model,String no) {
		// 조회수 증가
		// updateCount
		int noticeNo = Integer.parseInt(no);
		Map<String,Object> map=service.selectNoticeOne(noticeNo);
		model.addAttribute("notice",map);
		return "help/noticeForm";
	}

	/*공지사항 등록*/
	@RequestMapping("/help/noticeEnroll.do")
	//String date??
	public ModelAndView noticeEnroll(int cateNo,String title, String content,String date) {
		ModelAndView mv=new ModelAndView();
		Map<String, Object> map=new HashMap();
		map.put("cateNo", cateNo);
		map.put("title", title);
		map.put("content", content);
		map.put("opendate", date);
		service.noticeEnroll(map);
		int total = service.selectNoticeCount();
		mv.addObject("totalContents",total);
		mv.setViewName("help/notice");
		System.out.println(total);
		return mv;
/*		return "help/notice";*/
	}
	
	//공지사항 수정
	@RequestMapping("/help/noticeModify.do")
	public String noticeModify(@RequestParam(value="noticeNo") int noticeNo,Model model)
	{
		Notice notice = service.selectNotice(noticeNo);
		model.addAttribute("notice",notice);
		
		model.addAttribute("noticeNo",noticeNo);
		return "help/noticeModify";
	}
	
	@RequestMapping("/help/modifyEnd.do")
	public String modifyEnd(Notice notice,Model model)
	{
		int result=service.modifyEnd(notice);
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="업데이트 되었습니다.";
			
		}
		else
		{
			msg="업데이트 되지 않았습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	
	/*@RequestMapping("/help/consultInsertFrm.do")
	public String consultInsert(Consult consult,Model model)
	{
		int result = service.consultInsert(consult);
		System.out.println(result);
		
		String msg="";
		if(result>0)
		{
			msg="1:1문의가 등록되었습니다.";
		}
		else
		{
			msg="등록 실패";
		}
		String loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}*/
	@RequestMapping("/help/noticeDelete.do")
	public String noticeDelete(@RequestParam(value="noticeNo") int noticeNo, Model model)
	{
		int result = service.noticeDelete(noticeNo);
		
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="삭제 되었습니다.";
			
		}
		else
		{
			msg="삭제 되지 않았습니다.";
		}
		//redirect 할때는 아래와 같이 쓰면 된다.
		/*외부에서 다른 view에 접근을 하지 못하기 때문에 바로
		뷰를 선언하면 에러가 발생함*/
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg"; //index파일로 넘어가게 되어있음.
	}
}
