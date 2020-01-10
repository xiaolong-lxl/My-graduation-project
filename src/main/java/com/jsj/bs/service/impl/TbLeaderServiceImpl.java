package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbLeaderDao;
import com.jsj.bs.pojo.TbLeader;
import com.jsj.bs.service.TbLeaderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (TbLeader)表服务实现类
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */
@Service("tbLeaderService")
public class TbLeaderServiceImpl implements TbLeaderService {

    private static final Logger LOGGER = LogManager.getLogger(TbLeaderServiceImpl.class);
    @Autowired
    private TbLeaderDao tbLeaderDao;

    /**
     * 通过ID查询单条数据
     *
     * @param leaderId 主键
     * @return 实例对象
     */
    @Override
    public TbLeader queryById(Integer leaderId) {
        return tbLeaderDao.queryById(leaderId);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param leaderAccount 账号
     * @return 实例对象
     */
    @Override
    public TbLeader queryByLeaderAccount(String leaderAccount) {
        return tbLeaderDao.queryByLeaderAccount(leaderAccount);
    }

    /**
     * 登陆
     *
     * @param leaderAccount  账户名
     * @param leaderPassword 密码
     * @return 实例对象
     */

    @Override
    public TbLeader queryByAccount(String leaderAccount, String leaderPassword) {
        return tbLeaderDao.queryByAccount(leaderAccount, leaderPassword);
    }

    /**
     * 通过账户查询账户状态
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */
    @Override
    public Boolean queryStatus(String leaderAccount) {

        LOGGER.info("status==========" + tbLeaderDao.queryStatus(leaderAccount));

        return tbLeaderDao.queryStatus(leaderAccount);
    }

    /**
     * 通过账户查询id
     *
     * @param leaderAccount 账户名
     * @return Boolean
     */
    @Override
    public Integer queryByLId(String leaderAccount) {

        LOGGER.info("status==========" + tbLeaderDao.queryByLId(leaderAccount));

        return tbLeaderDao.queryByLId(leaderAccount);
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbLeader 实体
     * @return PageInfo<TbLeader> 分页数据集合
     */
    @Override
    public PageInfo<TbLeader> queryAll(int page, int pageSize, TbLeader tbLeader) {
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);

        List<TbLeader> tbLeaderList = tbLeaderDao.queryAll(tbLeader);

        return new PageInfo<>(tbLeaderList);
    }

    /**
     * 新增数据
     *
     * @param tbLeader 实例对象
     * @return 实例对象
     */
    @Override
    public TbLeader insert(TbLeader tbLeader) {
        tbLeaderDao.insert(tbLeader);
        return tbLeader;
    }

    /**
     * 修改数据
     *
     * @param tbLeader 实例对象
     * @return 实例对象
     */
    @Override
    public TbLeader update(TbLeader tbLeader) {
        int update = tbLeaderDao.update(tbLeader);
        if (update > 0) {
            return queryByLeaderAccount(tbLeader.getLeaderAccount());
        }
        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param leaderId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer leaderId) {
        return tbLeaderDao.deleteById(leaderId) > 0;
    }


}