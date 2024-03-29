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

//list 목록부터 delete API 만들기 복습
    List<Map<String,Object>> lists();

    List<HomeDTO> listss();

    void createBoard1(HomeDTO homeDTO);

    void updateBoard1(HomeDTO homeDTO);

    void deleteBoard1(Long id);

//list 목록부터 delete API 만들기 복습2
    List<HomeDTO> list2();

    void insert2(HomeDTO homeDTO);

    void update2(HomeDTO homeDTO);

    void delete2(Long id);
}
