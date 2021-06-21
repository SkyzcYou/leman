package com.leman.service.impl;

import com.leman.dao.HomeEpisodeMapper;
import com.leman.entity.HomeEpisode;
import com.leman.service.HomeEpisodeService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class HomeEpisodeServiceImpl implements HomeEpisodeService {

    private HomeEpisodeMapper homeEpisodeMapper;
    public void setHomeEpisodeMapper(HomeEpisodeMapper homeEpisodeMapper) {
        this.homeEpisodeMapper = homeEpisodeMapper;
    }

    @Override
    public int addHomeEpisode(HomeEpisode homeEpisode) {
        return 0;
    }

    @Override
    public int deleteHomeEpisodeById(int id) {
        return 0;
    }

    @Override
    public int updateHomeEpisode(HomeEpisode homeEpisode) {
        return homeEpisodeMapper.updateHomeEpisode(homeEpisode);
    }

    @Override
    public HomeEpisode queryHomeEpisodeById(int id) {
        return homeEpisodeMapper.queryHomeEpisodeById(id);
    }

    @Override
    public List<HomeEpisode> queryAllHomeEpisode() {
        return homeEpisodeMapper.queryAllHomeEpisode();
    }
}
