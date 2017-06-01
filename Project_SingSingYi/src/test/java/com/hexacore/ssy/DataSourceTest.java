package com.hexacore.ssy;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {

	Logger logger = Logger.getLogger(DataSourceTest.class);
	
	@Inject
	private DataSource dataSource;

	@Test
	public void testConnection() throws Exception {
		try (Connection con = dataSource.getConnection()) {
			logger.info(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}