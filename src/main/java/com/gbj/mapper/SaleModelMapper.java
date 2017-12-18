package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.SaleModel;

public interface SaleModelMapper {
    public Map<String , Object> load(Integer sm_id);
    public List<SaleModel> saleModelList();
}
