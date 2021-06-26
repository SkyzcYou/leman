package com.leman.service.impl;

import com.leman.dao.EpisodeMapper;
import com.leman.entity.Episode;
import com.leman.service.EpisodeService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EpisodeServiceImpl implements EpisodeService {
    private EpisodeMapper episodeMapper;

    public void setEpisodeMapper(EpisodeMapper episodeMapper) {
        this.episodeMapper = episodeMapper;
    }

    @Override
    public int addEpisode(Episode episode) {
        return episodeMapper.addEpisode(episode);
    }

    @Override
    public int deleteEpisodeById(int id) {
        return episodeMapper.deleteEpisodeById(id);
    }

    @Override
    public int updateEpisode(Episode episode) {
        return episodeMapper.updateEpisode(episode);
    }

    @Override
    public Episode queryEpisodeById(int id) {
        return episodeMapper.queryEpisodeById(id);
    }

    @Override
    public List<Episode> queryAllEpisode() {
        return episodeMapper.queryAllEpisode();
    }

    @Override
    public List<Episode> queryEpisodeByFatherId(int father_id) {
        return episodeMapper.queryEpisodeByFatherId(father_id);
    }

    @Override
    public Episode queryFirstEpisodeByFatherId(int father_id) {
        return episodeMapper.queryFirstEpisodeByFatherId(father_id);
    }

    @Override
    public List<Episode> queryEpisodeByFatherName(String father_name) {
        return episodeMapper.queryEpisodeByFatherName(father_name);
    }
}
