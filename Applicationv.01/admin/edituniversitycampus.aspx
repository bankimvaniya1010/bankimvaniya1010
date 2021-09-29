<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitycampus.aspx.cs" Inherits="admin_edituniversitycampus" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Edit INSTITUTION CAMPUS</li>
        </ol>

        <h1 class="h2">INSTITUTION CAMPUS Edit</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">University</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Main Campus</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlmaincampus" runat="server" class="form-control">
                                        <asp:ListItem value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="2">No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campName" class="col-sm-3 col-form-label form-label">Campus Name</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampName" type="text" runat="server" class="form-control" placeholder="Campus Name" />
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Select Country</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcountry" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Select City</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcity" runat="server" class="form-control"></asp:DropDownList>
                                    <asp:HiddenField runat="server" ID="hidCityID"/>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Campus Setting</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcampussetting" runat="server" class="form-control">
                                        <asp:ListItem value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="1">Urban</asp:ListItem>
                                        <asp:ListItem Value="2">SubUrban</asp:ListItem>
                                        <asp:ListItem Value="3">countryside</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                         <label for="campName" class="col-sm-3 col-form-label form-label">Campus Address</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtcampusaddress" type="text" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                            <label for="uniLatitude" class="col-sm-3 col-form-label form-label">Campus Latitude</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtLatitude" type="text" runat="server" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="uniLongitude" class="col-sm-3 col-form-label form-label">Campus Longitude</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtLongitude" type="text" runat="server" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                     <div class="form-group row">
                            <label for="uniAirport" class="col-sm-3 col-form-label form-label">Closest Airport to Campus</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtclosetairport" type="text" runat="server" class="form-control" placeholder="Closest Airport to Institution" />
                                    </div>
                                </div>
                            </div>
                        </div>

                       <div class="form-group row">
                            <label for="uniAirportDistance" class="col-sm-3 col-form-label form-label">Distance from closest airport</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtCampusAirportDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest airport" />
                                    </div>
                                    <asp:DropDownList id="airDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                        <asp:ListItem value="0">Please Select Unit</asp:ListItem>
                                        <asp:ListItem value="KM">KM</asp:ListItem>
                                        <asp:ListItem value="Miles">Miles</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="uniRailDistance" class="col-sm-3 col-form-label form-label">Distance closest Railway Station to campus</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtCampusclosestRailDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest Railway Station" />
                                    </div>
                                    <asp:DropDownList id="railclosestDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                        <asp:ListItem value="0">Please Select Unit</asp:ListItem>
                                        <asp:ListItem value="KM">KM</asp:ListItem>
                                        <asp:ListItem value="Miles">Miles</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    <div class="form-group row">
                            <label for="uniAirportDistance" class="col-sm-3 col-form-label form-label">Distance from Railway station</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtCampusrailwaydistance" type="text" runat="server" class="form-control" placeholder="Distance from closest airport" />
                                    </div>
                                    <select id="ddlrailwaydistanceunit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                        <option value="0">Please Select Unit</option>
                                        <option value="KM">KM</option>
                                        <option value="Miles">Miles</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="uniGettingAround" class="col-sm-3 col-form-label form-label">Getting Around</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtcampusGettingAround" type="text" runat="server" class="form-control" placeholder="Getting Around" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="form-group row">
                            <label for="uniGettingAround" class="col-sm-3 col-form-label form-label">Place of interest near the campus</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:FileUpload runat="server" ID="placeofinterestcampusimage"/>
                                        <input id="txtplaceofinterestcampus_description" type="text" runat="server" class="form-control" />
                                        <input id="txtplaceofinterestcampus_distance" type="text" runat="server" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Fraternities </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlFraternities" runat="server" class="form-control">
                                        <asp:ListItem value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="2">No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Sororities  </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlSororities" runat="server" class="form-control">
                                        <asp:ListItem value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="2">No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Total Students on Campus   </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txttotalstu_campus" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Male % on Campus   </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtmale_percentage" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Female % on Campus   </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtfemale_percentage" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">Average Age  </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtaverageage" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">% of Domestic Students </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtdomesticstude" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">% In State Students </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtstatestude" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">% of International Students </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtinternationalstude" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">No of Nationalities </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="text" id="txtnoofnationalty" runat="server" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                    
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        
        function validateForm() {

            var universityValue = $('#<%=ddlUniversity.ClientID%>').val();
            var campName = $('#<%=txtCampName.ClientID%>').val();
            <%--var campDescription = $('#<%=txtCampDescription.ClientID%>').val();
            var campResearch = $('#<%=txtCampResearch.ClientID%>').val();
            var campFacultyDescription = $('#<%=txtFacultyDescription.ClientID%>').val();--%>
            var country = $('#<%=ddlcountry.ClientID%>').val();
            var city = $('#<%=ddlcity.ClientID%>').val();

            if (universityValue == 0 || isNaN(parseInt(universityValue))) {
                alert("Please select institution for campus");
                return false;
            }
            else if (campName == '') {
                alert("Please enter INSTITUTION CAMPUS name");
                return false;
            }
            else if (campDescription == '') {
                alert("Please enter campus description");
                return false;
            }
            else if (campResearch == '') {
                alert("Please enter campus research");
                return false;
            }
            else if (campFacultyDescription == '') {
                alert("Please enter campus faculty description");
                return false;
            }
            else if (country == 0) {
                alert("Please select Country");
                return false;
            }
            else if (city == 0) {
                alert("Please select city");
                return false;
            }
            return true;         
        }

        $("#<%=ddlcountry.ClientID%>").change(function () {
                var countryId = $("#<%=ddlcountry.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "edituniversitycampus.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'countryId': '" + countryId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlcity.ClientID%>").length >= 1) {
                                $("#<%=ddlcity.ClientID%>").empty();
                                $("#<%=ddlcity.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlcity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                        }
                    }
                });
            
        });

        $("#<%=ddlcity.ClientID%>").change(function () {
            $("#<%=hidCityID.ClientID%>").val($("#<%=ddlcity.ClientID%>").val());
        });      
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#institution_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#universitycampusmaster').addClass('active');
	    });
    </script>
</asp:Content>
