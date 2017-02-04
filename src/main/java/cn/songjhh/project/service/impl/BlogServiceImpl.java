package cn.songjhh.project.service.impl;

import cn.songjhh.project.mapper.blog.BlogMapper;
import cn.songjhh.project.po.blog.Blog;
import cn.songjhh.project.po.blog.BlogExample;
import cn.songjhh.project.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * Created by song9 on 2017/1/13.
 */
@Service
public class BlogServiceImpl implements BlogService{

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public void insertBlog(Blog blog) {
        blog.setCreatetime(new Date());
        blog.setAltertime(new Date());
        blogMapper.insert(blog);
    }

    @Override
    public void updateAlterTime(Integer id, Blog blog) {
    }

    @Override
    public Blog getBlogById(Integer id) {
        blogMapper.selectByPrimaryKey(id);
        return blogMapper.selectByPrimaryKey(id);
    }

    @Override
    public Blog getBlogByTitle(String title) {
        return null;
    }

    @Override
    public List<Blog> getAllBlog() {
        BlogExample blogExample = new BlogExample();
        List<Blog> blogs = blogMapper.selectByExampleWithBLOBs(blogExample);
        return blogs;
    }
}
