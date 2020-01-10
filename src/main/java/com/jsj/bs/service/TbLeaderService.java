package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbLeader;

/**
 * (TbLeader)表服务接口
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */
public interface TbLeaderService {

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
    TbLeader queryByLeaderAccount(String  leaderAccount);

    /**
     * 登陆
     * @param leaderAccount  账户名
     * @param leaderPassword 密码
     * @return 实例对象
     */
    TbLeader queryByAccount( String leaderAccount, String leaderPassword);
    /**
     * 通过账户查询账户状态
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */

    Boolean queryStatus(String leaderAccount);
    /**
     * 通过账户查询id
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */

    Integer queryByLId(String leaderAccount);
    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbLeader 实体
     * @return PageInfo<TbLeader> 分页数据集合
     */
    PageInfo<TbLeader> queryAll(int page, int pageSize, TbLeader tbLeader);
  

    /**
     * 新增数据
     *
     * @param tbLeader 实例对象
     * @return 实例对象
     */
    TbLeader insert(TbLeader tbLeader);

    /**
     * 修改数据
     *
     * @param tbLeader 实例对象
     * @return 实例对象
     */
    TbLeader update(TbLeader tbLeader);

    /**
     * 通过主键删除数据
     *
     * @param leaderId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer leaderId);

}