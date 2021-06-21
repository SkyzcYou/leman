package com.leman.dao;

import com.leman.entity.HomeCarousel;
import com.leman.entity.HomeEpisode;

import java.util.List;


public interface HomeCarouselMapper {
    // 首页轮播图增加一张
    int addHomeCarousel(HomeCarousel homeCarousel);

    //根据id删除一页轮播图
    int deleteHomeCarouselById(int id);

    //更新轮播图
    int updateHomeCarousel(HomeCarousel homeCarousel);

    // 根据id查询,返回一个HomeEpisode
    HomeCarousel queryHomeCarouselById(int id);

    // 获取所有轮播图
    List<HomeCarousel> queryAllHomeCarousel();
}