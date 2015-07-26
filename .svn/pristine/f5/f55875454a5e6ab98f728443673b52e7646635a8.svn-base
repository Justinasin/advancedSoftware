/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Functions;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static sun.misc.MessageUtils.out;
/**
 *
 * @author john
 */
public class seller_landlord_populate_map extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public seller_landlord_populate_map(){
        System.out.println("MPHKE STON CONSTRUCTOR SELLER LANDLORD POPULATE MAP");
    }
    
    /************************************************
     * SE AUTO EDW OTAN MPAINEI O LANDLORD H SELLER STHN SELIDA TOU, TRABAEI OLA
     * TA SPITIA TOU KAI TA FORTWNEI ME JSON STO GOOGLE MAPS STHN SELIDA
     * seller_landlord.jsp
    ***********************************************/
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        System.out.println("MPHKE STO ************* SELLER LANDLORD POPULATE MAP");
        ArrayList<houseInstance> houseList = new ArrayList<houseInstance>();
        String username = "";
        String role = "";
        username = (String) request.getSession().getAttribute("username");
        role = (String) request.getSession().getAttribute("role");
        try {
            houseList = database_common_functions.FetchHousesByOwner(username);
            Gson gson = new Gson();
            JsonElement element ;
            element = gson.toJsonTree(houseList, new TypeToken<List<houseInstance>>() {}.getType());
            
            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
            //String JsonString = gson.toJson(houseList, ArrayList.class);
            //out.print(JsonString);
            
            //processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(seller_landlord_populate_map.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}