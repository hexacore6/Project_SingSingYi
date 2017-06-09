package com.hexacore.ssy.sharing.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FilePermission;
import java.io.IOException;
import java.io.InputStream;
import java.security.AccessControlContext;
import java.security.AccessController;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.sharing.domain.Comment;
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
	
	@Inject
	private SharingService sharingService;
	
	//공유글 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpSession httpSession, Sharing sharing, MultipartFile file, Model model) throws IOException {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		System.out.println(loginId + "로그인 아이디 알려주세요");
		sharing.setEximgfilename(file.getOriginalFilename());
		try {
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), sharingService.getShid(), loginId);
			sharing.setEximgfilename(savedName);
			sharingService.regist(sharing);
			uploadFile(file.getOriginalFilename(), file.getBytes(), sharingService.getShid(), loginId);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/sharing/list";
	}
	
	private String uploadFile(String originalName, byte[] fileData, int shid, String loginId) throws IOException{
		String savedName = loginId + "@" + shid + "@" + originalName;
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
	public void list(HttpServletRequest request, Model model, HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("login");
		String loginId = member.getId();
		model.addAttribute("list", sharingService.listAll(loginId));
	}
	
	//좋아요 업데이트 처리
	@Transactional
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public ResponseEntity<Boolean> updateLike(Model model, @RequestBody Sharing sharing) {
		ResponseEntity<Boolean> entity = null;
		LikeHistory likeHistory = new LikeHistory();
		likeHistory = null;
		if(sharingService.checkLike(sharing.getShid()) == null){
			//DB상에 좋아요 기록이 없을 경우
			try {
				sharingService.updateLikeCnt(sharing.getShid());
				sharingService.likeHistory(sharing);
				entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		} else{
			//DB상에 좋아요 기록이 있을 경우
			sharingService.deleteLikeHistory(sharing.getShid());
			sharingService.fallLikeCnt(sharing.getShid());
			entity = new ResponseEntity<Boolean>(false, HttpStatus.OK);;
		}
		return entity;
	}
	
	//공유글 댓글 리스트 출력 처리
	@RequestMapping(value = "/comment/list", method = RequestMethod.POST)
	public ResponseEntity<List<Comment>> listComment(@RequestBody Sharing sharing, Model model) {
		ResponseEntity<List<Comment>> entity = null;
		try {
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
	public String update(Sharing sharing, MultipartFile file, Model model) throws IOException {
		
		
		try {
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
	@RequestMapping(value = "/myDelete", method = RequestMethod.POST)
	public String delete(Sharing sharing, Model model) {
		try {
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
	public String myUpdate(Sharing sharing, MultipartFile file, Model model) throws IOException {
		
		
		try {
			sharingService.modify(sharing);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing";

	}
	
	//내 글 삭제하기 처리
	@Transactional
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String myDelete(Sharing sharing, Model model) {
		try {
			sharingService.removeComment(sharing.getShid());
			sharingService.removeSharing(sharing.getShid());
		} catch (Exception e) {
			System.out.println("삭제 실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing";
	}
	
	//검색 입력 처리 
	@RequestMapping(value = "/searchInput", method = RequestMethod.GET)
	public String search(Model model) throws IOException {

		return "redirect:/sharing/search";

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
		File dir = new File(uploadPath);
		File[] fileList = dir.listFiles();
		for (int i = 0; i < fileList.length; i++) {
			File file = fileList[i];
			System.out.println(file.getName() + "파일 이름 보여주세요");
			if(file.getName() == fileName){
				
			}
		}
		
		logger.info("File NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			System.out.println("이미지 파일 들어왔니 : " + in.toString());
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
		return entity;
	}
	
	
}
