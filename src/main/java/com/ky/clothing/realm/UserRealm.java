package com.ky.clothing.realm;

import com.ky.clothing.dao.CartMapper;
import com.ky.clothing.dao.UserMapper;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Daye
 * 用户授权和认证Realm
 */
public class UserRealm extends AuthorizingRealm {

    private UserMapper userMapper;

    @Override
    public String getName() {
        return "UserRealm";
    }

    private CartMapper cartMapper;

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    /**
     * 授权
     *
     * @param principals 在线用户信息
     * @return 返回授权信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    /**
     * 认证
     *
     * @param token 令牌
     * @return 返回用户信息
     * @throws AuthenticationException 判断用户登录认证失败原因
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //从token中获取登录的用户名
        String username = token.getPrincipal().toString();
        //查询数据库返回用户信息
        User user = userMapper.selectUserByLoginAccountAndPassword(username);
        //判断用户是否存在
        if(user == null){
            return null;
        }
        //获取用户购物车的商品数量
        int cartCnt = cartMapper.findCountUserId(user.getUserId());
        Map<String, Object> map = new HashMap<>(16);
        //将用户的购物车商品数量
        map.put("cartCnt", cartCnt);
        // 当前用户信息存到session中
        SecurityUtils.getSubject().getSession().setAttribute(SysParamEnum.SESSION_USER_NAME.toString(), user);
        SecurityUtils.getSubject().getSession().setAttribute(SysParamEnum.SESSION_SHOP_INFO_NAME.toString(), map);
        //返回认证信息
        return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
