<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createcampusfacilitymapping.aspx.cs" Inherits="admin_createcampusfacilitymapping" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create Campus Facility Mapping</li>
        </ol>

        <h1 class="h2">Create Campus Facility Mapping</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">University</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">Campus</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlCampus" runat="server" class="form-control">
                                        <option value="" selected="selected" disabled="disabled">Please Select Campus</option>
                                    </select>
                                    <asp:HiddenField ID="hidCampusField" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">Facility</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlFacility" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityDescription" class="col-sm-3 col-form-label form-label">Cost of Facility</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlFacilityCost" runat="server" class="form-control">
                                        <option value="" selected="selected" disabled="disabled">Please select</option>
                                        <option value="Free">Free</option>
                                        <option value="Paid">Paid</option>
                                    </select>
                                    <div id="facilityPrice" runat="server" class="d-none">
                                        <input id="txtFacilityCost" type="text" runat="server" class="form-control" placeholder="Price" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityCostOfLiving" class="col-sm-3 col-form-label form-label">Facility Location</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlFacilityLocation" runat="server" class="form-control">
                                        <option value="" selected="selected" disabled="disabled">Please select</option>
                                        <option value="Onsite">Onsite</option>
                                        <option value="Offsite">Offsite</option>
                                    </select>
                                    <div id="facilityDistance" runat="server" class="d-none">
                                        <input id="txtFacilityDistance" type="text" runat="server" class="form-control" placeholder="Distance" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()"/>
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
            $("#<%=ddlUniversity.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "createcampusfacilitymapping.aspx/GetCampusDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { universityID: $("#<%=ddlUniversity.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if (result.length == 0)
                                alert("No campus found. Please select other university");
                            if ($("#<%=ddlCampus.ClientID%>").length >= 1) {
                                $("#<%=ddlCampus.ClientID%>").empty();
                                $("#<%=ddlCampus.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select Campus"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCampus.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                            }
                        }
                    }
                });
            });

            $("#<%=ddlCampus.ClientID%>").change(function () {
                $("#<%=hidCampusField.ClientID%>").val($("#<%=ddlCampus.ClientID%>").val());
            });

            $("#<%=ddlFacilityCost.ClientID%>").change(function () {
                if ($("#<%=ddlFacilityCost.ClientID%>").val() == "Paid")
                    $("#<%=facilityPrice.ClientID%>").removeClass('d-none');
                else
                    $("#<%=facilityPrice.ClientID%>").addClass('d-none');

            });

            $("#<%=ddlFacilityLocation.ClientID%>").change(function () {
                if ($("#<%=ddlFacilityLocation.ClientID%>").val() == "Offsite")
                    $("#<%=facilityDistance.ClientID%>").removeClass('d-none');
                else
                    $("#<%=facilityDistance.ClientID%>").addClass('d-none');

            });
        });

        function validateForm() {
            var ddlCampusValue = $('#<%=hidCampusField.ClientID%>').val();
            var ddlFacilityValue = $('#<%=ddlFacility.ClientID%>').val();
            var ddlfacilityCost = $('#<%=ddlFacilityCost.ClientID%>').val();
            var txtfacilityCost = $('#<%=txtFacilityCost.ClientID%>').val();
            var ddlfacilityLocationValue = $('#<%=ddlFacilityLocation.ClientID%>').val();
            var txtfacilityDistance = $('#<%=txtFacilityDistance.ClientID%>').val();

            if (ddlCampusValue == 0 || isNaN(parseInt(ddlCampusValue))) {
                alert("Please select university campus");
                return false;
            }
            else if (ddlFacilityValue == 0 || isNaN(parseInt(ddlFacilityValue))) {
                alert("Please select facility");
                return false;
            }
            else if (ddlfacilityCost == '') {
                alert("Please select facility cost");
                return false;
            }
            else if (ddlfacilityCost === 'Paid' && txtfacilityCost == '' && isNaN(parseInt(txtfacilityCost))) {
                alert("Please enter numeric facility price");
                return false;
            }
            else if (ddlfacilityLocationValue == '') {
                alert("Please select facility location");
                return false;
            }
            else if (ddlfacilityLocationValue == 'Offsite' && txtfacilityDistance == '') {
                alert("Please select facility distance");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>