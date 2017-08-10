package com.tnt.booking.flight.controller;

import com.tnt.booking.flight.entity.AirLine;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class AirLineController {

    @RequestMapping(value = "/airline", method = RequestMethod.GET)
    public String airline() {
        try {
            
            
            
            final String uri = "http://klikmbc.co.id/json/getcodeflights-json";
            RestTemplate restTemplate = new RestTemplate();
            List<AirLine> ListAirLine = Arrays.asList(restTemplate.getForObject(uri, AirLine[].class));

            
            Optional<AirLine> a = ListAirLine.stream()
                    .filter((s) -> "NX".equals(s.getFlight_code())).findFirst();
            
            
            //System.out.println(ListAirLine.get(0).getFlight_image());
            System.out.println(a.get().getFlight_image());

            return "index";
        } catch (Exception e) {
            return "loi2";
        }
    }

}
