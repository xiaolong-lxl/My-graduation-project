package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbGaipaiDao;
import com.jsj.bs.pojo.TbGaipai;
import com.jsj.bs.service.TbGaipaiService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * (TbGaipai)表服务实现类
 *
 * @author makejava
 * @since 2020-01-09 16:30:54
 */
@Service("tbGaipaiService")
public class TbGaipaiServiceImpl implements TbGaipaiService {

    private static final Logger LOGGER= LogManager.getLogger(TbGaipaiServiceImpl.class);

    @Autowired
    private TbGaipaiDao tbGaipaiDao;

    /**
     * 通过ID查询单条数据
     *
     * @param gaipaiId 主键
     * @return 实例对象
     */
    @Override
    public TbGaipai queryById(Integer gaipaiId) {
        return tbGaipaiDao.queryById(gaipaiId);
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbGaipai 实体
     * @return PageInfo<TbGaipai> 分页数据集合
     */
    @Override
    public PageInfo<TbGaipai> queryAll(int page, int pageSize, TbGaipai tbGaipai) {
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);

        List<TbGaipai> tbGaipaiList = tbGaipaiDao.queryAll(tbGaipai);

        return new PageInfo<>(tbGaipaiList);
    }

    /**
     * 新增数据
     *
     * @param tbGaipai 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public TbGaipai insert(TbGaipai tbGaipai) {

        LOGGER.info("===================改派申请 service层==========insert==="+tbGaipai);

        int insert = tbGaipaiDao.insert(tbGaipai);

        if (insert > 0){

            return tbGaipaiDao.queryById(tbGaipai.getGaipaiId());
        }

        return null;
    }

    /**
     * 修改数据
     *
     * @param tbGaipai 实例对象
     * @return 实例对象
     */
    @Override
    public TbGaipai update(TbGaipai tbGaipai) {
        tbGaipaiDao.update(tbGaipai);
        return queryById(tbGaipai.getGaipaiId());
    }

    /**
     * 通过主键删除数据
     *
     * @param gaipaiId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer gaipaiId) {
        return tbGaipaiDao.deleteById(gaipaiId) > 0;
    }
}