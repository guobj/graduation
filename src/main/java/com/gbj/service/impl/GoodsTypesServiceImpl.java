package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.GoodsTypeMapper;
import com.gbj.model.GoodsType;
import com.gbj.service.GoodsTypeService;
@Service
public class GoodsTypesServiceImpl implements GoodsTypeService {
    @Autowired
    private GoodsTypeMapper goodsTypeMapper;
    @Override
    public Map<String , Object> typeList(Map<String , Object> map){
        List<GoodsType> typeList = goodsTypeMapper.typeList();
        map.put("typeList" , typeList);
        return map;
    }
    @Override
    public Map<String , Object> typeLikeList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<GoodsType> typeLikeList = goodsTypeMapper.typeLikeList(map);
        int count = goodsTypeMapper.count(map);
        if(typeLikeList!=null&&typeLikeList.size()>0){
            map.put("typeLikeList" , typeLikeList);
            map.put("count" , count);
            return map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public int goodsTypeAdd(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = goodsTypeMapper.goodsTypeAddAction((GoodsType)map.get("goodsType"));
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }

    }
    @Override
    public GoodsType goodsTypeDelAction(Integer gt_id ) {
        GoodsType load = goodsTypeMapper.load(gt_id);
        int result = goodsTypeMapper.goodsTypeDelAction(gt_id);
        if(result>0){
            return load;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
}
