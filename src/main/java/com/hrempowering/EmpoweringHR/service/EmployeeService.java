package com.hrempowering.EmpoweringHR.service;


import com.hrempowering.EmpoweringHR.domain.mysql.Employee;
import com.hrempowering.EmpoweringHR.repository.mysql_dao.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    @Autowired
    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee getEmployeeById(int id) {
        return employeeRepository.findFirstById(id);
    }

    public Employee createEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public Employee updateEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public void deleteEmployee(int id) {
        employeeRepository.deleteById(id);
    }

    public Collection<Employee> findByNameOrderById(String name) {
        return employeeRepository.findByNameOrderById(name);
    }

    public List<Employee> getEmployeesByName(String name) {
        return employeeRepository.findByNameIgnoreCaseContaining(name);
    }

    public List<Employee> getEmployeesByRoleId(String roleId) {
        return employeeRepository.findByRoleId(roleId);
    }


}
