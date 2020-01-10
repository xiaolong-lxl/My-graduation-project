package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbUser;

/**
 * (TbUser)表服务接口
 *
 * @author makejava
 * @since 2019-12-31 17:56:46
 */
public interface TbUserService {

    /**
     * 通过ID查询单条数据
     *
     * @param userAccount 主键
     * @return 实例对象
     */
    TbUser queryById(String  userAccount);
    /**
     * 登陆
     * @param userAccount  账户名
     * @param userPassword 密码
     * @return 实例对象
     */

    TbUser queryByAccount(String userAccount,String userPassword);

    /**
     * 通过账户查询账户状态
     *
     * @param userAccount 账户名
     * @return Boolean
     */
    Boolean queryStatus(String userAccount);

    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbUser 实体
     * @return PageInfo<TbUser> 分页数据集合
     */
    PageInfo<TbUser> queryAll(int page, int pageSize, TbUser tbUser);
  

    /**
     * 新增数据
     *
     * @param tbUser 实例对象
     * @return 实例对象
     */
    TbUser insert(TbUser tbUser);

    /**
     * 修改数据
     *
     * @param tbUser 实例对象
     * @return 实例对象
     */
    TbUser update(TbUser tbUser);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer userId);

}