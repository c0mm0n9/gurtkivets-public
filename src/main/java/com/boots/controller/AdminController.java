package com.boots.controller;

import com.boots.entity.*;
import com.boots.repository.*;
import com.boots.service.StudentService;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.time.Year;
import java.time.ZoneId;
import java.util.*;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ParentRepository parentRepository;
    @Autowired
    private StaffRepository staffRepository;
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private ClassesRepository classesRepository;

    @Autowired
    private RoomsRepository roomsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private  RoleRepository roleRepository;
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private GraduatesRepository graduatesRepository;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/admin")
    public String admin(Model model){
        ArrayList<String> classes = new ArrayList<>();
        ArrayList<Integer> studentsClasses = new ArrayList<>();
        for(Classes i : classesRepository.findAll()) {
            classes.add(i.getName());
            studentsClasses.add(i.getStudent().size());
        }
        model.addAttribute("classes", classes.toString());
        model.addAttribute("studentClasses", studentsClasses.toString());
        ArrayList<String> genders = new ArrayList<>();
        genders.add("Жінка");
        genders.add("Чоловік");
        ArrayList<String> studentGender = new ArrayList<>();
        for (String i : genders)
            studentGender.add(String.valueOf(studentRepository.findByGender(i).size()));

        model.addAttribute("genders",genders);
        model.addAttribute("studentGender",studentGender);
        return "admin";
    }

    @GetMapping("/admin/users")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "users";
    }

    @PostMapping("/admin/users")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) int userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/students")
    public String studentList(Model model) {
        model.addAttribute("allStudents", studentService.allStudent());
        return "students";
    }

    @PostMapping("/admin/students")
    public String  deleteStudent(@RequestParam(required = true, defaultValue = "" ) int userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            Student currentStudent = studentRepository.findById(userId).get();
            List<Classes> clasess = classesRepository.findByStudent(currentStudent);
            for(Classes i : clasess){
                i.getStudent().remove(currentStudent);

                classesRepository.save(i);
            }
            List<Classes> requests = classesRepository.findRequestsByStudentId(currentStudent.getId());
            for(Classes r : requests){
                r.getStudentRequests().remove(currentStudent);
                classesRepository.save(r);
            }
            resultRepository.deleteAll(resultRepository.findByStudent(currentStudent));
            for(Contest c : contestsRepository.findByContestants(currentStudent)){
                c.getContestants().remove(currentStudent);
                contestsRepository.save(c);
            }

            studentService.deleteStudent(userId);
        }
        return "redirect:/admin/students";
    }

    @GetMapping("/admin/graduates")
    public String allGraduates(Model model){
        model.addAttribute("graduates", graduatesRepository.findAll());
        return "graduates";

    }


    @PostMapping("/admin/graduates")
    public String postGraduates(@RequestParam(required = false, defaultValue = "") int graduatesId,
                                @RequestParam(required = false, defaultValue = "" ) String action,Model model){
        if (action.equals("delete")){
            graduatesRepository.deleteById(graduatesId);
            return "redirect:/admin/graduates";
        }
        model.addAttribute("graduates", graduatesRepository.findAll());
        return "graduates";
    }
    @GetMapping("/admin/parents")
    public String parentList(Model model) {
        model.addAttribute("allParents", parentRepository.findAll());
        return "parents";
    }

    @PostMapping("/admin/parents")
    public String  actionsParent(@RequestParam(required = true) int parentId,
                                 @RequestParam(required = true, defaultValue = "" ) String action,
                                 Model model){
        if (action.equals("delete")){
            parentRepository.deleteById(parentId);
            return "redirect:/admin/parents";
        }
        return "redirect:/admin";

    }


    @GetMapping("/admin/edit-parent")
    public String editParent(Model model, @RequestParam int parentId) {
        model.addAttribute("parent", parentRepository.findById(parentId).get());
        return "edit-parent";
    }
    @PostMapping("/admin/edit-parent")
    public String saveEditParent(Model model, @ModelAttribute ("parent") Parent parent) {
        parentRepository.save(parent);
        return "redirect:/admin/parents";
    }

    @GetMapping("/admin/edit-user")
    public String editUser(Model model, @RequestParam int userId) {
        model.addAttribute("user", userRepository.findById(userId).get());
        model.addAttribute("allRoles", roleRepository.findAll());
        return "edit-user";
    }
    @PostMapping("/admin/edit-user")
    public String saveEditUser(Model model, @ModelAttribute ("user") User user) {

        String allRoles[] = request.getParameterValues("role");
        if(user.getRoles() == null)
            user.setRoles(new HashSet<>());
        if(allRoles!=null) {
            for (String i : allRoles) {
                user.getRoles().add(roleRepository.findById(Integer.valueOf(i)).get());
            }
        }
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/edit-student")
    public String editStudent(Model model, @RequestParam int studentId) {
        model.addAttribute("student", studentRepository.findById(studentId).get());
        model.addAttribute("allClasses", classesRepository.findAll());
        model.addAttribute("studentClasses",classesRepository.findByStudent(studentRepository.findById(studentId).get()));

        return "edit-student";
    }
    @PostMapping("/admin/edit-student")
    public String saveEditStudent(Model model, @ModelAttribute ("student") Student student) {
        studentRepository.save(student);
        List<String> classes = new ArrayList<>();
        if(request.getParameterValues("class") != null){
            classes = List.of(request.getParameterValues("class"));
        }
        System.out.println(classes);

        List<Classes> classesStudent = classesRepository.findByStudent(student);
        for(Classes c : classesStudent){
            if(!classes.contains(c.getId())){
                c.getStudent().remove(student);
                classesRepository.save(c);
            }
        }
        if(classes != null){
            for(String i : classes){
                Classes classes1 =classesRepository.findById(Integer.valueOf(i)).get();
                if(!classes1.getStudent().contains(student)) {
                    classes1.getStudent().add(student);
                    classesRepository.save(classes1);
                }
            }
        }
        return "redirect:/admin/students";
    }

    @GetMapping("/admin/edit-employee")
    public String editEmployee(Model model, @RequestParam int employeeId) {
        model.addAttribute("employee", staffRepository.findById(employeeId));
        return "edit-employee";
    }
    @PostMapping("/admin/edit-employee")
    public String saveEmployee(Model model, @ModelAttribute ("employee") Staff staff) {
        staffRepository.save(staff);
        return "redirect:/admin/staff";
    }

    @GetMapping("/admin/staff")
    public String staffList(Model model) {
        model.addAttribute("allStaff", staffRepository.findAll());
        return "staff";
    }
    @PostMapping("/admin/staff")
    public String  actionsEmployees(@RequestParam(required = true) int employeeId,
                                 @RequestParam(required = true, defaultValue = "" ) String action,
                                 Model model){
        if (action.equals("delete")){
            Staff currentEmployee = staffRepository.findById(employeeId).get();
            List<Classes> clasess = classesRepository.findByStaff(currentEmployee);
            for(Classes i : clasess){
                i.getStaff().remove(currentEmployee);
                classesRepository.save(i);
            }
            staffRepository.deleteById(employeeId);
            return "redirect:/admin/staff";
        }
        return "redirect:/admin";

    }


    @GetMapping("/admin/classes")
    public String classesList(Model model){
        model.addAttribute("allClasses",classesRepository.findAll());
        for(Classes c : classesRepository.findAll()) {

        try {
            System.out.println(c.getTypeClass().getName());
        }catch (Exception e){ System.out.println(e);}

        }
        return "all-classes";
    }
    @PostMapping("/admin/classes")
    public String classesActions(@RequestParam(required = true) int classesId,
                                 @RequestParam(required = true, defaultValue = "" ) String action,
                                 Model model){
        if (action.equals("delete")){
            classesRepository.findById(classesId).get().setStaff(new HashSet<>());
            classesRepository.findById(classesId).get().setStudent(new HashSet<>());
            Set<Schedule> Schedules = classesRepository.findById(classesId).get().getSchedules();
            classesRepository.findById(classesId).get().setSchedules(new HashSet<>());
            for(Schedule s : Schedules ){
                scheduleRepository.delete(s);
            }
            classesRepository.deleteById(classesId);
            return "redirect:/admin/classes";
        }
        return "redirect:/admin/";
    }
    @GetMapping("/admin/edit-classes")
    public String addClassesGet(@RequestParam(required = true) int classesId,
                                @RequestParam(required = true, defaultValue = "" ) String action,
                                Model model) {
        model.addAttribute("roomList",roomsRepository.findAll());
        model.addAttribute("classes",classesRepository.findById(classesId).get());
        model.addAttribute("typesClass", typeClassRepository.findAll());
        return "edit-classes";
    }
    @GetMapping("/admin/checkPupils")
    public String checkPupils() throws ParseException {
        List<Student> students = studentRepository.findAll(Sort.by(Sort.Direction.ASC, "birthdate"));
        for(Student s : students){

                LocalDate date = LocalDate.parse(s.getBirthdate());

                if( Period.between(date, LocalDate.now()).getYears()>17){
                        Graduates g = new Graduates();
                        g.setUser(s.getUser());
                        g.setName(s.getName());
                        g.setGraduation_date(LocalDate.now().toString());
                        g.setSurname(s.getSurname());
                        g.setBirthdate(s.getBirthdate());
                        graduatesRepository.save(g);
                        List<Classes> clasess = classesRepository.findByStudent(s);
                        for(Classes i : clasess){
                            i.getStudent().remove(s);
                            classesRepository.save(i);
                        }
                        studentService.deleteStudent(s.getId());
                    System.out.println("---------"+s.getId());
                }else{
                    break;
                }

        }
        return "redirect:/admin";
    }

    @PostMapping("/admin/edit-classes")
    public String postAddClasses(@RequestParam(value = "values", required = false) List<String> values, Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("roomList",roomsRepository.findAll());
        Classes classes = new Classes();
        classes.setId(Integer.parseInt(request.getParameter("id")));
        classes.setName(request.getParameter("name"));
        classes.setDescription(request.getParameter("description"));
        classes.setSchedules(new HashSet<>());
        classes.setTypeClass(typeClassRepository.findById(Integer.valueOf(request.getParameter("typeClassId"))).get());
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


        return "redirect:/admin/classes";
    }

    @GetMapping("/admin/rooms")
    public String allRooms(Model model){
        model.addAttribute("allRooms", roomsRepository.findAll());
        return "rooms";
    }
    @PostMapping("/admin/rooms")
    public String delRooms(@RequestParam(required = true) int roomsId,Model model){
        List<Schedule> schedules = scheduleRepository.findByRoomId(roomsId);
        for(Schedule t :schedules){
            t.setRoom(null);
            scheduleRepository.save(t);
        }
        roomsRepository.deleteById(roomsId);
        return "redirect:/admin/rooms";
    }

    @GetMapping("/admin/edit-room")
    public String editRoom(Model model,@RequestParam int roomsId){
        model.addAttribute("rooms",roomsRepository.findById(roomsId));
        return "edit-room";
    }

    @PostMapping("/admin/edit-room")
    public String saveEditRoom(Model model, @ModelAttribute ("room") Room room){
        roomsRepository.save(room);
        return "redirect:/admin/rooms";
    }

    @GetMapping("/admin/add-room")
    public String addRooms(Model model){
        model.addAttribute("rooms", new Room());
        return "add-room";
    }

    @PostMapping("/admin/add-room")
    public String saveAddRooms(Model model, @ModelAttribute ("rooms") Room rooms){
        roomsRepository.save(rooms);
        return "redirect:/admin/rooms";
    }

    @GetMapping("/admin/users/gt/{userId}")
    public String  gtUser(@PathVariable("userId") int userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    /* Contests */

    @Autowired ContestsRepository contestsRepository;
    @GetMapping("/admin/contests")
    public String adminContests(Model model){
        model.addAttribute("contests", contestsRepository.findAll());
        return "admin\\contests";
    }
    @PostMapping("/admin/contests")
    public String actionsContests(@RequestParam(required = true) int contestId,
                                  @RequestParam(required = true, defaultValue = "" ) String action,
                                  Model model){
        if (action.equals("delete")) {
            contestsRepository.deleteById(contestId);
        }
            return "redirect:/admin/contests";
    }


    @GetMapping("/admin/add-contest")
    public String addContests(Model model){
        model.addAttribute("contest", new Contest());
        return "admin\\add-contest";
    }

    @PostMapping("/admin/add-contest")
    public String saveContests(Model model,  @ModelAttribute ("contest") Contest contest){
        contestsRepository.save(contest);
        return "redirect:/admin/contests";
    }
    @Autowired
    ResultRepository resultRepository;
    @GetMapping("/admin/edit-contest")
    public String addContestEditGet(@RequestParam(required = true) int contestId,
                                @RequestParam(required = true, defaultValue = "" ) String action,
                                Model model) {
        Contest contest = contestsRepository.findById(contestId).get();
        model.addAttribute("contest",contest);
        model.addAttribute("contestants",contest.getContestants());
        model.addAttribute("results", resultRepository.findByContest(contest));
        return "admin\\edit-contest";
    }
    @PostMapping("/admin/edit-contest")
    public String editContestSave(Model model, @ModelAttribute ("contest") Contest contest,  @RequestParam (value = "contestants", required = false) List<Student> contestants, @RequestParam (value = "results", required = false) List<String> results) {
        if(contestants!=null)
        contest.setContestants(new HashSet<>(contestants));
        if(results!=null)
        {
            for(int i = 0; i<results.size(); i+=4){
                Result r = new Result();
                r.setContest(contest);
                r.setId(Integer.parseInt(results.get(i)));
                r.setStudent(studentRepository.findById(Integer.valueOf(results.get(i+2))).get());
                r.setDetails(results.get(i+1));
                resultRepository.save(r);
            }
        }
        contestsRepository.save(contest);
        return "redirect:/admin/contests";
    }


    @Autowired
    TypeClassRepository typeClassRepository;
    @GetMapping("/admin/types-class")
    public String allTypeClass(Model model){
        model.addAttribute("types",typeClassRepository.findAll());
        return "admin\\types-class";
    }


    @PostMapping("/admin/types-class")
    public String actionsTypesClass(@RequestParam(required = true) int typeId,
                                    @RequestParam(required = true, defaultValue = "" ) String action,
                                    Model model){
        if (action.equals("delete")) {
            typeClassRepository.deleteById(typeId);
        }
        return "redirect:/admin/types-class";
    }


    @GetMapping("/admin/add-types-class")
    public String addTypeClass(Model model){
        model.addAttribute("type",new TypeClass());
        return "admin\\add-types-class";
    }

    @PostMapping("/admin/add-types-class")
    public String addPostTypeClass(Model model,  @ModelAttribute ("type") TypeClass typeClass){
        typeClassRepository.save(typeClass);
        return "redirect:/admin/types-class";
    }

    @GetMapping("/admin/edit-types-class")
    public String editTypeClass(Model model, @RequestParam(required = true) int typeId){
        model.addAttribute("type",typeClassRepository.findById(typeId).get());
        return "admin\\edit-types-class";
    }

    @PostMapping("/admin/edit-types-class")
    public String postEditTypeClass(Model model,  @ModelAttribute ("type") TypeClass typeClass){
        typeClassRepository.save(typeClass);
        return "redirect:/admin/types-class";
    }






    /* News */

    @Autowired
    NewsRepository newsRepository;

    @GetMapping("/admin/all-news")
    public String allNews(Model model){
        model.addAttribute("news",newsRepository.findAll());
        return "admin\\all-news";
    }
    @PostMapping("/admin/all-news")
    public String allNewsPost(@RequestParam(required = true) int id,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model){
        if (action.equals("delete")) {
            newsRepository.deleteById(id);
        }
        return "redirect:/admin/all-news";
    }

    @GetMapping("/admin/add-news")
    public String addNews(Model model){
        model.addAttribute(new News());
        return "admin\\add-news";
    }
    @PostMapping("/admin/add-news")
    public String addNewsSave(@ModelAttribute ("news") News news){
        news.setPublish_date(LocalDate.now().toString());
        newsRepository.save(news);
        return "redirect:/admin/all-news";
    }
    @GetMapping("/admin/edit-news")
    public String editNews(Model model, @RequestParam("id") int newsId){
        model.addAttribute(newsRepository.findById(newsId).get());
        return "admin\\edit-news";
    }
    @PostMapping("/admin/edit-news")
    public String editNewsSave(@ModelAttribute ("news") News news){
        newsRepository.save(news);
        return "redirect:/admin/all-news";
    }


    @GetMapping("/news")
    public String allNews(Model model, @RequestParam(required = true,defaultValue = "-1") int id){
       if(id>-1){
            model.addAttribute("news", newsRepository.findById(id).get());
            return "news";
        }
        System.out.println(newsRepository.findAll());
        model.addAttribute("allnews", newsRepository.findAll());
        return "allNews";
    }

}
