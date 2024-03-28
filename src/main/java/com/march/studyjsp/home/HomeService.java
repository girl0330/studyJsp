package com.march.studyjsp.home;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface HomeService {

    List<HomeDTO> homeList();

    List<HomeDTO1> homeList1();

    List<Map<String, Object>> homeList2();

    List<HomeDTO> homeList3();

    List<Map<String, Object>> homeList4();

    void createBoard(HomeDTO homeDTO);

    void updateBoard(HomeDTO homeDTO);

    void deleteBoard(Long id);

}
