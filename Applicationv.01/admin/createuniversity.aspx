<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuniversity.aspx.cs" Inherits="admin_createuniversity" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create University</li>
        </ol>

        <h1 class="h2">University Create</h1>

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
                                    <input id="txtYearEstablish" type="text" runat="server" class="form-control" placeholder="University Year Established" />
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
                         <label for="uniEmail" class="col-sm-3 col-form-label form-label">University Email ID</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtEmail" type="text" runat="server" class="form-control" placeholder="University Email ID" />
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
                                    <input id="txtMobile" type="text" runat="server" class="form-control" placeholder="University Mobile Number" maxlength="10" />
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
                                    <asp:DropDownList id="ddlCountry" name="ddlCountry" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="uniCity" class="col-sm-3 col-form-label form-label">University City</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlCity" name="ddlCity" runat="server">
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
                                    <input id="txtUniTimeZone" type="text" runat="server" class="form-control" placeholder="Location Time Zone" />
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
        </form>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%=ddlCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "createuniversity.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
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
    </script>
</asp:Content>