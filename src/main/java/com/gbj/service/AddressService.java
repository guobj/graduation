package com.gbj.service;

import java.util.List;
import java.util.Map;

import com.gbj.model.City;
import com.gbj.model.Country;
import com.gbj.model.Province;

public interface AddressService {
    public List<Province> provinceList(Map<String , Object> map);
    public List<City> cityList(Map<String , Object> map);
    public List<Country> countryList(Map<String , Object> map);
}
