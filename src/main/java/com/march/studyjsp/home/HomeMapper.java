package com.march.studyjsp.home;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {

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
