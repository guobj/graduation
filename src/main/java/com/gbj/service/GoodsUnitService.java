package com.gbj.service;

import java.util.Map;

public interface GoodsUnitService {
    public Map<String , Object> unitList(Map<String , Object> map);
    public Map<String , Object> goodsUnitList(Map<String , Object> map);
    public int goodsUnitAddAction(Map<String , Object> map);
    public int goodsUnitDelAction(Map<String , Object> map,Integer gu_id);
}
