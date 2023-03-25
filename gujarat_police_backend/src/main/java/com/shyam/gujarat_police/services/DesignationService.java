package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.DesignationDto;
import com.shyam.gujarat_police.dto.request.DesignationListDto;
import com.shyam.gujarat_police.dto.request.FindByDesignationDto;
import com.shyam.gujarat_police.entities.Designation;
import com.shyam.gujarat_police.exceptions.DataAlreadyExistException;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.repositories.DesignationRepository;
import com.shyam.gujarat_police.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DesignationService {

    @Autowired
    private DesignationRepository designationRepository;

    public List<DesignationDto> getAllDesignations() {
        List <Designation> designationList = (List<Designation>) designationRepository.findAll();
        return designationList.stream().map(designation -> {
            DesignationDto dto = new DesignationDto();
            dto.setId(designation.getId());
            dto.setName(designation.getName());
            dto.setNameInGujarati(designation.getNameInGujarati());
            dto.setDeletable(designation.getPolice().size() == 0);
            return dto;
        }).collect(Collectors.toList());
    }

    public Designation saveDesignation(Designation designation) {
        if (isDesignationExist(designation.getName(), designation.getNameInGujarati())) {
            throw new DataAlreadyExistException("Designation already exists for " + designation.getName());
        } else {
            return designationRepository.save(designation);
        }
    }

    public Designation updateDesignation(DesignationDto designation, Long designationId) {
        if (!Objects.nonNull(designationId)) {
            throw new DataNotFoundException("Designation Id not found: " + designationId);
        }
        Optional<Designation> designationOptional = designationRepository.findById(designationId);
        if (designationOptional.isEmpty()) {
            throw new DataNotFoundException("Designation not found: " + designationId);
        } else {
            Designation obtainedDesignation = designationOptional.get();
            // if any other name in english exists
            // if any other name in gujarati exists
            Optional<Designation> otherSameDesi = designationRepository.getWhereNotIdAndByNameOrNameInGuj(designationId, designation.getName(), designation.getNameInGujarati());
            if (otherSameDesi.isPresent()) {
                return null;
            }
            if (TextUtils.isBlank(designation.getName()) || TextUtils.isBlank(designation.getNameInGujarati())) {
                return null;
            }
            obtainedDesignation.setName(designation.getName());
            obtainedDesignation.setNameInGujarati(designation.getNameInGujarati());

            return designationRepository.save(obtainedDesignation);
        }
    }

    public Designation getDesignationById(Long designationId) {
        return designationRepository.findById(designationId)
                .orElseThrow(() -> new DataNotFoundException("Designation not found: " + designationId));
    }

    public Designation getDesignationByName(String designationName) {
        return designationRepository.findByName(designationName)
                .orElseThrow(() -> new DataNotFoundException("Designation not found: " + designationName));
    }

    public Designation getDesignationByNameOrCreate(String designationName) {
        return designationRepository.findByName(designationName)
                .orElseGet(() -> {
                    Designation designation = new Designation();
                    designation.setName(designationName);
                    designationRepository.save(designation);
                    return designation;
                });
    }

    public void deleteDesignation(Long designationId) {
        designationRepository.deleteById(designationId);
    }

    private boolean isDesignationExist(String name, String nameInGujarati) {
        return designationRepository.findbyNameOrNameInGujarati(name, nameInGujarati).size() > 0;
    }

    public List<Designation> findInDesignation(FindByDesignationDto designation) {
        List<Designation> resp = designationRepository.findbyNameOrNameInGujarati(designation.getName(), designation.getNameInGujarati());
        if (resp.size() > 0) {
            return resp;
        } else {
            throw new DataNotFoundException("Designation not found: " + designation);
        }
    }

    public Designation getDesignationByNameOrNameInGujarati(String designationName) {
        List<Designation> designations = designationRepository.findbyNameOrNameInGujarati(designationName);
        if (designations == null || designations.size() == 0) {
            throw new DataNotFoundException("Designation not found: " + designationName);
        }
        return designations.get(0);
    }

    public List<Designation> saveDesignationsFromList(DesignationListDto dto) {
        List<Designation> designationList = dto.getDesignationsList();
        List<Designation> savedDesignations = new ArrayList<>();
        for (Designation designation : designationList) {
            boolean result = isDesignationExist(designation.getName(),
                    designation.getNameInGujarati());
            if (!result) {
                Designation d = designationRepository.save(designation);
                savedDesignations.add(d);
            }
        }
        return savedDesignations;
    }
}
