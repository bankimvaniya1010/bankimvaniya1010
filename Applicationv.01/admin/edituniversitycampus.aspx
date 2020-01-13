<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitycampus.aspx.cs" Inherits="admin_edituniversitycampus" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

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
                    <div class="form-group row">
                         <label class="col-sm-3 col-form-label form-label">Select Country</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcountry" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label class="col-sm-3 col-form-label form-label">Select City</label>
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
            var campDescription = $('#<%=txtCampDescription.ClientID%>').val();
            var campResearch = $('#<%=txtCampResearch.ClientID%>').val();
            var campFacultyDescription = $('#<%=txtFacultyDescription.ClientID%>').val();
            var country = $('#<%=ddlcountry.ClientID%>').val();
            var city = $('#<%=ddlcity.ClientID%>').val();

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
                    url: "createuniversitycampus.aspx/GetCityDropdown",
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
