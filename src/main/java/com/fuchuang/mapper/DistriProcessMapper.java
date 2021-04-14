package com.fuchuang.mapper;

import com.fuchuang.pojo.Process;

import java.util.List;

public interface DistriProcessMapper {
    /**
     *
     * @param resource_id resource编号
     * @return resource上已经分配的工序列表
     */
    List<Process> selectDProcessByResouceId(int resource_id);

    /**
     *
     * @param processes 分配在一个resource的工序list
     * @return 是否插入成功
     */
    int insertDProcesses(List<Process> processes);
}
