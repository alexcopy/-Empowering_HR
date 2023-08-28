package com.hrempowering.EmpoweringHR.web.rest;

import com.hrempowering.EmpoweringHR.domain.mysql.Employee;
import com.hrempowering.EmpoweringHR.service.EmployeeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
public class IndexController {

    private final EmployeeService employeeService;

    @Autowired
    public IndexController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/addEmployee")
    public String addEmployee(@ModelAttribute Employee employee, HttpServletRequest request) {
        String dateOfBirth = request.getParameter("dateOfBirth");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            employee.setDateOfBirth(simpleDateFormat.parse(dateOfBirth));
        } catch (ParseException e) {

          throw new RuntimeException();
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

}