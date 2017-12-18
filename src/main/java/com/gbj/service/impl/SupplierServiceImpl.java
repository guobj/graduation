package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.ConsumerGrandMapper;
import com.gbj.mapper.EconomicTypeMapper;
import com.gbj.mapper.GoodsMapper;
import com.gbj.mapper.LicenseTypeMapper;
import com.gbj.mapper.SupplierGoodsMapper;
import com.gbj.mapper.SupplierLicenseTypeMapper;
import com.gbj.mapper.SupplierMapper;
import com.gbj.model.ConsumerGrand;
import com.gbj.model.EconomicType;
import com.gbj.model.Goods;
import com.gbj.model.LicenseType;
import com.gbj.model.Supplier;
import com.gbj.model.SupplierGoods;
import com.gbj.model.SupplierLicenseType;
import com.gbj.service.SupplierService;
@Service
public class SupplierServiceImpl implements SupplierService {
    @Autowired
    private SupplierMapper supplierMapper;
    @Autowired
    private ConsumerGrandMapper consumerGrandMapper;
    @Autowired
    private EconomicTypeMapper economicTypeMapper;
    @Autowired
    private SupplierGoodsMapper supplierGoodsMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private SupplierLicenseTypeMapper supplierLicenseTypeMapper;
    @Autowired
    private LicenseTypeMapper licenseTypeMapper;
    @Override
    public Map<String , Object> supList(Map<String , Object> map){
        List<Supplier> supList = supplierMapper.supList();
        map.put("supList" , supList);
        return map;
        
    }
    //供应商资料及分页
    @Override
    public Map<String , Object> supplierList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Supplier> supplierList = supplierMapper.supplierList(map);
        int count = supplierMapper.count(map);
        if(supplierList!=null&&supplierList.size()>0){
            map.put("supplierList" , supplierList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //添加供应商
    //查询相关资料
    @Override
    public Map<String , Object> supplierAdd(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<ConsumerGrand> consumerGrandList = consumerGrandMapper.consumerGrandList();
        List<EconomicType> economicTypeList = economicTypeMapper.economicTypeList();
        map.put("consumerGrandList" , consumerGrandList);
        map.put("economicTypeList" , economicTypeList);
        return map;
    }
    @Override
    public int supplierAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Supplier supplier = (Supplier) map.get("supplier");
        int result = supplierMapper.supplierAddAction(supplier);
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }
    //查询要修改供应商的资料ByID
    @Override
    public Map<String , Object> load(Map<String , Object> map , Integer sup_id ) {
        // TODO Auto-generated method stub
        List<ConsumerGrand> consumerGrandList = consumerGrandMapper.consumerGrandList();
        List<EconomicType> economicTypeList = economicTypeMapper.economicTypeList();
        map.put("consumerGrandList" , consumerGrandList);
        map.put("economicTypeList" , economicTypeList);
        map.put("supplierMap" , supplierMapper.load(sup_id));
        return map;
    }
    //保存修改的供应商信息
    @Override
    public int supplierUpdateAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Supplier supplier = (Supplier) map.get("supplier");
        int result = supplierMapper.supplierUpdateAction(supplier);
        if(result>0){
            map.put("message" , "修改成功");
            return result;
        }else{
            throw new RuntimeException("修改失败");
        }
    }
    //逻辑删除一条数据ByID
    @Override
    public int supplierDelAction(Map<String , Object> map , Integer sup_id ) {
        // TODO Auto-generated method stub
        int result = supplierMapper.supplierDelAction(sup_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    //逻辑删除多条数据ByIDs
    @Override
    public int supplierMoreDelAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = supplierMapper.supplierMoreDelAction(map);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
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
    @Override
    public Map<String , Object> supplierGoodsList(Map<String , Object> map ) {
        SupplierGoods suppliergoods = (SupplierGoods)map.get("suppliergoods");
        // TODO Auto-generated method stub
        List<Map<String , Object>> supplierGoodsList = supplierGoodsMapper.supplierGoodsList(map);
        int count = supplierGoodsMapper.count(map);
        if(supplierGoodsList!=null&&supplierGoodsList.size()>0){
            map.put("supplierGoodsList" , supplierGoodsList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //查询下拉列表的相关内容
    @Override
    public Map<String , Object> supplierGoodsAdd(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Supplier> supplierList = supplierMapper.supList();
        List<Goods> goodsList = goodsMapper.findAllgoods();
        map.put("goodsList" , goodsList);
        map.put("supplierList" , supplierList);
        return map;
    }
    //新增供应商报价
    @Override
    public int supplierGoodsAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        SupplierGoods supplierGoods = (SupplierGoods) map.get("supplierGoods");
        int result = supplierGoodsMapper.supplierGoodsAddAction(supplierGoods);
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }
    //逻辑删除一条数据
    @Override
    public int supplierGoodsDelAction(Map<String , Object> map , Integer sg_id ) {
        // TODO Auto-generated method stub
        int result = supplierGoodsMapper.supplierGoodsDelAction(sg_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    //逻辑删除多条数据
    @Override
    public int supplierGoodsMoreDelAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = supplierGoodsMapper.supplierGoodsMoreDelAction(map);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
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
    @Override
    public Map<String , Object> supplierLicenseList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Map<String , Object>> supplierLicenseList = supplierLicenseTypeMapper.supplierLicenseList(map);
        int count = supplierLicenseTypeMapper.count(map);
        if(supplierLicenseList!=null&&supplierLicenseList.size()>0){
            map.put("supplierLicenseList" , supplierLicenseList);
            map.put("count" , count);
            //System.out.println(goodsList);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //查询下拉列表的相关内容
    @Override
    public Map<String , Object> supplierLicenseAdd(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<LicenseType> supplierLicenseList = licenseTypeMapper.finAllLicense();
        List<Supplier> supplierList = supplierMapper.supList();
        map.put("supplierLicenseList" , supplierLicenseList);
        map.put("supplierList" , supplierList);
        return map;
    }
    //新增证照
    @Override
    public Map<String , Object> supplierLicenseAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        SupplierLicenseType supplierLicenseType = (SupplierLicenseType) map.get("supplierLicenseType");
        int result = supplierLicenseTypeMapper.supplierLicenseAddAction(supplierLicenseType);
        if(result>0){
            map.put("message" , "添加成功");

        }else{
            throw new RuntimeException("添加失败");
        }
        return map;
    }
    //逻辑删除一条数据ById
    @Override
    public int supplierLicenseDelAction(Map<String , Object> map , Integer st_id ) {
        // TODO Auto-generated method stub
        int result = supplierLicenseTypeMapper.supplierLicenseDelAction(st_id);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    //逻辑批量删除数据ByIds
    @Override
    public int supplierLicenseMoreDelAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        int result = supplierLicenseTypeMapper.supplierLicenseMoreDelAction(map);
        if(result>0){
            map.put("message" , "删除成功");
            return result;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    
    
    
}
