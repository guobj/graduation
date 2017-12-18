package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.ConsumerGrandMapper;
import com.gbj.mapper.ConsumerMapper;
import com.gbj.mapper.ConsumerSourceMapper;
import com.gbj.mapper.EconomicTypeMapper;
import com.gbj.mapper.IndustryMapper;
import com.gbj.mapper.SaleModelMapper;
import com.gbj.model.Consumer;
import com.gbj.model.ConsumerGrand;
import com.gbj.model.ConsumerSource;
import com.gbj.model.EconomicType;
import com.gbj.model.Industry;
import com.gbj.model.SaleModel;
import com.gbj.service.ConsumerService;
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
    public int consumerDel(Map<String , Object> map , Integer con_id ) {
        // TODO Auto-generated method stub
        int result = consumerMapper.consumerDel(con_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
        
    }
    @Override
    public int consumerMoreDel(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = consumerMapper.consumerMoreDel(map);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
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
    public int consumerGrandDelAction(Map<String , Object> map, Integer cg_id ) {
        // TODO Auto-generated method stub
        int result = consumerGrandMapper.consumerGrandDelAction(cg_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
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
