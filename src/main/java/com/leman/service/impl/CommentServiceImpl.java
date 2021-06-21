package com.leman.service.impl;

import com.leman.dao.CommentMapper;
import com.leman.entity.Comment;
import com.leman.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentMapper commentMapper;

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public int addComment(Comment comment) {
        return commentMapper.addComment(comment);
    }

    @Override
    public int deleteCommentById(int id) {
        return commentMapper.deleteCommentById(id);
    }

    @Override
    public int updateComment(Comment comment) {
        return commentMapper.updateComment(comment);
    }

    @Override
    public Comment queryCommentById(int id) {
        return commentMapper.queryCommentById(id);
    }

    @Override
    public List<Comment> queryAllComment() {
        return commentMapper.queryAllComment();
    }

    @Override
    public List<Comment> queryCommentByEpisodeId(int episode_id) {
        return commentMapper.queryCommentByEpisodeId(episode_id);
    }
}
