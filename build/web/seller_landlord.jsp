<%-- 
    Document   : seller_landlord
    Created on : Sep 2, 2014, 2:02:19 AM
    Author     : john
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Functions.database_common_functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Landlord Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
        <script type="text/javascript" src="javascript/seller_landlord.js">var externalScriptLoaded = false;</script>
        <script type="text/javascript" src="javascript/jquery-1.10.2.js"></script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRTNlfYzmHv1rvuWZ2ipH0F6HcQQD1RP4&v=3.exp&language=el"></script>
        <script>

            var flag = 0;
            var geocoder;
            var marker;
            var map;
            var infowindow;
            var myCenter = new google.maps.LatLng(37.97882854132278, 23.73069785156258);


            function markerCoords(markerobject) {

                google.maps.event.addListener(markerobject, 'dragend', function(evt) {

                    markerobject.setPosition(evt.latLng);
                    infowindow.setContent('New house location');

                    infowindow.open(map, markerobject);
                    //infowindow.setOptions({
                    //    content: '<p>Marker dropped: Current Lat: ' + evt.latLng.lat().toFixed(3) + ' Current Lng: ' + evt.latLng.lng().toFixed(3) + '</p>'
                    //});
                    //infowindow.open(map, markerobject);
                    codeLatLng();
                });

                google.maps.event.addListener(markerobject, 'drag', function(evt) {
                    //console.log("marker is being dragged");

                });

            }
            function initialize()
            {
                //addrloc
                geocoder = new google.maps.Geocoder();
                var mapProp = {
                    center: myCenter,
                    zoom: 7,
                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };

                map = new google.maps.Map(document.getElementById("map_canvas"), mapProp);

                /**********JQUERY**********/
                //alert("mphke initialize ton map, k tr paei na mpei sto getJSON");
                //$.get('seller_landlord_populate_map',function(responseJson)
                $.getJSON("seller_landlord_populate_map", function(data) {
                    //alert("mphke sto getJSON function");


                    var body = document.getElementById('myhouses');
                    body.innerHTML = "<h1>My Estates:</h1>";
                    var tbl = document.createElement('table');
                    var tbdy = document.createElement('tbody');

                    for (var i = 0, len = data.length; i < len; i++) {
                        /************************
                         *EDW EXOUME OLES TIS PLHROFORIES GIA OLA TA SPITIA KAPOIOU SELLER-RENTER,KAI MPOROUME
                         *NA TA XWSOUME OpouDHPOTE 3eRW GW , SE KANA PLAINO DIV KAI KALA EPEIDH ZHTAEI LISTA
                         *STA DE3iA O TUPOS STHN EKFWNHSH
                         *********************/
                        var tr = document.createElement('tr');
                        var td = document.createElement('td');
                        var a = document.createElement('a');
                        var houseId = data[i].idEstates;
                        var houseOwner = data[i].owner_username;

                        a.setAttribute('href', 'Estateprofile.jsp?houseId=' + houseId + '&houseOwner=' + houseOwner);

                        a.appendChild(document.createTextNode("House #" + data[i].idEstates));
                        td.appendChild(a);
                        tr.appendChild(td);
                        td = document.createElement('td');
                        td.appendChild(document.createTextNode("Price : " + data[i].price + "\u20AC"));
                        td.appendChild(document.createElement("br"));
                        td.appendChild(document.createTextNode("  Short description: " + data[i].description));
                        if(i+1<len){
                            td.appendChild(document.createElement("hr"));
                        }
                        tr.appendChild(td);
                        tbdy.appendChild(tr);



                        var latlng = new google.maps.LatLng(data[i].latitude, data[i].longitude);
                        var mapTitle = "House of " + data[i].owner_username;
                        var mapDesc = "Price : " + data[i].price + " euros</br>Location : " + data[i].location + ", " + data[i].Region +
                                "</br> Type : " + data[i].type_of_estate + "</br>Size : " + data[i].size_in_sq_m +
                                " m<sup>2</sup></br>  Heat : " + data[i].type_of_heat + "</br>Short description: " + data[i].description + "</br>";
                        var infoOpenDefault = false;
                        var dragAble = false;
                        var removable = false;
                        var iconPath = "img/house_marker.png";
                        create_marker(latlng, mapTitle, mapDesc, infoOpenDefault, dragAble, removable, iconPath, houseId, houseOwner);
                    }
                    tbl.appendChild(tbdy);
                    body.appendChild(tbl);



                });
                /********END OF JQUERY************/
                // Place Marker
                function placeMarker(location) {
                    if (marker) {
                        //alert("mphke sthn if(marker)");
                        marker.setPosition(location);
                        infowindow.setContent('New house location');

                        infowindow.open(map, marker);
                        map.setCenter(marker.getPosition());
                        map.panTo(marker.getPosition());
                        codeLatLng();
                    } else {
                        marker = new google.maps.Marker({
                            position: location,
                            map: map,
                            draggable: true,
                            animation: google.maps.Animation.DROP, //bounce animatio,
                            title: "New House location",
                            icon: "img/house_marker.png"
                        });
                        infowindow = new google.maps.InfoWindow({
                            content: 'New house location'});
                        infowindow.open(map, marker);
                        if (flag === 0) {
                            flag = 1;
                            markerCoords(marker);
                        }
                        map.setCenter(marker.getPosition());
                        map.panTo(marker.getPosition());
                        codeLatLng();
                    }
                }

                google.maps.event.addListener(map, 'click', function(event) {
                    placeMarker(event.latLng);

                });





                /*/*********************CREATE MARKER*********************************************/
                //############### Create Marker Function ##############
                function create_marker(MapPos, MapTitle, MapDesc, InfoOpenDefault, DragAble, Removable, iconPath, houseId, houseOwner)
                {
                    //new marker
                    var marker1 = new google.maps.Marker({
                        position: MapPos,
                        map: map,
                        draggable: DragAble,
                        animation: google.maps.Animation.DROP,
                        title: "house",
                        icon: iconPath
                    });

                    //Content structure of info Window for the Markers
                    var contentString = $('<div class="marker-info-win">' +
                            '<div class="marker-inner-win"><span class="info-content">' +
                            '<h3 class="marker-heading">' + MapTitle + '</h3>' +
                            MapDesc +
                            '</span><button name="remove-marker" class="remove-marker" title="Remove Marker">Go to house page</button>' +
                            '</br></br></div></div>');


                    //Create an infoWindow
                    var infowindow1 = new google.maps.InfoWindow();
                    //set the content of infoWindow
                    infowindow1.setContent(contentString[0]);

                    //Find remove button in infoWindow
                    var removeBtn = contentString.find('button.remove-marker')[0];

                    //Find save button in infoWindow
                    //var saveBtn = contentString.find('button.save-marker')[0];

                    //add click listner to remove marker button
                    google.maps.event.addDomListener(removeBtn, "click", function(event) {
                        //call remove_marker function to remove the marker from the map
                        go_to_house_page(marker1, houseId, houseOwner);
                    });



                    //add click listner to save marker button        
                    google.maps.event.addListener(marker1, 'click', function() {
                        infowindow1.open(map, marker1); // click on marker opens info window
                    });

                    if (InfoOpenDefault) //whether info window should be open by default
                    {
                        infowindow1.open(map, marker);
                    }
                }
                /************************END OF CREATE MARKER*********************************************/

                /*****************************************DELETE MARKER*********************************/
                //############### Remove Marker Function ##############
                function go_to_house_page(Marker, houseId, houseOwner)
                {
                    /* determine whether marker is draggable
                     new markers are draggable and saved markers are fixed */
                    if (Marker.getDraggable()) //den einai draggable ara einai ap ta spitia sthn bash
                    {
                        //EDW 8a se phgainei sthn selida tou spitiou me id=houseID kai idiokthth=houseOwner
                        alert("remove_marker :mphke sto marker draggable/la8os gia spitia pou anhkoun hdh sthn bash!");

                        //Marker.setMap(null); //just remove new marker
                    }
                    else
                    {

                        //alert("remove_marker :mphke sto marker not draggable me houseId="+houseId+"kai owner t spitiou= "+houseOwner);
                        window.location = 'Estateprofile.jsp?houseId=' + houseId + '&houseOwner=' + houseOwner;
                        //document.location.href = 'Estateprofile.jsp?houseId=' + houseId + '&houseOwner=' + houseOwner;
                        //Remove saved marker from DB and map using jQuery Ajax
                        /*var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
                         var myData = {del: 'true', latlang: mLatLang}; //post variables
                         $.ajax({
                         type: "POST",
                         url: "map_process.php",
                         data: myData,
                         success: function(data) {
                         Marker.setMap(null);
                         alert(data);
                         },
                         error: function(xhr, ajaxOptions, thrownError) {
                         alert(thrownError); //throw any errors
                         }
                         });*/
                    }
                }
                /*************END OF DELETE MARKER ***************************************************/

                /*****************SAVE MARKER********************************************************/
                //############### Remove Marker Function ##############


                ///************END OF SAVE MARKER*****************************************************/
            }// end of initialize

            /*********GEOCODE***********************************************************/
            function codeAddress() {

                var address = document.getElementById("addrloc").value + ' ,' + document.getElementById("selected_region").value;

                geocoder.geocode({'address': address}, function(results, status) {
                    if (status === google.maps.GeocoderStatus.OK) {


                        map.setZoom(8);
                        /********************************************************/
                        if (marker) {

                            marker.setPosition(results[0].geometry.location);
                            infowindow.setContent('New house location');

                            infowindow.open(map, marker);
                            map.setCenter(marker.getPosition());
                            map.panTo(marker.getPosition());
                            document.getElementById('lat_id_hid_field').value = results[0].geometry.location.lat();
                            document.getElementById('long_id_hid_field').value = results[0].geometry.lng();

                        } else {

                            marker = new google.maps.Marker({
                                position: results[0].geometry.location,
                                map: map,
                                draggable: true,
                                animation: google.maps.Animation.DROP, //bounce animatio,
                                title: "New House marker!",
                                icon: "img/house_marker.png"
                            });

                            infowindow = new google.maps.InfoWindow({
                                content: 'New house location'
                            });
                            infowindow.open(map, marker);
                            //if(flag===0){markerCoords(marker);flag=1;}
                            map.setCenter(marker.getPosition());
                            map.panTo(marker.getPosition());

                            if (flag === 0) {
                                flag = 1;
                                markerCoords(marker);
                            }
                            document.getElementById('lat_id_hid_field').value = results[0].geometry.lat();
                            document.getElementById('long_id_hid_field').value = results[0].geometry.lng();
                        }
                        /*********************************************************/
                        //var marker = new google.maps.Marker({
                        //    map: map,
                        //    draggable: true,
                        //    position: results[0].geometry.location

                        // });
                    } else {
                        alert("Geocode was not successful for the following reason: " + status);
                    }
                });
            }
            /*********END OF GEOCODE***********************************************************/
            /*********REVERSE GEOCODE***********************************************************/
            function codeLatLng() {
                //alert("mphke codeLatLng");
                //var input = document.getElementById('addrloc').value;
                //var latlngStr = input.split(',', 2);
                var lat = marker.getPosition().lat();
                var lng = marker.getPosition().lng();
                var latlng = new google.maps.LatLng(lat, lng);
                geocoder.geocode({'latLng': latlng}, function(results, status) {
                    if (status === google.maps.GeocoderStatus.OK) {
                        if (results[1]) {
                            map.setZoom(8);

                            document.getElementById('addrloc').value = results[1].formatted_address;

                            document.getElementById('lat_id_hid_field').value = lat;
                            document.getElementById('long_id_hid_field').value = lng;

                        } else {
                            alert('No results found');
                        }
                    } else {
                        alert('Geocoder failed due to: ' + status);
                    }
                });
            }

            /**********END OF REVERSE GEOCODE***************************************************/

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>


        <div id="map_canvas"></div>

        <table>
            <tr>
                <td>
                    <h1>Add an Estate:</h1>
                    <form id='insert_house' method="post" action="insert_house_into_base"  onsubmit="return popup();" >
                        <table>
                            <%  String role = (String) session.getAttribute("role");

                                if (database_common_functions.isLandlord(role) || database_common_functions.isSeller(role)) { %>
                            <tr>
                                <td>
                                    What would you like to do?
                                </td>
                                <td>

                                    <%  if (database_common_functions.isLandlord(role) && !database_common_functions.isSeller(role)) {%>
                                    <select name='saleOrRent' id='saleOrRent' disabled="true" >
                                        <option value='Unspecified' >Select exchange goal</option>                            
                                        <option value='FOR RENT' selected  >Rent</option>
                                        <option value='FOR SALE'>Sell</option>
                                    </select>
                                    <%} else if (database_common_functions.isSeller(role) && !database_common_functions.isLandlord(role)) {%>
                                    <select name='saleOrRent' id='saleOrRent' disabled="true" >
                                        <option value='Unspecified' >Select exchange goal</option>                            
                                        <option value='FOR RENT' >Rent</option>
                                        <option value='FOR SALE' selected >Sell</option>
                                    </select>
                                    <% } else { %>
                                    <select name='saleOrRent' id='saleOrRent' onchange="selectAGoal()">
                                        <option value='Unspecified' selected>Select exchange goal</option>                            
                                        <option value='FOR RENT' >Rent</option>
                                        <option value='FOR SALE'>Sell</option>
                                    </select>
                                    <% } %>

                                </td>
                                <td id="saleOrRent_js_message" name="saleOrRent_js_message" style="color:red"></td>
                            </tr>
                            <% }%>
                            <tr>
                                <td>
                                    Price :
                                </td>
                                <td>
                                    <input type="text" id="price_of_housee" name="price_of_housee" value="" class="input" onchange="validatePrice()" > 
                                </td>
                                <td id="price_js_message" name="price_js_message" style="color:red"></td>
                            </tr>


                            <tr>
                                <td>
                                    Address :
                                </td>
                                <td>
                                    <input type="hidden" id="lat_id_hid_field"  name="lat_hid_field" value="">
                                    <input type="hidden" id="long_id_hid_field"  name="long_hid_field" value="">
                                    <input type="text" id="addrloc" name="addrloc" value="" class="input" onchange="codeAddress()" > 
                                </td>
                                <td id="addr_js_message" name="addr_js_message" style="color:red"></td>
                            </tr>
                            <tr>
                                <td>
                                    Region/State:
                                </td>
                                <td>
                                    <select id="selected_region" name='selected_region' onchange="validateRegion()">
                                        <option value='' selected>Select a Region/State</option>
                                        <option value='Thraki'>Thraki</option>
                                        <option value='Macedonia'>Macedonia</option>
                                        <option value='Ipiros'>Ipiros</option>
                                        <option value='Thessalia'>Thessalia</option>
                                        <option value='Sterea Ellada'>Sterea Ellada</option>
                                        <option value='Evia'>Evia</option>
                                        <option value='Pelloponisos'>Pelloponisos</option>
                                        <option value='Krhth'>Krhth</option>
                                        <option value='Sporades'>Sporades</option>
                                        <option value='Kuklades'>Kuklades</option>
                                        <option value='Eptanisa'>Eptanisa</option>
                                        <option value='Dwdekanisa'>Dwdekanisa</option>                            
                                        <option value='Attiki'>Attiki</option>                            
                                    </select>
                                </td>
                                <td id="region_js_message" name="region_js_message" style="color:red"></td>
                            </tr>
                            <tr>
                                <td>
                                    m<sup>2</sup> :
                                </td>                   
                                <td>
                                    <input type="text" id="floor__area" name="floor__area" value="" class="input" onchange="validateM_2()"> 
                                </td>
                                <td id="m_2_js_message" name="m_2_js_message" style="color:red"></td>
                            </tr>
                            <tr>
                                <td>
                                    House type:
                                </td>
                                <td>
                                    <select name='house_type' id='house_type' onchange="showFloors()">
                                        <option value='Unspecified' selected>Select a House type</option>                            
                                        <option value='apartment' >Apartment</option>
                                        <option value='detached house'>Detached house</option>
                                    </select>
                                </td>
                                <td id="houseType_js_message" name="houseType_js_message" style="color:red"></td>
                            </tr>
                            <tr id='floorss' class="more">
                                <td>
                                    <div id='floorMessage1'></div>
                                </td>

                                <td>
                                    <input type="text" id="floor22" name="floor22" value="" class="input" onchange="validateFloorss()"> 
                                </td>
                                <td><div id='floorss_js_message2' style="color:red"></div></td>
                            </tr>
                            <tr>
                                <td>
                                    Public monthly pay:
                                </td>                   
                                <td>
                                    <input type="text" id="koin_dapan" name="koin_dapan" disabled="true" value="" class="input" onchange="validateMonthlyPay()"> 
                                </td>
                                <td><div id='monthlyPay_js_message2' style="color:red"></div></td>
                            </tr>
                            <tr>
                                <td>
                                    Year of Construction/Renovation :
                                </td>                   
                                <td>
                                    <input type="text" id="etos_kataskeuhs23" name="etos_kataskeuhs23" value="" class="input" onchange="validate_etos_kataskeuhs()"> 
                                </td>
                                <td id="etos_kataskeuhs_js_message" name="etos_kataskeuhs_js_message" style="color:red"></td>
                            </tr>
                            <tr>
                                <td>
                                    Heat Type :
                                </td>
                                <td>
                                    <select name='kentrikh_8ermansh' id='kentrikh_8ermansh' onchange="Tupos_8ermanshs()">
                                        <option value='Unspecified' selected>Select Heating</option>                            
                                        <option value='independent' >independent</option>
                                        <option value='central'>central</option>
                                    </select>
                                </td>
                                <td id="Tupos_8ermanshs_js_message" name="Tupos_8ermanshs_js_message" style="color:red"></td>
                            </tr>
                            <tr>
                                <td>
                                    House Description :
                                </td>
                                <td>
                                    <textarea id="descriptionFld" name="descriptionFld" value="" >Enter a description here...</textarea>
                                </td>
                            </tr>

                        </table>
                        <input type="submit" value="Submit"  >
                    </form>
                </td>
                <td>
                    <div id="myhouses" style="width:500px;"><h1>My Estates:</h1></div>
                </td>
            </tr>
        </table>

        <%@include file="footer.jsp" %>
    </body>

</html>
