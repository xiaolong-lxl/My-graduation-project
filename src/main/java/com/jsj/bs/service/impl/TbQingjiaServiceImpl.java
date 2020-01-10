package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbQingjiaDao;
import com.jsj.bs.pojo.TbQingjia;
import com.jsj.bs.service.TbQingjiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * (TbQingjia)表服务实现类
 *
 * @author makejava
 * @since 2020-01-09 22:08:29
 */
@Service("tbQingjiaService")
public class TbQingjiaServiceImpl implements TbQingjiaService {
    @Autowired
    private TbQingjiaDao tbQingjiaDao;

    /**
     * 通过ID查询单条数据
     *
     * @param qingjiaId 主键
     * @return 实例对象
     */
    @Override
    public TbQingjia queryById(Integer qingjiaId) {
        return tbQingjiaDao.queryById(qingjiaId);
    }
    
    
    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbQingjia 实体
     * @return PageInfo<TbQingjia> 分页数据集合
     */
    @Override
    public PageInfo<TbQingjia> queryAll(int page, int pageSize, TbQingjia tbQingjia) {
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);

        List<TbQingjia> tbQingjiaList = tbQingjiaDao.queryAll(tbQingjia);

        return new PageInfo<>(tbQingjiaList);
    }

    /**
     * 新增数据
     *
     * @param tbQingjia 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public TbQingjia insert(TbQingjia tbQingjia) {
//设置申请时间
        tbQingjia.setAddTime(new Date());

        int insert = tbQingjiaDao.insert(tbQingjia);

        if (insert > 0){
            return tbQingjiaDao.queryById(tbQingjia.getQingjiaId());
        }

        return new TbQingjia();
    }

    /**
     * 修改数据
     *
     * @param tbQingjia 实例对象
     * @return 实例对象
     */
    @Override
    public TbQingjia update(TbQingjia tbQingjia) {
        tbQingjiaDao.update(tbQingjia);
        return queryById(tbQingjia.getQingjiaId());
    }

    /**
     * 通过主键删除数据
     *
     * @param qingjiaId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer qingjiaId) {

        return tbQingjiaDao.deleteById(qingjiaId) > 0;
    }
}