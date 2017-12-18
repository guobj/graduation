package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.LicenseType;

public interface LicenseTypeMapper {
    public Map<String , Object> load(Integer lt_id);
    public List<LicenseType> finAllLicense();
}
