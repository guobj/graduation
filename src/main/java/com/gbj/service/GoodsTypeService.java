package com.gbj.service;

import java.util.Map;

public interface GoodsTypeService {
    public Map<String , Object> typeList(Map<String , Object> map);
    public Map<String , Object> typeLikeList(Map<String , Object> map);
    public int goodsTypeAdd(Map<String , Object> map);
    public int goodsTypeDelAction(Map<String , Object> map,Integer gt_id);
}
