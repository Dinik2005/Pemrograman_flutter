/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dini.matakuliah.repository;

import com.dini.matakuliah.entity.Matakuliah;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 *
 * @author Ideapad 3 14ITL6
 */
@Repository
public interface MatakuliahRepository extends JpaRepository<Matakuliah, Long> {

    Optional<Matakuliah> findMatakuliahByKode(Long kode);



}
