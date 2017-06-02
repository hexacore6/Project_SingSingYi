package com.hexacore.ssy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.jdbc.support.xml.SqlXmlValue;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.hexacore.ssy.sharing.dao.SharingDao;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.sharing.service.SharingService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class SharingDaoTest {

	Logger logger = Logger.getLogger(SharingDaoTest.class);

	@Inject
	private SharingService service;
	private SharingDao dao;

	@Test
	public void testCreate() throws Exception {
		
		Sharing sharing = new Sharing();
		sharing.setId("kosta111");
		sharing.setRrid(1);
		sharing.setShcontent("test");
		sharing.setEximgfilename("test.jpg");
		System.out.println(sharing.getId());
		System.out.println(sharing.toString());
		dao.create(sharing);
		//service.regist(sharing);
	}
	
	//@Test
	public void testRead() {
		//logger.info("2" + dao.read(2));
		logger.info(service.read(90));
	}
	
	//@Test
	public void testListAll(){
		logger.info("2" + dao.listAll());
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
