<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuniversitycampus.aspx.cs" Inherits="admin_createuniversitycampus" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create University Campus</li>
        </ol>

        <h1 class="h2">University Campus Create</h1>

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
                         <label for="campDescription" class="col-sm-3 col-form-label form-label">Campus Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampDescription" type="text" runat="server" class="form-control" placeholder="Campus Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campResearch" class="col-sm-3 col-form-label form-label">Campus Research</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampResearch" type="text" runat="server" class="form-control" placeholder="Campus Research" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campFacultyDescription" class="col-sm-3 col-form-label form-label">Campus Faculty Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtFacultyDescription" type="text" runat="server" class="form-control" placeholder="Campus Faculty Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <asp:HiddenField ID="hidCountryCount" runat="server" Value="0" />
                    <asp:HiddenField ID="hidCities" runat="server" Value="" />
                    <div id="container" class="form-group row"></div>

                    <asp:HiddenField ID="hidFacilityCount" runat="server" Value="0" />
                    <asp:HiddenField ID="hidFacilities" runat="server" Value="" />
                    <asp:HiddenField ID="hidFacilityCost" runat="server" Value="" />
                    <asp:HiddenField ID="hidFacilityPrice" runat="server" Value="" />
                    <asp:HiddenField ID="hidFacilityLocation" runat="server" Value="" />
                    <asp:HiddenField ID="hidFacilityDistance" runat="server" Value="" />
                    <div id="facilityContainer" class="form-group row"><input id="btnAddFacility" type="button" class="form-control" value="Add Facility" /></div>

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

        function createFacilityBlock() {
            var hfFacilityCount = $("#<%=hidFacilityCount.ClientID %>");
            var count = parseInt(hfFacilityCount.val());
            hfFacilityCount.val(count + 1);

            $("#facilityContainer").append('<label for="ddlFacilities_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Facilities</label>' +
                '<div class="col-sm-8">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<select id="ddlFacilities_' + count + '" class="form-control" style="margin-top:20px;">' +
                '<option value="0" selected="selected" disabled="disabled">Please Select Facility</option>' +
                '</select>' +
                '</div></div></div>' +
                '<label for="ddlFacilityCost_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Cost of Facility</label>' +
                '<div class="col-sm-8">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<select id="ddlFacilityCost_' + count + '" class="form-control" style="margin-top:20px;">' +
                '<option selected="selected" disabled="disabled" value="">Please select facility cost</option>' +
                '<option value="free">Free</option>' +
                '<option value="paid">Paid</option>' +
                '</select>' +
                '</div></div></div>' +
                '<label id="lblFacilityPrice_' + count + '" class="col-sm-3 col-form-label form-label" style="display: none">Price of Facility</label>' +
                '<div id="facility_price_block_' + count + '" class="col-sm-8" style="display: none">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<input id="txtFacilityPrice_' + count + '" type="number" class="form-control" placeholder="Facility Price" />' +
                '</div></div></div>' +
                '<label for="ddlFacilityLocation_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Facility Location</label>' +
                '<div class="col-sm-8">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<select id="ddlFacilityLocation_' + count + '" class="form-control" style="margin-top:20px;">' +
                '<option selected="selected" disabled="disabled" value="">Please select facility location</option>' +
                '<option value="offsite">Offsite</option>' +
                '<option value="onsite">Onsite</option>' +
                '</select>' +
                '</div></div></div>' +
                '<label id="lblFacilityDistance_' + count + '" class="col-sm-3 col-form-label form-label" style="display: none">Facility Distance</label>' +
                '<div id="facility_distance_block_' + count + '" class="col-sm-8" style="display: none">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<input id="txtFacilityDistance_' + count + '" type="number" class="form-control" placeholder="Facility Distance" />' +
                '</div></div></div>');

            $.ajax({
                type: "GET",
                url: "createuniversitycampus.aspx/GetAllFacilities",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        for (var i = 0; i < result.length; i++) {
                            $("#ddlFacilities_" + count).append($("<option></option>").val(result[i].id).html(result[i].facility_name));
                        }
                    }
                }
            });

            $("#ddlFacilityCost_" + count).change(function () {
                var facilityCostValue = $("#ddlFacilityCost_" + count).val().toLowerCase();
                if (facilityCostValue == 'paid') {
                    $("#lblFacilityPrice_" + count).show();
                    $("#facility_price_block_" + count).show();
                }
                else {
                    if (!$("#facility_price_block_" + count).is(':hidden') && $("#txtFacilityPrice_" + count).val() != "")
                        $("#txtFacilityPrice_" + count).val('');

                    $("#lblFacilityPrice_" + count).hide();
                    $("#facility_price_block_" + count).hide();
                }
            });

            $("#ddlFacilityLocation_" + count).change(function () {
                var facilityLocationValue = $("#ddlFacilityLocation_" + count).val().toLowerCase();
                if (facilityLocationValue == 'offsite') {
                    $("#lblFacilityDistance_" + count).show();
                    $("#facility_distance_block_" + count).show();
                }
                else {
                    if (!$("#facility_distance_block_" + count).is(':hidden') && $("#txtFacilityDistance_" + count).val() != "")
                        $("#txtFacilityPrice_" + count).val('');

                    $("#lblFacilityDistance_" + count).hide();
                    $("#facility_distance_block_" + count).hide();
                }
            });
        }
        var appendFlag = true;

        function createCountryElement() {
            var hfCountryCount = $("#<%=hidCountryCount.ClientID %>");
            var count = parseInt(hfCountryCount.val());
            hfCountryCount.val(count + 1);
            if (appendFlag) {
                $("#container").append('<label for="ddlCountry_' + count + '" class="col-sm-3 col-form-label form-label">Country</label>' +
                    '<div class="col-sm-8" id=country_city_block_' + count + '>' +
                    '<div class="row">' +
                    '<div class="col-md-6">' +
                    '<select id="ddlCountry_' + count + '" class="form-control"><option value="0" selected="selected" disabled="disabled">Please Select Country</option></select>' +
                    '</div></div><input id="btnAddCountry" type="button" class="form-control" value="Add Country" /></div>');
            }
            else {
                 $("#container").append('<label for="ddlCountry_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Country</label>' +
                    '<div class="col-sm-8" style="margin-top:20px;" id=country_city_block_' + count + '>' +
                    '<div class="row">' +
                    '<div class="col-md-6">' +
                    '<select id="ddlCountry_' + count + '" class="form-control"><option value="0" selected="selected" disabled="disabled">Please Select Country</option></select>' +
                    '</div></div></div>');
            }
            appendFlag = false;
            $.ajax({
                type: "GET",
                url: "createuniversitycampus.aspx/GetCountries",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        for (var i = 0; i < result.length; i++) {
                            $("#ddlCountry_" + count).append($("<option></option>").val(result[i].countryID).html(result[i].countryName));
                        }
                    }
                }
            });

            $("#ddlCountry_" + count).change(function () {
                $.ajax({
                    type: "GET",
                    url: "createuniversitycampus.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#ddlCountry_" + count).val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#ddlCity_" + count).length >= 1) {
                                $("#ddlCity_" + count).empty();
                                $("#ddlCity_" + count).append($('<option selected="selected" disabled="disabled"></option>').val("0").html("Please Select City"));
                            }
                            else {
                                var content = '<label for="ddlCity_' + count + '" class="col-sm-3 col-form-label form-label">City</label>' +
                                    '<div class="col-sm-8">' +
                                    '<div class="row">' +
                                    '<div class="col-md-6">' +
                                    '<select id="ddlCity_' + count + '" name="ddlCity_' + count + '" class="form-control"><option selected="selected" value="0" disabled="disabled">Please Select City</option></select>' +
                                    '</div></div></div>';
                                $(content).insertAfter($('#country_city_block_' + count));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#ddlCity_" + count).append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });
            });
        }

        function isvalidCities() {

            var countryCount = $("#<%=hidCountryCount.ClientID %>").val();
            $("#<%=hidCities.ClientID %>").val('');

            for (var i = 0; i < countryCount; i++) {
                if ($("#ddlCity_" + i).val() == null || $("#ddlCity_" + i).val() == undefined) {
                    alert("Please select city for country " + $("#ddlCountry_" + i + " option:selected").text());
                    return false;
                }
                else {
                    var data = $('#ddlCity_' + i).val() + ";" + $("#<%=hidCities.ClientID %>").val();
                    $("#<%=hidCities.ClientID %>").val(data);
                }
            }

            return true;
        }

        function isvalidFacilities() {
            var facilitiesCount = $("#<%=hidFacilityCount.ClientID %>").val();

            $("#<%=hidFacilities.ClientID %>").val('');
            $("#<%=hidFacilityCost.ClientID %>").val('');
            $("#<%=hidFacilityPrice.ClientID %>").val('');
            $("#<%=hidFacilityLocation.ClientID %>").val('');
            $("#<%=hidFacilityDistance.ClientID %>").val('');

            for (var i = 0; i < facilitiesCount; i++) {
                if ($("#ddlFacilities_" + i).val() == null || $("#ddlFacilities_" + i).val() == undefined) {
                    alert("Please select facility");
                    return false;
                }
                else {
                    var data = $('#ddlFacilities_' + i).val() + ";" + $("#<%=hidFacilities.ClientID %>").val();
                    $("#<%=hidFacilities.ClientID %>").val(data);
                }
                if ($("#ddlFacilityCost_" + i).val() == null || $("#ddlFacilityCost_" + i).val() == undefined) {
                    alert("Please select facility's cost for " + $("#ddlFacilities_" + i + " option:selected").text());
                    return false;
                }
                else {
                    var data = $('#ddlFacilityCost_' + i).val() + ";" + $("#<%=hidFacilityCost.ClientID %>").val();
                    $("#<%=hidFacilityCost.ClientID %>").val(data);
                }
                if (!$("#txtFacilityPrice_" + i).is(':hidden') && !(parseInt($("#txtFacilityPrice_" + i).val()) > -1)) {
                    alert("Please enter valid price for facility " + $("#ddlFacilities_" + i + " option:selected").text());
                    return false;
                }
                else {
                    var data = $('#txtFacilityPrice_' + i).val() + ";" + $("#<%=hidFacilityPrice.ClientID %>").val();
                    $("#<%=hidFacilityPrice.ClientID %>").val(data);
                }
                if ($("#ddlFacilityLocation_" + i).val() == null || $("#ddlFacilityLocation_" + i).val() == undefined) {
                    alert("Please select facility's location for " + $("#ddlFacilities_" + i + " option:selected").text());
                    return false;
                }
                else {
                    var data = $('#ddlFacilityLocation_' + i).val() + ";" + $("#<%=hidFacilityLocation.ClientID %>").val();
                    $("#<%=hidFacilityLocation.ClientID %>").val(data);
                }
                if (!$("#txtFacilityDistance_" + i).is(':hidden') && !(parseInt($("#txtFacilityDistance_" + i).val()) > -1)) {
                    alert("Please enter valid facility distance for facility " + $("#ddlFacilities_" + i + " option:selected").text());
                    return false;
                }
                else {
                    var data = $('#txtFacilityDistance_' + i).val() + ";" + $("#<%=hidFacilityDistance.ClientID %>").val();
                    $("#<%=hidFacilityDistance.ClientID %>").val(data);
                }
            }

            return true;
        }

        function validateForm() {

            var universityValue = $('#<%=ddlUniversity.ClientID%>').val();
            var campName = $('#<%=txtCampName.ClientID%>').val();
            var campDescription = $('#<%=txtCampDescription.ClientID%>').val();
            var campResearch = $('#<%=txtCampResearch.ClientID%>').val();
            var campFacultyDescription = $('#<%=txtFacultyDescription.ClientID%>').val();

            if (universityValue == 0 || isNaN(parseInt(universityValue))) {
                alert("Please select university for campus");
                return false;
            }
            else if (campName == '') {
                alert("Please enter university campus name");
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
            else if (!isvalidCities()) {
                return false;
            }
            else if (!isvalidFacilities()) {
                return false;
            }

            return true;
        }

        $(document).ready(function () {
            $("#<%=hidCountryCount.ClientID%>").val(0);
            $("#<%=hidCities.ClientID%>").val('');
            $("#container").empty();

            $("#<%=hidFacilities.ClientID%>").val('');
            $("#<%=hidFacilityCount.ClientID%>").val(0);

            createCountryElement();

            $(document).on( "click", "#btnAddCountry", function () {
                createCountryElement();
                $("#btnAddCountry").remove();
                $('#container').append('<input id="btnAddCountry" type="button" class="form-control" value="Add Country">');
            });

            $("#btnAddFacility").click(function () {
                createFacilityBlock();
            });
        });


    </script>
</asp:Content>
