<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitydetails.aspx.cs" Inherits="edituniversitydetails" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit University Details</li>
        </ol>

        <h1 class="h2">Edit University Detail</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="uniName" class="col-sm-3 col-form-label form-label">University Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniName" type="text" runat="server" class="form-control" placeholder="University Name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">University Affiliation</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAffiliation" type="text" runat="server" class="form-control" placeholder="University Affiliation" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniType" class="col-sm-3 col-form-label form-label">University Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniType" type="text" runat="server" class="form-control" placeholder="University Type" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniYearEstablish" class="col-sm-3 col-form-label form-label">University Year Established</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtYearEstablish" type="text" runat="server" maxlength="4" class="form-control" placeholder="University Year Established" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniSDescription" class="col-sm-3 col-form-label form-label">University Short Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniSDescription" type="text" runat="server" class="form-control" placeholder="University Short Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniLDescription" class="col-sm-3 col-form-label form-label">University Long Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniLDescription" type="text" runat="server" class="form-control" placeholder="University Long Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniEmail" class="col-sm-3 col-form-label form-label">University Email IDe</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtEmail" type="email" runat="server" class="form-control" placeholder="University Email ID" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniWebsite" class="col-sm-3 col-form-label form-label">University Website</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniWebsite" type="text" runat="server" class="form-control" placeholder="University Website" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">University Contact Person</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniContactPerson" type="text" runat="server" class="form-control" placeholder="University Contact Person" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniMobile" class="col-sm-3 col-form-label form-label">University Mobile Number</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtMobile" type="text" runat="server" class="form-control" placeholder="University Mobile Number" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAddress" class="col-sm-3 col-form-label form-label">University Address</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAddress" type="text" runat="server" class="form-control" placeholder="University Address" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniCountry" class="col-sm-3 col-form-label form-label">University Country</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCountry" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniCity" class="col-sm-3 col-form-label form-label">University City</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlCity" name="ddlCity" runat="server" class="form-control">
                                        <option value="" selected="selected" disabled="disabled">Please Select City</option>
                                    </select>
                                    <asp:HiddenField ID="hidCityField" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniLatitude" class="col-sm-3 col-form-label form-label">Location Latitude</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniLatitude" type="text" runat="server" class="form-control" placeholder="Location Latitude" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniLongitude" class="col-sm-3 col-form-label form-label">Location Longitude</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniLongitude" type="text" runat="server" class="form-control" placeholder="Location Longitude" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniTimeZone" class="col-sm-3 col-form-label form-label">Location Time Zone</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlTimeZone" name="ddlTimeZone" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAirport" class="col-sm-3 col-form-label form-label">Closest Airport to University</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAirport" type="text" runat="server" class="form-control" placeholder="Closest Airport to University" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAirportDistance" class="col-sm-3 col-form-label form-label">Distance from closest airport</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAirportDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest airport" />
                                </div>
                                <select id="airDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                    <option value="" disabled="disabled">Please Select Unit</option>
                                    <option value="KM">KM</option>
                                    <option value="Miles">Miles</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniRailDistance" class="col-sm-3 col-form-label form-label">Distance from closest Railway Station</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniRailDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest Railway Station" />
                                </div>
                                <select id="railDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                    <option value="" disabled="disabled">Please Select Unit</option>
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
                                    <input id="txtUniGettingAround" type="text" runat="server" class="form-control" placeholder="Getting Around" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAcceptedMaxAge" class="col-sm-3 col-form-label form-label">University Accepted Maximum age</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-3">
                                    <input id="txtUniAcceptedMaxAge" type="number" runat="server" class="form-control" placeholder="Maximum Age" />
                                </div>
                                <label class="col-form-label form-label">years</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAcceptedMinAge" class="col-sm-3 col-form-label form-label">University Accepted Minimum age</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-3">
                                    <input id="txtUniAcceptedMinAge" type="number" runat="server" class="form-control" placeholder="Minimum Age" />
                                </div>
                                <span>
                                    <label class="col-form-label form-label">years</label></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Subscribe Gte Service</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-3">
                                    <select id="subscription" name="gtesubscription" runat="server" class="form-control">
                                        <option value="" disabled="disabled">Please Select</option>
                                        <option value="0">GTE Service</option>
                                        <option value="1">Full Servive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniNotesDisclaimer" class="col-sm-3 col-form-label form-label">Notes and Disclaimer for university</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea id="txtNotesDisclaimer" runat="server" class="form-control" placeholder="Notes and Disclaimer"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="logo" class="col-sm-3 col-form-label form-label">Logo</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:FileUpload ID="logo" runat="server" CssClass="custom-file-input" />

                                    <label for="logo" class="custom-file-label">Choose file</label>
                                   <img src="<%=imagepath %>" alt="logo" />
                                        
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="stripcolor" class="col-sm-3 col-form-label form-label">header strip Color </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" id="txtstripcolor" class="form-control"/>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="verticalnavigationcolor" class="col-sm-3 col-form-label form-label">Color Of vertical navigation </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" id="txtverticalnavigationcolor" class="form-control"/>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> font Color </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" id="txtfontcolor" class="form-control"/>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%=ddlCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "edituniversitydetails.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCity.ClientID%>").length >= 1) {
                                $("#<%=ddlCity.ClientID%>").empty();
                                $("#<%=ddlCity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });

            });

            $("#<%=ddlCity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddlCity.ClientID%>").val());
            });

        });

        function validateForm() {
            var txtUniName = $('#<%=txtUniName.ClientID%>').val();
            var txtUniAffiliation = $('#<%=txtUniAffiliation.ClientID%>').val();
            var txtUniType = $('#<%=txtUniType.ClientID%>').val();
            var txtUniGettingAround = $('#<%=txtUniGettingAround.ClientID%>').val();
            var txtUniRailDistance = $('#<%=txtUniRailDistance.ClientID%>').val();
            var txtUniAirportDistance = $('#<%=txtUniAirportDistance.ClientID%>').val();
            var UniTimeZoneValue = $('#<%=ddlTimeZone.ClientID%>').val();
            var txtUniLongitude = $('#<%=txtUniLongitude.ClientID%>').val();
            var txtUniLatitude = $('#<%=txtUniLatitude.ClientID%>').val();
            var countryValue = $('#<%=ddlCountry.ClientID%>').val();
            var cityValue = $('#<%=hidCityField.ClientID%>').val();
            var txtUniAddress = $('#<%=txtUniAddress.ClientID%>').val();
            var txtYearEstablish = $('#<%=txtYearEstablish.ClientID%>').val();
            var txtEmail = $('#<%=txtEmail.ClientID%>').val();
            var txtUniLDescription = $('#<%=txtUniLDescription.ClientID%>').val();
            var txtUniSDescription = $('#<%=txtUniSDescription.ClientID%>').val();
            var txtUniWebsite = $('#<%=txtUniWebsite.ClientID%>').val();
            var txtUniContactPerson = $('#<%=txtUniContactPerson.ClientID%>').val();
            var txtMobile = $('#<%=txtMobile.ClientID%>').val();
            var txtUniAirport = $('#<%=txtUniAirport.ClientID%>').val();
            var railDistanceUnit = $('#<%=railDistanceUnit.ClientID%>').val();
            var airDistanceUnit = $('#<%=airDistanceUnit.ClientID%>').val();
            var txtUniAcceptedMaxAge = $('#<%=txtUniAcceptedMaxAge.ClientID%>').val();
            var txtUniAcceptedMinAge = $('#<%=txtUniAcceptedMinAge.ClientID%>').val();
            var subscriptionSelection = $('#<%=subscription.ClientID%>').val();
            var txtNotesDisclaimer = $('#<%=txtNotesDisclaimer.ClientID%>').val();
            var headerstripcolor = $('#<%=txtstripcolor.ClientID%>').val();
            var verticalNavigationcolor = $('#<%=txtverticalnavigationcolor.ClientID%>').val();
            var fontcolor =$('#<%=txtfontcolor.ClientID%>').val();
            //regex
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
            var urlRegex = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;

            if (txtUniName == '') {
                alert("Please enter University Name");
                return false;
            }
            else if (txtUniAffiliation == '') {
                alert("Please enter University Affiliation");
                return false;
            }
            else if (txtUniType == '') {
                alert("Please enter University Type");
                return false;
            }
            else if (txtYearEstablish == '' || isNaN(parseInt(txtYearEstablish)) || parseInt(txtYearEstablish) >= new Date().getFullYear()) {
                alert("Please enter correct university establishment year");
                return false;
            }
            else if (txtUniSDescription == '') {
                alert("Please enter University  Short Description");
                return false;
            }
            else if (txtUniLDescription == '') {
                alert("Please enter University long description");
                return false;
            }
            else if (txtEmail == '' || !emailRegex.test(txtEmail)) {
                alert("Please enter University Email ID");
                return false;
            }
            else if (txtUniWebsite == '' || !urlRegex.test(txtUniWebsite)) {
                alert("Please enter university website");
                return false;
            }
            else if (txtUniContactPerson == '') {
                alert("Please enter University contact person");
                return false;
            }
            else if (txtMobile == '') {
                alert("Please enter valid university mobile number");
                return false;
            }
            else if (txtUniAddress == '') {
                alert("Please enter University Address");
                return false;
            }
            else if (countryValue == 0 || isNaN(parseInt(countryValue))) {
                alert("Please select University Country");
                return false;
            }
            else if (cityValue == 0 || isNaN(parseInt(cityValue))) {
                alert("Please select University City");
                return false;
            }
            else if (txtUniLatitude == '' || isNaN(parseFloat(txtUniLatitude))) {
                alert("Please enter University Latitude");
                return false;
            }
            else if (txtUniLongitude == '' || isNaN(parseFloat(txtUniLongitude))) {
                alert("Please enter University Longitude");
                return false;
            }
            else if (UniTimeZoneValue == 0 || isNaN(parseInt(UniTimeZoneValue))) {
                alert("Please select university time zone");
                return false;
            }
            else if (txtUniAirport == '') {
                alert("Please enter airport name");
                return false;
            }
            else if (txtUniAirportDistance == '' || !airDistanceUnit || isNaN(parseFloat(txtUniAirportDistance))) {
                if (txtUniAirportDistance != '' && !airDistanceUnit)
                    alert("Please select distance unit");
                else
                    alert("Please enter nearest airport distance from university");
                return false;
            }
            else if (txtUniRailDistance == '' || !railDistanceUnit || isNaN(parseFloat(txtUniRailDistance))) {
                if (txtUniRailDistance != '' && !railDistanceUnit)
                    alert("Please select distance unit");
                else
                    alert("Please enter nearest railway station distance from university");
                return false;
            }
            else if (txtUniGettingAround == '') {
                alert("Please enter University Getting Around");
                return false;
            }
            else if (txtUniAcceptedMaxAge == '' || parseInt(txtUniAcceptedMaxAge) <= 0) {
                alert("Please enter valid university accepted maximum age");
                return false;
            }
            else if (txtUniAcceptedMinAge == '' || parseInt(txtUniAcceptedMinAge) <= 0) {
                alert("Please enter valid university accepted minimum age");
                return false;
            }
            else if (parseInt(txtUniAcceptedMinAge) > parseInt(txtUniAcceptedMaxAge)) {
                alert("Minimum age greater than maximum age. Please enter valid university accepted age range.");
                return false;
            }
            else if (isNaN(parseInt(subscriptionSelection))) {
                alert("Please select service subscription for university.");
                return false;
            }
            else if (txtNotesDisclaimer == '') {
                alert("Please enter University Notes and disclaimer");
                return false;
            }
            else if (headerstripcolor == '') {
                alert("Please enter header strip color");
                return false;
            }
            else if (verticalNavigationcolor == '') {
                alert("Please enter Vertical Navigation color");
                return false;
            }
            else if (headerstripcolor == '') {
                alert("Please enter font color");
                return false;
            }

            return true;
        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#universitymenu_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#universitymaster').addClass('active');
	    });
    </script>
</asp:Content>
