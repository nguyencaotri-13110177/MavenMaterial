package com.example.flight.controller;

import com.example.flight.entity.SearchResult;
import com.example.flight.entity.SearchResult2;
import com.example.flight.resdata.FlightInformation;
import com.example.flight.entity.SearchTicket;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
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
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchResultTicketController {

    private static final String APPLICATION_NAME = "FlightTicket";

    private static final String API_KEY = "AIzaSyC5FYFXrSjH9Whx8gDey_ZHbUkh_sqj2lA"; //Key giới hạn 50 lượt request/ 1 ngày

    /**
     * Global instance of the HTTP transport.
     */
    private static HttpTransport httpTransport;

    /**
     * Global instance of the JSON factory.
     */
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String resultSearch(ModelMap model, @RequestParam(value = "MaSanBayDi") String MaSanBayDi, @RequestParam(value = "MaSanBayDen") String MaSanBayDen, @RequestParam(value = "NgayDi") String NgayDi, @RequestParam(value = "SLNguoiLon") int SLNguoiLon, @RequestParam(value = "SLTreEm") int SLTreEm, @RequestParam(value = "SLEmBe") int SLEmBe) throws ParseException {

        //Đổi định dạng ngày đi
        SimpleDateFormat formatter1 = new SimpleDateFormat("dd MMM, yyyy");  //convert string date type
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
        //String dateInString = "7-Jun-2013";
        try {

            Date ngaydi = formatter1.parse(NgayDi);
            //System.out.println(ngaydi);
            //System.out.println(formatter2.format(ngaydi));
            NgayDi = formatter2.format(ngaydi);
        } catch (ParseException e) {
            e.printStackTrace();
        }

//        //Đổi định dạng ngày về
//        try {
//
//            Date ngayve = formatter1.parse(NgayVe);
//            //System.out.println(ngaydi);
//            //System.out.println(formatter2.format(ngaydi));
//            NgayVe=formatter2.format(ngayve);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        List<SearchResult> searchResults = new ArrayList<>();
        try {
            httpTransport = GoogleNetHttpTransport.newTrustedTransport();

            PassengerCounts passengers = new PassengerCounts();
            passengers.setAdultCount(SLNguoiLon); // Price[1] //Số lượng người lớn
            passengers.setChildCount(SLTreEm); // Price[2] //Số lượng trẻ em
            passengers.setSeniorCount(0);
            passengers.setInfantInSeatCount(SLEmBe); // //Số lượng Em Bé
            passengers.setInfantInLapCount(0); // Price[4]

            List<SliceInput> slices = new ArrayList<>();

            SliceInput slice = new SliceInput();
            slice.setOrigin(MaSanBayDi.substring(0, 3)); //Nhập mã sân bay đi, chỉ lấy 3 ký tự đầu của Mã Sân Bay nhận được
            slice.setDestination(MaSanBayDen.substring(0, 3));  //Nhập mã sân bay đến, chỉ lấy 3 ký tự đầu của Mã Sân Bay nhận được
            slice.setDate(NgayDi);  //Nhập ngày đi
            slices.add(slice);

//            System.out.println(MaSanBayDi.substring(0, 3));
//            System.out.println(MaSanBayDen.substring(0, 3));
//            System.out.println(SLNguoiLon);
//            System.out.println(SLTreEm);
//            System.out.println(SLEmBe);
//            System.out.println(NgayDi);
            TripOptionsRequest request = new TripOptionsRequest();
            request.setSolutions(19);//Lấy 19 kết quả đầu tiên
            request.setPassengers(passengers);
            request.setSlice(slices);

            TripsSearchRequest parameters = new TripsSearchRequest();
            parameters.setRequest(request);
            QPXExpress qpXExpress = new QPXExpress.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME)
                    .setGoogleClientRequestInitializer(new QPXExpressRequestInitializer(API_KEY)).build();

            TripsSearchResponse list = qpXExpress.trips().search(parameters).execute();
            List<TripOption> tripResults = list.getTrips().getTripOption();
            FlightInformation.flightTripInfos = tripResults;

            String id;

            for (int i = 0; i < tripResults.size(); i++) {
                SearchResult searchResult = new SearchResult();
                //Trip Option ID
                id = tripResults.get(i).getId();
                searchResult.setI(i);
                searchResult.setId(id);
                //Slice
                List<SliceInfo> sliceInfo = tripResults.get(i).getSlice();
                for (int j = 0; j < sliceInfo.size(); j++) {
                    int duration = sliceInfo.get(j).getDuration();
                    searchResult.setDuration(duration);
                    List<SegmentInfo> segInfo = sliceInfo.get(j).getSegment();
                    for (int k = 0; k < segInfo.size(); k++) {
                        //String bookingCode = segInfo.get(k).getBookingCode();
                        FlightInfo flightInfo = segInfo.get(k).getFlight();
                        //String flightNum = flightInfo.getNumber();
                        String flightCarrier = flightInfo.getCarrier();
                        searchResult.setAirline(flightCarrier);
                        List<LegInfo> leg = segInfo.get(k).getLeg();
                        for (int l = 0; l < leg.size(); l++) {
                            //String aircraft = leg.get(l).getAircraft();
                            String arrivalTime = leg.get(l).getArrivalTime();
                            searchResult.setArrive(arrivalTime);
                            String departTime = leg.get(l).getDepartureTime();
                            searchResult.setDepart(departTime);

                        }
                    }
                }
                //Pricing
                List<PricingInfo> priceInfo = tripResults.get(i).getPricing();

                //Tính tổng giá tiền (tính luôn tiền thuế)
                double ThanhTien = 0;

                int SoNguoiLon = 0;
                int SoTreEm = 0;
                int SoEmBe = 0;

                double MotVeNguoiLon = 0;
                double MotVeTreEm = 0;
                double MotVeEmBe = 0;

                double TongVeNguoiLon = 0;
                double TongVeTreEm = 0;
                double TongVeEmBe = 0;
                
                for (int p = 0; p < priceInfo.size(); p++) {
                    try {
                        SoNguoiLon = priceInfo.get(p).getPassengers().getAdultCount();

                        MotVeNguoiLon = Double.parseDouble(priceInfo.get(p).getSaleTotal().substring(3)); //Loại bỏ 3 ký tự đầu trong giá VND
                        TongVeNguoiLon = MotVeNguoiLon * SoNguoiLon;

                    } catch (NullPointerException e) {
                        //khong nguoi lon
                    }

                    try {
                        SoTreEm = priceInfo.get(p).getPassengers().getChildCount();

                        MotVeTreEm = Double.parseDouble(priceInfo.get(p).getSaleTotal().substring(3)); //Loại bỏ 3 ký tự đầu trong giá VND
                        TongVeTreEm = MotVeTreEm * SoTreEm;
                    } catch (NullPointerException e) {
                        //khong co tre em
                    }

                    try {
                        SoEmBe = priceInfo.get(p).getPassengers().getInfantInSeatCount();

                        MotVeEmBe = Double.parseDouble(priceInfo.get(p).getSaleTotal().substring(3)); //Loại bỏ 3 ký tự đầu trong giá VND
                        TongVeEmBe = MotVeEmBe * SoEmBe;
                    } catch (NullPointerException e) {
                        //Khong co em be
                    }
                }
                ThanhTien = TongVeNguoiLon + TongVeTreEm + TongVeEmBe;
                
                NumberFormat formatter = new DecimalFormat("#0");
                searchResult.setPricePerPerson(String.valueOf(formatter.format(ThanhTien))+" "+priceInfo.get(0).getSaleTotal().substring(0, 3)); //lấy lại đơn vị tiền tệ
                
                SearchResult2.ListKetQua=searchResults;
                
                searchResults.add(searchResult);
            }

        } catch (IOException e) {
            System.out.println(e);
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
            searchResult.setId("id" + i);
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
