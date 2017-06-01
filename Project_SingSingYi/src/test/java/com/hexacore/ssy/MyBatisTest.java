package com.hexacore.ssy;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {

	Logger logger = Logger.getLogger(MyBatisTest.class);
	
	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testFactory() {
		logger.info("SqlSessionFactory 확인 : " + sqlSessionFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			logger.info("SqlSession 확인 : " + session);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}