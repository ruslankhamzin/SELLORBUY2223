package com.example.buysell.controllers;

import com.example.buysell.models.User;
import com.example.buysell.models.UserROLES;
import com.example.buysell.models.enums.Role;
import com.example.buysell.repositories.User_roleRepository;
import com.example.buysell.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private User_roleRepository user_roleRepository;

    private List abc = new ArrayList();

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("users", userService.list());
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/newRole")
    public String newRole(@RequestParam Map<String,String> form) throws ParseException {
        if (abc.isEmpty()) {
            abc.addAll(List.of(Role.values()));
        }
        abc.add(form.get("name"));
        return "redirect:/admin";
    }
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", abc);
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
}
