package com.gbj.controller;

import com.gbj.model.Consumer;
import com.gbj.model.ConsumerGrand;
import com.gbj.service.ConsumerService;
import com.gbj.utils.FileUpload;
import com.gbj.utils.JacksonData;
import com.gbj.utils.PageBean;
import com.gbj.utils.TimeDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class ConsumerController {
    @Autowired
    private ConsumerService consumerService;
    @RequestMapping("/consumerList")
    //客户基本信息查询及分页
    public String consumerList(Map<String , Object> map,Consumer consumer,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try {
            map = PageBean.serverMap(map , consumer , pages);
            map = consumerService.consumerList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch (Exception e){
            map.put("message",e.getMessage());
        }
        return "consumer/consumerList";
    }
    //弹出添加框 客户基本信息
    @RequestMapping("/consumerAdd")
    public String consumerAdd(Map<String , Object> map){
        map = consumerService.consumerAdd(map);
        return "consumer/consumerAdd";
    }
    //添加客户基本信息
    @RequestMapping("/consumerAdd.action")
    public String consumerAddAction(Map<String , Object> map,Consumer consumer,MultipartFile file) throws IllegalStateException, IOException{
        //生成创建客户的时间
        String time = TimeDemo.dateTime();
        consumer.setCon_time(time);
        //上传用户头像
        String name = FileUpload.fileUpload(file);
        consumer.setCon_logo(name);
        //goods.setGoods_logo(name);
        try{
            map.put("consumer" , consumer);
            consumerService.consumerAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";

    }
    //弹出将要修改客户的信息
    @RequestMapping("/consumerUpdate")
    public String consumerUpdate(Map<String , Object> map,Integer con_id){
        map = consumerService.load(map , con_id);
        return "consumer/consumerUpdate";
    }
    //提交保存修改的信息
    @RequestMapping("/consumerUpdate.action")
    public String consumerUpdateAction(Map<String , Object> map,Consumer consumer,MultipartFile file){
        try{
            //上传用户头像
            String name = FileUpload.fileUpload(file);
            consumer.setCon_logo(name);
            map.put("consumer" , consumer);
            consumerService.consumerUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
        
    }

    //通过ID删除该类型的信息，，，物理删除
    @RequestMapping("/consumerDel")
    @ResponseBody
    public JacksonData consumerDel(@RequestParam Integer id){
        JacksonData data = new JacksonData();
        Consumer consumer = consumerService.consumerDel(id);
        data.success(consumer);
        return data;
    }

    //通过map进行的批量删除，商品ID存到数组中去
    @RequestMapping("/consumerMoreDel")
    @ResponseBody
    public JacksonData consumerMoreDel(Integer[] ids){
        JacksonData backData = new JacksonData();
        List data = consumerService.consumerMoreDel(ids);
        backData.success(data);
        return backData;
    }
    @RequestMapping("/consumerRemark")
    //客户备注信息查询ji分页
    public String consumerRemarkList(Map<String , Object> map,Consumer consumer,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , consumer , pages);
        map = consumerService.consumerList(map);
        map = PageBean.clientMap(map , pages , request);
        return "consumer/consumerRemark";
    }
    //弹出将要修改客户客户的信息
    @RequestMapping("/consumerRemarkUpdate")
    public String consumerRemarkUpdate(Map<String , Object> map,Integer con_id){
        map = consumerService.load(map , con_id);
        return "consumer/consumerRemarkUpdate";
    }
    //提交保存修改的备注信息
    @RequestMapping("/consumerRemarkUpdate.action")
    public String consumerRemarkUpdateAction(Map<String , Object> map,Consumer consumer){
        try{
            map.put("consumer" , consumer);
            consumerService.consumerUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
        
    }

    //客户等级分页
    @RequestMapping("/consumerGrand")
    public String consumerGrandPageList(Map<String , Object> map,ConsumerGrand consumerGrand,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , consumerGrand , pages);
        map = consumerService.consumerGrandPageList(map);
        map = PageBean.clientMap(map , pages , request);
        return "consumer/consumerGrandPageList";
    }

    //客户等级逻辑删除
    //单个删除
    @RequestMapping(value = "/consumerGrandDel",produces = "application/json",consumes = "application/json")
    @ResponseBody
    public JacksonData consumerGrandDel(@RequestParam Integer id){
        JacksonData data = new JacksonData();
        ConsumerGrand consumerGrand = consumerService.consumerGrandDelAction(id);
        data.success(consumerGrand);
        return data;
    }
    //弹出添加信息的窗口
    @RequestMapping("/consumerGrandAdd")
    public String consumerGrandAdd(){
        return "consumer/consumerGrandAdd";
    }
    //提交并保存添加的新等级
    @RequestMapping("/consumerGrandAdd.action")
    public String consumerGrandAddAction(ConsumerGrand consumerGrand,Map<String , Object> map){
        try{
            map.put("consumerGrand" , consumerGrand);
            consumerService.consumerGrandAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
}
