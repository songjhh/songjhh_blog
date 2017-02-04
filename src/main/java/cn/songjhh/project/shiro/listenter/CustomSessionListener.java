package cn.songjhh.project.shiro.listenter;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;

/**
 * Created by song9 on 2017/1/3.
 */
public class CustomSessionListener implements SessionListener {

    //private ShiroSessionRepository shiroSessionRepository;

    @Override
    public void onStart(Session session) {
        System.out.println("on start");
    }

    @Override
    public void onStop(Session session) {
        System.out.println("on stop");
    }

    @Override
    public void onExpiration(Session session) {
        System.out.println("on expiration");
    }


}
