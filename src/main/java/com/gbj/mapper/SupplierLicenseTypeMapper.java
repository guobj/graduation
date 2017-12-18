package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.SupplierLicenseType;

public interface SupplierLicenseTypeMapper {
    //查询供应商证照
    public List<Map<String , Object>> supplierLicenseList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    //新增供应商证照
    public int supplierLicenseAddAction(SupplierLicenseType supplierLicenseType);
    //逻辑删除一条数据byid
    public int supplierLicenseDelAction(Integer sg_id);
    //    /逻辑删除多条数据BYIDs
    public int supplierLicenseMoreDelAction(Map<String , Object> map);
}
