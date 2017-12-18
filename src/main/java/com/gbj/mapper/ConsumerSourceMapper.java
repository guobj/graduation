package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.ConsumerSource;

public interface ConsumerSourceMapper {
    public Map<String , Object> load(Integer cs_id);
    public List<ConsumerSource> consumerSourceList();
}
