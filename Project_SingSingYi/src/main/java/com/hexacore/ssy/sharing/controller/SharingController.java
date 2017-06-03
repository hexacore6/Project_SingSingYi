package com.hexacore.ssy.sharing.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Sharing sharing, MultipartFile file, Model model) throws IOException {
		System.out.println(file);
		//System.out.println("123123123" + file.getOriginalFilename());
		//sharing.setEximgfilename(file.getOriginalFilename());
		//String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		//sharing.setEximgfilename(savedName);
		
		try {
			System.out.println("파라메터: " + sharing);
			sharingService.regist(sharing);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/sharing/list";

	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		logger.info("show all list...");
		model.addAttribute("list", sharingService.listAll());

	}

	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public ResponseEntity<Sharing> read(@RequestBody Sharing sharing, Model model) {
		
		ResponseEntity<Sharing> entity = null;
		//String id = sharingService.read(sharing.getShid()).getId();
		try {
			model.addAttribute("read", sharingService.read(sharing.getShid()));
			System.out.println(sharingService.read(sharing.getShid()) + "결과");
			entity = new ResponseEntity<Sharing>(sharingService.read(sharing.getShid()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			//entity = new ResponseEntity<Sharing>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;

	}
	
	private String uploadFile(String originalName, byte[] fileData) throws IOException{
		UUID uid = UUID.randomUUID();
		String loginId = "kosta111";
		
		String savedName = loginId + "@" + originalName;
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
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
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("File NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

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
	
	/*
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted" , HttpStatus.OK);
	}*/
}
