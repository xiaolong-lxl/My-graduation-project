package com.jsj.bs.controller;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbGaipai;
import com.jsj.bs.service.TbGaipaiService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


/**
 * (TbGaipai)表控制层
 *
 * @author makejava
 * @since 2020-01-09 16:30:54
 */
@Controller
@RequestMapping("/tbGaipai")
public class TbGaipaiController {

    private static final Logger LOGGER = LogManager.getLogger(TbGaipaiController.class);
    /**
     * 服务对象
     */
    @Autowired
    private TbGaipaiService tbGaipaiService;

    /**
     * 添加改派信息
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping(value = "/addGaiPai", method = RequestMethod.POST)
    @ResponseBody
    public TbGaipai addGaiPai(@RequestParam("gaipaiTitle") String gaipaiTitle,
                              @RequestParam("gaipaiWhy") String gaipaiWhy,
                              @RequestParam("orderId") int orderId,
                              @RequestParam("leaderId") int leaderId,
                              Model model) {

        LOGGER.info("====TbGaipaiController======" + gaipaiTitle + "=====" + gaipaiWhy + "========" + orderId);

        TbGaipai tbGaipai = new TbGaipai();

        tbGaipai.setGaipaiTitle(gaipaiTitle);
        tbGaipai.setGaipaiWhy(gaipaiWhy);
        tbGaipai.setOdertId(orderId);
        tbGaipai.setLeaderId(leaderId);
        tbGaipai.setGaipaiDate(new Date());
        LOGGER.info("==========" + tbGaipai);

        TbGaipai toTbGaipai = tbGaipaiService.insert(tbGaipai);

        if (toTbGaipai != null) {

            model.addAttribute("addmsg", "success");
            return toTbGaipai;
        }

        model.addAttribute("addmsg", "error");
        model.addAttribute("msg", "改派申请失败，请联系管理员");
        return new TbGaipai();
    }

    /**
     * 根据负责人查询此人改派申请
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param leaderId 负责人
     * @return PageInfo<TbGaipai> 分页数据集合
     */
    @RequestMapping(value = "searchByLeaderId", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<TbGaipai> searchByLeaderId(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, @RequestParam("leaderId") int leaderId) {

        LOGGER.info(leaderId + "==================负责人id============");
        TbGaipai tbGaipai = new TbGaipai();
        tbGaipai.setLeaderId(leaderId);
        return tbGaipaiService.queryAll(page, pageSize, tbGaipai);
    }

    /**
     * 删除改派信息
     * @param tbGaipai
     * @return
     */
    @RequestMapping(value = "delGaiPai", method = RequestMethod.POST)
    @ResponseBody
    public Boolean delGaiPai(TbGaipai tbGaipai) {

        LOGGER.info("=================del del del ==========="+tbGaipai.getGaipaiId());

        boolean deleteById = tbGaipaiService.deleteById(tbGaipai.getGaipaiId());
        if (deleteById){
            return true;
        }
        return false;
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    @ResponseBody
    public TbGaipai selectOne(Integer id) {
        return tbGaipaiService.queryById(id);
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbGaipai 实体
     * @return PageInfo<TbGaipai> 分页数据集合
     */
    @RequestMapping(value = "searchAll", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<TbGaipai> searchAll(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, TbGaipai tbGaipai) {
        return tbGaipaiService.queryAll(page, pageSize, tbGaipai);
    }

}