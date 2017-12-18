package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.EconomicType;

public interface EconomicTypeMapper {
    public Map<String , Object> load(Integer et_id);
    public List<EconomicType> economicTypeList();
}
