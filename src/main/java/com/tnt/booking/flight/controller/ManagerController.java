package com.tnt.booking.flight.controller;

import com.tnt.booking.flight.entity.SearchResult2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManagerController {
    @RequestMapping(value = "/dangnhap", method = RequestMethod.GET)
    public String dangnhap() {
        return "dangnhap";
    }
    
    @RequestMapping(value = "/quenmatkhau", method = RequestMethod.GET)
    public String quenmatkhau() {
        return "quenmatkhau";
    }
    
    @RequestMapping(value = "/quanly", method = RequestMethod.GET)
    public String quanly() {
        return "quanly";
    }
    
    @RequestMapping(value = "/thanhtoanthanhcong", method = RequestMethod.GET)
    public String thanhtoanthanhcong(@RequestParam("id") String id, ModelMap mm) {
        
        mm.addAttribute("id", id);
        return "thanhtoanthanhcong";
    }
    
    
}
