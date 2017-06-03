package com.example.flight.controller;

import com.example.flight.entity.SearchTicket;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchTicketController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "index";
    }
    
    @RequestMapping(value = "/thanhtoan", method = RequestMethod.GET)
    public String thanhtoan() {
        return "thanhtoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_vietcombank", method = RequestMethod.GET)
    public String chuyenkhoan_vietcombank(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","Vietcombank");
        return "chuyenkhoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_vietinbank", method = RequestMethod.GET)
    public String chuyenkhoan_vietinbank(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","Vietinbank");
        return "chuyenkhoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_bidv", method = RequestMethod.GET)
    public String chuyenkhoan_bidv(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","BIVD");
        return "chuyenkhoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_techcombank", method = RequestMethod.GET)
    public String chuyenkhoan_techcombank(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","Techcombank");
        return "chuyenkhoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_sacombank", method = RequestMethod.GET)
    public String chuyenkhoan_sacombank(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","Sacombank");
        return "chuyenkhoan";
    }
    
    @RequestMapping(value = "/chuyenkhoan_acb", method = RequestMethod.GET)
    public String chuyenkhoan_acb(ModelMap mm) {
        
        mm.addAttribute("TenNganHang","ACB");
        return "chuyenkhoan";
    }
    
    
    
    
}
