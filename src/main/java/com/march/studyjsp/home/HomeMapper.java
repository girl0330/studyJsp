package com.march.studyjsp.home;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {
    List<HomeDTO> homeList();

    List<HomeDTO1> homeList1();

    List<Map<String, Object>> homeList2();

    List<HomeDTO> homeList3();

    List<Map<String,Object>> homeList4();

    void createBoard(HomeDTO homeDTO);

    void updateBoard(HomeDTO homeDTO);

    void deleteBoard(Long id);
}
