package com.hrempowering.EmpoweringHR.repository.mysql_dao;


import com.hrempowering.EmpoweringHR.domain.mysql.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface EmployeeRepository extends JpaRepository<Employee, String> {

    Employee findFirstById(int id);

    void deleteById(int id);

    List<Employee> findByFirstNameOrderById(String firstName);

    List<Employee> findByLastNameOrderById(String firstName);

    List<Employee> findByLastNameIgnoreCaseContaining(String name);

    List<Employee> findByRoleName(String roleId);

    List<Employee> findByPhoneNumber(String roleId);

}