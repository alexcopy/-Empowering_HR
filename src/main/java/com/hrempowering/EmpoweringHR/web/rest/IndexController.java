package com.hrempowering.EmpoweringHR.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class IndexController {

    @GetMapping("/map")
    public String index(Model model) {
        return "map";
    }

    @GetMapping("/")
    public String index_2(Model model) {
        return "map";
    }
}