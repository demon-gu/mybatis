package com.demon.mapper;

import com.alibaba.fastjson.JSON;
import com.demon.pojo.Order;
import com.demon.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import sun.dc.pr.PRError;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * TODO
 *
 * @author Demon
 * @date 2018/9/16 17:15
 */
public class UserMapperTest {

    private UserMapper userMapper;

    @Before
    public void setUp() throws Exception {
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        userMapper = sqlSession.getMapper(UserMapper.class);
    }

    @Test
    public void queryOrderUserLazy() {
        Order order = userMapper.queryOrderUserLazy("20140921001");
        System.out.println(JSON.toJSONString(order.getUser()));
    }

    @Test
    public void queryOrderAndUserAndOrderDetailsAndItemByOrderNumber() {
        Order order = userMapper.queryOrderAndUserAndOrderDetailsAndItemByOrderNumber("20140921001");
        System.out.println(JSON.toJSONString(order));
    }

    @Test
    public void queryOrderAndUserAndOrderDetailsByOrderNumber() {
        Order order = userMapper.queryOrderAndUserAndOrderDetailsByOrderNumber("20140921001");
        System.out.println(JSON.toJSONString(order));
    }

    @Test
    public void queryOrderAndUserByOrderNumber() {
        Order order = userMapper.queryOrderAndUserByOrderNumber("20140921003");
        System.out.println(JSON.toJSONString(order));
    }
}