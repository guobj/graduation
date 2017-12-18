package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Education;

public interface EducationMapper {
    //查询学历ByID
    public Map<String , Object> load(Integer edu_id);
    //查询全部学历
    public List<Education> eduList();
}
