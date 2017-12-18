package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.AddressMapper;
import com.gbj.model.City;
import com.gbj.model.Country;
import com.gbj.model.Province;
import com.gbj.service.AddressService;
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Override
    public List<Province> provinceList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Province> provinceList = addressMapper.provinceList();
        if(provinceList!=null&&provinceList.size()>0){
            map.put("provinceList" , provinceList);
        }else{
            map.put("message" , "没有数据");
        }
        return provinceList;
    }
    @Override
    public List<City> cityList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<City> cityList = addressMapper.cityList(map.get("provinceID").toString());
        //System.out.println(map.get("provinceID").toString());
        if(cityList!=null&&cityList.size()>0){
            map.put("cityList" , cityList);
        }else{
            map.put("message" , "没有数据");
        }
        return cityList;
    }
    @Override
    public List<Country> countryList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Country> countryList = addressMapper.countryList(map.get("cityID").toString());
        if(countryList!=null&&countryList.size()>0){
            map.put("countryList" , countryList);
        }else{
            map.put("message" , "没有数据");
        }
        return countryList;
    }


    
}
