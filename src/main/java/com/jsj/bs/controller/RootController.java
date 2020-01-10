package com.jsj.bs.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2019/12/31 20:49
 */
@Controller
public class RootController {

    private static final Logger LOGGER= LogManager.getLogger(RootController.class);

    @GetMapping("{page}")
    public String page(@PathVariable("page")String page){
        return page;
    }

    //@RequestMapping(value = {"/user/quit","login-leader"})
    @RequestMapping(value = "/user/quit",method = RequestMethod.GET)
    public String quit(HttpSession session,SessionStatus status){
        System.out.println("=进入清除session=");
        session.removeAttribute("account");
        status.setComplete();
        System.out.println("==清理完成==");

        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/uploadFile",method = RequestMethod.POST)
    @ResponseBody
    public Boolean uploadFile(@RequestParam("file") MultipartFile file){

        if (file.isEmpty()){
            //model.addAttribute("msg", "上传文件失败，请选择文件");
            return false;
        }
        String originalFilename = file.getOriginalFilename();

        String filepath="f:/logs/";

        File newFile = new File(filepath + originalFilename);

        try {
            file.transferTo(newFile);
            LOGGER.info("success！");
            //model.addAttribute("msg", "上传已文件！");
            return true;
        } catch (Exception e) {
            LOGGER.error(e);
        }
        //model.addAttribute("msg", "上传文件失败，请检查是否正常操作！");
        return false;
    }
}
