/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Functions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class update_house_info extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String houseId=(String) request.getParameter("houseId");
        String houseOwner=(String) request.getParameter("houseOwner");
        
        String username = (String) request.getSession().getAttribute("username");
        String role = (String) request.getSession().getAttribute("role");
        
        String state = (String) request.getParameter("saleOrRent");
        String Price = (String) request.getParameter("priceEstateProfile");
        String Address = (String) request.getParameter("addressEstateProfile");
        String Region = (String) request.getParameter("selected_region");
        String size= (String) request.getParameter("sq_mEstateProfile");//tetragwnika
        String HouseType = (String) request.getParameter("house_type");
        String floor = (String) request.getParameter("floorsEstateProfile");//ti orofos einai to diamerisma, h posous orofous exei h monokatoikia
        String public_pay = (String) request.getParameter("publicPayEstateProfile");
        String year = (String) request.getParameter("conRenovEstateProfile");
        String heating = (String) request.getParameter("kentrikh_8ermansh");
        String description = (String) request.getParameter("descEstateProfile");
        
        if("detached house".equals(HouseType)){
            public_pay="0";
        }
        
        String message2="Updates Not Made!";
        String url="/Estateprofile.jsp?houseId="+houseId+"&houseOwner="+houseOwner+"&message2="+message2;
        
        int boundary=44;
        if(Address.length() >boundary){
            Address = Address.substring(0,boundary );
        }
        
        if(description.length() >boundary){
            description = description.substring(0,boundary );
        }
        
        
        System.out.println("\nstate "+state+"\nPrice "+Price+"\nAddress "+Address+"\nRegion "+Region+"\nsize "+size
        +"\nHouseType "+HouseType+"\nfloor "+floor+"\npublic_pay "+public_pay+"\nyear "+year+"\nheating "+heating+"\ndescription "+description);
        try {
            
            database_common_functions.updateHouse(houseId, houseOwner, state,  Price,  Address,
                    Region,  size,  HouseType,  floor,
                    public_pay,  year,  heating,  description) ;
            message2="House info updated!";
            url="/Estateprofile.jsp?houseId="+houseId+"&houseOwner="+houseOwner+"&message2="+message2;
        } catch (SQLException ex) {
            Logger.getLogger(update_house_info.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    

}