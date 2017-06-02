package com.hexacore.ssy.sharing.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.hexacore.ssy.sharing.dao.SharingDao;
import com.hexacore.ssy.sharing.domain.Sharing;

@Service
public class SharingServiceImp implements SharingService {
	
	@Inject
	private SharingDao sharingDao;

	@Override
	public List<Sharing> listAll() {
		return sharingDao.listAll();
	}

	//@Transactional
	@Override
	public void regist(Sharing sharing) throws Exception {
		sharingDao.create(sharing);
		
		/*String[] files = board.getFiles();
		
		if(files == null){
			return;
		}
		
		for (String fileName : files) {
			dao.addAttach(fileName);
		}*/
	}

	@Override
	public Sharing read(int shid) {
		return sharingDao.read(shid);
	}

	@Override
	public void modify(Sharing sharing) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(int shid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCommentCnt(int shid) {
		sharingDao.updateCommentCnt(shid);
	}

	@Override
	public void updateLikeCnt(int shid) {
		sharingDao.updateLikeCnt(shid);
	}
	

}
