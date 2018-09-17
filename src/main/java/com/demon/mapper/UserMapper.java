package com.demon.mapper;

import com.demon.pojo.Order;
import com.demon.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * TODO
 *
 * @author Demon
 * @date 2018/9/16 17:08
 */
public interface UserMapper {

    /**
     * 通过订单编号20140921001查询order并延迟加载user
     * @param orderNumber 订单编号
     * @return
     */
    Order queryOrderUserLazy(@Param("orderNumber")String orderNumber);

    /**
     * 多对多查询
     * @param orderNumber 订单编号
     * @return
     */
    Order queryOrderAndUserAndOrderDetailsAndItemByOrderNumber(@Param("orderNumber") String orderNumber);

    /**
     * 一对多查询
     * @param orderNumber 订单编号
     * @return
     */
    Order queryOrderAndUserAndOrderDetailsByOrderNumber(@Param("orderNumber") String orderNumber);

    /**
     * 一对一查询
     * @param orderNumber 订单编号
     * @return
     */
    Order queryOrderAndUserByOrderNumber(@Param("orderNumber") String orderNumber);
}
