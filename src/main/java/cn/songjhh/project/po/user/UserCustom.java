package cn.songjhh.project.po.user;

/**
 * Created by song9 on 2016/12/29.
 */
public class UserCustom extends User {

    private boolean rememberMe;

    public boolean isRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }
}
