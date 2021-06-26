package com.leman.dao;

import com.leman.entity.Episode;

import java.util.List;

public interface EpisodeMapper {
    //增加一个Episode
    int addEpisode(Episode episode);

    //根据id删除一个Episode
    int deleteEpisodeById(int id);

    //更新Episode
    int updateEpisode(Episode episode);

    //根据id查询,返回一个Episode
    Episode queryEpisodeById(int id);

    //查询全部Episode,返回list集合
    List<Episode> queryAllEpisode();

    //根据 father_id 查询该播放列表
    List<Episode> queryEpisodeByFatherId(int id);

    //根据 father_id 获取第一集
    Episode queryFirstEpisodeByFatherId(int father_id);

    //根据 father_name 获取搜索列表
    List<Episode> queryEpisodeByFatherName(String father_name);
}
