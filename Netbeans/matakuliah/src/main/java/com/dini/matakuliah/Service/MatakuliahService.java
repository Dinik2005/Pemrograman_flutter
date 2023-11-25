package com.dini.matakuliah.service;

import com.dini.matakuliah.entity.Matakuliah;
import com.dini.matakuliah.repository.MatakuliahRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class MatakuliahService {
    private final MatakuliahRepository matakuliahRepository;
    @Autowired
    public MatakuliahService(MatakuliahRepository matakuliahRepository){
        this.matakuliahRepository = matakuliahRepository;
    }
    
    public List<Matakuliah> getAll(){
        return matakuliahRepository.findAll();
    }
    
    public void insert(Matakuliah matakuliah){
        Optional<Matakuliah> matakuliahOptional = 
                matakuliahRepository.findMatakuliahByKode(matakuliah.getKode());
        if(matakuliahOptional.isPresent()){
            throw new IllegalStateException("Email Sudah Ada");
        }
        matakuliahRepository.save(matakuliah);
    }
}