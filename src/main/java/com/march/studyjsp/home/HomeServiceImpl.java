package com.march.studyjsp.home;

import lombok.RequiredArgsConstructor;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class HomeServiceImpl implements HomeService {
    private final HomeMapper homeMapper;

    //글목록
    @Override
    public List<HomeDTO> homeList() {
        System.out.println("!!!!!!!!!!!!!!!!!!");
        System.out.println("데이터 확인:::::    "+homeMapper.homeList());

        return homeMapper.homeList();
    }

    //작성
    @Override
    public void createBoard(HomeDTO homeDTO) {
        homeMapper.createBoard(homeDTO);
    }

    //수정
    @Override
    public void updateBoard(HomeDTO homeDTO) {
        homeMapper.updateBoard(homeDTO);
    }

    //삭제
    @Override
    public void deleteBoard(Long id) {
        homeMapper.deleteBoard(id);
    }

    //상세페이지
    @Override
    public HomeDTO homeDetail(Long id) {
        return homeMapper.homeDetail(id);
    }

}
