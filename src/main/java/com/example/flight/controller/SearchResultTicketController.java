package com.example.flight.controller;

import com.example.flight.entity.SearchResult;
import com.example.flight.entity.SearchTicket;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.qpxExpress.QPXExpress;
import com.google.api.services.qpxExpress.QPXExpressRequestInitializer;
import com.google.api.services.qpxExpress.model.FlightInfo;
import com.google.api.services.qpxExpress.model.LegInfo;
import com.google.api.services.qpxExpress.model.PassengerCounts;
import com.google.api.services.qpxExpress.model.PricingInfo;
import com.google.api.services.qpxExpress.model.SegmentInfo;
import com.google.api.services.qpxExpress.model.SliceInfo;
import com.google.api.services.qpxExpress.model.SliceInput;
import com.google.api.services.qpxExpress.model.TripOption;
import com.google.api.services.qpxExpress.model.TripOptionsRequest;
import com.google.api.services.qpxExpress.model.TripsSearchRequest;
import com.google.api.services.qpxExpress.model.TripsSearchResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchResultTicketController {

    private static final String APPLICATION_NAME = "FlightTicket";

    private static final String API_KEY = "AIzaSyDv657-DW-HlSWCMvV0DhD1TJJV3RN-S_Q";

    /**
     * Global instance of the HTTP transport.
     */
    private static HttpTransport httpTransport;

    /**
     * Global instance of the JSON factory.
     */
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String resultSearch(@ModelAttribute("searchTicket") SearchTicket searchTicket, ModelMap model) {
        List<SearchResult> searchResults = new ArrayList<>();
        try {
            httpTransport = GoogleNetHttpTransport.newTrustedTransport();

            PassengerCounts passengers = new PassengerCounts();
            passengers.setAdultCount(searchTicket.getAdultCount()); // Price[1]
            passengers.setChildCount(searchTicket.getChildCount()); // Price[2]
            passengers.setSeniorCount(searchTicket.getSeniorCount());
            passengers.setInfantInSeatCount(0); // Price[3]
            passengers.setInfantInLapCount(0); // Price[4]

            List<SliceInput> slices = new ArrayList<>();

            SliceInput slice = new SliceInput();
            slice.setOrigin(searchTicket.getOrigin());
            slice.setDestination(searchTicket.getDestination());
            slice.setDate(searchTicket.getDate());
            slices.add(slice);

            TripOptionsRequest request = new TripOptionsRequest();
            request.setSolutions(3);
            request.setPassengers(passengers);
            request.setSlice(slices);

            TripsSearchRequest parameters = new TripsSearchRequest();
            parameters.setRequest(request);
            QPXExpress qpXExpress = new QPXExpress.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME)
                    .setGoogleClientRequestInitializer(new QPXExpressRequestInitializer(API_KEY)).build();

            TripsSearchResponse list = qpXExpress.trips().search(parameters).execute();
            List<TripOption> tripResults = list.getTrips().getTripOption();

            String id;

            System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++");

            for (int i = 0; i < tripResults.size(); i++) {
                SearchResult searchResult = new SearchResult();
                //Trip Option ID
                id = tripResults.get(i).getId();
                System.out.println("id " + id);

                //Slice
                List<SliceInfo> sliceInfo = tripResults.get(i).getSlice();
                for (int j = 0; j < sliceInfo.size(); j++) {
                    int duration = sliceInfo.get(j).getDuration();
                    System.out.println("duration " + duration);
                    searchResult.setDuration(duration);
                    List<SegmentInfo> segInfo = sliceInfo.get(j).getSegment();
                    for (int k = 0; k < segInfo.size(); k++) {
                        String bookingCode = segInfo.get(k).getBookingCode();
                        System.out.println("bookingCode " + bookingCode);
                        FlightInfo flightInfo = segInfo.get(k).getFlight();
                        String flightNum = flightInfo.getNumber();
                        System.out.println("flightNum " + flightNum);
                        String flightCarrier = flightInfo.getCarrier();
                        System.out.println("flightCarrier " + flightCarrier);
                        searchResult.setAirline(flightCarrier);
                        List<LegInfo> leg = segInfo.get(k).getLeg();
                        for (int l = 0; l < leg.size(); l++) {
                            String aircraft = leg.get(l).getAircraft();
                            System.out.println("aircraft " + aircraft);
                            String arrivalTime = leg.get(l).getArrivalTime();
                            System.out.println("arrivalTime " + arrivalTime);
                            searchResult.setArrive(arrivalTime);
                            String departTime = leg.get(l).getDepartureTime();
                            System.out.println("departTime " + departTime);
                            searchResult.setDepart(departTime);
                            String dest = leg.get(l).getDestination();
                            System.out.println("Destination " + dest);
                            String destTer = leg.get(l).getDestinationTerminal();
                            System.out.println("DestTer " + destTer);
                            String origin = leg.get(l).getOrigin();
                            System.out.println("origin " + origin);
                            String originTer = leg.get(l).getOriginTerminal();
                            System.out.println("OriginTer " + originTer);
                            int durationLeg = leg.get(l).getDuration();
                            System.out.println("durationleg " + durationLeg);
                            int mil = leg.get(l).getMileage();
                            System.out.println("Milleage " + mil);

                        }

                    }
                }

                //Pricing
                List<PricingInfo> priceInfo = tripResults.get(i).getPricing();
                searchResult.setPricePerPerson(priceInfo.get(0).getSaleTotal());
                for (int p = 0; p < priceInfo.size(); p++) {
                    String price = priceInfo.get(p).getSaleTotal();
                    System.out.println("Price " + price);
                }

                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++");
                searchResults.add(searchResult);
            }
        } catch (IOException e) {
            System.err.println(e.getMessage());
            return "loi1";
        } catch (GeneralSecurityException t) {
            return "loi2";
        }
        model.addAttribute("searchResults", searchResults);
        return "search_result";
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public String demo(ModelMap model) {

        List<SearchResult> searchResults = new ArrayList<>();
        
        for (int i = 0; i < 5; i++) {
            SearchResult searchResult = new SearchResult();
            searchResult.setAirline("Airline " + i);
            searchResult.setDepart("Depart " + i);
            searchResult.setArrive("Arrive " + i);
            searchResult.setDuration(i);
            searchResult.setPricePerPerson("Price per person " + i);
            searchResults.add(searchResult);
        }
        
        model.addAttribute("searchResults", searchResults);
        return "search_result";
    }
}
