package com.march.studyjsp.home;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface HomeService {

    //목록
    List<HomeDTO> homeList();

    //작성
    void createBoard(HomeDTO homeDTO);

    //수정
    void updateBoard(HomeDTO homeDTO);

    //삭제
    void deleteBoard(Long id);

    //상세페이지
    HomeDTO homeDetail(Long id);

}
