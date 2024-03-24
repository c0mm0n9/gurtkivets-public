package com.boots.controller;

import com.boots.entity.User;
import com.boots.repository.ClassesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClassesController {
    @Autowired
    private ClassesRepository classesRepository;

    @GetMapping("/classes")
    public String allClasses(Model model){
        model.addAttribute("allClasses", classesRepository.findAll());
        return "classes";
    }
    @GetMapping("/classes/details")
    public String classesDetails(Model model, @RequestParam int classesId) {
        model.addAttribute("classes",classesRepository.findById(classesId).get());
        return "class-details";
    }
}
