/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Functions;

import static java.lang.Math.abs;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

/**
 *
 * @author john
 */
public class houseInstance {

    String idEstates;
    String price;
    String location;
    String Region;
    String type_of_estate;
    String floor;
    String size_in_sq_m;
    String public_pay;
    String yearOfConstRenov;
    String type_of_heat;
    String state;
    String description;
    String owner_username;
    String latitude;
    String longitude;
    double score;
    double diw;
    double dib;

    public houseInstance(String idEstates, String price, String location, String Region, String type_of_estate,
            String floor, String size_in_sq_m, String public_pay, String yearOfConstRenov, String type_of_heat,
            String description, String owner_username, String latitude, String longitude) {

        this.setIdEstates(idEstates);
        this.setPrice(price);
        this.setLocation(location);
        this.setRegion(Region);
        this.setType_of_estate(type_of_estate);
        this.setFloor(floor);
        this.setSize_in_sq_m(size_in_sq_m);
        this.setPublic_pay(public_pay);
        this.setYearOfConstRenov(yearOfConstRenov);
        this.setType_of_heat(type_of_heat);
        this.setDescription(description);
        this.setOwner_username(owner_username);
        this.setLatitude(latitude);
        this.setLongitude(longitude);

    }

    public houseInstance() {

    }

    public String getIdEstates() {
        return idEstates;
    }

    public void setIdEstates(String idEstates) {
        this.idEstates = idEstates;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public String getType_of_estate() {
        return type_of_estate;
    }

    public void setType_of_estate(String type_of_estate) {
        this.type_of_estate = type_of_estate;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getSize_in_sq_m() {
        return size_in_sq_m;
    }

    public void setSize_in_sq_m(String size_in_sq_m) {
        this.size_in_sq_m = size_in_sq_m;
    }

    public String getPublic_pay() {
        return public_pay;
    }

    public void setPublic_pay(String public_pay) {
        this.public_pay = public_pay;
    }

    public String getYearOfConstRenov() {
        return yearOfConstRenov;
    }

    public void setYearOfConstRenov(String yearOfConstRenov) {
        this.yearOfConstRenov = yearOfConstRenov;
    }

    public String getType_of_heat() {
        return type_of_heat;
    }

    public void setType_of_heat(String type_of_heat) {
        this.type_of_heat = type_of_heat;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOwner_username() {
        return owner_username;
    }

    public void setOwner_username(String owner_username) {
        this.owner_username = owner_username;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    houseInstance copyandnormaliseHouse(houseInstance max) {
        houseInstance newhouse = new houseInstance();
        newhouse.idEstates = this.idEstates;
        newhouse.price = Double.toString(Double.parseDouble(this.price) / Double.parseDouble(max.price));
        newhouse.floor = (Double.parseDouble(max.floor)>0)?(Double.toString(Double.parseDouble(this.floor) / Double.parseDouble(max.floor))):Double.toString(0.0);
        newhouse.size_in_sq_m = Double.toString(Double.parseDouble(this.size_in_sq_m) / Double.parseDouble(max.size_in_sq_m));
        newhouse.public_pay = (Double.parseDouble(max.public_pay)>0)?(Double.toString(Double.parseDouble(this.public_pay) / Double.parseDouble(max.public_pay))):Double.toString(0.0);
        newhouse.yearOfConstRenov = (Double.parseDouble(max.yearOfConstRenov)>0)?(Double.toString(Double.parseDouble(this.yearOfConstRenov) / Double.parseDouble(max.yearOfConstRenov))):Double.toString(0.0);
        return newhouse;
    }

    void calcdifs(houseInstance best,houseInstance worst) {
        diw=dif(this,worst);
        dib=dif(this,best);
        
    }

    double dif(houseInstance one, houseInstance another) {

        return sqrt(pow((one.pricedif(another)), 2) + pow((one.floordif(another)), 2) + pow((one.floor_areadif(another)), 2) + pow((one.yearOfConstRenovdif(another)), 2) + pow((one.public_paydif(another)), 2));
    }

    void scoreself() {
        score = Double.parseDouble(floor) + Double.parseDouble(size_in_sq_m) + Double.parseDouble(yearOfConstRenov) - Double.parseDouble(public_pay) - Double.parseDouble(price);
        System.out.println("just scored inside "+score);

    }

    double pricedif(houseInstance house) {
        return abs(Double.parseDouble(this.price) - Double.parseDouble(house.price));
    }

    int Regiondif(houseInstance house) {
        return (this.Region.equals(house.Region)) ? 1 : 0;
    }

    int type_of_estatedif(houseInstance house) {
        return (this.type_of_estate.equals(house.type_of_estate)) ? 1 : 0;
    }

    double floordif(houseInstance house) {
        return abs(Double.parseDouble(this.floor) - Double.parseDouble(house.floor));
    }

    double floor_areadif(houseInstance house) {
        return abs(Double.parseDouble(this.size_in_sq_m) - Double.parseDouble(house.size_in_sq_m));
    }

    double public_paydif(houseInstance house) {
        return abs(Double.parseDouble(this.public_pay) - Double.parseDouble(house.public_pay));
    }

    double yearOfConstRenovdif(houseInstance house) {
        return abs(Double.parseDouble(this.yearOfConstRenov) - Double.parseDouble(house.yearOfConstRenov));
    }

    double type_of_heatdif(houseInstance house) {
        return (this.type_of_heat.equals(house.type_of_heat)) ? 1 : 0;
    }
}
