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
                         <label for="cityName" class="col-sm-3 col-form-label form-label">Country</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList>
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
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>