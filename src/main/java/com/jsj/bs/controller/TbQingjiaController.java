package com.jsj.bs.controller;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbLeader;
import com.jsj.bs.pojo.TbQingjia;
import com.jsj.bs.service.TbLeaderService;
import com.jsj.bs.service.TbQingjiaService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * (TbQingjia)表控制层
 *
 * @author makejava
 * @since 2020-01-09 22:08:29
 */
@Controller
@RequestMapping("/tbQingjia")
public class TbQingjiaController {

    private static final Logger LOGGER= LogManager.getLogger(TbQingjiaController.class);

    /**
     * 服务对象
     */
    @Autowired
    private TbQingjiaService tbQingjiaService;
    @Autowired
    private TbLeaderService tbLeaderService;

    /**
     * 进入请假页面
     *
     * @param leaderAccount 负责人账号  唯一
     * @param model
     * @return
     */
    @RequestMapping(value = "/inQingJiaPage", method = RequestMethod.GET)
    public String inQingJiaPage(String leaderAccount, Model model, HttpSession session) {

        if (leaderAccount != null) {

            TbLeader tbLeader = tbLeaderService.queryByLeaderAccount(leaderAccount);

            model.addAttribute("tbLeader", tbLeader);
            session.setAttribute("msg", "请求成功");

            return "qingjiapage";
        }

        session.setAttribute("msg", "路径问题，请联系管理员");

        return "redirect:/error";
    }

    /**
     * 申请请假  添加信息
     * @param tbQingjia
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/addQingJiaInfo", method = RequestMethod.POST)
    public String addQingJiaInfo(TbQingjia tbQingjia, Model model, HttpSession session) {

        TbQingjia tbQingjia1 = tbQingjiaService.insert(tbQingjia);

        if (tbQingjia1 != null) {

            model.addAttribute("tbQingjia", tbQingjia1);
            session.setAttribute("msg", "添加成功");
            return "qjListpage";
        }

        session.setAttribute("msg", "添加异常，请联系管理员");
        return "redirect:/error";
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
    public PageInfo<TbQingjia> searchByLeaderId(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, @RequestParam("leaderId") int leaderId) {

        LOGGER.info(leaderId + "==================负责人id============");
        TbQingjia tbQingjia = new TbQingjia();
        tbQingjia.setLeaderId(leaderId);
        return tbQingjiaService.queryAll(page, pageSize, tbQingjia);
    }

    /**
     * 删除改派信息
     * @param tbQingjia
     * @return
     */
    @RequestMapping(value = "delQingjia", method = RequestMethod.POST)
    @ResponseBody
    public Boolean delGaiPai(TbQingjia tbQingjia) {

        LOGGER.info("=================del del del ==========="+tbQingjia.getQingjiaId());

        boolean deleteById = tbQingjiaService.deleteById(tbQingjia.getQingjiaId());
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
    public TbQingjia selectOne(Integer id) {
        return tbQingjiaService.queryById(id);
    }


    /**
     * 查询多条数据
     *
     * @param page      页码
     * @param pageSize  页大小
     * @param tbQingjia 实体
     * @return PageInfo<TbQingjia> 分页数据集合
     */
    @RequestMapping("searchAll")
    @ResponseBody
    public PageInfo<TbQingjia> searchAll(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, TbQingjia tbQingjia) {
        return tbQingjiaService.queryAll(page, pageSize, tbQingjia);
    }

}