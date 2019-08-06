package com.ky.clothing.service;

import com.ky.clothing.entity.User;

import java.util.List;

/**
 * @author Daye
 * 用户Service层接口类
 */
public interface UserService {

    /**
     * 查询所有用户的基本信息
     * @return 返回userList
     */
    List<User> selectAllUserBaseInfo();

    /**
     * 根据用户id修改用户的头像url
     * @param user 用户对象
     * @return 返回影响行数
     */
    boolean updateAvatarUrlByUserId(User user);

    /**
     * 判断账号是否存
     * @param loginAccount 账号
     * @return 返回boolean
     */
    boolean checkLoginAccountRepeat(String loginAccount);

    /**
     * 判断email是否存
     * @param email email
     * @return 返回boolean
     */
    boolean checkEmailRepeat(String email);

    /**
     * 用户注册
     * 插入记录（已验证空值）
     *
     * @param user 带插入的对象
     * @return 返回是否注册成功
     */
    boolean signUp(User user);

    /**
     * 根据邮箱查询用户id
     * @param email 邮箱
     * @return 返回用户id和账号
     */
    User selectUserIdByEmail(String email);

    /**
     * 根据id更改用户登录密码
     * @param userId 用户id
     * @param newPassword 新密码
     * @return 返回影响行数
     */
    int updatePasswordByUserId(Integer userId, String newPassword);

    /**
     * 根据id查询用户记录
     * @param userId 用户id
     * @return 查询结果
     */
    User selectByPrimaryKey(Integer userId);

    /**
     * 根据id更新用户数据（验证空值）
     * @param user 待更新的对象
     * @return 返回更新记录数量
     */
    int updateByPrimaryKeySelective(User user);

    /**
     * 普通用户登录
     * @param user 待验证的账号密码存放对象
     * @return 返回json封装对象
     */
    User userLogin(User user);
}
