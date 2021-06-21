package com.leman.service;

import com.leman.entity.HomeCarousel;

import java.util.List;

public interface HomeCarouselService {
    //增加一个HomeCarousel
    int addHomeCarousel(HomeCarousel homeCarousel);

    //根据id删除一个HomeCarousel
    int deleteHomeCarouselById(int id);

    //更新
    int updateHomeCarousel(HomeCarousel homeCarousel);

    //根据id查询,返回一个HomeCarousel
    HomeCarousel queryHomeCarouselById(int id);

    //查询全部轮播图
    List<HomeCarousel> queryAllHomeCarousel();
}
