<%@ Page Language="C#" AutoEventWireup="true" CodeFile="proctormaster.aspx.cs" Inherits="admin_proctormaster" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">PROCTOR MASTER</li>
        </ol>

        <h1 class="h2">PROCTOR MASTER</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">PROCTOR Name</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtproctorname" type="text" runat="server" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityName" class="col-sm-3 col-form-label form-label">PROCTOR Email ID</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtproctoremail" type="text" runat="server" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityDescription" class="col-sm-3 col-form-label form-label">PROCTOR Phone</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtproctorphone" type="text" runat="server" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityCostOfLiving" class="col-sm-3 col-form-label form-label">PROCTOR COUNTRY</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" class="form-control" ID="ddlproctoecountry"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityAround" class="col-sm-3 col-form-label form-label">PROCTOR city:</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" class="form-control" ID="ddlproctorcity"></asp:DropDownList>
                                    <asp:HiddenField ID="hidCityField" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" style="display:none">
                         <label for="cityWeather" class="col-sm-3 col-form-label form-label">PROCTOR TIMEZONE</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="DropdownList1" class="form-control"> </asp:DropDownList>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

                  
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()"/>
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#managemeeting_schedule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#proctoremaster').addClass('active');

            $("#<%=ddlproctoecountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "proctormaster.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlproctoecountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlproctorcity.ClientID%>").length >= 1) {
                                $("#<%=ddlproctorcity.ClientID%>").empty();
                                $("#<%=ddlproctorcity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlproctorcity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });

            });

            $("#<%=ddlproctorcity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddlproctorcity.ClientID%>").val());
            });

        });

        function validateForm() {

            var txtproctorname = $('#<%=txtproctorname.ClientID%>').val();
            var email = $('#<%=txtproctoremail.ClientID%>').val();
            var mobile = $('#<%=txtproctorphone.ClientID%>').val();
            var country = $('#<%=ddlproctoecountry.ClientID%>').val();
            var city = $('#<%=hidCityField.ClientID%>').val();            
            

            if (txtproctorname == '') {
                alert("Please enter procctor name");
                return false;
            }
            else if (email == '') {
                alert("Please enter email id");
                return false;
            }
            else if (mobile == '') {
                alert("Please enter Mobile number");
                return false;
            }
            else if (country == '0') {
                alert("Please select country");
                return false;
            }
                
            return true;
            
        }
    </script>
</asp:Content>
