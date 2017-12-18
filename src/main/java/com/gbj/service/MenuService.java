package com.gbj.service;

import java.util.Map;

public interface MenuService {
    public Map<String , Object> queryMenu(Integer role_id,Map<String , Object> map);
    public Map<String , Object> updateMenu(Map<String , Object> map);
}
