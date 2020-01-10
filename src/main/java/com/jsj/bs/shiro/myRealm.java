package com.jsj.bs.shiro;


import com.jsj.bs.pojo.TbAdmin;
import com.jsj.bs.pojo.TbLeader;
import com.jsj.bs.pojo.TbUser;
import com.jsj.bs.service.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author King_long
 * @program: 2019122403web
 * @Date 2019/12/24 17:15
 */

public class myRealm extends AuthorizingRealm {

    private static final Logger LOGGER = LogManager.getLogger(myRealm.class);

    @Autowired
    private TbUserService tbUserService;
    @Autowired
    private TbLeaderService tbLeaderService;
    @Autowired
    private TbAdminService tbAdminService;
    @Autowired
    private TbRoleService tbRoleService;

    /**
     * 授权
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        String account = getAvailablePrincipal(principals).toString();

        LOGGER.info(account + "=========================");

        List<String> userRoleList = tbRoleService.queryByUserAccount(account);

        LOGGER.info("===userRoleList====" + userRoleList.isEmpty());

        List<String> leaderRoleList = tbRoleService.queryByLeaderAccount(account);

        LOGGER.info("===leaderRoleList====" + leaderRoleList.isEmpty());
        List<String> adminRoleList = tbRoleService.queryByAdminAccount(account);

        LOGGER.info("===adminRoleList====" + adminRoleList.isEmpty());
        if (userRoleList != null) {
            for (String role : userRoleList) {

                LOGGER.info(role + "=============userRoleList============");

                info.addRole(role);

            }
        }
        if (leaderRoleList != null) {
            for (String role : leaderRoleList) {

                LOGGER.info(role + "===========leaderRoleList==============");

                info.addRole(role);

            }
        }
        if (adminRoleList != null) {
            for (String role : adminRoleList) {

                LOGGER.info(role + "============adminRoleList=============");

                info.addRole(role);

            }
        }

        LOGGER.info(info.getRoles());
        return info;
    }

    /**
     * 认证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        AuthenticationInfo info = null;

        UsernamePasswordToken token1 = (UsernamePasswordToken) token;

        String account = token1.getUsername();

        char[] password = token1.getPassword();

        String pass = new String(password);

        LOGGER.info("==============" + pass);

        TbUser user = tbUserService.queryByAccount(account, pass);

        TbLeader leader = tbLeaderService.queryByAccount(account, pass);

        TbAdmin admin = tbAdminService.queryByAccount(account, pass);

        if ((user != null && user.getUserId() != 0) || (leader != null && leader.getLeaderId() != 0) || (admin != null && admin.getAdminId() != 0)) {
            info = new SimpleAuthenticationInfo(account, pass, getName());
        }

        return info;
    }
}
