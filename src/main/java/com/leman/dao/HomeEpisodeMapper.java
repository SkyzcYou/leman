package com.leman.dao;

import com.leman.entity.HomeEpisode;

import java.util.List;


public interface HomeEpisodeMapper {
    //增加一个HomeEpisode
    int addHomeEpisode(HomeEpisode homeEpisode);

    //根据id删除一个HomeEpisode
    int deleteHomeEpisodeById(int id);

    //更新HomeEpisode
    int updateHomeEpisode(HomeEpisode homeEpisode);

    //根据id查询,返回一个HomeEpisode
    HomeEpisode queryHomeEpisodeById(int id);

    //查询全部HomeEpisode,返回list集合
    List<HomeEpisode> queryAllHomeEpisode();
}