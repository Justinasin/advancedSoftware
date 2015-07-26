/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function showFloors() {
    if (document.getElementById('floorss')) {
        if (document.getElementById('house_type').value === "apartment") {
            //document.getElementById("koin_dapan").disabled='false';
            document.getElementById('koin_dapan').removeAttribute("disabled");
            
            document.getElementById('floorss').style.display = 'table-row';
            document.getElementById('floorMessage1').innerHTML = "Floor:";
            document.getElementById('houseType_js_message').innerHTML = "";
            
        }else if(document.getElementById('house_type').value === "detached house"){
            //document.getElementById("koin_dapan").disabled='true';
            document.getElementById('koin_dapan').setAttribute("disabled","disabled");
            
            document.getElementById('floorss').style.display = 'table-row';
            document.getElementById('floorMessage1').innerHTML = "Number of Floors:";
            document.getElementById('houseType_js_message').innerHTML = "";
            
        }
        else {
            //document.getElementById("koin_dapan").disabled = "false";
            document.getElementById('koin_dapan').setAttribute("disabled","disabled");
            
            document.getElementById('floorss').style.display = 'none';
            document.getElementById('houseType_js_message').innerHTML = "Please select a house type!!!";
            document.getElementById('floorss_js_message2').innerHTML = "";
            
        }
        
    }
}
function validateMonthlyPay(){
    var mpay = document.getElementById('koin_dapan').value;
    
    if( isNaN(mpay)){
        error="not all numbers";
    }else if(mpay.length>40 || mpay<0 || mpay.length<2)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("monthlyPay_js_message2").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("monthlyPay_js_message2").innerHTML = "Please enter an appropriate number!!!";
        return false;
    }
    else{
        document.getElementById("monthlyPay_js_message2").innerHTML = "";
        return true;
    }
}
function validateFloorss(){
    var floor = document.getElementById('floor22').value;
    
    if( isNaN(floor)){
        error="not all numbers";
    }else if(floor.length>3 || floor<0 || floor.length<=0)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("floorss_js_message2").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("floorss_js_message2").innerHTML = "Please enter an appropriate number!!!";
        return false;
    }
    else{
        document.getElementById("floorss_js_message2").innerHTML = "";
        return true;
    }
    
}

function selectAGoal(){
    if(document.getElementById('saleOrRent').value === "Unspecified"){
        document.getElementById('saleOrRent_js_message').innerHTML = "Please choose a goal!";
        return false;
    }else{
        document.getElementById('saleOrRent_js_message').innerHTML = "";
        return true;
    }
}


function validatePrice(){    
    var price = document.getElementById('price_of_housee').value;
    
    if( isNaN(price)){
        error="not all numbers";
    }else if(price.length>20 || price<=0 || price.length<=0)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("price_js_message").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("price_js_message").innerHTML = "Please enter an appropriate price!!!";
        return false;
    }
    else{
        document.getElementById("price_js_message").innerHTML = "";
        return true;
    }
}

function addressLength(){
    var addr = document.getElementById('addrloc').value;
    if(addr.length<2 || addr.length>45){
        document.getElementById("addr_js_message").innerHTML = "Address length must be between 2-45 characters!!!";
        return false;
    }else{
        document.getElementById("addr_js_message").innerHTML = "";
        return true;
    }
}
function validateRegion(){
    if(document.getElementById('selected_region').value === ""){
        document.getElementById('region_js_message').innerHTML = "Please select a Region!!!";
        codeAddress();
        return false;
    }else{
        document.getElementById('region_js_message').innerHTML = "";
        codeAddress();
        return true;
    }
}
function validateM_2(){
    //isNaN(price)=>den einai mono ari8moi
    var size = document.getElementById('floor__area').value;
    
    
    if( isNaN(size)){
        error="not all numbers";
    }else if(size.length>40 || size<0 || size.length<2)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("m_2_js_message").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("m_2_js_message").innerHTML = "Please enter an appropriate number!!!";
        return false;
    }
    else{
        document.getElementById("m_2_js_message").innerHTML = "";
        return true;
    }
}

function validate_etos_kataskeuhs(){
    var etos = document.getElementById('etos_kataskeuhs23').value;
    
    if( isNaN(etos)){
        error="not all numbers";
    }else if(etos<0 || etos>2015 || etos.length<4)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("etos_kataskeuhs_js_message").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("etos_kataskeuhs_js_message").innerHTML = "Please enter an appropriate number!!!";
        return false;
    }
    else{
        document.getElementById("etos_kataskeuhs_js_message").innerHTML = "";
        return true;
    }
    
}
function Tupos_8ermanshs(){
    if(document.getElementById('kentrikh_8ermansh').value === "Unspecified"){
        document.getElementById('Tupos_8ermanshs_js_message').innerHTML = "Please select Heat Type!!!";
        return false;
    }else{
        document.getElementById('Tupos_8ermanshs_js_message').innerHTML = "";
        return true;
    }
}

function popup(){
                
                if(document.getElementById('saleOrRent').value ==='Unspecified'){
                    alert("Please enter a proper Exchange Goal");
                    return false;                    
                }
                if(!validatePrice()){
                    alert("Please enter a proper price");
                    return false;
                }
                if(!addressLength()){
                    alert("Please enter a proper address");
                    return false;
                }
                if(!validateRegion()){
                    alert("Please enter a proper region");
                    return false;
                }
                if(!validateM_2()){
                    alert("Please enter a proper house size");
                    return false;
                }
                
                
                if(document.getElementById('house_type').value ==='Unspecified'){
                    alert("Please enter a proper House Type");
                    return false;                    
                }
                if(document.getElementById('house_type').value !=='Unspecified' && !validateFloorss()){
                    alert("Please enter a proper floor number");
                    return false;
                }
                if(!validateMonthlyPay() && document.getElementById('house_type').value ==='apartment'){
                    alert("Please enter a proper monthly pay value");
                    return false;
                }
                if(!validate_etos_kataskeuhs()){
                    alert("Please enter a proper year of construction/renovation");
                    return false;
                }
                if(!Tupos_8ermanshs()){
                    alert("Please enter a proper type of Heat");
                    return false;
                }
                document.getElementById('saleOrRent').removeAttribute("disabled");
                return true;
    
}
