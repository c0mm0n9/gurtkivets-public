package com.boots.service;

import com.boots.entity.*;
import com.boots.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.*;

import jakarta.mail.*;
import jakarta.mail.internet.*;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    StudentRepository studentRepository;
    @Autowired
    ParentRepository parentRepository;
    @Autowired
    ClassesRepository classesRepository;
    @Autowired
    StaffRepository staffRepository;

    @Autowired
    TokenRepository tokenRepository;



    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public User findUserById(int userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public List<User> allUsers() {
        return (List<User>) userRepository.findAll();
    }

    public boolean saveUser(String username,String email, String password) {
        User userFromDB = userRepository.findByUsername(username);

        if (userFromDB != null) {
            return false;
        }
        User user = new User();
        user.setRoles(Collections.singleton(new Role(1, "ROLE_USER")));
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(bCryptPasswordEncoder.encode(password));
        VerificationToken token = new VerificationToken();
        token.setUser(user);
        token.setToken(UUID.randomUUID().toString());
        token.setType(0);
        userRepository.save(user);
        tokenRepository.save(token);
        Email email1 = new Email();
        email1.sendEmail("Підтвердіть свій E-MAIL","localhost:8080/confirm-email?token="+token.getToken(),user.getEmail().toString());

        return true;
    }
    public boolean setPassword(String password,String token){
        try {


        VerificationToken token1 = tokenRepository.findByToken(token);
        User user = token1.getUser();
        user.setPassword(bCryptPasswordEncoder.encode(password));
        userRepository.save(user);
        tokenRepository.delete(token1);
        return true;
        }catch (Exception e){
            return  false;
        }
    }
    public boolean deleteUser(int userId) {
        if (userRepository.findById(userId).isPresent()) {
            for(Parent i:parentRepository.findByUser(userRepository.findById(userId).get())){
                parentRepository.delete(i);
            }
            for(Student k:studentRepository.findByUser(userRepository.findById(userId).get())){
                List<Classes> clasess = classesRepository.findByStudent(k);
                for(Classes i : clasess){
                    i.getStudent().remove(k);
                    classesRepository.save(i);
                }
                studentRepository.delete(k);
            }
            Staff currentEmployee = staffRepository.findByUser(userRepository.findById(userId).get());
            List<Classes> clasess = classesRepository.findByStaff(currentEmployee);
            for(Classes i : clasess){
                i.getStaff().remove(currentEmployee);
                classesRepository.save(i);
            }
            try {
                staffRepository.delete(staffRepository.findByUser(userRepository.findById(userId).get()));
            }catch (Exception e){}
            try {
                tokenRepository.deleteAll(tokenRepository.findByUser(userRepository.findById(userId).get()));
            }catch (Exception e){}

            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }
    public boolean sendResetPassword(String username){
        Email email = new Email();
        VerificationToken token = new VerificationToken();
        User user = userRepository.findByUsername(username);
        token.setUser(user);
        token.setToken(UUID.randomUUID().toString());
        token.setType(1);
        userRepository.save(user);
        tokenRepository.save(token);
        email.sendEmail("Відновлення паролю","localhost:8080/reset-password?token="+token.getToken(),user.getEmail().toString());
        return true;
    }
    public List<User> usergtList(int idMin) {
        return em.createQuery("SELECT u FROM User u WHERE u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }


}
class Email{
    Email(){

    }
    public void sendEmail(String subject, String text, String recipient){
       System.out.println(subject+"\n"+text+"\n"+recipient);
    }
}
