package com.ky.clothing.dao;

import com.ky.clothing.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Daye
 * 用户表Dao持久层
 */
@Repository
public interface UserMapper {

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
    int updateAvatarUrlByUserId(User user);

    /**
     * 查询该账号的数量
     * @param loginAccount 账号
     * @return 返回账号数量
     */
    Integer selectCountLoginAccount(String loginAccount);

    /**
     * 查询该email的数量
     * @param email email
     * @return 返回email数量
     */
    Integer selectCountEmail(String email);

    /**
     * 根据邮箱查询用户id
     * @param email 邮箱
     * @return 返回用户id和账号
     */
    User selectUserIdByEmail(String email);

    /**
     * 根据id更改用户登录密码
     * @param user 待修改的用户对象
     * @return 返回影响行数
     */
    int updatePasswordByUserId(User user);

    /**
     * 根据账号密码查询普通用户信息
     * @param username 登录账号账号
     * @return 返回查询对象
     */
    User selectUserByLoginAccountAndPassword(String username);

    /**
     * 插入记录（未验证空值）
     * @param record 带插入的对象
     * @return 刚插入的记录id
     */
    int insert(User record);

    /**
     * 插入记录（已验证空值）
     * @param record 带插入的对象
     * @return 刚插入的记录id
     */
    int insertSelective(User record);

    /**
     * 根据id查询用户记录
     * @param userId 用户id
     * @return 查询结果
     */
    User selectByPrimaryKey(@Param("userId") Integer userId);

    /**
     * 根据id更新用户数据（未验证空值）
     * @param record 待更新的对象
     * @return 返回更新记录数量
     */
    int updateByPrimaryKey(User record);

    /**
     * 根据id更新用户数据（验证空值）
     * @param record 待更新的对象
     * @return 返回更新记录数量
     */
    int updateByPrimaryKeySelective(User record);
}