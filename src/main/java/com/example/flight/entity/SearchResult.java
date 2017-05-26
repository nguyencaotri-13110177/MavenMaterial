package com.example.flight.entity;

public class SearchResult {
   
    private String airline, depart, arrive;
    private int duration;
    private String pricePerPerson;

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getArrive() {
        return arrive;
    }

    public void setArrive(String arrive) {
        this.arrive = arrive;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getPricePerPerson() {
        return pricePerPerson;
    }

    public void setPricePerPerson(String pricePerPerson) {
        this.pricePerPerson = pricePerPerson;
    }  
}
