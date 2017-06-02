package com.hexacore.ssy;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.hexacore.ssy.board.dao.BoardDAO;
import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.SearchCriteria;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
			locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class BoardDAOTest {
	Logger logger = Logger.getLogger(BoardDAOTest.class);
	@Inject
	private BoardDAO dao;
	

//	@Test
	public void testCreate(){
		
		Article article = new Article();
		article.setAtitle("새로운 타이틀을 넣습니다.");
		article.setAcontent("새로운 콘텐츠를 넣습니다.");
		article.setId("kdj5317");
		article.setBid(1);    // QnA
		//article.setBid(2);  //공지사항
		dao.create(article);
	}
	
//	@Test
	public void testRead(){
		logger.info(dao.read(252).toString());
		dao.updateViewCnt(219);
	}
	

//	@Test
	public void testViewCount(){
		dao.updateViewCnt(219);
	}
	
//	@Test
	public void testUpdate(){
		Article article = new Article();
		article.setAid(2);
		article.setAtitle("수정된 타이틀입니다.222");
		article.setAcontent("수정된 콘텐츠 입니다.222");
		dao.update(article);
	}
	
//	@Test
	public void testDelete(){
		dao.delete(5);
	}
	
//	@Test
	public void testListPage(){
		int page = 2;
		
		List<Article> list = dao.listPage(page);
		
		for (Article article : list) {
			logger.info(article.getAid() + ":" + article.getAtitle());
		}
	}
	
//	@Test
	public void testListCriteria(){
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<Article> list = dao.listCriteria(cri);
		
		for (Article article : list){
			logger.info(article.getAid() + ":" + article.getAtitle());
		}
	}

	@Test
	public void testSearch(){

		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("t");
		cri.setKeyword("수정된");
		cri.setPage(1);
		cri.setPerPageNum(10);
		logger.info(dao.listSearch(cri).toString());
	}
	
//	@Test
	public void testURI(){
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.path("/board/read")
				.queryParam("board_id", 12)
				.queryParam("perPageNum", 10)
				.build();
		logger.info("/board/read?board_id=12&perPageNum=10");
		logger.info(uriComponents.toString());
	}
	
//	@Test
	public void testURI2(){
		
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
		.path("/{module}/{page}")
		.queryParam("board_id", 12)
		.queryParam("perPageNum", 10)
		.build()
		.expand("board", "read")
		.encode();
		
		logger.info("/board/read?board_id=12&perPageNum=10");
		logger.info(uriComponents.toString());
		
	}
	
//	@Test
	public void testDynamic1(){
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword(".");
		cri.setSearchType("t");
		logger.info("============================================");
		
		List<Article> list = dao.listSearch(cri);
		
		for(Article article : list){
			logger.info(article.getAid()+ ":" + article.getAtitle());
		}
		
		logger.info("================================================");
		
		logger.info("COUNT: " + dao.listSearchCount(cri));
	}



}
