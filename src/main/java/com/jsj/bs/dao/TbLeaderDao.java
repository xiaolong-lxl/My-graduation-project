package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbLeader;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TbLeader)表数据库访问层
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */

@Mapper
public interface TbLeaderDao {

    /**
     * 通过ID查询单条数据
     *
     * @param leaderId 主键
     * @return 实例对象
     */
    TbLeader queryById(Integer leaderId);

    /**
     * 通过账号查询单条数据
     *
     * @param leaderAccount 账号
     * @return 实例对象
     */
    TbLeader queryByLeaderAccount(@Param("leaderAccount") String  leaderAccount);
    /**
     * 登陆
     * @param leaderAccount  账户名
     * @param leaderPassword 密码
     * @return 实例对象
     */
    TbLeader queryByAccount(@Param("leaderAccount") String leaderAccount, @Param("leaderPassword") String leaderPassword);

    /**
     * 通过账户查询账户状态
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */

    Boolean queryStatus(@Param("leaderAccount") String leaderAccount);

    /**
     * 通过账户查询id
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */

    Integer queryByLId(@Param("leaderAccount") String leaderAccount);
    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbLeader 实例对象
     * @return 对象列表
     */
    List<TbLeader> queryAll(TbLeader tbLeader);

    /**
     * 新增数据
     *
     * @param tbLeader 实例对象
     * @return 影响行数
     */
    int insert(TbLeader tbLeader);

    /**
     * 修改数据
     *
     * @param tbLeader 实例对象
     * @return 影响行数
     */
    int update(TbLeader tbLeader);

    /**
     * 通过主键删除数据
     *
     * @param leaderId 主键
     * @return 影响行数
     */
    int deleteById(Integer leaderId);

}