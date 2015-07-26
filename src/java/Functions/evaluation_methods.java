/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Functions;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author stavros
 */
public class evaluation_methods {

    
    static houseInstance findmax(ArrayList<houseInstance> houselist){
        houseInstance max=new houseInstance();
        max.price = Integer.toString(0);
        max.floor = Integer.toString(0);
        max.size_in_sq_m = Integer.toString(0);
        max.public_pay = Integer.toString(0);
        max.yearOfConstRenov = Integer.toString(0);
        for(houseInstance house : houselist)
        {
            if(Integer.parseInt(house.price)>Integer.parseInt(max.price))
                max.price = house.price;
            if(Integer.parseInt(house.floor)>Integer.parseInt(max.floor))
                max.floor = house.floor;
            if(Integer.parseInt(house.size_in_sq_m)>Integer.parseInt(max.size_in_sq_m))
                max.size_in_sq_m = house.size_in_sq_m;
            if(Integer.parseInt(house.public_pay)>Integer.parseInt(max.public_pay))
                max.public_pay = house.public_pay;
            if(Integer.parseInt(house.yearOfConstRenov)>Integer.parseInt(max.yearOfConstRenov))
                max.yearOfConstRenov = house.yearOfConstRenov;
        }
        
        return max;
    }

}
