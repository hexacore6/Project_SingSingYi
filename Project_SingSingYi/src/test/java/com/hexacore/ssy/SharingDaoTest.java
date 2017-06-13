package com.hexacore.ssy;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.sharing.dao.SharingDAO;
import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.sharing.service.SharingService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class SharingDaoTest {

	Logger logger = Logger.getLogger(SharingDaoTest.class);

	@Inject
	private SharingDAO dao;
	
	//@Test
	public void testCreate() throws Exception {
		
		Sharing sharing = new Sharing();
		sharing.setId("kosta111");
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
		List<Sharing> list = dao.listAll("kosta111");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getShid() + "공유글의 번호");
		}
		//logger.info(dao.listAll("kosta111"));
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
	
	//@Test
	public void testGetShid() throws Exception{
		
		System.out.println(dao.getShid());
	}
	
	//@Test
	public void testUpdate() {
		Sharing sharing = new Sharing();
		sharing.setShid(4);
		sharing.setShcontent("updateTest");
		dao.update(sharing);
	}
	
	//@Test
	public void testUpdateImg() {
		Sharing sharing = new Sharing();
		sharing.setShid(18);
		sharing.setEximgfilename("kosta111@18@twice_knockknock.jpg");
		sharing.setShcontent("updateTest44");
		System.out.println(sharing);
		dao.updateImg(sharing);
	}
	
	//@Test
	public void testRemove(){
		dao.deleteComment(18);
		dao.deleteSharing(18);
	}
	
	//@Test
	public void testComment(){
		Comment comment = new Comment();
		comment.setShid(16);
		comment.setId("kosta111");
		comment.setCcontent("test2");
		dao.comment(comment);
	}
	
	//@Test
	public void testListComment(){
		int shid = 16;
		logger.info(dao.listComment(shid));
	}
	
	//@Test
	public void testGetComment(){
		Comment comment =  new Comment();
		comment.setShid(16);
		comment.setId("kosta111");
		logger.info(dao.getComment(comment));
	}
	
	//@Test
	public void testLikeHistory(){
		Sharing sharing = new Sharing();
		sharing.setShid(16);
		sharing.setId("kosta111");
		dao.likeHistory(sharing);
	}
	
	//@Test
	public void testCheckLike(){
		System.out.println(dao.checkLike(6) + "db 아이디");
	}
	
	//@Test
	public void testSearhcById(){
		String id = "ost";
		logger.info(dao.searchById(id));
	}
	
	@Test
	public void testGetSongTitle(){
		
		List<Sharing> list = dao.listAll("kosta111");
		String name = null;
		String[] array = null;
		for (int i = 0; i < list.size(); i++) {
			name = list.get(i).getRecordfilename();
			if(name != null){
				array = name.split("@");
				System.out.println(array[2]);
			}
		}
	}
	

}
