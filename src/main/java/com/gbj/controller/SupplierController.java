package com.gbj.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gbj.utils.JacksonData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gbj.model.Supplier;
import com.gbj.model.SupplierGoods;
import com.gbj.model.SupplierLicenseType;
import com.gbj.service.SupplierService;
import com.gbj.utils.FileUpload;
import com.gbj.utils.PageBean;
import com.gbj.utils.TimeDemo;

@Controller
public class SupplierController {
    @Autowired
    private SupplierService supplierService;
    @RequestMapping("/supplierList")
    //客户基本信息查询ji分页
    public String supplierList(Map<String , Object> map,Supplier supplier,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            map = PageBean.serverMap(map , supplier , pages);
            map = supplierService.supplierList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "supplier/supplierList";
    }
    //弹出添加信息框
    @RequestMapping("/supplierAdd")
    public String employeeAdd(Map<String , Object> map){
        map = supplierService.supplierAdd(map);
        return "supplier/supplierAdd";
    }
    //提交并v保存添加的供应商
    @RequestMapping("/supplierAdd.action")
    public String supplierAddAction(Map<String , Object> map,Supplier supplier,MultipartFile file) throws IllegalStateException, IOException{
        //生成创建客户的时间
        String time = TimeDemo.dateTime();
        supplier.setSup_time(time);
        //上传用户头像
        String name = FileUpload.fileUpload(file);
        supplier.setSup_logo(name);
        map.put("supplier" , supplier);
        try{
            supplierService.supplierAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //弹出将要修改用户的信息
    @RequestMapping("/supplierUpdate")
    public String supplierUpdate(Map<String , Object> map,Integer sup_id){
        map = supplierService.load(map , sup_id);
        return "supplier/supplierUpdate";
    }
    //提交保存修改的用户信息信息
    @RequestMapping("/supplierUpdate.action")
    public String supplierUpdateAction(Map<String , Object> map,Supplier supplier,MultipartFile file){
        try{
            //上传用户头像
            String name = FileUpload.fileUpload(file);
            supplier.setSup_logo(name);
            map.put("supplier" , supplier);
            supplierService.supplierUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //通过ID删除该用户的信息，，，逻辑删除
    @RequestMapping("/supplierDel")
    @ResponseBody
    public JacksonData supplierDelAction(@RequestParam Integer id){
        JacksonData backData = new JacksonData();
        Supplier supplier = supplierService.supplierDelAction(id);
        backData.success(supplier);
        return backData;
    }
    //通过map进行的批量删除，用户ID存到数组中去
    @RequestMapping("/supplierMoreDel")
    @ResponseBody
    public JacksonData supplierMoreDelAction(Integer[] ids){
        JacksonData backData = new JacksonData();
        List list = supplierService.supplierMoreDelAction(ids);
        backData.success(list);
        return backData;
    }
    
    /*
     *
     *
     *
     *
     * 供应商报价管理
     *
     *
     *
     *
     *
     * */
    //报价分页
    @RequestMapping("/supplierPriceList")
    public String supplistPriceList(Map<String , Object> map,SupplierGoods supplierGoods,
            @RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            System.out.println("接到值为"+supplierGoods);
            map = PageBean.serverMap(map , supplierGoods , pages);
            map = supplierService.supplierGoodsList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            e.printStackTrace();
            map.put("message" , e.getMessage());
        }
        return "supplier/supplierPriceList";
    }
    //新增报价
    @RequestMapping("/supplierGoodsAdd")
    public String supplierGoodsAdd(Map<String , Object> map){
        map = supplierService.supplierGoodsAdd(map);
        return "supplier/supplierGoodsAdd";
    }
    @RequestMapping("/supplierGoodsAdd.action")
    public String supplierGoodsAddAction(Map<String , Object> map,SupplierGoods supplierGoods){
        try{
            map.put("supplierGoods" , supplierGoods);
            supplierService.supplierGoodsAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }

        return "main/message";
    }

    //通过ID删除该b报价的信息，，，逻辑删除
    @RequestMapping("/supplierGoodsDel")
    @ResponseBody
    public JacksonData supplierGoodsDelAction(@RequestParam Integer id){
        JacksonData backData = new JacksonData();
        SupplierGoods supplierGoods = supplierService.supplierGoodsDelAction(id);
        backData.success(supplierGoods);
        return backData;
    }

    //通过map进行的批量删除，用户ID存到数组中去
    @RequestMapping("/supplierGoodsMoreDel")
    @ResponseBody
    public JacksonData supplierGoodsMoreDelAction(Integer[] ids){
        JacksonData backData = new JacksonData();
        List list = supplierService.supplierGoodsMoreDelAction(ids);
        backData.success(list);
        return backData;
    }
    /*
     *
     *
     *
     *
     * 供应商证照管理
     *
     *
     *
     *
     *
     * */
    @RequestMapping("/supplierLtList")
    //客户基本信息查询ji分页
    public String supplierLicenseList(Map<String , Object> map,SupplierLicenseType supplierLicenseType,
            @RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            map = PageBean.serverMap(map , supplierLicenseType , pages);
            map = supplierService.supplierLicenseList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "supplier/supplierLtList";
    }
    //新增证照
    @RequestMapping("/supplierLicenseAdd")
    public String supplierLicenseAdd(Map<String , Object> map){
        map = supplierService.supplierLicenseAdd(map);
        return "supplier/supplierLicenseAdd";
    }
    @RequestMapping("/supplierLicenseAdd.action")
    public String supplierLicenseAddAction(Map<String , Object> map,SupplierLicenseType supplierLicenseType){
        try{
            map.put("supplierLicenseType" , supplierLicenseType);
            supplierService.supplierLicenseAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }

        return "main/message";
    }
    //通过ID删除该b报价的信息，，，逻辑删除
    @RequestMapping("/supplierLicenseDel")
    @ResponseBody
    public JacksonData supplierLicenseDelAction(@RequestParam Integer id){
        JacksonData backData = new JacksonData();
        SupplierLicenseType supplierLicenseType = supplierService.supplierLicenseDelAction(id);
        backData.success(supplierLicenseType);
        return backData;
    }
    //用户ID存到数组中去
    @RequestMapping("/supplierLicenseMoreDel")
    @ResponseBody
    public JacksonData supplierLicenseMoreDelAction(Integer[] ids){
        JacksonData backData = new JacksonData();
        List list = supplierService.supplierLicenseMoreDelAction(ids);
        backData.success(list);
        return backData;
    }
}