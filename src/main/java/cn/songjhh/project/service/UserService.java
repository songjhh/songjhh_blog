package cn.songjhh.project.service;

import cn.songjhh.project.po.user.User;
import cn.songjhh.project.po.user.UserCustom;
import cn.songjhh.project.po.user.UserQueryVo;
import org.apache.shiro.session.Session;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by song9 on 2016/12/29.
 */
public interface UserService {

    //通过用户名查询用户
    public UserCustom getByUserName(String userName);

    //通过用户名查询角色信息
    public Set<String> getRolesByUserName(String userName);

    //通过用户名查询权限信息
    public Set<String> getPermissionsByUserName(String userName);

    //通过角色查询权限信息
    public Set<String> getPermissionsByRole(String roleName);

    //注册账号
    public void insertUser(UserCustom userCustom);

    //赋予账号角色
    public void giveRole(UserCustom userCustom, Integer role_id);

    //更新账号最后登录时间
    public void updateLoginLastTime(UserCustom userCustom,Session session);

    //更新账号信息
    public void updateUser(Integer id,UserCustom userCustom);

    //用户查询列表
    public List<UserCustom> getUserList(UserQueryVo userQueryVo);

}
