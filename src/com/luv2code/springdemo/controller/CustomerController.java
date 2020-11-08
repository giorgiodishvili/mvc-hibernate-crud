package com.luv2code.springdemo.controller;

import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    // need to inject our customer service
    @Autowired
    private CustomerService customerService;

    @GetMapping("/list")
    public String listCustomers(Model theModel) {

        // get customers from the service
        List<Customer> theCustomers = customerService.getCustomers();

        // add the customers to the model
        theModel.addAttribute("customers", theCustomers);

        return "list-customers";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        //create model attriute to bind form data;

        Customer customer = new Customer();
        theModel.addAttribute("customer", customer);
        return "customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
        customerService.saveCustomer(theCustomer);
        //save the customer via service

        return "redirect:/customer/list";

    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int theId,
                                    Model theModel) {
        //get the customer from the database
        Customer customer = customerService.getCustomer(theId);
        //set customer as model attribut to prepopulate form
        theModel.addAttribute("customer", customer);
        //send over to our form
        return "customer-form";
    }

    @GetMapping("delete")
    public String delete(@RequestParam("customerId") int theid) {
        customerService.deleteCustomer(theid);

        return "redirect:/customer/list";
    }

    @GetMapping("/search")
    public String searchCustomer(@RequestParam("theSearchName") String theSearchName,
                                 Model model) {
        List<Customer> theCustomers = customerService.searchCustomers(theSearchName);

        model.addAttribute("customers", theCustomers);

        return "list-customers";
    }

}










