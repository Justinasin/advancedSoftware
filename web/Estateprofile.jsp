
<%@page import="java.util.ArrayList"%>
<%@page import="Functions.houseInstance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Functions.database_common_functions"%>
<%@page import="Functions.houseInstance"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>House Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
        <script type="text/javascript" src="javascript/Estateprofile.js">var externalScriptLoaded = false;</script>
        <script type="text/javascripjavascript/jquery-1.10.2.js.10.2.js"></script>

    </head>
    <body>
        <%@include file="navigationbar.jsp" %>

        <%            String username = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");
            String houseId = request.getParameter("houseId");//ta xw perasei san orisma sto url!
            String houseOwner = request.getParameter("houseOwner");
            houseInstance house = database_common_functions.FetchHouseByOwnerAndByHouseId(houseOwner, houseId);
            String message = (String) request.getParameter("message");
            ArrayList<String> results = new ArrayList<String>();
            results = database_common_functions.fetchHouseImagesByHouseId(houseId);

            if (message == null) {
                message = "";
            }
        %>
        <h2>You've chosen to examine the house below:</h2>
        <div>
            <% if (username.equals(houseOwner)) {%>
            <h3>File Upload:</h3>
            Select a file to upload: <br />
            <form action="UploadFileServlet" method="post"
                  enctype="multipart/form-data" name="form1">
                <input type="hidden" id="houseIddd" name="houseIddd" value=<%=houseId%>>
                Select your image: <input type="file" name="file"  />
                <input type="submit" value="Upload" />
            </form><div><%=message%></div>
            <% }

                if (!results.isEmpty()) {
            %>
            Click image to view photo gallery:
            <a href="photoAlbum.jsp?houseId=<%=houseId%>&houseOwner=<%=houseOwner%>">
                <img alt="View Galley" src="images/<%=results.get(0)%>" height="160"/> </a>
            <a href="photoAlbum.jsp?houseId=<%=houseId%>&houseOwner=<%=houseOwner%>"></a>
            <br/>
            <% } else {

            %>
            <a href="photoAlbum.jsp?houseId=<%=houseId%>&houseOwner=<%=houseOwner%>">View Gallery</a>
            <% } %>

        </div>
        <div> <!logika table me description tou spitiou, otan valoume ta data 8elei ftiaxsimo me css>

            <table>
                <% if (username.equals(houseOwner)) {%>
                <form name='upadeteHouseInfo' method="post" action="update_house_info"  onsubmit="return validate_house_info();" >
                    <input type="hidden" name="houseId" id="houseId" value="<%=houseId%>" >
                    <input type="hidden" name="houseOwner" id="houseOwner" value="<%=houseOwner%>" >                
                    <%}%>
                    <tr>
                        <td>
                            State : 
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {
                                    if (database_common_functions.isLandlord(role) && !database_common_functions.isSeller(role)) {
                                        if ("FOR RENT".equals(house.getState())) {

                            %>

                            <select name='saleOrRent' id='saleOrRent'disabled="true" >                                                           
                                <option value='FOR RENT' selected  >Rent</option>
                                <option value='RENTED'>Rented</option>
                            </select>
                            <%                            } else { %>
                            <select name='saleOrRent' id='saleOrRent'disabled="true" >                                                           
                                <option value='FOR RENT'   >Rent</option>
                                <option value='RENTED' selected>Rented</option>
                            </select>    

                            <% }
                            } else if (database_common_functions.isSeller(role) && !database_common_functions.isLandlord(role)) {

                                if ("FOR SALE".equals(house.getState())) {
                            %>
                            <select name='saleOrRent' id='saleOrRent' >
                                <option value='FOR SALE' selected >Sell</option>
                                <option value='SOLD' >Sold</option>
                            </select>
                            <%
                            } else { %>
                            <select name='saleOrRent' id='saleOrRent' >
                                <option value='FOR SALE'  >Sell</option>
                                <option value='SOLD' selected>Sold</option>
                            </select> 

                            <%   }

                                } else {
                                             if ("FOR SALE".equals(house.getState())) { %>
                            <select name='saleOrRent' id='saleOrRent' onchange="selectAGoal()">
                                <option value='SOLD' >Sold</option>
                                <option value='FOR SALE' selected>Sell</option>
                                <option value='FOR RENT' >Rent</option>
                            </select>
                            <%} else if("SOLD".equals(house.getState())) {%>
                            <select name='saleOrRent' id='saleOrRent' onchange="selectAGoal()">
                                <option value='SOLD' selected >Sold</option>
                                <option value='FOR RENT'>Rent</option>
                                <option value='FOR SALE'>Sell</option>
                            </select>

                            <% }else if("FOR RENT".equals(house.getState())){ %>
                            <select name='saleOrRent' id='saleOrRent' onchange="selectAGoal()">
                                <option value='FOR RENT' selected >Rent</option>
                                <option value='RENTED'>Rented</option>
                                <option value='FOR SALE'>Sell</option>
                            </select>
                                
                            <%}else{%>
                                <select name='saleOrRent' id='saleOrRent' onchange="selectAGoal()">
                                <option value='FOR RENT'  >Rent</option>
                                <option value='RENTED' selected>Rented</option>
                                <option value='FOR SALE'>Sell</option>
                            </select>
                            <% }

                                }
                            %>

                            <% } else {%>
                            <!--state spitiou apo vash--><%=house.getState()%>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price : 
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>

                            <input type="text" id="priceEstateProfile" name="priceEstateProfile" value="<%=house.getPrice()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--price spitiou apo vash--><%=house.getPrice()%> euros
                            <% } %>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            Address : 
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <input type="text" id="addressEstateProfile" name="addressEstateProfile" value="<%=house.getLocation()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--Address spitiou apo vash--><%=house.getLocation()%>
                            <% } %>                 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Region/State: 
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <select id="selected_region"   name='selected_region'  onload="setSelected('\"'<%=house.getRegion()%>'\"')" onchange="validateRegion()">

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
                                <option value='Attiki' selected>Attiki</option>                            
                            </select>

                            <% } else {%>
                            <!--Region spitiou apo vash--><%=house.getRegion()%>
                            <% } %>


                        </td>
                    </tr>
                    <tr>
                        <td>
                            m<sup>2</sup> :
                        </td>                   
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <input type="text" id="sq_mEstateProfile" name="sq_mEstateProfile" value="<%=house.getSize_in_sq_m()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--tetragwnika spitiou apo vash--> <%=house.getSize_in_sq_m()%>
                            <% } %>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            House type: 
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <select name='house_type' id='house_type' onchange="showFloors()">
                                <% if ("apartment".equals(house.getType_of_estate())) { %>                            
                                <option value='apartment' selected >Apartment</option>
                                <option value='detached house'>Detached house</option>
                                <% } else { %>
                                <option value='apartment'  >Apartment</option>
                                <option value='detached house' selected>Detached house</option>
                                <% } %>
                            </select>

                            <% } else {%>
                            <!--Tupos spitiou apo vash--><%=house.getType_of_estate()%>
                            <% } %>

                        </td>
                    </tr>
                    <tr >
                        <%  if ("apartment".equals(house.getType_of_estate())) { %>
                        <td>
                            Apartment floor :
                        </td>
                        <% } else { %>
                        <td>
                            Number of floors in house :
                        </td> 
                        <%}%>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <input type="text" id="floorsEstateProfile" name="floorsEstateProfile" value="<%=house.getFloor()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--floors spitiou apo vash--><%= house.getFloor()%>
                            <% } %>

                        </td>
                    </tr>
                    <!--if diamerisma-->
                    <%  if (("apartment".equals(house.getType_of_estate()))) {%>
                    <tr>
                        <td>
                            Public Pay: 
                        </td>                   
                        <td>

                            <% if (username.equals(houseOwner)) {%>
                            <input type="text" id="publicPayEstateProfile" name="publicPayEstateProfile" value="<%=house.getPublic_pay()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--koinoxrhsta diamerismatos apo vash--><%=house.getPublic_pay()%> euros
                            <% } %>

                        </td>
                    </tr>
                    <%}%>
                    <!--endif diamerisma-->
                    <tr>
                        <td>
                            Year of Construction/Renovation: 
                        </td>                   
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <input type="text" id="conRenovEstateProfile" name="conRenovEstateProfile" value="<%=house.getYearOfConstRenov()%>" class="input" onchange="usernameLength()" >
                            <% } else {%>
                            <!--yearofblabla spitiou apo vash--><%=house.getYearOfConstRenov()%>
                            <% } %>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            Type of heat :
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <select name='kentrikh_8ermansh' id='kentrikh_8ermansh' onchange="Tupos_8ermanshs()">
                                <% if ("independent".equals(house.getType_of_heat())) { %>                            
                                <option value='independent' selected >independent</option>
                                <option value='central'>central</option>
                                <% } else { %>
                                <option value='independent'  >independent</option>
                                <option value='central' selected>central</option>
                                <% } %>

                                <% } else {%>
                                <!--heating spitiou apo vash--><%=house.getType_of_heat()%>
                                <% } %>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            House Description :
                        </td>
                        <td>
                            <% if (username.equals(houseOwner)) {%>
                            <textarea id="descEstateProfile" name="descEstateProfile" value="<%=house.getDescription()%>" ><%=house.getDescription()%></textarea>                            
                            <% } else {%>
                            <!--descriptionfld spitiou apo vash--><%=house.getDescription()%>
                            <% } %>

                        </td>
                    </tr>
                    <% if (username.equals(houseOwner)) {
                            String message2 = (String) request.getParameter("message2");
                            if (message2 == null) {
                                message2 = "";
                            }

                    %>
                    <tr>
                        <td>
                            <input type="submit" value="Update House Info" >
                        </td>
                        <td><%=message2%></td>
                    </tr>
                </form>
                <%

                } else {%>
                <tr>
                    <td>
                        <form action="/HouseGr/sendmessage.jsp" method="get" >
                            <input type="hidden" name="houseId" id="houseId" value="<%=houseId%>" >
                            <input type="hidden" name="houseOwner" id="houseOwner" value="<%=houseOwner%>" >
                            <input type="hidden" name="replyto" id="replyto" value="<%=houseOwner%>" >
                            <input type="submit" value="Send message to house owner!" />
                        </form><div><%=message%></div>
                    </td>
                </tr>
                <% }
                %>
            </table>

        </div>


        <%@include file="footer.jsp" %>
    </body>
</html>
