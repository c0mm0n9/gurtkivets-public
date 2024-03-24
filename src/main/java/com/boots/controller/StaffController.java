package com.boots.controller;


import com.boots.entity.*;
import com.boots.repository.*;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalTime;
import java.util.*;

@Controller
public class StaffController {
    @Autowired
    EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    StaffRepository staffRepository;
    @Autowired
    ClassesRepository classesRepository;
    @Autowired
    HttpServletRequest request;

    @Autowired
    ScheduleRepository scheduleRepository;
    @Autowired
    StudentRepository studentRepository;

    @Autowired
    RoomsRepository roomsRepository;

    @Autowired
    TypeClassRepository typeClassRepository;

    @GetMapping("/employee")
    public String teacherPanel(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("staff",staffRepository.findByUser(user));
        model.addAttribute("staffClasses",classesRepository.findByStaff(staffRepository.findByUser(user)));
        return "teacher";
    }
    @GetMapping("/employee/edit-info")
    public String addInfoPage(Model model,@AuthenticationPrincipal User user) {
        if(staffRepository.findByUser(user) != null)
        model.addAttribute("staffForm",staffRepository.findByUser(user));
        else
            model.addAttribute("staffForm",new Staff());

        return "staff-add-info";
    }
    @PostMapping ("/employee/edit-info")
    public String addInfo(@ModelAttribute("staffForm") Staff staffForm,@AuthenticationPrincipal User user) {
        staffForm.setUser(user);
        staffRepository.save(staffForm);
        return "redirect:/employee";
    }

    @GetMapping("/employee/add-classes")
    public String addClassesGet(Model model,@AuthenticationPrincipal User user) {
        if(staffRepository.findByUser(user)==null){
            Staff staff = new Staff();
            staff.setUser(user);
            staffRepository.save(staff);
        }
        model.addAttribute("roomList",roomsRepository.findAll());
        model.addAttribute("typesClass", typeClassRepository.findAll());
        return "add-class";
    }

    @PostMapping("/employee/add-classes")
    public String postAddClasses(@RequestParam("values") List<String> values, @RequestParam(value = "typeClassId",required = false) int typeClassId,Model model, @AuthenticationPrincipal User user) {
        Classes classes = new Classes();
        classes.setName(request.getParameter("name"));
        classes.setDescription(request.getParameter("description"));
        classes.getStaff().add(staffRepository.findByUser(user));
        classes.setTypeClass(typeClassRepository.findById(typeClassId).get());
        List<String> conflicts = new ArrayList<>();
        System.out.println("+++++++++++++++++++++++++++++++++++++++++");
        System.out.println(values);
        for (int i = 0; i < values.size(); i += 4) {


                Schedule schedule = new Schedule();
                schedule.setDay(values.get(i));
                schedule.setTime_start(values.get(i + 1));
                schedule.setTime_end(values.get(i + 2));
         //TODO ??? переробити
            if(!(LocalTime.parse(values.get(i + 2)).compareTo(LocalTime.parse(values.get(i + 1)))>0 &&
                    scheduleRepository.findScheduleConflicts(values.get(i),
                            roomsRepository.findById(Integer.valueOf(values.get(i+3))).get().getId(),
                            values.get(i+1), values.get(i+2)).size()==0
            ) ){

            }

                schedule.setRoom(roomsRepository.findById(Integer.valueOf(values.get(i + 3))).get());
                scheduleRepository.save(schedule);
                classes.getSchedules().add(schedule);

                if(LocalTime.parse(values.get(i + 2)).compareTo(LocalTime.parse(values.get(i + 1)))<    0){
                    conflicts.add("Неправильно вказаний час");
                }else {
                    for (Schedule s : scheduleRepository.findScheduleConflicts(values.get(i),
                            roomsRepository.findById(Integer.valueOf(values.get(i + 3))).get().getId(),
                            values.get(i + 1), values.get(i + 2))) {
//TODO fix checking
                      //  conflicts.add("Збігається час з гуртком - " + classesRepository.findBySchedules(s).getName());
                    }
                }
            }

        classesRepository.save(classes);
        System.out.println(conflicts);
        if(conflicts.size()!=0){
            return "redirect:/employee/edit-classes?classesId="+classes.getId()+"&hasConflicts=true";
        }

        return "redirect:/employee";
    }

    @GetMapping("/employee/edit-classes")
    public String editClassesGet(@RequestParam(required = true) int classesId,
                                @RequestParam(required = true, defaultValue = "" ) String action,
                                Model model, @AuthenticationPrincipal User user, @RequestParam(required = true, defaultValue = "false") boolean hasConflicts) {
        if(classesRepository.findById(classesId).get().getStaff().contains(staffRepository.findByUser(user))) {
            model.addAttribute("hasConflicts", hasConflicts);
            model.addAttribute("roomList",roomsRepository.findAll());
            model.addAttribute("typesClass", typeClassRepository.findAll());
            model.addAttribute("classes", classesRepository.findById(classesId).get());
            return "edit-classes";
        }else{
            return "redirect:/employee";
        }
    }

    @PostMapping("/employee/edit-classes")
    public String editAddClasses(@RequestParam(value = "values", required = false) List<String> values, @RequestParam(value = "typeClassId",required = false) int typeClassId,Model model, @AuthenticationPrincipal User user) {


        model.addAttribute("roomList",roomsRepository.findAll());
        Classes classes = new Classes();
        classes.setId(Integer.parseInt(request.getParameter("id")));
        classes.setName(request.getParameter("name"));
        classes.setDescription(request.getParameter("description"));
        classes.setSchedules(new HashSet<>());
        classes.setTypeClass(typeClassRepository.findById(typeClassId).get());
        List<String> students = new ArrayList<>();
        if(request.getParameter("students")!=null)
            students = List.of(request.getParameterValues("students"));
        List<String> studentRequests = new ArrayList<>();
        if(request.getParameter("studentRequests")!=null)
            studentRequests = List.of(request.getParameterValues("studentRequests"));
        Set<Student> currentRequests = classesRepository.findById(Integer.parseInt(request.getParameter("id"))).get().getStudentRequests();
        for(String s : studentRequests) {
            classes.getStudent().add(studentRepository.findById(Integer.parseInt(s)).get());
            currentRequests.remove(studentRepository.findById(Integer.parseInt(s)).get());
        }
        classes.setStudentRequests(currentRequests);
        Set<Student> currentStudent = new HashSet<>();
        for(String s:students){
            currentStudent.add(studentRepository.findById(Integer.parseInt(s)).get());
        }
        classes.setStudent(currentStudent);
        classes.getStaff().addAll(classesRepository.findById(classes.getId()).get().getStaff());
        classesRepository.save(classes);
        if(values!=null){
        for (int i = 0; i < values.size(); i +=5) {
            Schedule schedule = new Schedule();
            schedule.setDay(values.get(i));
            schedule.setTime_start(values.get(i+1));
            schedule.setTime_end(values.get(i+2));
            System.out.println(values.get(i+3));
            schedule.setRoom(roomsRepository.findById(Integer.valueOf(values.get(i+3))).get());
            schedule.setId(Integer.parseInt(values.get(i + 4)));

            scheduleRepository.save(schedule);
            classes.getSchedules().add(schedule);
        }
        }
        classesRepository.save(classes);

        return "redirect:/employee";
    }
}
