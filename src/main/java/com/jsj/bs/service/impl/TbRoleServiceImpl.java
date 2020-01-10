package com.jsj.bs.service.impl;

import com.jsj.bs.dao.TbRoleDao;
import com.jsj.bs.pojo.TbRole;
import com.jsj.bs.service.TbRoleService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色表(TbRole)表服务实现类
 *
 * @author makejava
 * @since 2019-12-31 19:41:08
 */
@Service("tbRoleService")
public class TbRoleServiceImpl implements TbRoleService {

    private static final Logger LOGGER= LogManager.getLogger(TbRoleServiceImpl.class);

    @Autowired
    private TbRoleDao tbRoleDao;

    /**
     * 通过ID查询单条数据
     *
     * @param roleId 主键
     * @return 实例对象
     */
    @Override
    public TbRole queryById(Integer roleId) {
        return tbRoleDao.queryById(roleId);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    @Override
    public List<String> queryByUserAccount(String account) {

        LOGGER.info(tbRoleDao.queryByUserAccount(account).size());
        return tbRoleDao.queryByUserAccount(account);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    @Override
    public List<String> queryByLeaderAccount(String account) {

        LOGGER.info(tbRoleDao.queryByLeaderAccount(account).size());

        return tbRoleDao.queryByLeaderAccount(account);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    @Override
    public List<String> queryByAdminAccount(String account) {

        LOGGER.info(tbRoleDao.queryByAdminAccount(account).size());
        return tbRoleDao.queryByAdminAccount(account);
    }

}