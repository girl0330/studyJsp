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

    @Override
    public List<HomeDTO> homeList() {
        System.out.println("!!!!!!!!!!!!!!!!!!");
        System.out.println("데이터 확인:::::    "+homeMapper.homeList());

        return homeMapper.homeList();
    }

    @Override
    public List<HomeDTO1> homeList1() {
        System.out.println("homeMapper.homeList11111111111111111111 = " + homeMapper.homeList1());
        return homeMapper.homeList1();
    }

    @Override
    public List<Map<String, Object>> homeList2() {
        System.out.println("homeMapper222222222222222222222");
        return homeMapper.homeList2();
    }

    @Override
    public List<HomeDTO> homeList3() {
        System.out.println("homeMapper 3333333333333333");
        return homeMapper.homeList3();
    }

    @Override
    public List<Map<String,Object>> homeList4() {
        List<Map<String,Object>> list = homeMapper.homeList4();
        return list;
    }

    @Override
    public void createBoard(HomeDTO homeDTO) {
        homeMapper.createBoard(homeDTO);
    }

    @Override
    public void updateBoard(HomeDTO homeDTO) {
        homeMapper.updateBoard(homeDTO);
    }

    @Override
    public void deleteBoard(Long id) {
        homeMapper.deleteBoard(id);
    }
}
