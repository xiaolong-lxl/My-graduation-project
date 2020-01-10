package com.jsj.bs.controller;

import com.jsj.bs.pojo.TbUser;
import com.jsj.bs.service.TbUserService;
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
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

/**
 * (TbUser)表控制层
 *
 * @author makejava
 * @since 2019-12-04 11:04:55
 */
@Controller
@RequestMapping("/tbUser")
public class TbUserController {

    private static final Logger LOGGER = LogManager.getLogger(TbUserController.class);

    @Autowired
    private TbUserService userService;

    /**
     * 用户注册
     * @param tbUser
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String userRegister(TbUser tbUser,HttpSession session,Model model){

        TbUser user = userService.queryById(tbUser.getUserAccount());

        if (user == null){
            //添加用户角色
            tbUser.setRoleId(3);
            //用户不存在，可以注册
            TbUser insert = userService.insert(tbUser);
            //返回 1 成功  0 失败
            session.setAttribute("status",1 );
            session.setAttribute("msg","注册成功,请登录" );
            return "login-user";
        }
        session.setAttribute("status",0 );
        session.setAttribute("msg","账户已存在，请重新注册" );
        return "register";
    }
    /**
     * 验证码验证
     * @param model
     * @param message
     * @return
     */
    @RequestMapping("/loginView")
    public String loginView(Model model, String message) {
        model.addAttribute("msg", "登陆失败，验证码错误");
        LOGGER.info("验证码错误");

        return "login-user";
    }
    /**
     * 用户登陆
     *
     * @param userAccount
     * @param userPassword
     * @return
     */
    @RequestMapping("/login-user")
    public String loginUser(@RequestParam("userAccount") String userAccount,
                            @RequestParam("userPassword") String userPassword,
                            HttpSession session,
                            Model model) {

        LOGGER.error(userAccount + "===============" + userPassword);

        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(userAccount, userPassword);

        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                Boolean status = userService.queryStatus(userAccount);
                if (!status && subject.hasRole("user")) {
                    session.setAttribute("account", userAccount);
                    session.setAttribute("hasRole", "hasUser");
                    return "userpage";
                }
                session.setAttribute("msg", "当前账户异常，请联系管理员" + status);
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
     * @param tbUser
     * @param session
     * @param status
     * @return
     */
    @RequestMapping(value = "/upTbUser", method = RequestMethod.POST)
    public String upTbUser(TbUser tbUser, HttpSession session, SessionStatus status) {

        LOGGER.info(tbUser + "=======================controller  up===========");
        TbUser user = userService.update(tbUser);

        if (user != null) {
            System.out.println("=进入清除session=");
            session.removeAttribute("account");
            status.setComplete();
            System.out.println("==清理完成==");
            session.setAttribute("msg", "修改完成，请重新登陆");
            session.setAttribute("status", 1);
            return "redirect:/login-user";
        }
        session.setAttribute("msg", "修改失败，请联系管理员");
        return "redirect:/error";
    }

}