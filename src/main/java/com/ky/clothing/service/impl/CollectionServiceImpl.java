package com.ky.clothing.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ky.clothing.dao.CartMapper;
import com.ky.clothing.dao.CollectionMapper;
import com.ky.clothing.entity.Collectionss;
import com.ky.clothing.service.CollectionService;

@Service
public class CollectionServiceImpl implements CollectionService{
	
	private CollectionMapper collectionMapper;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteByUserId(Integer userId) {
		// TODO Auto-generated method stub
		collectionMapper.deleteByUserId(userId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteByCltId(Integer cltId) {
		// TODO Auto-generated method stub
		collectionMapper.deleteByCltId(cltId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Map<String, Object>> findBaseInfoByUserId(Integer userId) {
		List<Map<String, Object>> cltList = collectionMapper.findBaseInfoByUserId(userId);
		//System.out.println(cltList);
		return cltList;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public Collectionss checkCltIsNew(Collectionss clt) {
		// TODO Auto-generated method stub
		return collectionMapper.findrecords(clt);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void addCollectionss(Collectionss clt) {
		// TODO Auto-generated method stub
		collectionMapper.insert(clt);
	}
	
	@Autowired
    public void setCltMapper(CollectionMapper collectionMapper) {
        this.collectionMapper = collectionMapper;
    }

}
