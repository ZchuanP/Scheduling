package com.fuchuang.service;

import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.util.ResourceUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface ResourceService {

    List<ResourceUtil> selectAllResource();


    Boolean insertResource(Resource resource);


    Boolean deleteResouerceById(int resource_id);

    List<ResourceType> selectResourceByType();
}
