package com.gbj.mapper;

import com.gbj.model.ConsumerGrand;

import java.util.List;
import java.util.Map;

public interface ConsumerGrandMapper {
    public ConsumerGrand load(Integer cg_id);
    public List<ConsumerGrand> consumerGrandList();
    public List<ConsumerGrand> consumerGrandPageList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    public int consumerGrandDelAction(Integer cg_id);
    public int consumerGrandAddAction(ConsumerGrand consumerGrand);
}
