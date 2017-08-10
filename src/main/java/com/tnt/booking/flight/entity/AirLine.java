package com.tnt.booking.flight.entity;

import org.codehaus.jackson.annotate.JsonProperty;

public class AirLine {
    
    @JsonProperty("flight_code")
    private String flight_code;
    
    @JsonProperty("flight_name")
    private String flight_name;
    
    @JsonProperty("flight_image")
    private String flight_image;

    public String getFlight_code() {
        return flight_code;
    }

    public void setFlight_code(String flight_code) {
        this.flight_code = flight_code;
    }

    public String getFlight_name() {
        return flight_name;
    }

    public void setFlight_name(String flight_name) {
        this.flight_name = flight_name;
    }

    public String getFlight_image() {
        return flight_image;
    }

    public void setFlight_image(String flight_image) {
        this.flight_image = flight_image;
    }

   
    
    
    
}
