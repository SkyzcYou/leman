package com.leman.service.impl;

import com.leman.dao.HomeCarouselMapper;
import com.leman.dao.HomeEpisodeMapper;
import com.leman.entity.HomeCarousel;
import com.leman.entity.HomeEpisode;
import com.leman.service.HomeCarouselService;
import com.leman.service.HomeEpisodeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeCarouselServiceImpl implements HomeCarouselService {

    private HomeCarouselMapper homeCarouselMapper;
    public void setHomeCarouselMapper(HomeCarouselMapper homeCarouselMapper) {
        this.homeCarouselMapper = homeCarouselMapper;
    }

    @Override
    public int addHomeCarousel(HomeCarousel homeCarousel) {
        return 0;
    }

    @Override
    public int deleteHomeCarouselById(int id) {
        return 0;
    }

    @Override
    public int updateHomeCarousel(HomeCarousel homeCarousel) {
        return homeCarouselMapper.updateHomeCarousel(homeCarousel);
    }

    @Override
    public HomeCarousel queryHomeCarouselById(int id) {
        return homeCarouselMapper.queryHomeCarouselById(id);
    }

    @Override
    public List<HomeCarousel> queryAllHomeCarousel() {
        return homeCarouselMapper.queryAllHomeCarousel();
    }
}
