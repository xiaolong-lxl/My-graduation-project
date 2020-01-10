package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbAdminDao;
import com.jsj.bs.pojo.TbAdmin;
import com.jsj.bs.pojo.TbUser;
import com.jsj.bs.service.TbAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (TbAdmin)表服务实现类
 *
 * @author makejava
 * @since 2019-12-31 18:53:55
 */
@Service("tbAdminService")
public class TbAdminServiceImpl implements TbAdminService {
    @Autowired
    private TbAdminDao tbAdminDao;

    /**
     * 通过ID查询单条数据
     *
     * @param adminId 主键
     * @return 实例对象
     */
    @Override
    public TbAdmin queryById(Integer adminId) {
        return tbAdminDao.queryById(adminId);
    }

    /**
     * 登陆
     *
     * @param adminAccount  账户名
     * @param adminPassword 密码
     * @return 实例对象
     */
    @Override
    public TbAdmin queryByAccount(String adminAccount, String adminPassword) {
        return tbAdminDao.queryByAccount(adminAccount, adminPassword);
    }

    /**
     * 通过账户查询账户状态
     *
     * @param adminAccount 账户名
     * @return Boolean
     */
    @Override
    public Boolean queryStatus(String adminAccount) {
        return tbAdminDao.queryStatus(adminAccount);
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbAdmin  实体
     * @return PageInfo<TbAdmin> 分页数据集合
     */
    @Override
    public PageInfo<TbAdmin> queryAll(int page, int pageSize, TbAdmin tbAdmin) {
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);

        List<TbAdmin> tbAdminList = tbAdminDao.queryAll(tbAdmin);

        return new PageInfo<>(tbAdminList);
    }

    /**
     * 新增数据
     *
     * @param tbAdmin 实例对象
     * @return 实例对象
     */
    @Override
    public TbAdmin insert(TbAdmin tbAdmin) {
        tbAdminDao.insert(tbAdmin);
        return tbAdmin;
    }

    /**
     * 修改数据
     *
     * @param tbAdmin 实例对象
     * @return 实例对象
     */
    @Override
    public TbAdmin update(TbAdmin tbAdmin) {
        tbAdminDao.update(tbAdmin);
        return queryById(tbAdmin.getAdminId());
    }

    /**
     * 通过主键删除数据
     *
     * @param adminId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer adminId) {
        return tbAdminDao.deleteById(adminId) > 0;
    }
}