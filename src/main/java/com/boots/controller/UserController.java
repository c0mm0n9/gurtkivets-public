package com.boots.controller;

import com.boots.entity.*;
import com.boots.repository.*;
import com.boots.service.StudentService;
import com.boots.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.coyote.Request;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.*;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    StudentRepository studentRepository;

    @Autowired
    GraduatesRepository graduatesRepository;
    @Autowired
    HttpServletRequest request;
    @Autowired
    private ParentRepository parentRepository;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ClassesRepository classesRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private TypeClassRepository typeClassRepository;
    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private TokenRepository tokenRepository;
    @GetMapping("/")
    public String homePage(Model model){
        Set<Classes> todayClasses = new HashSet<>();
        for(Schedule s : scheduleRepository.findByDay(LocalDate.now().getDayOfWeek().name()))
        {
            Classes c = classesRepository.findBySchedules(s);
            c.setSchedules(Collections.singleton(s));
            todayClasses.add(c);
        }
        model.addAttribute("news",newsRepository.lastNews(4));
        model.addAttribute("allClasses",todayClasses);
        model.addAttribute("typeClasses",typeClassRepository.findAll());
        return "index";
    }

    @GetMapping("/account")
    public String studentList(Model model, @AuthenticationPrincipal User user) {
        List<Student> students = studentRepository.findByUser(user);

        for(int i = 0; i< students.size(); i++){
            List<Classes> classesSet = new ArrayList<>();
            for(Classes c : classesRepository.findByStudent(students.get(i))) {
                c.setStudent(new HashSet<>());
                c.setStudentRequests(new HashSet<>());
                classesSet.add(c);
            }
            students.get(i).setClasses(classesSet);
        }
        model.addAttribute("allStudents", students);
        model.addAttribute("allParents", parentRepository.findByUser(user));
        model.addAttribute("allGraduates", graduatesRepository.findByUser(user));
        return "account";
    }
    @PostMapping("/account")
    public String postAccount(Model model,@RequestParam(required = true, defaultValue = "" ) String action, @RequestParam(required = true) int classesId, @RequestParam(required = true) int studentId) {
        if (action.equals("leave")){
            Student student = studentRepository.findById(studentId).get();
            Classes classes = classesRepository.findById(classesId).get();
            classes.getStudent().remove(student);
            classesRepository.save(classes);
        }
        return "redirect:/account";
    }



    @GetMapping("/account/add-student")
    public String addStudent(Model model) {
        model.addAttribute("studentForm", new Student());
        model.addAttribute("allClasses", classesRepository.findAll());
        return "add-student";
    }

    @PostMapping("/account/add-student")
    public String addUser(@ModelAttribute("studentForm") @Valid Student studentForm, BindingResult bindingResult, Model model, @AuthenticationPrincipal User user) {
        String classes [] = request.getParameterValues("class");
        if (bindingResult.hasErrors()) {
            return "add-student";
        }
        if (!studentService.saveStudent(studentForm,user)){
            // model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "add-student";
        }
        studentForm.setUser(user);
        studentRepository.save(studentForm);

        if(classes != null){
            for(String i : classes){
                Classes classes1 =classesRepository.findById(Integer.valueOf(i)).get();
                classes1.getStudent().add(studentForm);
                classesRepository.save(classes1);
            }
        }

        return "redirect:/account/";
    }

    @RequestMapping("/account/diploma")
    public String getDiploma(Model model, @RequestParam int graduatesId, @AuthenticationPrincipal User user) throws IOException{
        if(graduatesRepository.findById(graduatesId).get().getUser().getId() == user.getId()) {
            File f = new File("graduates"+graduatesId+".jpg");
            if(!f.exists() && !f.isDirectory()) {
              Graduates g = graduatesRepository.findById(graduatesId).get();


            int width = 2480;
            int height = 3508;

            // Constructs a BufferedImage of one of the predefined image types.
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            // Create a graphics which can be used to draw into the buffered image
            Graphics2D g2d = bufferedImage.createGraphics();

            // fill all the image with white
            g2d.setColor(Color.white);
            g2d.fillRect(0, 0, width, height);

                g2d.setFont(new Font("TimesRoman", Font.PLAIN, 250  ));
                // fill all the image with white


                // create a string with yellow
                g2d.setColor(Color.black);
                g2d.drawString("Диплом", 672, 678);
                g2d.drawString(g.getName()+" "+g.getSurname(), 878, 778);

            // Disposes of this graphics context and releases any system resources that it is using.
            g2d.dispose();

            // Save as PNG
            File file = new File("graduates"+graduatesId+".jpg");
                try {
                    ImageIO.write(bufferedImage, "jpg", file);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }



        }
        File file = new File("graduates"+graduatesId+".jpg");
        model.addAttribute("diploma",file.getName());
        return ("diploma");

    }

    @GetMapping("/account/add-parents")
    public String parentForm(Model model, @AuthenticationPrincipal User user) {
        if(parentRepository.findByUser(user).size()==2) return "redirect:/account/";;
        model.addAttribute("parentQty", parentRepository.findByUser(user).size());
        return "add-parents";
    }
    @RequestMapping("/account/add-parents")
    public String addParent(@AuthenticationPrincipal User user) {
        Parent parent1 = new Parent();
        Parent parent2 = new Parent();
        if(parentRepository.findByUser(user).size()<2){
        if(request.getParameter("parent1-name") !="") {
            parent1.setName(request.getParameter("parent1-name"));
            parent1.setSurname(request.getParameter("parent1-surname"));
            parent1.setGender(request.getParameter("parent1-gender"));
            parent1.setPhone(request.getParameter("parent1-phone"));
            parent1.setJob(request.getParameter("parent1-job"));
            parent1.setJobPhone(request.getParameter("parent1-jobPhone"));
            parent1.setUser(user);
            parentRepository.save(parent1);
        }
        if(request.getParameter("parent2-name") !="" && parentRepository.findByUser(user).size()==1) {

            parent2.setName(request.getParameter("parent2-name"));
            parent2.setSurname(request.getParameter("parent2-surname"));
            parent2.setGender(request.getParameter("parent2-gender"));
            parent2.setPhone(request.getParameter("parent2-phone"));
            parent2.setJob(request.getParameter("parent2-job"));
            parent2.setJobPhone(request.getParameter("parent2-jobPhone"));
            parent2.setUser(user);
            parentRepository.save(parent2);

        }
        }
        return "redirect:/account/";
    }

    @GetMapping("/account/edit-parent")
    public String editParent(Model model, @RequestParam int parentId, @AuthenticationPrincipal User user) {
        if(parentRepository.findById(parentId).get().getUser().getId()==user.getId()) {
            model.addAttribute("parent", parentRepository.findById(parentId).get());
            return "edit-parent";
        }else{
            return "redirect:/account";
        }
    }
    @PostMapping("/account/edit-parent")
    public String saveEditParent(Model model, @ModelAttribute ("parent") Parent parent) {
        parentRepository.save(parent);
        return "redirect:/account";
    }

    @GetMapping("/account/edit-student")
    public String editStudent(Model model, @RequestParam int studentId, @AuthenticationPrincipal User user) {
        if(studentRepository.findById(studentId).get().getUser().getId()==user.getId()){
        model.addAttribute("student", studentRepository.findById(studentId).get());
        model.addAttribute("allClasses", classesRepository.findNotAttendedByStudentId(studentId));
        //classesRepository.findByStudent(studentRepository.findById(studentId).get())
        model.addAttribute("studentClasses",classesRepository.findRequestsByStudentId(studentId));

        return "edit-student";
        }else {
            return "redirect:/account";
        }
    }
    @PostMapping("/account/edit-student")
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
                c.getStudentRequests().remove(student);
                classesRepository.save(c);
            }
        }
        if(classes != null){
            for(String i : classes){
                Classes classes1 =classesRepository.findById(Integer.valueOf(i)).get();
                if(!classes1.getStudentRequests().contains(student)) {
                    classes1.getStudentRequests().add(student);
                    classesRepository.save(classes1);
                }
            }
        }
        return "redirect:/account";
    }

    //EMAIL CONFIRM
    @GetMapping("/confirm-email")
    public String confirmEmail(Model model, @RequestParam String token, @AuthenticationPrincipal User user) {
        VerificationToken token1 = tokenRepository.findByToken(token);
        if(token1!=null) {
            User user1 = token1.getUser();
            if (token1.getType() == 0) {
                user1.setEnabled(true);
                userRepository.save(user1);
                tokenRepository.delete(token1);
                model.addAttribute("message","Ви вдало підтвердили пошту!");
            }else{
                model.addAttribute("message","Сталася помилка");
            }
        }else{
            model.addAttribute("message","Сталася помилка");
        }

        return "result";
    }

    //RESET PASSWORD

    @GetMapping("/reset-password")
    public String resetPassword(Model model, @RequestParam(required = false, name = "token") String token) {
        String username = "";
        model.addAttribute("username", username);
        if(token!=null){
            model.addAttribute("token", token);
            return "reset-password-form";
        }
        return "reset-password";
    }
    @PostMapping("/reset-password")
    public String resetPostPassword(Model model) {
        String token =request.getParameter("token");
        System.out.println(token);
        if(request.getParameter("newPassword")!=null){
           if(userService.setPassword(request.getParameter("newPassword"),token))
           {
               model.addAttribute("message","Успішно!");

           }else{
               model.addAttribute("message","Сталася помилка!");
           }
            return "result";
        }else
        if(token==null && request.getParameter("newPassword")==null && request.getParameter("username")!=null){
           userService.sendResetPassword(request.getParameter("username"));
            model.addAttribute("message","Перевірте ваш E-MAIL!");
            return "result";
        }else if(request.getParameter("username")!=null){
            model.addAttribute("message","Сталася помилка!");
            return "result";
        }
        model.addAttribute("username", new String());

        return "reset-password";
    }



}
