package Functions;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import static java.sql.Types.NULL;
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
public class insert_house_into_base extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       //request.session.getAttribute("username");
        String username = "";
        String role = "";
        username = (String) request.getSession().getAttribute("username");
        role = (String) request.getSession().getAttribute("role");
        
        String state = (String) request.getParameter("saleOrRent");
        String Price = (String) request.getParameter("price_of_housee");
        String Address = (String) request.getParameter("addrloc");
        String Region = (String) request.getParameter("selected_region");
        String size= (String) request.getParameter("floor__area");//tetragwnika
        String HouseType = (String) request.getParameter("house_type");
        String floor = (String) request.getParameter("floor22");//ti orofos einai to diamerisma, h posous orofous exei h monokatoikia
        String public_pay = (String) request.getParameter("koin_dapan");
        String year = (String) request.getParameter("etos_kataskeuhs23");
        String heating = (String) request.getParameter("kentrikh_8ermansh");
        String description = (String) request.getParameter("descriptionFld");
        String lat = (String) request.getParameter("lat_hid_field");
        String longi = (String) request.getParameter("long_hid_field");
        String message="";
        String url="/n,desmrn";
        int boundary=44;
        if(Address.length() >boundary){
        Address = Address.substring(0,boundary );
        }
        
        System.out.println("Mphkame sthn instert_house_into_base.java me lat ================" + lat + 
                " LONGI ====" + longi+"\nPRICE= " +Price+"\nsize= "+size);
        
        if("Unspecified".equals(state) || "Unspecified".equals(HouseType) || "Unspecified".equals(heating) || "".equals(Region) ){
            message = "Mwrh poutana mphkes me unspecified, Javascript den psineis na ftia3eis?";
            System.out.println("Mphk sto Unspecified");
        }else{
            if("detached house".equals((HouseType))){
                System.out.println("Mphke sto if detached house");
                //einai monokatoikia ara ta public_pay einai 0
                public_pay = "0";
            }
            try {
                System.out.println("Mphke sto try gia na kanei insert into base");
                if("Enter a description here...".equals(description)){
                    description = "none";
                }
                database_common_functions.insertHouseIntoBase(Price, Address, Region, HouseType, floor, size, public_pay, year, heating, state, description, username/*owner*/, lat, longi);
                message = "Succesfully added house";
                url = "/seller_landlord.jsp";
                System.out.println("bghke apo to insert into base sqlinsert me url= "+url);
                request.setAttribute("message", message);
            } catch (SQLException ex) {
                System.out.println("Mphk sto catch tou insert into base");
                Logger.getLogger(insert_house_into_base.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("Paei sto request dispacher");
            RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
            
        }    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}