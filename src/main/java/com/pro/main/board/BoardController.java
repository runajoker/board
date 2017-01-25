package com.pro.main.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.main.vo.ArticleVO;
import com.pro.main.vo.CommentVO;
import com.pro.main.vo.MemberVO;
import com.pro.main.vo.PagingVO;
import com.pro.main.vo.PhotoVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	@Autowired
	private PagingVO pagingVO;

	@RequestMapping(value = "/board/{board_no}/{pg}/")
	public ModelAndView boardGo(@PathVariable int pg, @PathVariable int board_no) throws Exception {
		Map<String, Integer> args = new HashMap<String, Integer>();
		args.put("board_no", board_no);
		int pageLimit = (pg - 1) * 15;
		args.put("pg", pageLimit);
		String paging = pagingVO.getPagingNumbers(pg, board_no);

		List<ArticleVO> list = boardService.getBoardList(args);

		ModelAndView mav = new ModelAndView("/board/board", "list", list);
		mav.addObject("pg", pg);
		mav.addObject("paging", paging);
		return mav;
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/")
	public ModelAndView detailArticleShow(@PathVariable int board_no, @PathVariable int article_no,
			@PathVariable int pg) {
		boardService.increaseViewCount(article_no);

		logger.info(article_no + "" + board_no);
		Map<String, Integer> args = new HashMap<String, Integer>();
		args.put("board_no", board_no);
		args.put("article_no", article_no);
		ArticleVO articleVO = boardService.getDetailArticle(args);
		logger.info(articleVO.toString());
		ModelAndView mav = new ModelAndView("/board/detailArticle", "articleVO", articleVO);
		mav.addObject("pg", pg);
		return mav;
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/delete/")
	public ModelAndView deleteArticle(@PathVariable int article_no) {
		try {
			boardService.deleteArticle(article_no);

		} catch (NullPointerException e) {
			e.printStackTrace();
			// 세션이 같은게 아니면 삭제 안되게
		}

		ModelAndView mav = new ModelAndView("result");
		mav.addObject("msg", "삭제 성공");
		mav.addObject("url", "../../");

		return mav;

	}

	@RequestMapping(value = "/board/{board_no}/{pg}/create/", method = RequestMethod.GET)
	public String moveWriteForm(HttpSession session) {

		return "/board/insert";
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/create/", method = RequestMethod.POST)
	public ModelAndView createArticle(@PathVariable int board_no, HttpSession session, HttpServletRequest request) {
		ArticleVO articleVO = new ArticleVO();
		ModelAndView mav = new ModelAndView("result");

		logger.info(session.getAttribute("userNumber").toString());
		if (!session.getAttribute("userNumber").toString().equals("0")) {
			// filter 사용하기위해 일단 적어둠
			MemberVO memberVO = (MemberVO) session.getAttribute("uinfo");

			articleVO.setArticle_title(request.getParameter("subject"));
			articleVO.setArticle_content(request.getParameter("content"));
			articleVO.setArticle_user_id(memberVO.getMember_id());
			articleVO.setArticle_user_password(memberVO.getMember_pw());
			articleVO.setBoard_no(board_no);
			try {
				boardService.createArticle(articleVO);
				logger.info(board_no + "");
				mav.addObject("msg", "입력성공");
				mav.addObject("url", "../");
				return mav;
			} catch (Exception e) {
				mav.addObject("msg", "실패");
				mav.addObject("url", "./");
				return mav;
			}
		} else {
			logger.info(request.getParameter("subject"));
			logger.info(request.getParameter("username"));
			logger.info(request.getParameter("userpw"));
			logger.info(request.getParameter("content"));
			articleVO.setArticle_title(request.getParameter("subject"));
			articleVO.setArticle_user_id(request.getParameter("username"));
			articleVO.setArticle_user_password(request.getParameter("userpw"));
			articleVO.setArticle_content(request.getParameter("content"));
			articleVO.setBoard_no(board_no);

			try {
				boardService.createArticle(articleVO);
				logger.info(board_no + "");

				mav.addObject("msg", "입력성공");
				mav.addObject("url", "../");
				return mav;

			} catch (Exception e) {

				mav.addObject("msg", "실패");
				mav.addObject("url", "./");
				return mav;
			}
		}
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/modify/", method = RequestMethod.GET)
	public ModelAndView moveModifyArticleForm(@PathVariable int article_no, HttpSession session) {
		ArticleVO articleVO = new ArticleVO();
		if ((!session.getAttribute("userNumber").toString().equals("0"))) {
			// 회원 인 경우

			articleVO = boardService.modifyStepOneArticleRead(article_no);
			logger.info("moveModifyArticleForm: " + articleVO.toString());
		} else {
			logger.info("b회원");
		}

		ModelAndView mav = new ModelAndView("/board/modify", "articleVO", articleVO);
		return mav;

	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/modify/", method = RequestMethod.POST)
	public ModelAndView modifyArticle(@PathVariable int article_no, HttpSession session, HttpServletRequest request) {
		ArticleVO articleVO = new ArticleVO();
		ModelAndView mav = new ModelAndView("result");

		logger.info(session.getAttribute("userNumber").toString());
		if (!session.getAttribute("userNumber").toString().equals("0")) {
			MemberVO memberVO = (MemberVO) session.getAttribute("uinfo");

			articleVO.setArticle_title(request.getParameter("subject"));
			articleVO.setArticle_content(request.getParameter("content"));
			articleVO.setArticle_no(article_no);
			try {
				boardService.modifyStepTwoArticleModify(articleVO);

				mav.addObject("msg", "수정성공");
				mav.addObject("url", "../");
				return mav;
			} catch (Exception e) {
				mav.addObject("msg", "실패");
				mav.addObject("url", "./");
				return mav;
			}
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoVO vo) {
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null
					&& !vo.getFiledata().getOriginalFilename().equals("")) {
				// 파일이 존재하면
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String path = defaultPath + "main/resources" + File.separator + "upload" + File.separator;
				File file = new File(path);
				System.out.println("path:" + path);
				// 디렉토리 존재하지 않을경우 디렉토리 생성
				if (!file.exists()) {
					file.mkdirs();
				}
				// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
				String realname = UUID.randomUUID().toString() + "." + ext;
				///////////////// 서버에 파일쓰기 /////////////////
				vo.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/main/resources/upload/"
						+ realname;
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	@RequestMapping(value = "/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			// String dftFilePath =
			// request.getSession().getServletContext().getRealPath("/");
			String dftFilePath = "C:/project/board/src/main/webapp";
			// 파일 기본경로 _ 상세경로
			// String filePath = dftFilePath + "/main/resources" +
			// File.separator + "upload" + File.separator;
			String filePath = dftFilePath + "/resources/upload/";
			logger.info("multif default" + "");
			logger.info("multif detail" + filePath);
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/main/resources/upload/" + realFileNm;
			logger.info("fileInfo" + sFileInfo);
			PrintWriter print = response.getWriter();
			logger.info(print.toString());

			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/comment/list", method = RequestMethod.POST, headers = "Accept=application/json;charset=UTF-8", produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<CommentVO> getCommentList(@PathVariable int article_no, HttpServletRequest request) {
		logger.info("comment list 수행중 article_no : " + article_no);

		List<CommentVO> com_list = new ArrayList<CommentVO>();
		try {
			com_list = boardService.getCommentList(article_no);
			logger.info("com_list : " + com_list.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return com_list;
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/comment/insert", method = RequestMethod.POST)
	@ResponseBody
	public void insertComment(@PathVariable int article_no, HttpSession session, HttpServletRequest request) {
		CommentVO commentVO = new CommentVO();
		commentVO.setArticle_no(article_no);
		commentVO.setComment_content(request.getParameter("comment_content"));
		commentVO.setComment_user_pw(request.getParameter("comment_password"));
		commentVO.setComment_user_id(request.getParameter("comment_user_id"));
		logger.info("com_con : " + request.getParameter("comment_content") + "com_id : "
				+ request.getParameter("comment_user_id") + "com_pw : " + request.getParameter("comment_password"));
		if (request.getParameter("user_no").equals("0")) {
			logger.info("00000000");
		} else {
			logger.info("else");
		}

		logger.info("comment insert 수행중");
		logger.info("commentVO : " + commentVO.toString());

		try {
			boardService.insertComment(commentVO);
			/* boardService.increaseCommentCount(article_no); */
		} catch (Exception e) {
			logger.info("에러 : " + e.toString());
		}

	}

}
