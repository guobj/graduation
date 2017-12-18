package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.GoodsUnitMapper;
import com.gbj.model.GoodsUnit;
import com.gbj.service.GoodsUnitService;
@Service
public class GoodsUnitServiceImpl implements GoodsUnitService {
    @Autowired
    private GoodsUnitMapper goodsUnitMapper;
    @Override
    public Map<String , Object> unitList(Map<String , Object> map){
        List<GoodsUnit> unitList = goodsUnitMapper.unitList();
        map.put("unitList" , unitList);
        return map;

    }
    @Override
    public Map<String , Object> goodsUnitList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<GoodsUnit> goodsUnitList = goodsUnitMapper.goodsUnitList(map);
        int count = goodsUnitMapper.count(map);
        if(goodsUnitList!=null&&goodsUnitList.size()>0){
            map.put("goodsUnitList" , goodsUnitList);
            map.put("count" , count);
            return map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public int goodsUnitAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = goodsUnitMapper.goodsUnitAddAction((GoodsUnit)map.get("goodsUnit"));
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }
    @Override
    public int goodsUnitDelAction(Map<String , Object> map , Integer gu_id ) {
        // TODO Auto-generated method stub
        int result = goodsUnitMapper.goodsUnitDelAction(gu_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
}
