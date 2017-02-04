package cn.songjhh.project.controller;

import cn.songjhh.project.po.user.User;
import cn.songjhh.project.po.user.UserCustom;
import cn.songjhh.project.service.UserService;
import cn.songjhh.project.util.CryptographyUtil;
import org.apache.commons.logging.Log;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;


/**
 * Created by song9 on 2016/12/29.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //跳转登录页面
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginView() {
        return "user/login";
    }

    //跳转注册页面
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String registerView() {
        return "user/register";
    }

    //跳转设置页面
    @RequestMapping(value = "/setting/{user_name}")
    public String setting(@PathVariable("user_name") String user_name, Model model) {
        if(user_name.equals(SecurityUtils.getSubject().getPrincipal())) {
            UserCustom userCustom = userService.getByUserName(user_name);
            model.addAttribute("user", userCustom);
            return "user/setting";
        } else {
            return "redirect:/user/setting/" + SecurityUtils.getSubject().getPrincipal();
        }
    }

    //登录账号
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(UserCustom userCustom, Model model) {
        Subject subject = SecurityUtils.getSubject();
        if(!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(userCustom.getUsername(), userCustom.getPassword());
            token.setRememberMe(true);
            try {
                subject.login(token);
                Session session = subject.getSession();
                userService.updateLoginLastTime(userService.getByUserName(userCustom.getUsername()),session);
                return "redirect:/";
            } catch (UnknownAccountException uae) {
                model.addAttribute("errorMsg", "username wasn't in the system.");
            } catch (IncorrectCredentialsException ice){
                model.addAttribute("errorMsg", "password didn't match.");
            } catch (LockedAccountException lae) {
                model.addAttribute("errorMsg", "account for that username is locked - can't login.");
            } catch (ExcessiveAttemptsException  eae) {
                model.addAttribute("errorMsg", "password lost miss too much,please try again later.");
            } catch (AuthenticationException ae) {
                model.addAttribute("errorMsg", "unexpected condition.");
            }
            model.addAttribute("userCustom", userCustom);
            return "user/login";
        }
        return "redirect:/";
    }

    //登出账号
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        if (subject.isAuthenticated()) {
            System.out.println(session.getLastAccessTime());
            subject.logout();
        } else if(subject.isRemembered()) {
            subject.logout();
        }
        return "redirect:/";
    }

    //注册账号
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(Model model,
                           @Valid UserCustom userCustom, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors) {
                //输出错误信息
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("allErrors", allErrors);
            model.addAttribute("user", userCustom);
            return "/user/register";
        }

        if (userService.getByUserName(userCustom.getUsername()) == null) {
            userService.insertUser(userCustom);
            userService.giveRole(userCustom,3);//3为普通用户 待改善
            return "redirect:/";
        } else {
            model.addAttribute("user", userCustom);
            model.addAttribute("errormessage", "userName has been registered!");
            return "/user/register";
        }
    }

    //更新账号信息
    @RequestMapping(value = "/update")
    public String update(Integer id,Model model,UserCustom userCustom) {
            userService.updateUser(id,userCustom);//更新用户信息
            return "redirect:/";
    }

}
