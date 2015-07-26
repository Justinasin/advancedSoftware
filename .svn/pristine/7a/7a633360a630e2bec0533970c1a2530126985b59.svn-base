/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function usernameLength(){
    var usr = document.getElementById('username').value;
    if(usr.length<2 || usr.length>32){
        document.getElementById("tdusernameid").innerHTML = "Username length must be between 2-32 characters!!!";
        return false;
    }else{
        document.getElementById("tdusernameid").innerHTML = "";
        return true;
    }
}
function onlyLettersName(){
    //var letters = /[^\x00-\x80]|[a-zA-Z]+$/;
    var letters = /[^α-ωΑ-Ωa-zA-Z]/g;
    var nm = document.getElementById('name').value;
    //alert("nm size="+nm.length);
    
    if( (letters.test(nm))){
         error="not all letters";
    }else if(nm.length < 2 || nm.length > 50){
        error="not right size";
    }
    else{
        error="";
    }
    //var el1 = document.getElementById("tdnameid");
    if(error === "not all letters"){
        document.getElementById("tdnameid").innerHTML = "Only Letters are allowed!!!";
        return false;
    }
    else if( error === "not right size"){
        document.getElementById("tdnameid").innerHTML = "Name length must be between 2-50 characters!!!";
        return false;
    }
    else{
        document.getElementById("tdnameid").innerHTML = "";
        return true;
    }
}
function onlyLettersSurname(){
    
    var letters = /[^α-ωΑ-Ωa-zA-Z]/g;
    var nm = document.getElementById('Surname').value;

    if( (letters.test(nm))){
         error="not all letters";
    }else if(nm.length < 2 || nm.length > 50){
        error="not right size";
    }
    else{
        error="";
    }
    //var el1 = document.getElementById("tdnameid");
    
    if(error === "not all letters"){
        document.getElementById("tdsurnameid").innerHTML = "Only Letters are allowed!!!";
        return false;
    }
    else if( error === "not right size"){
        document.getElementById("tdsurnameid").innerHTML = "Surname length be between 2-50 characters!!!";
        return false;
    }
    else{
        document.getElementById("tdsurnameid").innerHTML = "";
        return true;
    }
}
function onlyNumbersPhone(){
    var numbers = /[^0-9]/;
    var phone_number = document.getElementById('phone_n').value;
    
    if( isNaN(phone_number)){
        error="not all numbers";
    }else if(phone_number.length<10 || phone_number.length>14)
    {
        error="not right size" ; 
    }
    else{
        error="";
    }
    if(error === "not all numbers"){
        document.getElementById("tdphoneid").innerHTML = "Only Numbers are allowed!!!";
        return false;
    }
    else if(error === "not right size"){
        document.getElementById("tdphoneid").innerHTML = "Phone length must be between 10-14 numbers!!!";
        return false;
    }
    else{
        document.getElementById("tdphoneid").innerHTML = "";
        return true;
    }
}

function validateEmail() { //http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var mail = document.getElementById('email').value;
    if( re.test(mail)){
        document.getElementById("tdmailid").innerHTML = "";
        return true;
    }else{
        document.getElementById("tdmailid").innerHTML = "Not a valid email address!!!";
        return false;
    }
}
function validatePassword(){
    var  pwd = document.getElementById('pwd').value;
    var  repwd = document.getElementById('repwd').value;
    
    if(pwd.length < 4 || pwd.length > 32){
            document.getElementById("tdrepwdid").innerHTML = "Password length must be between 4-32 characters!!!";
            return false;
    }
    if(pwd===repwd){        
        document.getElementById("tdrepwdid").innerHTML = "";
        return true;
    }else{
        document.getElementById("tdrepwdid").innerHTML = "Passwords do not match!!!";
        return false;
    }
}
function chooseARole(){
    var adm = document.getElementById('admin');
    var landlrd = document.getElementById('landlord');
    var renter = document.getElementById('Renter');
    var seller = document.getElementById('seller');
    var buyer = document.getElementById('Buyer');
    
    if( adm.checked || landlrd.checked || renter.checked ||  seller.checked ||  buyer.checked){
        return true;
    }else{
        return false;
    }
}
function validate_form()
{

    
    if(usernameLength()=== false){
        alert("Write an appropriate username!!!");
        return false;        
    }
    if(validatePassword() === false){
        alert("Write an appropriate password!!!");
        return false;
    }
    if(onlyLettersName() === false){
        alert("Write an appropriate name!!!");
        return false;
    }    
    if(onlyLettersSurname() === false){
        alert("Write an appropriate surname!!!");
        return false;
    }
    if(validateEmail() === false){
        alert("Write an appropriate email address!!!");
        return false;
    }
    if(onlyNumbersPhone() === false){
        alert("Write an appropriate number!!!");
        return false;
    }
    
    if(chooseARole() === false){
        alert("Choose an appropriate role!!!");
        return false;
    }
    
    return true;
    

}
          