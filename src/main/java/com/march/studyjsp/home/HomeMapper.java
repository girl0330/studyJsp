package com.march.studyjsp.home;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {
    List<HomeDTO> homeList();
}
