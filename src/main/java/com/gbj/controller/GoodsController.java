package com.gbj.controller;

import com.gbj.model.Goods;
import com.gbj.model.GoodsOut;
import com.gbj.model.GoodsType;
import com.gbj.model.GoodsUnit;
import com.gbj.service.GoodsService;
import com.gbj.service.GoodsTypeService;
import com.gbj.service.GoodsUnitService;
import com.gbj.service.SupplierService;
import com.gbj.utils.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsTypeService goodsTypeService;
    @Autowired
    private GoodsUnitService goodsUnitService;
    @Autowired
    private SupplierService supplierService;
    
    @RequestMapping("/goodsList")
    //商品查询ji分页
    public String goodsList(Map<String , Object> map,Goods goods,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , goods , pages);
        map = goodsService.goodsMap(map);
        map = PageBean.clientMap(map , pages , request);
        return "goods/goodsList";
    }
    @RequestMapping("/goodsAdd")
    //查询商品添加的关联信息
    public String goodsAdd(Map<String , Object> map){
        //商品单位
        map = goodsUnitService.unitList(map);
        //商品类型
        map = goodsTypeService.typeList(map);
        //商品供应商
        map = supplierService.supList(map);
        return "goods/goodsAdd";
    }
    @RequestMapping("/goodsAddAction")
    //商品添加
    public String goodsAddAction(Map<String , Object> map,Goods goods,MultipartFile file){
        try{
            String name = FileUpload.fileUpload(file);
            goods.setGoods_logo(name);
            map.put("goods" , goods);
            //添加商品
            goodsService.goodsAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    @RequestMapping("/goodsUpdate")
    //通过ID查询要更改商品的信息
    public String goodsUpdate(Map<String , Object> map,Integer goods_id){
        map.put("goods_id" , goods_id);
        //商品单位
        map = goodsUnitService.unitList(map);
        //商品类型
        map = goodsTypeService.typeList(map);
        //商品供应商
        map = supplierService.supList(map);
        //查询要修改商品的信息
        map = goodsService.load(map,goods_id);
        return "goods/goodsUpdate";
    }
    @RequestMapping("/goodsUpdateAction")
    //保存已修改商品的信息到数据库中
    public String goodsUpdateAction(Map<String , Object> map,Goods goods){
        try{
            map.put("goods" , goods);
            //保存修改信息
            goodsService.goodsUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        
        return "main/message";
    }
    //通过ID弹出确认删除的信息框
    @RequestMapping("/del")
    public String del(Map<String , Object> map, Integer id){
        map.put("id" , id);
        map.put("url" , "goodsDel");
        return "main/del";
    }
    //通过ID删除该商品的信息，，，物理删除
    @RequestMapping("/goodsDel")
    public String goodsDel(Map<String , Object> map, Integer id){
        try{
            map.put("goods_id" , id);
            goodsService.goodsDel(map,id);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //暂无作用的批量删除
    /*@RequestMapping("/delMore")
    public String delMore(Map<String , Object> map,Integer[] goods_ids){
        map.put("goods_ids" , goods_ids);
        return "main/delMore";
    }*/
    //通过map进行的批量删除，商品ID存到数组中去
    @RequestMapping("/goodsMoreDel")
    public String goodsMoreDel(Map<String , Object> map,Integer[] goods_ids){
        try{
            map.put("goods_ids" , goods_ids);
            goodsService.goodsMoreDel(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //模糊查询及分页商品类型
    @RequestMapping("/goodsType")
    public String goodsTypeList(Map<String , Object> map,GoodsType goodsType,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , goodsType , pages);
        map = goodsTypeService.typeLikeList(map);
        map = PageBean.clientMap(map , pages , request);
        return "goods/goodsType";
    }
    //弹出添加页面
    @RequestMapping("/goodsTypeAdd")
    public String goodsTypeAdd(){
        return "goods/goodsTypeAdd";
    }
    //确认添加商品类型到数据库
    @RequestMapping("/goodsTypeAdd.action")
    public String goodsTypeAddAction(GoodsType goodsType,Map<String , Object> map){
        try{
            map.put("goodsType" , goodsType);
            goodsTypeService.goodsTypeAdd(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //通过ID弹出确认删除的信息框
    @RequestMapping("/typeDel")
    public String typeDel(Map<String , Object> map, Integer id){
        map.put("id" , id);
        map.put("url" , "goodsTypeDel.action");
        return "main/del";
    }
    //通过ID删除该类型的信息，，，物理删除
    @RequestMapping("/goodsTypeDel.action")
    public String goodsTypeDel(Map<String , Object> map, Integer id){
        try{
            map.put("goods_id" , id);
            goodsTypeService.goodsTypeDelAction(map,id);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //商品单位模糊查询及分页查询
    @RequestMapping("/goodsUnit")
    public String goodsUnitList(Map<String , Object> map,GoodsUnit goodsUnit,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            map = PageBean.serverMap(map , goodsUnit , pages);
            map = goodsUnitService.goodsUnitList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        
        return "goods/goodsUnit";
    }
    //弹出添加页面
    @RequestMapping("/goodsUnitAdd")
    public String goodsUnitAdd(){
        return "goods/goodsUnitAdd";
    }
    //确认添加商品类型到数据库
    @RequestMapping("/goodsUnitAdd.action")
    public String goodsUnitAddAction(GoodsUnit goodsUnit,Map<String , Object> map){
        try{
            map.put("goodsUnit" , goodsUnit);
            goodsUnitService.goodsUnitAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //通过ID弹出确认删除的信息框
    @RequestMapping("/unitDel")
    public String unitDel(Map<String , Object> map, Integer id){
        map.put("id" , id);
        map.put("url" , "goodsUnitDel.action");
        return "main/del";
    }
    //通过ID删除该类型的信息，，，物理删除
    @RequestMapping("/goodsUnitDel.action")
    public String goodsUnitDel(Map<String , Object> map, Integer id){
        try{
            map.put("goods_id" , id);
            goodsUnitService.goodsUnitDelAction(map,id);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    /*库存管理的内容*/
    //商品库存查询
    @RequestMapping("/goodsStock")
    //商品查询ji分页
    public String goodsStockList(Map<String , Object> map,Goods goods,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , goods , pages);
        map = goodsService.goodsStockList(map);
        map = PageBean.clientMap(map , pages , request);
        return "goods/goodsStockList";
    }
    //商品入库模糊查询及分页
    @RequestMapping("/goodsStockIn")
    public String goodsStockInList(Map<String , Object> map,Goods goods,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , goods , pages);
        map = goodsService.goodsStockList(map);
        map = PageBean.clientMap(map , pages , request);
        return "goods/goodsStockInList";
    }
    //弹出添加窗口
    @RequestMapping("/goodsStockInUpdate")
    public String goodsStockInUpdate(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        goodsService.goodsStockInUpdate(map);
        return "goods/goodsStockInUpdate";
    }
    //查询商品单价
    @RequestMapping("load")
    public void load(Integer goods_id,HttpServletResponse response,Map<String , Object> map) throws IOException{
        map = goodsService.load(map,goods_id);
        Gson gson = new Gson();
        String data = gson.toJson(map);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(data);
        out.flush();
        out.close();
    }
    //确认添加商品入库到数据库
    @RequestMapping("/goodsStockInUpdate.action")
    public String goodsStockInUpdateAction(Goods goods,Map<String , Object> map){
        try{
            String time = TimeDemo.dateTime();
            goods.setGoods_time(time);
            map.put("goods" , goods);
            goodsService.goodsStockInUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //出库列表
    @RequestMapping("/goodsStockOut")
    public String goodsStockOutList(Map<String , Object> map,GoodsOut goodsOut,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            map = PageBean.serverMap(map , goodsOut , pages);
            map = goodsService.goodsStockOutList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "goods/goodsStockOutList";
    }
    //库存盘点X轴数据 柱状图动态获取数据
    @RequestMapping("/datastocking")
    public void datastocking(Goods goods,Map<String , Object> map,HttpServletResponse response) throws IOException{
        List<Goods> goodsAllList = goodsService.stocking(map);
        Gson gson = new Gson();
        String data = gson.toJson(goodsAllList);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(data);
        out.flush();
        out.close();
        
    }
    //柱状图页面
    @RequestMapping("/stocking")
    public String stocking(Goods goods,Map<String , Object> map,HttpServletResponse response) throws IOException{
        return "goods/stocking";
    }
    //通过ID弹出确认确认出库页面
    @RequestMapping("/confirmGoodsOut")
    public String confirmGoodsOut(Map<String , Object> map, Integer go_id){
        map.put("go_id" , go_id);
        map.put("url" , "confirmGoodsOut.action");
        map.put("message" , "确定出库？");
        return "goods/confirmOut";
    }
    //确认出库修改标志
    @RequestMapping("/confirmGoodsOut.action")
    public String confirmGoodsOutAction(GoodsOut goodsOut,Map<String , Object> map){
        try{
            String time = TimeDemo.dateTime();
            goodsOut.setGo_stime(time);
            map.put("goodsOut" , goodsOut);
            goodsService.confirmGoodsOut(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    
    //文件导出
    @RequestMapping("/goodsExcel")
    public void goodsExcel(HttpServletResponse response) throws IOException{
    	List<Goods> goodsList = goodsService.goodsExcel();
    	String fileName = "商品详细.xlsx";
    	 String filePath = DownLoadExcel.goodsExcel(goodsList,fileName);
         //下载公共方法
         FileUtil.downloadFile(fileName,new File(filePath) ,response);
    			
    }
    //文件导入
    @RequestMapping("/goodsImportExcelDialog")
    public String goodsImportExcelDialog() throws IOException{
    	 return "main/importExcel";
    			
    }
    //文件导入测试
    @RequestMapping("/goodsImportExcel")
    public String goodsImportExcel(Map<String, Object> resultMap,MultipartFile file, HttpServletRequest multipartRequest) throws IOException{
    	 String filePath= FileUtil.getRootLocation()+ File.separator;
         File group=new File(filePath+"importExcel");
         if(!group.exists()){
             group.mkdirs();
         }
         String filename = FileUtil.getNewFileName(filePath+"importExcel",file.getOriginalFilename());
         File newFile=null;
         try {
             newFile = FileUtil.getFile(file.getInputStream(), group.getAbsolutePath() + File.separator + filename);
         } catch (IOException e) {
             newFile=null;
         }
         if (file != null) {
        	 resultMap = goodsService.importGoodsExcel(resultMap,file,multipartRequest);
         }
         System.out.println(resultMap.get("message"));
		return "main/message";
    }

}
