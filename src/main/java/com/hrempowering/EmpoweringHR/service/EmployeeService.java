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

    public Collection<Employee> findByFirstNameOrderById(String name) {
        return employeeRepository.findByFirstNameOrderById(name);
    }

    public Collection<Employee> findByLastNameOrderById(String name) {
        return employeeRepository.findByLastNameOrderById(name);
    }

    public List<Employee> getEmployeesByName(String name) {
        return employeeRepository.findByLastNameIgnoreCaseContaining(name);
    }

    public List<Employee> getEmployeesByRoleName(String roleId) {
        return employeeRepository.findByRoleName(roleId);
    }


    public void addEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

}
