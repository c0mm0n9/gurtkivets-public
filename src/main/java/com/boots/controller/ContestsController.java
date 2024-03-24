package com.boots.controller;

import com.boots.entity.Contest;
import com.boots.entity.Result;
import com.boots.entity.Student;
import com.boots.entity.User;
import com.boots.repository.ContestsRepository;
import com.boots.repository.ResultRepository;
import com.boots.repository.StudentRepository;
import com.boots.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class    ContestsController {
    @Autowired
    ContestsRepository contestsRepository;

    @Autowired
    ResultRepository resultRepository;

    @GetMapping("/contests")
    public String contestsPage(Model model, @RequestParam(required = true, defaultValue = "-1") int id){

        if(id>0){
            Contest contest = contestsRepository.findById(id).get();
            model.addAttribute("contest", contest);
            model.addAttribute("results", resultRepository.findByContest(contest));
            System.out.println(resultRepository.findByContest(contest));
            return "contest";
        }

            model.addAttribute("contests", contestsRepository.findAll());
            return "contests";

    }


    @Autowired
    StudentRepository studentRepository;

    @GetMapping ("/contest-register")
    public String registerContestPage(Model model, @RequestParam(required = true) int id, @AuthenticationPrincipal User user){
        Set<Student> unregisteredSet = new HashSet<>(studentRepository.findByUser(user));
        Set<Student> registeredSet = new HashSet<>(contestsRepository.findById(id).get().getContestants());
        Set<Student> reg = new HashSet<>();
        for(Student s : unregisteredSet){
            if(registeredSet.contains(s)){
                unregisteredSet.remove(s);
                reg.add(s);
            }
        }
        model.addAttribute("allStudent", unregisteredSet);
        model.addAttribute("registeredStudent", reg);
        model.addAttribute("contest", contestsRepository.findById(id).get());
        return "contest-register";
    }
    @PostMapping("/contest-register")
    public String register(Model model, @RequestParam int studentId, @RequestParam int contestId, @RequestParam String action){
        Student s = studentRepository.findById(studentId).get();
        Contest c = contestsRepository.findById(contestId).get();
        if(action.equals("add")){
        c.getContestants().add(s);
        Result r = new Result();
        r.setStudent(s);
        r.setContest(c);
        resultRepository.save(r);
        contestsRepository.save(c);

        }
        if(action.equals("delete")){
            c.getContestants().remove(s);
            for(Result r : resultRepository.findByStudent(s)){
                if(r.getContest().equals(c)){
                    resultRepository.delete(r);
                    break;
                }
            }
            contestsRepository.save(c);
        }

        return"redirect:/contests?id="+contestId;
    }
}
