package com.gbj.service.impl;

import com.gbj.mapper.*;
import com.gbj.model.*;
import com.gbj.service.ConsumerService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ConsumerServiceImpl implements ConsumerService {

    @Autowired
    private ConsumerMapper consumerMapper;
    @Autowired
    private ConsumerSourceMapper consumerSourceMapper;
    @Autowired
    private ConsumerGrandMapper consumerGrandMapper;
    @Autowired
    private EconomicTypeMapper economicTypeMapper;
    @Autowired
    private IndustryMapper industryMapper;
    @Autowired
    private SaleModelMapper saleModelMapper;
    @Override
    public Map<String , Object> consumerList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Consumer> consumerList = consumerMapper.consumerList(map);
        int count = consumerMapper.count(map);
        if(consumerList!=null&&consumerList.size()>0){
            map.put("consumerList" , consumerList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public Map<String , Object> consumerAdd(Map<String , Object> map) {
        // TODO Auto-generated method stub
        List<ConsumerSource> consumerSourceList = consumerSourceMapper.consumerSourceList();
        List<ConsumerGrand> consumerGrandList = consumerGrandMapper.consumerGrandList();
        List<EconomicType> economicTypeList = economicTypeMapper.economicTypeList();
        List<Industry> industryList = industryMapper.industryList();
        List<SaleModel> saleModelList = saleModelMapper.saleModelList();
        map.put("saleModelList" , saleModelList);
        map.put("consumerSourceList" , consumerSourceList);
        map.put("consumerGrandList" , consumerGrandList);
        map.put("economicTypeList" , economicTypeList);
        map.put("industryList" , industryList);
        return map;
    }
    @Override
    public int consumerAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Consumer consumer = (Consumer) map.get("consumer");
        int result = consumerMapper.consumerAddAction(consumer);
        if(result>0){
            map.put("message" , "新建成功");
            return result;
        }else{
            throw new RuntimeException("新建失败");
        }

    }
    @Override
    public Map<String , Object> load(Map<String , Object> map , Integer con_id ) {
        // TODO Auto-generated method stub
        List<ConsumerSource> consumerSourceList = consumerSourceMapper.consumerSourceList();
        List<ConsumerGrand> consumerGrandList = consumerGrandMapper.consumerGrandList();
        List<EconomicType> economicTypeList = economicTypeMapper.economicTypeList();
        List<Industry> industryList = industryMapper.industryList();
        List<SaleModel> saleModelList = saleModelMapper.saleModelList();
        map.put("saleModelList" , saleModelList);
        map.put("consumerSourceList" , consumerSourceList);
        map.put("consumerGrandList" , consumerGrandList);
        map.put("economicTypeList" , economicTypeList);
        map.put("industryList" , industryList);
        map.put("consumerMap" , consumerMapper.load(con_id));
        return map;
    }
    @Override
    public int consumerUpdateAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Consumer consumer = (Consumer) map.get("consumer");
        int result = consumerMapper.consumerUpdateAction(consumer);
        if(result>0){
            map.put("message" , "修改成功");
            return result;
        }else{
            throw new RuntimeException("修改失败");
        }

    }
    @Override
    public Consumer consumerDel(Integer con_id ) {
        // TODO Auto-generated method stub
        Consumer consumer = consumerMapper.load(con_id);
        int result = consumerMapper.consumerDel(con_id);
        if(result>0){
            return consumer;
        }
        return null;
        
    }
    @Override
    public List consumerMoreDel(Integer[] ids) {
        // TODO Auto-generated method stub
        List consumerList = consumerMapper.findAllList();
        int result = consumerMapper.consumerMoreDel(ids);
        if(result>0){
            return consumerList;
        }
        return  null;
    }
    //客户等级分页
    @Override
    public Map<String , Object> consumerGrandPageList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<ConsumerGrand> consumerGrandPageList = consumerGrandMapper.consumerGrandPageList(map);
        int count = consumerGrandMapper.count(map);
        if(consumerGrandPageList!=null&&consumerGrandPageList.size()>0){
            map.put("consumerGrandPageList" , consumerGrandPageList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //客户等级逻辑删除
    @Override
    public ConsumerGrand consumerGrandDelAction( Integer cg_id ) {
        // TODO Auto-generated method stub
        ConsumerGrand consumerGrand = consumerGrandMapper.load(cg_id);
        int result = consumerGrandMapper.consumerGrandDelAction(cg_id);
        if(result>0){
            return consumerGrand;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    //添加新等级
    @Override
    public int consumerGrandAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = consumerGrandMapper.consumerGrandAddAction((ConsumerGrand)map.get("consumerGrand"));
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }


    
    
}
