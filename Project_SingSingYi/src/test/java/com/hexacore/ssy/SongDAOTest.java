package com.hexacore.ssy;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.song.dao.SongDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class SongDAOTest {
	
	@Inject
	private SongDAO dao;
	
	Logger logger = Logger.getLogger(SongDAOTest.class);
	
	@Test
	public void checkFavorite(){
		String id = "woong1";
		int sid = 1;		
		System.out.println("디에오 체크 : " + dao.checkFavorite(id, sid));
	}
}
