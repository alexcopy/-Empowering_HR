package com.hrempowering.EmpoweringHR.web.rest;

import com.hrempowering.EmpoweringHR.domain.mysql.Employee;
import com.hrempowering.EmpoweringHR.service.EmployeeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.UUID;

@Controller
public class IndexController {

    private final EmployeeService employeeService;
    private final ResourceLoader resourceLoader;

    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;

    @Autowired
    public IndexController(EmployeeService employeeService, ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
        this.employeeService = employeeService;
    }

    @PostMapping("/addEmployee")
    public String addEmployee(@ModelAttribute Employee employee, HttpServletRequest request,
                              @RequestParam("pict") MultipartFile file) {
        String dateOfBirth = request.getParameter("dateOfBirth");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String fileName =   UUID.randomUUID()  + "_" + file.getOriginalFilename();
            String uploadDir = resourceLoader.getResource("static/images/uploads").getFile().getAbsolutePath()
                    .replace("webapp", "resources");
            String filePath = Paths.get(uploadDir, fileName).toString();
            String targetDir = resourceLoader.getResource("classpath:/static/images/uploads").getFile().getAbsolutePath();
            String targetDirFilePath = Paths.get(targetDir, fileName).toString();
            File targetPath = new File(targetDirFilePath);
            File destFile = new File(filePath);
            Files.copy(file.getInputStream(), destFile.toPath());
            file.transferTo(targetPath);
            employee.setDateOfBirth(simpleDateFormat.parse(dateOfBirth));
            employee.setPicture("images/uploads/" + fileName);
        } catch (ParseException e) {
            System.out.println("ParseException: " + e.getMessage());
            throw new RuntimeException();
        } catch (IOException e) {
            System.out.println("IOException: " + e.getMessage());
            throw new RuntimeException(e);
        }
        employeeService.addEmployee(employee);
        return "redirect:/team";
    }

    @GetMapping("/")
    public String index(Model model, HttpServletRequest request) {
        String urlPath = request.getRequestURI();
        model.addAttribute("urlPath", urlPath);
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "map";
    }

    @GetMapping("/team")
    public String team(Model model, HttpServletRequest request) {
        String urlPath = request.getRequestURI();
        model.addAttribute("urlPath", urlPath);
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "map";
    }

    @GetMapping("/employees")
    public String contacts(Model model, HttpServletRequest request) {
        String urlPath = request.getRequestURI();

        model.addAttribute("urlPath", urlPath);
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "map";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee( @PathVariable Integer id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employees";
    }
}