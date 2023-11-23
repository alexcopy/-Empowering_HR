package com.hrempowering.EmpoweringHR.seeders;

import com.github.javafaker.Faker;
import com.hrempowering.EmpoweringHR.domain.mysql.Employee;
import com.hrempowering.EmpoweringHR.repository.mysql_dao.EmployeeRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

//@Component
public class DataSeeder {

    private final EmployeeRepository employeeRepository;
    private final Faker faker; // Add the Faker instance
    private static final List<String> PICTURE_PATHS = Arrays.asList(
            "images/user/u-xl-1.jpg",
            "images/user/u-xl-10.jpg",
            "images/user/u-xl-11.jpg",
            "images/user/u-xl-12.jpg",
            "images/user/u-xl-2.jpg",
            "images/user/u-xl-3.jpg",
            "images/user/u-xl-4.jpg",
            "images/user/u-xl-5.jpg",
            "images/user/u-xl-6.jpg",
            "images/user/u-xl-7.jpg",
            "images/user/u-xl-8.jpg",
            "images/user/u-xl-9.jpg",
            "images/user/user-md-01.jpg",
            "images/user/user-md-1.jpg",
            "images/user/user-md-2.jpg",
            "images/user/user-md-3.jpg",
            "images/user/user-md-4.jpg",
            "images/user/user-md-5.jpg",
            "images/user/user-sm-01.jpg",
            "images/user/user-sm-02.jpg",
            "images/user/user-sm-03.jpg",
            "images/user/user-sm-04.jpg",
            "images/user/user-sm-05.jpg",
            "images/user/user-sm-06.jpg",
            "images/user/user-xs-01.jpg"
    );

//    @Autowired
    public DataSeeder(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
        this.faker = new Faker(); // Initialize Faker instance
    }

//    @PostConstruct
    public void seedData() throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < 50; i++) {
            Employee employee = new Employee();
            employee.setFirstName(faker.funnyName().name());
            employee.setLastName(faker.funnyName().name());
            employee.setRoleName(faker.job().position());
            employee.setPhoneNumber(faker.phoneNumber().cellPhone());
            employee.setEmail(faker.internet().emailAddress());
            employee.setPto(faker.number().numberBetween(1, 100));
            employee.setRoleName(faker.job().seniority());
            employee.setDateOfBirth(faker.date().birthday());
            employee.setLocation(faker.address().cityName());
            Date startDateMin = dateFormat.parse("2010-01-01");
            Date startDateMax = dateFormat.parse("2023-12-31");
            long startTimeMillis = startDateMin.getTime();
            long endTimeMillis = startDateMax.getTime();
            long randomTimeMillis = ThreadLocalRandom.current().nextLong(startTimeMillis, endTimeMillis + 1);
            employee.setStartDate(new Date(randomTimeMillis));
            int randomIndex = faker.random().nextInt(PICTURE_PATHS.size());
            employee.setPicture(PICTURE_PATHS.get(randomIndex));

            employeeRepository.save(employee);
        }
    }
}
