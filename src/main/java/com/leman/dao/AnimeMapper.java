package com.leman.dao;

import com.leman.entity.Anime;

import java.util.List;


public interface AnimeMapper {
    //增加一个Anime
    int addAnime(Anime anime);

    //根据id删除一个Anime
    int deleteAnimeById(int id);

    //更新Anime
    int updateAnime(Anime anime);

    //根据id查询,返回一个Anime
    Anime queryAnimeById(int id);

    //查询全部Anime,返回list集合
    List<Anime> queryAllAnime();

    // 根据 name 查询剧集
    List<Anime> queryAnimeListByName(String name);
}