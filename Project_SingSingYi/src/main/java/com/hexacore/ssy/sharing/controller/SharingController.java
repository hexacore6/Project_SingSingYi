package com.hexacore.ssy.sharing.controller;


import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilePermission;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.AccessControlContext;
import java.security.AccessController;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.eclipse.core.filesystem.provider.FileInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.PageMaker;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.sharing.domain.RecordRepository;
import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.Encoding;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.sharing.service.SharingService;
import com.hexacore.ssy.sharing.util.MediaUtils;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/sharing")
public class SharingController {

	private static final Logger logger = LoggerFactory.getLogger(SharingController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name= "recordPath")
	private String recordPath;
	
	@Inject
	private SharingService sharingService;
	
	//공유글 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpSession httpSession, Sharing sharing, MultipartFile file, Model model) throws IOException {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		String value = null;
		
		try {
			//이미지 파일을 첨부한 경우
			if(!file.getOriginalFilename().equals("")){
				String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				if (mType != null) {
					String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), sharingService.getShid(), loginId);
					sharing.setEximgfilename(savedName);
					sharingService.regist(sharing);
					uploadFile(file.getOriginalFilename(), file.getBytes(), sharingService.getShid(), loginId);
					System.out.println("성공");
				}
				else{
					sharing.setEximgfilename("NoImageType");
					sharingService.regist(sharing);
				}
				
			} 
			//이미지파일을 첨부하지 않는경우
			else{
				System.out.println(sharing.getRecordfilename() instanceof String);
				sharingService.regist(sharing);
				
			}
			
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/sharing/list";
	}
	
	private String uploadFile(String originalName, byte[] fileData, int shid, String loginId) throws IOException{
		String savedName = loginId + "_" + shid + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	//공유글 댓글 추가 처리
	@Transactional
	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public ResponseEntity<Comment> addComment(@RequestBody Comment comment) throws IOException {
		ResponseEntity<Comment> entity = null;
		try {
			sharingService.registComment(comment);
			sharingService.updateCommentCnt(comment.getShid());
			entity = new ResponseEntity<Comment>(sharingService.getComment(comment), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//공유글 리스트 출력 처리
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, HttpSession httpSession, Model model) {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		List<Sharing> list = sharingService.listAll(loginId);
		String name = null;
		String[] array = null;
		for (int i = 0; i < list.size(); i++) {
			name = list.get(i).getRecordfilename();
			System.out.println(name + "녹음파일보여주세요");
			System.out.println(name instanceof String);
			if(!name.equals("")){
				array = name.split("_");
				list.get(i).setRecordfilename(array[2]);
			}
		}
		model.addAttribute("list", list);
	}
	
	//좋아요 업데이트 처리
	@Transactional
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public ResponseEntity<Sharing> updateLike(@RequestBody Sharing sharing) {
		ResponseEntity<Sharing> entity = null;
		LikeHistory likeHistory = new LikeHistory();
		
		likeHistory.setId(sharing.getId());
		likeHistory.setShid(sharing.getShid());
		//System.out.println(likeHistory.getId() + "좋아요기록테이블 아이디");
		//System.out.println(likeHistory.getShid() + "좋아요기록테이블 공유글번호");
		if(sharingService.checkLike(likeHistory) == null){
			//DB상에 좋아요 기록이 없을 경우
			try {
				
				sharingService.updateLikeCnt(sharing.getShid());
				sharingService.likeHistory(likeHistory);
				sharing.setLikecnt(sharingService.getLikeCnt(sharing.getShid()));
				entity = new ResponseEntity<Sharing>(sharing, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace(); 	
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		} else{
			//DB상에 좋아요 기록이 있을 경우
			sharingService.deleteLikeHistory(likeHistory);
			sharingService.fallLikeCnt(sharing.getShid());
			sharing.setLikecnt(sharingService.getLikeCnt(sharing.getShid()));
			entity = new ResponseEntity<Sharing>(sharing, HttpStatus.OK);;
		}
		return entity;
	}
	
	//공유글 댓글 리스트 출력 처리
	@RequestMapping(value = "/comment/list", method = RequestMethod.POST)
	public ResponseEntity<List<Comment>> listComment(@RequestBody Sharing sharing, Model model) {
		ResponseEntity<List<Comment>> entity = null;
		try {
			List<Comment> list = sharingService.listComment(sharing.getShid());
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getCregdate() + "댓글날짜");
			}
			model.addAttribute("listComment", sharingService.listComment(sharing.getShid()));
			entity = new ResponseEntity<List<Comment>>(sharingService.listComment(sharing.getShid()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//공유글 상세조회 처리
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public ResponseEntity<Sharing> read(@RequestBody Sharing sharing, Model model) {
		ResponseEntity<Sharing> entity = null;
		try {
			model.addAttribute("read", sharingService.read(sharing.getShid()));
			model.addAttribute("listComment", sharingService.listComment(sharing.getShid()));
			entity = new ResponseEntity<Sharing>(sharingService.read(sharing.getShid()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//공유글 수정하기 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Sharing sharing, Model model) throws IOException {
		
		
		try {
			System.out.println("수정하기");
			sharingService.modify(sharing);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/sharing/list";

	}
	
	//공유글 삭제하기 처리
	@Transactional
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Sharing sharing, Model model) {
		try {
			sharingService.removeAllLikeHistory(sharing.getShid());
			sharingService.removeComment(sharing.getShid());
			sharingService.removeSharing(sharing.getShid());
		} catch (Exception e) {
			System.out.println("삭제 실패");
			e.printStackTrace();
		}
		return "redirect:/sharing/list";
	}
	
	//내 글 수정하기 처리
	@RequestMapping(value = "/myUpdate", method = RequestMethod.POST)
	public String myUpdate(Sharing sharing, MultipartFile file, Model model, HttpSession httpSession) throws IOException {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		
		try {
			sharingService.modify(sharing);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing/"+loginId;

	}
	
	//내 글 삭제하기 처리
	@Transactional
	@RequestMapping(value = "/myDelete", method = RequestMethod.POST)
	public String myDelete(Sharing sharing, Model model, HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		
		try {
			sharingService.removeComment(sharing.getShid());
			sharingService.removeSharing(sharing.getShid());
		} catch (Exception e) {
			System.out.println("삭제 실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing/"+loginId;
	}
	
	// 검색 결과 처리
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(@RequestParam("keyword") String keyword, @RequestParam("type") String type, Model model)
			throws IOException {
		List<Sharing> list = null;
		String name = null;
		String[] array = null;
		switch (type) {
		case "user":
			list = sharingService.searchById(keyword);
			for (int i = 0; i < list.size(); i++) {
				name = list.get(i).getRecordfilename();
				if(!name.equals("")){
					array = name.split("_");
					list.get(i).setRecordfilename(array[2]);
				}
			}
			model.addAttribute("list", list);
			break;
		case "title":
			list = sharingService.searchByTitle(keyword);
			System.out.println(keyword + "입력한 노래 제목");
			for (int i = 0; i < list.size(); i++) {
				name = list.get(i).getRecordfilename();
				if(!name.equals("")){
					array = name.split("_");
					list.get(i).setRecordfilename(array[2]);
				}
			}
			model.addAttribute("list", list);
			break;
		case "content":
			list = sharingService.searchByContent(keyword);
			for (int i = 0; i < list.size(); i++) {
				name = list.get(i).getRecordfilename();
				if(!name.equals("")){
					array = name.split("_");
					list.get(i).setRecordfilename(array[2]);
				}
			}
			model.addAttribute("list", list);
			break;
		}
		
	}
	
	// 검색 입력 처리
	@RequestMapping(value = "/searchInput", method = RequestMethod.POST)
	public String search(HttpServletRequest request, HttpSession httpSession, Model model,
			@RequestParam String searchType, @RequestParam String keywordInput)
			throws IOException {
		Encoding enc = new Encoding();
		String type = searchType;
		String keyword = keywordInput;
		System.out.println(keyword + "인코딩전쿼리");
		System.out.println(Encoding.encodingKeyword(keyword) + "인코딩후쿼리");
		return "redirect:/sharing/search?type=" + type + "&keyword=" + Encoding.encodingKeyword(keyword);

	}
	
	

	/*@ResponseBody
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadImage(MultipartFile file) throws Exception {

		logger.info("image name : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("type : " + file.getContentType());

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

	}
	*/
	
	//페이지에 이미지 출력하기 처리
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String originName[] = fileName.split("_");
		System.out.println(originName.length + "파일길이");
		if(originName.length == 3){
			logger.info("File NAME : " + fileName);

			try {
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				MediaType mType = MediaUtils.getMediaType(formatName);

				HttpHeaders headers = new HttpHeaders();
				in = new FileInputStream(uploadPath + fileName);
				logger.info(uploadPath + fileName);
				if (mType != null) {
					headers.setContentType(mType);
				} else {
					fileName = fileName.substring(fileName.indexOf("_") + 1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition",
							"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				in.close();
			}
		}
		else{
			//이미지파일이 아닌 경우
			
			MediaType mType = MediaType.IMAGE_PNG;
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + "/haedlogo.png");
			logger.info(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} 
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}
		
		return entity;
	}
	
	// 나의 녹음저장소 조회
	@RequestMapping(value = "/record", method = RequestMethod.POST)
	public ResponseEntity<List<RecordRepository>> getRecord(@RequestBody RecordRepository recordRepository, Model model) {
		ResponseEntity<List<RecordRepository>> entity = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//String date = null;
				
		try {
			System.out.println(recordRepository.getId() + "아이디출력");
			List<RecordRepository> list = sharingService.getRecord(recordRepository.getId());
			for (int i = 0; i < list.size(); i++) {
				//date = format.format(list.get(i).getRecordregdate());
				//System.out.println(date + "스트링으로 변환");
				//list.get(i).setRecordregdate(format(recordRepository.getRecordregdate()));
				System.out.println(list.get(i).getRecordregdate() + "출력");
			}
			entity = new ResponseEntity<List<RecordRepository>>(sharingService.getRecord(recordRepository.getId()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// mp3 파일 불러오기
		@RequestMapping(value="/displayRecord")
		public void displayRecord(String fileName, HttpServletResponse response) throws Exception {
			
			response.setContentType("audio/mpeg");
			InputStream in = null;
			OutputStream out = null;

			try {
				in = new FileInputStream(recordPath + fileName);
				logger.info(recordPath + fileName);
				 out = response.getOutputStream();
				 
				 byte[] buffer = new byte[1024];
			     int count = 0;
			     while( (count = in.read(buffer)) != -1){
			    	 out.write(buffer, 0, count);
			     }
				 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				 if(out != null) out.close();
		         if(in != null) in.close();
			}
		}
	
	
}
