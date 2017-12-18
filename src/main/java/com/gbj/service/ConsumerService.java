package com.gbj.service;

import java.util.Map;

public interface ConsumerService {
    public Map<String , Object> consumerList(Map<String , Object> map);
    public Map<String , Object> consumerAdd(Map<String , Object> map);
    public int consumerAddAction(Map<String , Object> map);
    //通过ID查询将要修改商品
    public Map<String , Object> load(Map<String , Object> map,Integer con_id);
    //提交保存修改的客户信息
    public int consumerUpdateAction(Map<String , Object> map);
    //删除一条数据
    public int consumerDel(Map<String,Object> map,Integer con_id);
    //删除多条数据
    public int consumerMoreDel(Map<String , Object> map);
    //客户等级分页及模糊查询
    public Map<String , Object> consumerGrandPageList(Map<String , Object> map);
    //客户等级逻辑删除
    public int consumerGrandDelAction(Map<String , Object> map,Integer cg_id);
    //添加新的等级
    public int consumerGrandAddAction(Map<String , Object> map);
}
