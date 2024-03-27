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

}
