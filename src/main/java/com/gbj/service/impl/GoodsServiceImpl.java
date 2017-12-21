package com.gbj.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gbj.mapper.GoodsMapper;
import com.gbj.mapper.GoodsOutMapper;
import com.gbj.mapper.OrderMapper;
import com.gbj.model.Goods;
import com.gbj.model.GoodsOut;
import com.gbj.service.GoodsService;
import com.gbj.utils.ImportExcelUtil;
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsOutMapper goodsOutMapper;
    @Autowired
    private OrderMapper orderMapper;
    
    //文件导入的工具
    ImportExcelUtil importExcel = new ImportExcelUtil();
    
    @Override
    public Map<String , Object> goodsMap(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Goods> goodsList = goodsMapper.goodsList(map);
        int count = goodsMapper.count(map);
        if(goodsList!=null&&goodsList.size()>0){
            map.put("goodsList" , goodsList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public int goodsAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = goodsMapper.goodsAdd((Goods) map.get("goods"));
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
        
    }
    @Override
    public Map<String , Object> load(Map<String , Object> map,Integer goods_id ) {
        // TODO Auto-generated method stub
        //查询将要要修改的信息
        map.put("gMap" , goodsMapper.load(goods_id));
        return map;
    }
    @Override
    public int goodsUpdateAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Goods goods = (Goods) map.get("goods");
        //System.out.println(goods);
        int result = goodsMapper.goodsUpdate(goods);
        if(result>0){
            map.put("message" , "修改成功");
        }else{
            map.put("message" , "修改失败");
        }
        return result;
    }
    @Override
    public int goodsDel(Map<String,Object> map, Integer goods_id ) {
        // TODO Auto-generated method stub
        int result = goodsMapper.goodsDel(goods_id);
        if(result>0){
            map.put("message" , "删除成功");
        }else{
            map.put("message" , "删除失败");
        }
        return result;
    }
    @Override
    public int goodsMoreDel(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        //        Integer[] goods_ids = (Integer[]) map.get("goods_ids");
        int result = goodsMapper.goodsMoreDel(map);
        if(result>0){
            map.put("message" , "删除成功");
        }else{
            map.put("message" , "删除失败");
        }
        return result;
    }
    //库存列表
    @Override
    public Map<String , Object> goodsStockList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Goods> goodsStockList = goodsMapper.goodsStockList(map);
        int count = goodsMapper.count(map);
        if(goodsStockList!=null&&goodsStockList.size()>0){
            map.put("goodsStockList" , goodsStockList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //弹出商品入库的窗口
    @Override
    public int goodsStockInUpdate(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Goods> goodsAllList = goodsMapper.findAllgoods();
        map.put("goodsAllList" , goodsAllList);
        return 0;
    }
    
    @Override
    public int goodsStockInUpdateAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = goodsMapper.goodsStockInUpdateAction((Goods) map.get("goods"));
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }
    //出库列表
    @Override
    public Map<String , Object> goodsStockOutList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<GoodsOut> goodsStockOutList = goodsOutMapper.goodsStockOutList(map);
        int count = goodsOutMapper.count(map);
        if(goodsStockOutList!=null&&goodsStockOutList.size()>0){
            map.put("goodsStockOutList" , goodsStockOutList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //柱状图X轴data数据
    @Override
    public List<Goods> stocking(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Goods> goodsAllList = goodsMapper.findAllgoods();
        map.put("goodsAllList" , goodsAllList);
        return goodsAllList;
    }
    //确认出库交易完成
    @Override
    public int confirmGoodsOut(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        GoodsOut goodsOut = (GoodsOut) map.get("goodsOut");
        GoodsOut goodsOut_or_id = goodsOutMapper.load(goodsOut.getGo_id());
        int result = goodsOutMapper.confirmGoodsOut(goodsOut);
        if(result>0){
            orderMapper.updateSignTwo(goodsOut_or_id.getFk_or_id());
            map.put("message" , "出库成功");
            return result;
        }else{
            throw new RuntimeException("出库失败");
        }
    }
    //文件导出
	@Override
	public List<Goods> goodsExcel() {
		// TODO Auto-generated method stub
		List<Goods> goodsAllList = goodsMapper.findAllgoods();
		return goodsAllList;
		
	}
	@Override
	public Map<String, Object> importGoodsExcel(Map<String, Object> resultMap,MultipartFile file, HttpServletRequest multipartRequest) throws IOException {
		// TODO Auto-generated method stub
//		List<Goods> goodsAllList = goodsMapper.findAllgoods();
		//Map<String, Object> resultMap = new HashMap<String, Object>();
         List<Goods> excelImportDataList=importExcel.getExcelInfo(file);
         if (excelImportDataList.size()>0){
             Integer result = goodsMapper.goodsMoreAdd(excelImportDataList);
             if (result > 0){
            	 resultMap.put("message", "信息导入成功");
                return resultMap;
             }else{
            	 resultMap.put("message", "信息导入失败");
                 return resultMap;
             }
         }else{
        	 resultMap.put("message", "传入的文件没有数据");
             return resultMap;
         }
	}
    
}
