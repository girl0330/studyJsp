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
//      List<HomeDTO> a = homeMapper.homeList3();
//      return a;
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
//    List<Map<String,Object>> list = homeMapper.homeList4();
//    return homeMapper.homeList3();
//list 목록부터 delete API 만들기 복습
    @Override
    public List<Map<String,Object>> lists() {
        System.out.println("서비스인플;;;;;;;;;;");
        List<Map<String,Object>> lists = homeMapper.lists();
        System.out.println("Map버전"+lists);
        return lists;
//      return homeMapper.lists();
    }

    @Override
    public List<HomeDTO> listss() {
        System.out.println(";;;;;;;;;;;;;");
        List<HomeDTO> a = homeMapper.listss();
        System.out.println("DTO버전"+a);
        return a;
    }

    @Override
    public void createBoard1(HomeDTO homeDTO) {
        System.out.println(";;;;;;;;;;");
        homeMapper.createBoard1(homeDTO);
    }

    @Override
    public void updateBoard1(HomeDTO homeDTO) {
        System.out.println("서비스impl");
        homeMapper.updateBoard1(homeDTO);
    }

    @Override
    public void deleteBoard1(Long id) {
        System.out.println("ㄹㄹㄹㄹㄹㄹㄹㄹㄹ");
        homeMapper.deleteBoard1(id);
    }

//list 목록부터 delete API 만들기 복습2
    @Override
    public List<HomeDTO> list2() {
//        List<Map<String,Object>> b = HomeMapper.list2();
//        return b;
        return homeMapper.list2();
    }

    @Override
    public void insert2(HomeDTO homeDTO) {
        homeMapper.insert2(homeDTO);
    }

    @Override
    public void update2(HomeDTO homeDTO) {
        homeMapper.update2(homeDTO);
        System.out.println("------------"+homeDTO);
    }

    @Override
    public void delete2(Long id) {
        homeMapper.delete2(id);
    }
}
