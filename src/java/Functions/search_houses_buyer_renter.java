/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Functions;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import static java.awt.SystemColor.window;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author john
 */
public class search_houses_buyer_renter extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = "";
        String role = "";
        username = (String) request.getSession().getAttribute("username");
        role = (String) request.getSession().getAttribute("role");

        String state = (String) request.getParameter("sale-Rent");
        String priceFrom = (String) request.getParameter("from_price");
        String priceTo = (String) request.getParameter("to_price");
        String priceWeight = (String) request.getParameter("weight_price_range");

        String region = (String) request.getParameter("selectRegion1");
        String regionWeight = (String) request.getParameter("weight_region-state");

        String floor_area_from = (String) request.getParameter("from_floor_area");
        String floor_area_to = (String) request.getParameter("to_floor_area");
        String floor_area_weight = (String) request.getParameter("weight_floor_area");

        String houseType = (String) request.getParameter("house_type_search_house");//apartment,detached house,BOTH
        String houseTypeWeight = (String) request.getParameter("weight_type_of_house");

        String floorDetachedFrom = (String) request.getParameter("floorfrom");
        String floorDetachedTo = (String) request.getParameter("floorto");
        String floorDetachedWeight = (String) request.getParameter("weight_floor_of_house");

        String floorApartmentFrom = (String) request.getParameter("floorfrom2");
        String floorApartmentTo = (String) request.getParameter("floorto2");
        String floorApartmentWeight = (String) request.getParameter("weight_floor_of_house2");

        String publicPayFrom = (String) request.getParameter("from_koin_dapan");
        String publicPayTo = (String) request.getParameter("to_koin_dapan");
        String publicPayWeight = (String) request.getParameter("weight_koin_dapan");

        String yearOfConstructionFrom = (String) request.getParameter("from_etos_kataskeuhs");
        String yearOfConstructionTo = (String) request.getParameter("to_etos_kataskeuhs");
        String yearOfConstructionWeight = (String) request.getParameter("weight_etos_kataskeuhs");

        String heatType = (String) request.getParameter("heatType");//independent,central,BOTH
        String heatTypeWeight = (String) request.getParameter("weight_type_of_heat");

        String searchAlgorithm = (String) request.getParameter("select_algorithm");//saw,topsis
        String url = "errorPage.jsp";

        ArrayList<houseInstance> houseList = new ArrayList<houseInstance>();//Here is the results of our Sql query

        //AUTO TO BALA APLA G NA XOUME KAPWS NA 3EROUME AN EINAI BOTH h SPECIFIC, AN DN XREIAZETAI TO SBHNOUME
        String message = "fail";

        try {
            //trabame ta spitia apo thn bash kai ta bazoume se mia lista apo object houses (houseInstance.java)
            System.out.println("PAME NA TRABH3oOUME AP THN BASH TA SPITIA ");
            System.out.println(state + "-|1-" + priceFrom + "-|2-" + priceTo + "-|3-" + region + "-|4-" + floor_area_from + "-|5-" + floor_area_to + "-|6-" + houseType + "-|7-" + houseTypeWeight + "-|8-" + floorDetachedFrom + "-|9-" + floorDetachedTo + "-|10-" + floorApartmentFrom + "-|11-" + floorApartmentTo + "-|12-" + publicPayFrom + "-|13-" + publicPayTo + "-|14-" + yearOfConstructionFrom + "-|15-" + yearOfConstructionTo + "-|16-" + heatType);
            houseList = database_common_functions.FetchHousesBySearchForm(state, priceFrom, priceTo, region, floor_area_from, floor_area_to, houseType, houseTypeWeight, floorDetachedFrom, floorDetachedTo, floorApartmentFrom, floorApartmentTo, publicPayFrom, publicPayTo, yearOfConstructionFrom, yearOfConstructionTo, heatType);
            //houseList = database_common_functions.FetchHousesByState(state);
            //url = "/buyer_renter.jsp";
            //ArrayList<houseInstance> top10houses = new ArrayList<houseInstance>(houseList.subList(0, 2));
            message = "success";
            for (houseInstance inst : houseList) {
                System.out.println("house id = " + inst.getIdEstates());

                System.out.println("+++asd++++EKTUPWNOUME AUTA P PHRAME AUTHN FORMA SEARCH_HOUSES:++++++++");
                System.out.println("state=" + inst.getState() + " price=" + inst.getPrice()
                        + "region= " + inst.getRegion() + " \nfloor_area= " + inst.getSize_in_sq_m()
                        + " houseType = " + inst.getType_of_estate()
                        + " floor= " + inst.getFloor() + " publicPay = "
                        + inst.getPublic_pay() + " \nyearOfConstruction= "
                        + inst.getYearOfConstRenov() + " \nheatType= " + inst.getType_of_heat());
                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            }

            //request.setAttribute("top10",top10houses);
            //url = "/buyer_renter_results.jsp";
            url = "/buyer_renter.jsp";
            int weightsum = Integer.parseInt(priceWeight) + Integer.parseInt(floor_area_weight)
                    + Integer.parseInt(floorDetachedWeight) + Integer.parseInt(floorApartmentWeight)
                    + Integer.parseInt(publicPayWeight) + Integer.parseInt(yearOfConstructionWeight);
            double pw = (Double.parseDouble(priceWeight) / weightsum);
            double aw = (Double.parseDouble(floor_area_weight) / weightsum);
            double fdw = (Double.parseDouble(floorDetachedWeight) / weightsum);
            double faw = (Double.parseDouble(floorApartmentWeight) / weightsum);
            double ppw = (Double.parseDouble(publicPayWeight) / weightsum);
            double yw = (Double.parseDouble(yearOfConstructionWeight) / weightsum);
            ArrayList<houseInstance> sortedlist = new ArrayList<houseInstance>();
            final ArrayList<houseInstance> normalisedhouseList = new ArrayList<houseInstance>();//Here is the results of our Sql query
            houseInstance max;
            max = evaluation_methods.findmax(houseList);
            System.out.println("just scored "+max.score +" max.price "+ max.price+" max.floor "+ max.floor+
                        " max.size_in_sq_m "+ max.size_in_sq_m+" max.public_pay "+ max.public_pay+
                        " max.yearOfConstRenov "+ max.yearOfConstRenov);
            for (houseInstance house : houseList) {
                houseInstance newhouse = house.copyandnormaliseHouse(max);
                //mul with weights
                System.out.println("BEFORE "+newhouse.score +" newhouse.price "+ newhouse.price+" newhouse.floor "+ newhouse.floor+
                        " newhouse.size_in_sq_m "+ newhouse.size_in_sq_m+" newhouse.public_pay "+ newhouse.public_pay+
                        " newhouse.yearOfConstRenov "+ newhouse.yearOfConstRenov);
                newhouse.price = Double.toString((Double.parseDouble(newhouse.price)) * pw);
                newhouse.floor = Double.toString((Double.parseDouble(newhouse.floor)) * faw);
                newhouse.size_in_sq_m = Double.toString((Double.parseDouble(newhouse.size_in_sq_m)) * aw);
                newhouse.public_pay = Double.toString((Double.parseDouble(newhouse.public_pay)) * ppw);
                newhouse.yearOfConstRenov = Double.toString((Double.parseDouble(newhouse.yearOfConstRenov)) * yw);
                newhouse.scoreself();
                System.out.println("just scored "+newhouse.score +" newhouse.price "+ newhouse.price+" newhouse.floor "+ newhouse.floor+
                        " newhouse.size_in_sq_m "+ newhouse.size_in_sq_m+" newhouse.public_pay "+ newhouse.public_pay+
                        " newhouse.yearOfConstRenov "+ newhouse.yearOfConstRenov);
                normalisedhouseList.add(newhouse);
            }
            if ("saw".equals(searchAlgorithm)) {
                Collections.sort(normalisedhouseList, new comparescores());
                Collections.reverse(normalisedhouseList);
            } else {

                houseInstance best = Collections.max(normalisedhouseList, new comparescores());
                houseInstance worst = Collections.min(normalisedhouseList, new comparescores());
                System.out.println("topsisssssssssssssssssssssssss");
                for (houseInstance sorted : normalisedhouseList) {
                    sorted.calcdifs(best , worst);
                }
                
                Collections.sort(normalisedhouseList, new topsissorter());

            }
            for (houseInstance sorted : normalisedhouseList) {
                System.out.println(sorted.idEstates);
                for (houseInstance tobesorted : houseList) {
                    if (tobesorted.idEstates.equals(sorted.idEstates)) {
                        sortedlist.add(tobesorted);
                        break;
                    }
                }
            }

            //TWRA logika exoume thn lista me ta 10 best houses gia to search tou (renter-buyer) kai pame na
            //ta peta3oume se kana google maps.
            Gson gson = new Gson();
            JsonElement element;
            //PAIRNAW THN ARXIKH HOUSELIST ENW 8A PREPE THN top10houses!!!!!!!!!!!!!!!!!!!!!
            element = gson.toJsonTree(sortedlist, new TypeToken<List<houseInstance>>() {
            }.getType());

            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
            //request.setAttribute("jsonArray", jsonArray);

        } catch (SQLException ex) {
            System.out.println("mphke sto sql exception");
            Logger.getLogger(search_houses_buyer_renter.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println("MESSAGE ============================" + message);
        System.out.println("URL ============================" + url);
        //request.setAttribute("message", message);
        //RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher(url);
        //reqDispatcher.forward(request,response);
    }

}