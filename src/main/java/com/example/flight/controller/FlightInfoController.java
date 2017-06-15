package com.example.flight.controller;

import com.example.flight.resdata.FlightInformation;
import com.google.api.services.qpxExpress.model.LegInfo;
import com.google.api.services.qpxExpress.model.PricingInfo;
import com.google.api.services.qpxExpress.model.SegmentInfo;
import com.google.api.services.qpxExpress.model.SliceInfo;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FlightInfoController {
    
    @RequestMapping(value = "flight-info", params = "v", method = RequestMethod.GET)
    public String flightInfo(@RequestParam("id") String id, ModelMap model) {
        
        int n = FlightInformation.flightTripInfos.size();
        int item = 0;
        
        for (int i = 0; i < n; i++) {
            if (FlightInformation.flightTripInfos.get(i).getId().equals(id)) {
                item = i;
            }
        }
        
        List<LegInfo> leg = FlightInformation.flightTripInfos.get(item).getSlice().get(0).getSegment().get(0).getLeg();
        List<SegmentInfo> segment = FlightInformation.flightTripInfos.get(item).getSlice().get(0).getSegment();
        List<PricingInfo> price = FlightInformation.flightTripInfos.get(item).getPricing();
        
        model.addAttribute("fOrigin", leg.get(0).getOrigin());
        model.addAttribute("fDestination", leg.get(0).getDestination());
        model.addAttribute("fAirline", segment.get(0).getFlight().getCarrier());
        model.addAttribute("fAircraft", leg.get(0).getAircraft());
        model.addAttribute("fArrive", leg.get(0).getArrivalTime());
        model.addAttribute("fDepart", leg.get(0).getDepartureTime());
        model.addAttribute("fPrice", price.get(0).getBaseFareTotal());
        
        return "flight_info";
    }
}
