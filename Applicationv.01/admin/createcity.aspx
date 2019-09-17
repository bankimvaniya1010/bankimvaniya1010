<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createcity.aspx.cs" Inherits="admin_createcity" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create City</li>
        </ol>

        <h1 class="h2">Create City</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">Country</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCountry" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityName" class="col-sm-3 col-form-label form-label">City Name</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityName" type="text" runat="server" class="form-control" placeholder="City Name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityDescription" class="col-sm-3 col-form-label form-label">City Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityDescription" type="text" runat="server" class="form-control" placeholder="City Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityCostOfLiving" class="col-sm-3 col-form-label form-label">Cost of living in City</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityCost" type="text" runat="server" class="form-control" placeholder="Cost of Living in City" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityAround" class="col-sm-3 col-form-label form-label">Areas around city:</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityAround" type="text" runat="server" class="form-control" placeholder="Areas Around City" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityWeather" class="col-sm-3 col-form-label form-label">City Weather</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityWeather" type="text" runat="server" class="form-control" placeholder="City Weather" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="cityReaching" class="col-sm-3 col-form-label form-label">Reaching City</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCityReaching" type="text" runat="server" class="form-control" placeholder="Reaching City" />
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

    <script type="text/javascript">
        function validateForm() {

            var txtCityName = $('#<%=txtCityName.ClientID%>').val();
            var txtCityDescription = $('#<%=txtCityDescription.ClientID%>').val();
            var txtCityCost = $('#<%=txtCityCost.ClientID%>').val();
            var txtCityAround = $('#<%=txtCityAround.ClientID%>').val();
            var txtCityWeather = $('#<%=txtCityWeather.ClientID%>').val();
            var txtCityReaching = $('#<%=txtCityReaching.ClientID%>').val();
            var countryValue = $('#<%=ddlCountry.ClientID%>').val();
   
            if (countryValue == 0 || isNaN(parseInt(countryValue))) {
                alert("Please select country");
                return false;
            }
            else if (txtCityName == '') {
                alert("Please enter name for city");
                return false;
            }
            else if (txtCityDescription == '') {
                alert("Please enter city description");
                return false;
            }
            else if (txtCityCost == '') {
                alert("Please enter city cost of living");
                return false;
            }
            else if (txtCityAround == '') {
                alert("Please enter city around");
                return false;
            }
            else if (txtCityWeather == '') {
                alert("Please enter city weather");
                return false;
            }
            else if (txtCityReaching == '') {
                alert("Please enter ways to reach city");
                return false;
            }
                
            return true;
            
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#admin_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#managecity').addClass('active');
        });
    </script>

</asp:Content>