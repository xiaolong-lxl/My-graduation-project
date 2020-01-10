package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TbUser)表数据库访问层
 *
 * @author makejava
 * @since 2019-12-31 17:56:46
 */
 
@Mapper
public interface TbUserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param userAccount
     * @return 实例对象
     */
    TbUser queryById(String userAccount);

    /**
     * 登陆
     * @param userAccount  账户名
     * @param userPassword 密码
     * @return 实例对象
     */
    TbUser queryByAccount(@Param("userAccount") String userAccount, @Param("userPassword") String userPassword);

    /**
     * 通过账户查询账户状态
     *
     * @param userAccount 账户名
     * @return Boolean
     */
    Boolean queryStatus(@Param("userAccount") String userAccount);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbUser 实例对象
     * @return 对象列表
     */
    List<TbUser> queryAll(TbUser tbUser);

    /**
     * 新增数据
     *
     * @param tbUser 实例对象
     * @return 影响行数
     */
    int insert(TbUser tbUser);

    /**
     * 修改数据
     *
     * @param tbUser 实例对象
     * @return 影响行数
     */
    int update(TbUser tbUser);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(Integer userId);

}