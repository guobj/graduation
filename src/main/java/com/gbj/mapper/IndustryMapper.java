package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Industry;

public interface IndustryMapper {
    public Map<String , Object> load(Integer in_id);
    public List<Industry> industryList();
}
