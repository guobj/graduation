package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.City;
import com.gbj.model.Country;
import com.gbj.model.Province;

public interface AddressMapper {
    public Map<String , Object> loadProvince(String pro_id);
    public Map<String , Object> loadCity(String c_id);
    public Map<String , Object> loadCountry(String a_id);
    public List<Province> provinceList();
    public List<City> cityList(String provinceID);
    public List<Country> countryList(String cityID);
}
