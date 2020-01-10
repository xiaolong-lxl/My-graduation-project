package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbUserDao;
import com.jsj.bs.pojo.TbUser;
import com.jsj.bs.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * (TbUser)表服务实现类
 *
 * @author makejava
 * @since 2019-12-31 17:56:46
 */
@Service("tbUserService")
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    private TbUserDao tbUserDao;

    /**
     * 通过ID查询单条数据
     *
     * @param userAccount
     * @return 实例对象
     */
    @Override
    public TbUser queryById(String  userAccount) {
        return tbUserDao.queryById(userAccount);
    }
    /**
     * 登陆
     * @param userAccount  账户名
     * @param userPassword 密码
     * @return 实例对象
     */
    @Override
    public TbUser queryByAccount(String userAccount, String userPassword) {
        return tbUserDao.queryByAccount(userAccount, userPassword);
    }
    /**
     * 通过账户查询账户状态
     *
     * @param userAccount 账户名
     * @return Boolean
     */
    @Override
    public Boolean queryStatus(String userAccount) {
        return tbUserDao.queryStatus(userAccount);
    }


    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbUser 实体
     * @return PageInfo<TbUser> 分页数据集合
     */
    @Override
    public PageInfo<TbUser> queryAll(int page, int pageSize, TbUser tbUser) {
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);

        List<TbUser> tbUserList = tbUserDao.queryAll(tbUser);

        return new PageInfo<>(tbUserList);
    }

    /**
     * 新增数据
     *
     * @param tbUser 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public TbUser insert(TbUser tbUser) {

        Date date = new Date();

        tbUser.setCreateTime(date);

        int insert = tbUserDao.insert(tbUser);

        if (insert>0){
            return tbUserDao.queryById(tbUser.getUserAccount());
        }
       return null;
    }

    /**
     * 修改数据
     *
     * @param tbUser 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public TbUser update(TbUser tbUser) {
        int update = tbUserDao.update(tbUser);
        if (update>0){
            return queryById(tbUser.getUserAccount());
        }
        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Transactional
    @Override
    public boolean deleteById(Integer userId) {
        return tbUserDao.deleteById(userId) > 0;
    }
}