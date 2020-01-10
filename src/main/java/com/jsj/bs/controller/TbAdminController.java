package com.jsj.bs.controller;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbAdmin;
import com.jsj.bs.service.TbAdminService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * (TbAdmin)表控制层
 *
 * @author makejava
 * @since 2019-12-31 18:53:55
 */
@Controller
@RequestMapping("tbAdmin")
public class TbAdminController {

    private static final Logger LOGGER= LogManager.getLogger(TbAdminController.class);
    /**
     * 服务对象
     */
    @Autowired
    private TbAdminService tbAdminService;

    /**
     * 管理员登陆
     *
     * @param tbAdmin
     * @return
     */
    @RequestMapping("login-admin")
    public String loginAdmin(TbAdmin tbAdmin, HttpSession session, Model model) {

        String account = tbAdmin.getAdminAccount();

        String password = tbAdmin.getAdminPassword();

        LOGGER.error(tbAdmin.getAdminAccount() + "===============" + tbAdmin.getAdminAccount());

        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(account, password);

        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                Boolean status = tbAdminService.queryStatus(account);
                if (!status && subject.hasRole("admin")) {
                    session.setAttribute("account", account);
                    session.setAttribute("hasRole", "hasAdmin");
                    return "main";
                }
                session.setAttribute("msg", "当前账户异常，请联系超级管理员"+status);
                return "redirect:/error";
            }
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }
        session.setAttribute("msg", "账户或密码错误");
        return "redirect:/error";
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    @ResponseBody
    public TbAdmin selectOne(Integer id) {
        return tbAdminService.queryById(id);
    }
    
    
    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbAdmin 实体
     * @return PageInfo<TbAdmin> 分页数据集合
     */
    @RequestMapping("searchAll")
    @ResponseBody
    public PageInfo<TbAdmin> searchAll(@RequestParam(value = "page",defaultValue = "1") int page, @RequestParam(value = "pageSize",defaultValue = "5")int pageSize, TbAdmin tbAdmin){
        return tbAdminService.queryAll(page, pageSize, tbAdmin);
    }

}