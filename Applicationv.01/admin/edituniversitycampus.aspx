<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitycampus.aspx.cs" Inherits="admin_edituniversitycampus" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit University Campus</li>
        </ol>

        <h1 class="h2">University Campus Edit</h1>

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
                    <asp:HiddenField ID="hidCountries" runat="server" Value="" />
                    <div id="container" class="form-group row"></div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <input id="btnAddCountry" type="button" class="form-control" value="Add Country" />
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

        function populateCity(count, cityIndex) {

            $.ajax({
                type: "GET",
                url: "edituniversitycampus.aspx/GetCityDropdown",
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
                                    '<select id="ddlCity_' + count + '" name="ddlCity_' + count + '" class="form-control"><option value="0" disabled="disabled">Please Select City</option></select>' +
                                    '</div></div></div>';
                                $(content).insertAfter($('#country_city_block_' + count));
                        }
                        for (var i = 0; i < result.length; i++) {
                            $("#ddlCity_" + count).append($("<option></option>").val(result[i].city_id).html(result[i].name));
                        }
                    }
                }
            });
            if (cityIndex > 0)
                $("#ddlCity_" + count + " select").val(cityIndex);
        }

        function createCountryElement(countryIndex, cityIndex) {
            var hfCountryCount = $("#<%=hidCountryCount.ClientID %>");
            var count = parseInt(hfCountryCount.val());
            hfCountryCount.val(count + 1);

            $("#container").append('<label for="ddlCountry_' + count + '" class="col-sm-3 col-form-label form-label">Country</label>' +
                '<div class="col-sm-8" id=country_city_block_' + count + '>' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<select id="ddlCountry_' + count + '" class="form-control"><option value="0" selected="selected" disabled="disabled">Please Select Country</option></select>' +
                '</div></div></div>');

            $.ajax({
                type: "GET",
                url: "edituniversitycampus.aspx/GetCountries",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        for (var i = 0; i < result.length; i++) {
                            $("#ddlCountry_" + count).append($("<option></option>").val(result[i].countryID).html(result[i].countryName));
                        }
                        if (countryIndex > 0) {
                            $("#ddlCountry_" + count).prop('selectedIndex', countryIndex);
                            populateCity(count, cityIndex);
                        }
                    }
                }
            });

            $("#ddlCountry_" + count).change(function () {
                populateCity(count, cityIndex);
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
            else if (!isvalidCities()) { return false; }

            return true;         
        }


        $(document).ready(function () {
            $("#container").empty();
            $("#btnAddCountry").click(function () {
                createCountryElement(-1, -1);
            });

            var citiesArray = $("#<%=hidCities.ClientID %>").val().split(';');
            var countryArray = $("#<%=hidCountries.ClientID %>").val().split(';');

            var count = citiesArray.length - 1;
            for (var i = 0; i < count; i++)
                createCountryElement(countryArray[i], citiesArray[i]);
        });
    </script>
</asp:Content>
