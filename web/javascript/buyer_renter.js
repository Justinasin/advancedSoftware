/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function showFloorsSearchHouse() {

    if (document.getElementById('floors_in_detached_house') && document.getElementById('floor_in_apartment')) {

        if (document.getElementById('house_type_search_house').value === "apartment") {


            document.getElementById('from_koin_dapan').removeAttribute("disabled");
            document.getElementById('to_koin_dapan').removeAttribute("disabled");
            document.getElementById('weight_koin_dapan').removeAttribute("disabled");

            //document.getElementById('floors_in_search_house').style.display = 'table-row';
            document.getElementById('floor_in_apartment').style.display = 'table-row';
            document.getElementById('floors_in_detached_house').style.display = 'none';
            //document.getElementById('floorMessage_search_house').innerHTML = "Floor from: ";

        } else if (document.getElementById('house_type_search_house').value === "detached house") {
            //document.getElementById("koin_dapan").disabled='true';
            document.getElementById('from_koin_dapan').setAttribute("disabled", "disabled");
            document.getElementById('to_koin_dapan').setAttribute("disabled", "disabled");
            document.getElementById('weight_koin_dapan').setAttribute("disabled", "disabled");

            document.getElementById('floor_in_apartment').style.display = 'none';
            document.getElementById('floors_in_detached_house').style.display = 'table-row';
            //document.getElementById('floorMessage_search_house').innerHTML = "Number of Floors from: ";
        }
        else {
            //document.getElementById("koin_dapan").disabled = "false";
            document.getElementById('from_koin_dapan').removeAttribute("disabled");
            document.getElementById('to_koin_dapan').removeAttribute("disabled");
            document.getElementById('weight_koin_dapan').removeAttribute("disabled");

            document.getElementById('floors_in_detached_house').style.display = 'table-row';
            document.getElementById('floor_in_apartment').style.display = 'table-row';

            //document.getElementById('floors_in_search_house').style.display = 'none';
        }

    }
}

function validate_number(number_id, error_message_td_id) {
    var mpay = document.getElementById(number_id).value;

    if (isNaN(mpay)) {
        error = "not all numbers";
    } else if (mpay.length > 40 || mpay < 0 )
    {
        error = "not right size";
    }
    else {
        error = "";
    }
    if (error === "not all numbers") {
        document.getElementById(error_message_td_id).innerHTML = "Numbers only please!";
        return false;
    }
    else if (error === "not right size") {
        document.getElementById(error_message_td_id).innerHTML = "Not appropriate number!";
        return false;
    }
    else {
        document.getElementById(error_message_td_id).innerHTML = "";
        return true;
    }
}

function validate_year(number_id, error_message_td_id) {
    var etos = document.getElementById(number_id).value;

    if (isNaN(etos)) {
        error = "not all numbers";
    } else if (etos < 0 || etos > 2015 || (etos.length>0 && etos.length<4) || (etos.length>0 && etos.length>4))
    {
        error = "not right size";
    }
    else {
        error = "";
    }
    if (error === "not all numbers") {
        document.getElementById(error_message_td_id).innerHTML = "Numbers only please!";
        return false;
    }
    else if (error === "not right size") {
        document.getElementById(error_message_td_id).innerHTML = "Not appropriate year!";
        return false;
    }
    else {
        document.getElementById(error_message_td_id).innerHTML = "";
        return true;
    }

}

function popup2(role) {
                if (!validate_number('from_price', 'tdto_priceid')) {
                    alert("Insert an appropriate price range!");
                    return false;
                }
                if (!validate_number('to_price', 'tdto_priceid')) {
                    alert("Insert an appropriate price range!");
                    return false;
                }

                if (!validate_number('from_floor_area', 'td_floor_area_id')) {
                    alert("Insert appropriate house size!");
                    return false;
                }
                if (!validate_number('to_floor_area', 'td_floor_area_id')) {
                    alert("Insert appropriate house size!");
                    return false;
                }
                if (!validate_number('floorfrom', 'tdto_floorsfloorsid')
                        && (document.getElementById('house_type_search_house').value === "BOTH"
                                || document.getElementById('house_type_search_house').value === "detached house")) {//Auto einai gia to detached house
                    alert("Insert appropriate floor number!");
                    return false;
                }
                if (!validate_number('floorto', 'tdto_floorsfloorsid') && (document.getElementById('house_type_search_house').value === "BOTH"
                        || document.getElementById('house_type_search_house').value === "detached house")) {
                    alert("Insert appropriate floor number!");
                    return false;
                }
                if (!validate_number('floorfrom2', 'tdto_floorsfloorsid2') && (document.getElementById('house_type_search_house').value === "BOTH"
                        || document.getElementById('house_type_search_house').value === "apartment")) {
                    alert("Insert appropriate floor!");
                    return false;
                }
                if (!validate_number('floorto2', 'tdto_floorsfloorsid2') && (document.getElementById('house_type_search_house').value === "BOTH"
                        || document.getElementById('house_type_search_house').value === "apartment")) {
                    alert("Insert appropriate floor!");
                    return false;
                }
                if (!validate_number('from_koin_dapan', 'td_koin_dapanaasss_id') && (document.getElementById('house_type_search_house').value === "BOTH"
                        || document.getElementById('house_type_search_house').value === "apartment")) {
                    alert("Insert appropriate public pay!");
                    return false;
                }
                if (!validate_number('to_koin_dapan', 'td_koin_dapanaasss_id') && (document.getElementById('house_type_search_house').value === "BOTH"
                        || document.getElementById('house_type_search_house').value === "apartment")) {
                    alert("Insert appropriate public pay!");
                    return false;
                }
                if (!validate_year('from_etos_kataskeuhs', 'td_etos_kataskeuhsed_id')) {
                    alert("Insert appropriate year of construction/renovation!");
                    return false;
                }
                if (!validate_year('to_etos_kataskeuhs', 'td_etos_kataskeuhsed_id')) {
                    alert("Insert appropriate year of construction/renovation!");
                    return false;
                }

                document.getElementById('sale-Rent').removeAttribute("disabled");


                populateMap();

//    public static Boolean isRenter(String role) {
//        return role.charAt(3) == '1';
//    }
//
//    public static Boolean isBuyer(String role) {
//        return role.charAt(4) == '1';
//    }
                if ((role[3] === '1' && role[4] !== '1')|| (role[3]!=='1' && role[4]=== '1')){
                    document.getElementById('sale-Rent').setAttribute("disabled", "disabled");
                }
    //
                return false;
            }

function priceRange(from, to) {

    if (to - from < 0) {
        return false;
    } else {
        return true;

    }

}