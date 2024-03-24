package com.boots.service;

import antlr.actions.python.CodeLexer;
import com.boots.entity.Role;
import com.boots.entity.Student;
import com.boots.entity.User;
import com.boots.repository.StudentRepository;
import com.boots.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class StudentService {
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    UserRepository userRepository;
    public boolean saveStudent(Student student, User user) {
        /*studentRepository.save(student);
        user.getStudents().add(student);
        userRepository.save(user);*/
        return true;

    }

    public List<Student> allStudent(){
        return studentRepository.findAll();
    }

    public boolean deleteStudent(int studentId){
        if(studentRepository.findById(studentId).isPresent()){
            studentRepository.deleteById(studentId);
            return true;
        }
        return false;
    }


}
