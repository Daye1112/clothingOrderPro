package com.ky.clothing.service.impl;

import com.ky.clothing.dao.UserMapper;
import com.ky.clothing.entity.User;
import com.ky.clothing.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Daye
 * 用户Service层接口实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<User> selectAllUserBaseInfo() {
        return userMapper.selectAllUserBaseInfo();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean updateAvatarUrlByUserId(User user) {
        return userMapper.updateAvatarUrlByUserId(user) > 0;
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public boolean checkLoginAccountRepeat(String loginAccount) {
        Integer cnt = userMapper.selectCountLoginAccount(loginAccount);
        return cnt > 0;
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public boolean checkEmailRepeat(String email) {
        Integer cnt = userMapper.selectCountEmail(email);
        return cnt > 0;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean signUp(User user) {
        return userMapper.insertSelective(user) > 0;
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public User selectUserIdByEmail(String email) {
        return userMapper.selectUserIdByEmail(email);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updatePasswordByUserId(Integer userId, String newPassword) {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(newPassword);
        return userMapper.updatePasswordByUserId(user);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public User selectByPrimaryKey(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateByPrimaryKeySelective(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public User userLogin(User user){
        return userMapper.selectUserByLoginAccountAndPassword(user.getLoginAccount());
    }
}
