package com.jsj.bs.controller;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbLeader;
import com.jsj.bs.service.TbLeaderService;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

/**
 * (TbLeader)表控制层
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */
@Controller
@RequestMapping("tbLeader")
public class TbLeaderController {

    private static final Logger LOGGER= LogManager.getLogger(TbLeaderController.class);
    /**
     * 服务对象
     */
    @Autowired
    private TbLeaderService tbLeaderService;

    /**
     * 负责人登陆
     *
     * @param tbLeader
     * @return
     */
    @RequestMapping("login-leader")
    public String loginLeader(TbLeader tbLeader, HttpSession session, Model model) {

        String account = tbLeader.getLeaderAccount();

        String password = tbLeader.getLeaderPassword();

        LOGGER.error(tbLeader.getLeaderAccount() + "===============" + tbLeader.getLeaderPassword());

        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(account, password);

        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                Boolean status = tbLeaderService.queryStatus(account);
                Integer leaderId = tbLeaderService.queryByLId(account);
                LOGGER.info("+=================lid=============="+leaderId);
                if (!status && subject.hasRole("leader")) {
                    session.setAttribute("account", account);
                    session.setAttribute("leaderId", leaderId);
                    //start   此处是用来判断用户和负责人第一次修改密码成功的判断
                    session.setAttribute("status",  001);
                    session.setAttribute("msg", "修改完成，请重新登陆");
                    //end
                    session.setAttribute("hasRole", "hasLeader");
                    return "leaderpage";
                }
                session.setAttribute("msg", "当前账户异常，请联系管理员"+status);
                return "redirect:/error";
            }
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }
        session.setAttribute("msg", "账户或密码错误");
        return "redirect:/error";
    }

    /**
     * 用户修改用户信息
     * @param tbLeader
     * @param session
     * @param status
     * @return
     */
    @RequestMapping(value = "/upTbLeader", method = RequestMethod.POST)
    public String upTbUser(TbLeader tbLeader, HttpSession session, SessionStatus status) {

        LOGGER.info(tbLeader + "=======================controller  up===========");
        TbLeader leader = tbLeaderService.update(tbLeader);

        if (leader != null) {
            session.setAttribute("status", 1);
            session.setAttribute("msg", "修改完成，请重新登陆");

            return "redirect:/login-leader";
        }
        session.setAttribute("msg", "修改失败，请联系管理员");
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
    public TbLeader selectOne(Integer id) {
        return tbLeaderService.queryById(id);
    }
    
    
    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbLeader 实体
     * @return PageInfo<TbLeader> 分页数据集合
     */
    @RequestMapping("searchAll")
    @ResponseBody
    public PageInfo<TbLeader> searchAll(@RequestParam(value = "page",defaultValue = "1") int page, @RequestParam(value = "pageSize",defaultValue = "5")int pageSize, TbLeader tbLeader){
        return tbLeaderService.queryAll(page, pageSize, tbLeader);
    }

}