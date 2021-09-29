<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editmealplan.aspx.cs" Inherits="admin_editmealplan" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Update Meal Plan</li>
        </ol>

        <h1 class="h2">Update  Meal Plan</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="MealName" class="col-sm-3 col-form-label form-label">Meal Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlMeal" name="ddlMeal" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="discipline" class="col-sm-3 col-form-label form-label">Currency</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCurrency" name="ddlCurrency" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="studymode" class="col-sm-3 col-form-label form-label">City</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCity" name="ddlCity" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="Mealfee" class="col-sm-3 col-form-label form-label">Fee</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtFee" type="text" runat="server" class="form-control" placeholder="Meal Fee" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="extraAdult" class="col-sm-3 col-form-label form-label">Extra Adult Percentage</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtExtraAdultPercentage" type="text" runat="server" class="form-control" placeholder="Extra Adult Percentage" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="extraChild" class="col-sm-3 col-form-label form-label">Extra Child Percentage</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtExtraChildPercentage" type="text" runat="server" class="form-control" placeholder="Extra Child Percentage" />
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


        function validateForm() {

            var AdultPercentage = $('#<%=txtExtraAdultPercentage.ClientID%>').val();
            var ChildPercentage = $('#<%=txtExtraChildPercentage.ClientID%>').val();
            var fee = $('#<%=txtFee.ClientID%>').val();
            var City = $('#<%=ddlCity.ClientID%>').val();
            var Currency = $('#<%=ddlCurrency.ClientID%>').val();
            var Meal = $('#<%=ddlMeal.ClientID%>').val();
            if (Meal == 0 || isNaN(parseInt(Meal))) {
                alert("Please select meal");
                return false;
            }
            else if (Currency == 0 || isNaN(parseInt(Currency))) {
                alert("Please select currency");
                return false;
            }
            else if (City == 0 || isNaN(parseInt(City))) {
                alert("Please select city");
                return false;
            }
            else if (fee == '') {
                alert("Please enter amount");
                return false;
            }
         else if ((AdultPercentage != '') && isNaN(parseInt(AdultPercentage))) {
                alert("Please enter appropriate extra adult percentage ");
                return false;
            }
            else if ((ChildPercentage != '') && isNaN(parseInt(ChildPercentage))) {
                alert("Please enter appropriate extra child percentage ");
                return false;
            }
            return true;

        }
        
		$(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#Costcalculator_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#managemealplan').addClass('active');
	    });
    </script>
</asp:Content>
