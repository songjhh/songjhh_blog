package cn.songjhh.project.service;

import cn.songjhh.project.po.blog.Blog;

import java.util.List;

/**
 * Created by song9 on 2017/1/13.
 */
public interface BlogService {

    //提交博文
    public void insertBlog(Blog blog);

    //更新修改时间
    public void updateAlterTime(Integer id,Blog blog);

    //通过id查找博文
    public Blog getBlogById(Integer id);

    //通过标题查找博文
    public Blog getBlogByTitle(String title);

    //寻找所有博文
    public List<Blog> getAllBlog();

}
