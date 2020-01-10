package com.jsj.bs;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration("src/main/resources")//扫描了resources配置文件夹里面的配置，后恢复正常
@ContextConfiguration(locations={"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
public class BastTest {

   private static final Logger LOGGER= LogManager.getLogger(BastTest.class);

    @Test
    public void test(){
        LOGGER.info("run..............");
    }
}