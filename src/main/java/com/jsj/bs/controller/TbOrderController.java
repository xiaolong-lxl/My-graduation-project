package com.jsj.bs.controller;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbOrder;
import com.jsj.bs.service.TbOrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * 报修单表(TbOrder)表控制层
 *
 * @author makejava
 * @since 2020-01-06 15:23:40
 */
@Controller
@RequestMapping("/tbOrder")
public class TbOrderController {

    private static final Logger LOGGER = LogManager.getLogger(TbOrderController.class);

    /**
     * 服务对象
     */
    @Autowired
    private TbOrderService tbOrderService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping(value = "/selectOne/{id}", method = RequestMethod.GET)
    @ResponseBody
    public TbOrder selectOne(@PathVariable("id") int id) {
        LOGGER.info("==================================" + id);
        LOGGER.info(tbOrderService.queryById(id));
        return tbOrderService.queryById(id);
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbOrder  实体
     * @return PageInfo<TbOrder> 分页数据集合
     */
    @RequestMapping(value = "/searchAll", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<TbOrder> searchAll(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, TbOrder tbOrder) {

        LOGGER.info(tbOrder+"========="+page + "====" + pageSize + "=========" + tbOrderService.queryAll(page, pageSize, tbOrder));

        return tbOrderService.queryAll(page, pageSize, tbOrder);
    }

    /**
     * 更新数据
     *
     * @param tbOrder
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Boolean update(TbOrder tbOrder) {

        LOGGER.info(tbOrder + "+=============update===========+" + tbOrderService.update(tbOrder));

        return tbOrderService.update(tbOrder);
    }

    /**
     * 根据id更新报修单状态和状态详情
     *
     * @param orderId
     * @param statu
     * @param statuDesc
     * @return
     */
    @RequestMapping(value = "/updateDesc", method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateDesc(@RequestParam("orderId") Integer orderId,@RequestParam("statu")String statu,@RequestParam("statuDesc")String statuDesc) {

        TbOrder tbOrder = new TbOrder();
        tbOrder.setOrderId(orderId);
        tbOrder.setStatu(statu);
        tbOrder.setStatuDesc(statuDesc);
        LOGGER.info(tbOrder + "+=============updateDesc===========+" + tbOrderService.update(tbOrder));

        return tbOrderService.update(tbOrder);
    }

    /**
     * 添加报修单
     * @param tbOrder  报修单
     * @param file1  文件1
     * @param file2  文件2
     * @param model 莫得
     * @param request 请求
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/addOrder", method = RequestMethod.POST)
    public String addOrder(TbOrder tbOrder, MultipartFile file1, MultipartFile file2, Model model, HttpServletRequest request) throws IOException {
        LOGGER.info(tbOrder + "+============addOrder============+");

        String filename1 = null;
        String filename2 = null;
        //设置图片上传路径
        String path = request.getSession().getServletContext().getRealPath("/upload");
        LOGGER.info("========path===========" + path.toString());
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }

        //获取源文件名
        filename1 = file1.getOriginalFilename();
        filename2 = file2.getOriginalFilename();
        //LOGGER.info(filename1 + "----------11111111111111---------" + filename2);

        //获取文件的扩展名
        //String ext1 = "." + FilenameUtils.getExtension(filename1);
       // String ext2 = "." + FilenameUtils.getExtension(filename2);
        //LOGGER.info(ext1 + "----------11111111111111---------" + ext2);
        //完成文件上传
        if (!filename1.equals("")) {
            //把文件的的名称设置成唯一值：uuid
            filename1 = UUID.randomUUID().toString().replace("-", "") + "_" + filename1 ;
            //将图片保存
            file1.transferTo(new File("F:/upload/" + filename1));
            //添加路径到数据库
            tbOrder.setOrderImg1(filename1);
        }
        if (!filename2.equals("")) {
            //把文件的的名称设置成唯一值：uuid
            filename2 = UUID.randomUUID().toString().replace("-", "") + "_" + filename2 ;
            //将图片保存
            file2.transferTo(new File("F:/upload/" + filename2));
            //添加路径到数据库
            tbOrder.setOrderImg2(filename2);
        }
        //LOGGER.info(filename1 + "----------33333333---------" + filename2);
        // LOGGER.info(filename1 + "+============addOrder=Controller===========+" + filename2);

        //添加时间
        Date date = new Date();
        tbOrder.setAddTime(date);
        TbOrder addOrder = tbOrderService.insert(tbOrder);

        LOGGER.info(addOrder + "+============addOrder=Controller===========+");
        model.addAttribute("msg", "success");
        return "userpage-2";
    }


    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param leaderId 负责人id
     * @return PageInfo<TbOrder> 分页数据集合
     */
    @RequestMapping(value = "/searchByLId", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<TbOrder> searchByLId(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, @RequestParam("leaderId") int leaderId) {

        LOGGER.info("====负责人id=========+"+leaderId);
        TbOrder tbOrder = new TbOrder();
        tbOrder.setLeaderId(leaderId);
        LOGGER.info(tbOrder+"========="+page + "====" + pageSize + "=========" + tbOrderService.queryAll(page, pageSize, tbOrder));
        return tbOrderService.queryAll(page, pageSize, tbOrder);
    }

}