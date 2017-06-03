package com.hexacore.ssy;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.sharing.dao.SharingDao;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.sharing.service.SharingService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class SharingDaoTest {

	Logger logger = Logger.getLogger(SharingDaoTest.class);

	@Inject
	private SharingService service;
	private SharingDao	dao;
	
	@Test
	public void testCreate() throws Exception {
		
		Sharing sharing = new Sharing();
		sharing.setId("woong");
		sharing.setRrid(1);
		sharing.setShcontent("test");
		sharing.setEximgfilename("test.jpg");
		dao.create(sharing);
		//service.regist(sharing);
	}
	
	//@Test
	public void testRead() {
		//logger.info("2" + dao.read(2));
//		logger.info(service.read(90));
	}
	
	//@Test
	public void testListAll(){
		//logger.info("2" + dao.listAll());
	}
	
	//@Test
	public void testUpdateLikeCnt(){
		//dao.updateLikeCnt(2);
		logger.info("좋아요");
	}
	
	//@Test
	public void testUpdateCommentCnt(){
		//dao.updateCommentCnt(2);
		logger.info("댓글");
	}

	

}
