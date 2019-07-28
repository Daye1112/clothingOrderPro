package com.ky.clothing.dao;

import com.ky.clothing.entity.ContactManager;
import org.springframework.stereotype.Repository;

/**
 * @author Daye
 * 联系客服Dao层持久类
 */
@Repository
public interface ContactManagerMapper {
    /**
     * 根据id删除记录
     * @param contactManagerId 联系客服id
     * @return 影响的行数
     */
    int deleteByPrimaryKey(Integer contactManagerId);

    /**
     * 插入记录（无null验证）
     * @param record 待插入的数据对象
     * @return 返回插入记录的id
     */
    int insert(ContactManager record);

    /**
     * 插入记录（有null验证）
     * @param record 待插入的数据对象
     * @return 返回插入记录的id
     */
    int insertSelective(ContactManager record);

    /**
     * 根据id查询记录
     * @param contactManagerId id
     * @return 查询的对象数据
     */
    ContactManager selectByPrimaryKey(Integer contactManagerId);

    /**
     * 根据id更新记录（有null验证）
     * @param record 待更新的数据对象
     * @return 返回影响行数
     */
    int updateByPrimaryKeySelective(ContactManager record);

    /**
     * 根据id更新记录（无null验证）
     * @param record 待更新的数据对象
     * @return 返回影响行数
     */
    int updateByPrimaryKey(ContactManager record);
}