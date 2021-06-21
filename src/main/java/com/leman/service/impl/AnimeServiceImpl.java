package com.leman.service.impl;

import com.leman.dao.AnimeMapper;
import com.leman.entity.Anime;
import com.leman.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimeServiceImpl implements AnimeService {
    private AnimeMapper animeMapper;

    public void setAnimeMapper(AnimeMapper animeMapper) {
        this.animeMapper = animeMapper;
    }

    @Override
    public int addAnime(Anime anime) {
        return animeMapper.addAnime(anime);
    }

    @Override
    public int deleteAnimeById(int id) {
        return animeMapper.deleteAnimeById(id);
    }

    @Override
    public int updateAnime(Anime anime) {
        return animeMapper.updateAnime(anime);
    }

    @Override
    public Anime queryAnimeById(int id) {
        return animeMapper.queryAnimeById(id);
    }

    @Override
    public List<Anime> queryAllAnime() {
        return animeMapper.queryAllAnime();
    }

    @Override
    public List<Anime> queryAnimeListByName(String name) {
        return animeMapper.queryAnimeListByName(name);
    }
}
