package Functions;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author john
 */
public class database_common_functions {

    public static ArrayList<String> selectAllUsers() {
        try {
            Connection connection = null;
            Statement statement = null;

            connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            statement = connection.createStatement();
            ResultSet set = null;
            set = statement.executeQuery("SELECT * FROM Users ");

            ArrayList<String> results = new ArrayList<String>();
            while (set.next()) {
                results.add(set.getString(1) + " " + set.getString(2) + " " + set.getString(3) + " " + set.getString(4) + " "
                        + set.getString(5) + " " + set.getString(6) + " " + set.getString(7) + " " + set.getString(8));
            }

            statement.close();
            connection.close();

            return results;
        } catch (SQLException ex) {
            Logger.getLogger(database_common_functions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public static int isInDatabase(String username) throws SQLException {
        //an einai sthn bash to String username epistrefei 1, alliws 0
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;
        int res = 0;

        set = st.executeQuery("SELECT username FROM Users WHERE username = '"
                + username + "' ");

        if (set.next()) {
            //"Username already registered"
            res = 1;
        } else {
            res = 0;
        }

        st.close();
        connection.close();
        return res;
    }

    public static void insertIntoBase(String Username, String Password, String Name,
            String Surname, String email, String phone, String role) throws SQLException {
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;

        String sqlupdate = "insert into Users values ('"
                + Username + "','"
                + Password + "','"
                + Name + "','"
                + Surname + "','"
                + email + "','"
                + phone + "'," + role + ",0)";

        st.executeUpdate(sqlupdate);
        st.close();
        connection.close();
        return;
    }

    public static Boolean isAdmin(String role) {
        return (role.charAt(0) == '1');
    }

    public static Boolean isLandlord(String role) {
        return role.charAt(1) == '1';
    }

    public static Boolean isSeller(String role) {
        return role.charAt(2) == '1';
    }

    public static Boolean isRenter(String role) {
        return role.charAt(3) == '1';
    }

    public static Boolean isBuyer(String role) {
        return role.charAt(4) == '1';
    }

    public static Boolean isConfirmed(String confirmed) {
        return (confirmed.charAt(0) == '1');
    }

    public static void updateUser(String OldUsername, String Username, String Password, String Name,
            String Surname, String email, String phone, String role) throws SQLException {
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;
        String sqlupdate = "update Users set "
                + "username='" + Username
                + "',password='" + Password
                + "',name='" + Name
                + "',surname='" + Surname
                + "',email='" + email
                + "',phone='" + phone
                //+ "',roles='" + role
                //                +"',confirmed='"+1
                + "' where username= '" + OldUsername + "';";
        System.out.println(sqlupdate);

        st.executeUpdate(sqlupdate);
        st.close();
        connection.close();
    }

    public static void insertHouseIntoBase(String Price, String Address, String Region, String HouseType,
            String floor, String size, String public_pay, String year, String heating, String state,
            String description, String owner, String lat, String longi) throws SQLException {
        //System.out.println("Mphk sto insertHouseIntoBase k paei n kanei con pool init kai create Statement");
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;
        //System.out.println("ekane init kai create statement k tr pame n kanoume to sqlupdate");
        String sqlupdate = "INSERT INTO Estates (`price`, `location`,`Region` ,`type of estate`, `floor`, `size(sq.m.)`, `public pay per month`, `year of construction/renovation`, `type of heat`, `state`, `description`, `owner_username`, `latitude`, `longitude`)"
                + "VALUES ('"
                + Price + "', '"
                + Address + "', '"
                + Region + "', '"
                + HouseType + "', "
                + floor + ", "
                + size + ", "
                + public_pay + ", '"
                + year + "', '"
                + heating + "', '"
                + state + "', '"
                + description + "', '"
                + owner + "', "
                + lat + ", "
                + longi + ");";

        st.executeUpdate(sqlupdate);
        //System.out.println("to kane to sqlupdate pa na kanei return");
        st.close();
        connection.close();
        return;
    }

    public static ArrayList<houseInstance> FetchHousesByOwner(String owner/*seller/landlord username*/) throws SQLException {

        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        ResultSet set = null;
        String state1="SOLD";
        
        //We are going to create a list of houseInstances;
        ArrayList<houseInstance> houseList = new ArrayList<houseInstance>();

        st = connection.createStatement();

        set = st.executeQuery("SELECT * FROM Estates WHERE owner_username = '"
                + owner + "' && state!='"+state1+"'");

        while (set.next()) {
            houseInstance house = new houseInstance();
            house.setIdEstates(set.getString("idEstates"));
            house.setPrice(set.getString("price"));
            house.setLocation(set.getString("location"));
            house.setRegion(set.getString("Region"));
            house.setType_of_estate(set.getString("type of estate"));
            house.setFloor(set.getString("floor"));
            house.setSize_in_sq_m(set.getString("size(sq.m.)"));
            house.setPublic_pay(set.getString("public pay per month"));
            house.setYearOfConstRenov(set.getString("year of construction/renovation"));
            house.setType_of_heat(set.getString("type of heat"));
            house.setState(set.getString("state"));
            house.setDescription(set.getString("description"));
            house.setOwner_username(set.getString("owner_username"));
            house.setLatitude(set.getString("latitude"));
            house.setLongitude(set.getString("longitude"));
            houseList.add(house);
        }
        return houseList;
    }

    public static houseInstance FetchHouseByOwnerAndByHouseId(String owner, String houseId) throws SQLException {

        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        ResultSet set = null;

        houseInstance house = null;

        st = connection.createStatement();

        set = st.executeQuery("SELECT * FROM Estates WHERE owner_username = '"
                + owner + "' AND idEstates = '" + houseId + "'");

        while (set.next()) {
            house = new houseInstance();
            house.setIdEstates(set.getString("idEstates"));
            house.setPrice(set.getString("price"));
            house.setLocation(set.getString("location"));
            house.setRegion(set.getString("Region"));
            house.setType_of_estate(set.getString("type of estate"));
            house.setFloor(set.getString("floor"));
            house.setSize_in_sq_m(set.getString("size(sq.m.)"));
            house.setPublic_pay(set.getString("public pay per month"));
            house.setYearOfConstRenov(set.getString("year of construction/renovation"));
            house.setType_of_heat(set.getString("type of heat"));
            house.setState(set.getString("state"));
            house.setDescription(set.getString("description"));
            house.setOwner_username(set.getString("owner_username"));
            house.setLatitude(set.getString("latitude"));
            house.setLongitude(set.getString("longitude"));

        }
        return house;
    }

    public static ArrayList<houseInstance> FetchHousesByState(String state/*FOR SALE/FOR RENT/BOTH*/) throws SQLException {

        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        ResultSet set = null;

        //We are going to create a list of houseInstances;
        ArrayList<houseInstance> houseList = new ArrayList<houseInstance>();

        st = connection.createStatement();

        if ("FOR RENT".equals(state)) {
            set = st.executeQuery("SELECT * FROM Estates WHERE state = 'FOR RENT'");
        } else if ("FOR SALE".equals(state)) {
            set = st.executeQuery("SELECT * FROM Estates WHERE state = 'FOR SALE'");
        } else {
            set = st.executeQuery("SELECT * FROM Estates WHERE state = 'FOR SALE' || state = 'FOR RENT' ");
        }

        while (set.next()) {
            houseInstance house = new houseInstance();
            house.setIdEstates(set.getString("idEstates"));
            house.setPrice(set.getString("price"));
            house.setLocation(set.getString("location"));
            house.setRegion(set.getString("Region"));
            house.setType_of_estate(set.getString("type of estate"));
            house.setFloor(set.getString("floor"));
            house.setSize_in_sq_m(set.getString("size(sq.m.)"));
            house.setPublic_pay(set.getString("public pay per month"));
            house.setYearOfConstRenov(set.getString("year of construction/renovation"));
            house.setType_of_heat(set.getString("type of heat"));
            house.setState(set.getString("state"));
            house.setDescription(set.getString("description"));
            house.setOwner_username(set.getString("owner_username"));
            house.setLatitude(set.getString("latitude"));
            house.setLongitude(set.getString("longitude"));
            houseList.add(house);
        }
        return houseList;
    }

    public static void insertIntoBaseImage(String houseId, String imgName) throws SQLException {
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;

        System.out.println("MESA STHN INSERT INTO BASE houseid =" + houseId + " imgName= " + imgName);
        st = connection.createStatement();
        ResultSet set = null;

        String sqlupdate = "insert into images values ('"
                + imgName + "','"
                + houseId + "')";

        st.executeUpdate(sqlupdate);
        st.close();
        connection.close();
        return;

    }

    public static int isHouseImageInDatabase(String houseId, String imgName) throws SQLException {
        //an einai sthn bash to String username epistrefei 1, alliws 0
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;
        int res = 0;

        set = st.executeQuery("SELECT * FROM images WHERE image_name = '"
                + imgName + "' && Estates_idEstates = '" + houseId + "'");

        if (set.next()) {
            //"already in database"
            res = 1;
        } else {
            res = 0;
        }

        st.close();
        connection.close();
        return res;
    }

    public static ArrayList<String> fetchHouseImagesByHouseId(String houseId) {
        try {
            Connection connection = null;
            Statement statement = null;

            connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            statement = connection.createStatement();
            ResultSet set = null;
            set = statement.executeQuery("SELECT image_name FROM images WHERE Estates_idEstates = '" + houseId + "'");

            ArrayList<String> results = new ArrayList<String>();
            while (set.next()) {
                results.add(set.getString(1));
            }

            statement.close();
            connection.close();

            return results;
        } catch (SQLException ex) {
            Logger.getLogger(database_common_functions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public static ArrayList<houseInstance> FetchHousesBySearchForm(String state, String priceFrom, String priceTo, String region, String floor_area_from, String floor_area_to, String houseType, String houseTypeWeight, String floorDetachedFrom, String floorDetachedTo, String floorApartmentFrom, String floorApartmentTo, String publicPayFrom, String publicPayTo, String yearOfConstructionFrom, String yearOfConstructionTo, String heatType) throws SQLException {

        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        ResultSet set = null;

        //We are going to create a list of houseInstances;
        ArrayList<houseInstance> houseList = new ArrayList<houseInstance>();

        st = connection.createStatement();

        String sqlQuery = "select * from Estates where true";

        if ("BOTH".equals(state)) {
            sqlQuery += " and (state = 'FOR SALE' || state = 'FOR RENT')";
        } else if ("FOR SALE".equals(state)) {
            sqlQuery += " and (state = 'FOR SALE')";
        } else if ("FOR RENT".equals(state)) {
            sqlQuery += " and (state = 'FOR RENT')";
        }
        if ("apartment".equals(houseType)) {
            sqlQuery += " and (`type of estate` = 'apartment')";
            if (!(floorApartmentFrom.equals(""))) {
                sqlQuery += " and floors >=" + floorApartmentFrom;
            }
            if (!(floorApartmentTo.equals(""))) {
                sqlQuery += " and floors <=" + floorApartmentTo;
            }
            if (!(publicPayFrom.equals(""))) {
                sqlQuery += " and `public pay per month` >=" + publicPayFrom;
            }
            if (!(publicPayTo.equals(""))) {
                sqlQuery += " and `public pay per month` <=" + publicPayTo;
            }
        } else if ("detached house".equals(houseType)) {
            sqlQuery += " and (`type of estate` = 'detached house')";
            if (!(floorDetachedFrom.equals(""))) {
                sqlQuery += " and floors >=" + floorDetachedFrom;
            }
            if (!(floorApartmentTo.equals(""))) {
                sqlQuery += " and floors <=" + floorDetachedTo;
            }
        } else {
            sqlQuery += " and (((`type of estate` = 'apartment')";

            if (!(floorApartmentFrom.equals(""))) {
                sqlQuery += " and floors >=" + floorApartmentFrom;
            }
            if (!(floorApartmentTo.equals(""))) {
                sqlQuery += " and floors <=" + floorApartmentTo;
            }
            if (!(publicPayFrom.equals(""))) {
                sqlQuery += " and `public pay per month` >=" + publicPayFrom;
            }
            if (!(publicPayTo.equals(""))) {
                sqlQuery += " and `public pay per month` <=" + publicPayTo;
            }
            sqlQuery += ") || (";
            sqlQuery += "(`type of estate` = 'detached house')";
            if (!(floorDetachedFrom.equals(""))) {
                sqlQuery += " and floors >=" + floorDetachedFrom;
            }
            if (!(floorApartmentTo.equals(""))) {
                sqlQuery += " and floors <=" + floorDetachedTo;
            }
            sqlQuery += "))";
        }

        if ("central".equals(heatType)) {
            sqlQuery += " and (`type of heat`= 'central')";
        } else if ("independent".equals(heatType)) {
            sqlQuery += " and (`type of heat`= 'independent')";
        }
        if (!"ALL".equals(region)) {
            sqlQuery += " and (Region= '" + region + "')";
        }
        if (!(priceFrom.equals(""))) {
            sqlQuery += " and price>=" + priceFrom;
        }
        if (!(priceTo.equals(""))) {
            sqlQuery += " and price<=" + priceTo;
        }

        if (!(floor_area_from.equals(""))) {
            sqlQuery += " and `size(sq.m.)`>=" + floor_area_from;
        }
        if (!(floor_area_to.equals(""))) {
            sqlQuery += " and `size(sq.m.)`<=" + floor_area_to;
        }
        if (!(yearOfConstructionFrom.equals(""))) {
            sqlQuery += " and `year of construction/renovation`>=" + yearOfConstructionFrom;
        }
        if (!(yearOfConstructionTo.equals(""))) {
            sqlQuery += " and `year of construction/renovation `<=" + yearOfConstructionTo;
        }
        sqlQuery += ";";
        set = st.executeQuery(sqlQuery);
        while (set.next()) {
            houseInstance house = new houseInstance();
            house.setIdEstates(set.getString("idEstates"));
            house.setPrice(set.getString("price"));
            house.setLocation(set.getString("location"));
            house.setRegion(set.getString("Region"));
            house.setType_of_estate(set.getString("type of estate"));
            house.setFloor(set.getString("floor"));
            house.setSize_in_sq_m(set.getString("size(sq.m.)"));
            house.setPublic_pay(set.getString("public pay per month"));
            house.setYearOfConstRenov(set.getString("year of construction/renovation"));
            house.setType_of_heat(set.getString("type of heat"));
            house.setState(set.getString("state"));
            house.setDescription(set.getString("description"));
            house.setOwner_username(set.getString("owner_username"));
            house.setLatitude(set.getString("latitude"));
            house.setLongitude(set.getString("longitude"));
            houseList.add(house);
        }
        return houseList;

    }

    public static void deleteImage(String image_name) {

        try {

            Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            Statement st;
            ResultSet set = null;

            st = connection.createStatement();

            st.execute("DELETE FROM images WHERE image_name='" + image_name + "';");
        } catch (SQLException e) {

        }

    }
    
    
    
    public static ArrayList<String> fetchInboxbyUsername(String username) {
        try {
            Connection connection = null;
            Statement statement = null;

            connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            statement = connection.createStatement();
            ResultSet set = null;
            set = statement.executeQuery("select * from Messages where to_username='"+username+"';");

            ArrayList<String> results = new ArrayList<String>();
            while (set.next()) {
                results.add(set.getString(1));
                results.add(set.getString(2));
            }

            statement.close();
            connection.close();

            return results;
        } catch (SQLException ex) {
            Logger.getLogger(database_common_functions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    
    public static void insertmessage(String message,String from,String to)
    {
        try {
            Connection connection = null;
            Statement statement = null;

            connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            statement = connection.createStatement();
            ResultSet set = null;
            statement.executeUpdate("insert into Messages values('"+message+"','"+from+"','"+to+"');");


            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(database_common_functions.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void deletemessage(String message_to_delete,String from,String to)
    {
        try {
            Connection connection = null;
            Statement statement = null;

            connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
            statement = connection.createStatement();
            ResultSet set = null;
            String sqlupdate="delete from Messages where Message='"+message_to_delete+"' and from_username='"+from+"' and to_username='"+to+"';";
            System.out.println("sqlupdate "+sqlupdate);
            statement.executeUpdate(sqlupdate);
            


            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(database_common_functions.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public static void updateHouse(String houseId,String houseOwner, String state, String Price, String Address,
            String Region, String size, String HouseType, String floor,
            String public_pay, String year, String heating, String description            
            ) throws SQLException {
        Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
        Statement st;
        st = connection.createStatement();
        ResultSet set = null;
        //String query = "update Estates set price = '"+Price+"' , location = '"+Address+
        //        "' , Region  = where first_name = ?";
        String sqlupdate = "update Estates set "
                + "price='" + Price
                + "',location='" + Address
                + "',Region='" + Region
                + "',`type of estate`='" + HouseType
                + "',floor='" + floor
                + "',`size(sq.m.)`='" + size
                + "',`public pay per month`='" + public_pay
                + "',`year of construction/renovation`='" + year
                + "',`type of heat`='" + heating
                + "',state='" + state                
                + "',description='" + description
                + "' where (idEstates= '" + houseId + "' AND owner_username = '"+houseOwner+"')";
        System.out.println(sqlupdate);

        st.executeUpdate(sqlupdate);
        st.close();
        connection.close();
    }
    
}
