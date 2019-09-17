<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editvisa.aspx.cs" Inherits="admin_editvisa" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Update Visa Plan</li>
        </ol>

        <h1 class="h2">Update  Visa Plan</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="VisaName" class="col-sm-3 col-form-label form-label">Visa Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlVisa" name="ddlVisa" runat="server" class="form-control"></asp:DropDownList>
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
                        <label for="Visafee" class="col-sm-3 col-form-label form-label">Fee</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtFee" type="text" runat="server" class="form-control" placeholder="Visa Fee" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ExtraAdult" class="col-sm-3 col-form-label form-label">Extra Adult Fee</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtExtraAdult" type="text" runat="server" class="form-control" placeholder="Extra Adult Fee" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ExtraChild" class="col-sm-3 col-form-label form-label">Extra Child Fee</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtExtraChild" type="text" runat="server" class="form-control" placeholder="Extra Child Fee" />
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

            var AdultAmount = $('#<%=txtExtraAdult.ClientID%>').val();
            var ChildAmount = $('#<%=txtExtraChild.ClientID%>').val();
            var fee = $('#<%=txtFee.ClientID%>').val();
            var City = $('#<%=ddlCity.ClientID%>').val();
            var Currency = $('#<%=ddlCurrency.ClientID%>').val();
            var Visa = $('#<%=ddlVisa.ClientID%>').val();
            if (Visa == 0 || isNaN(parseInt(Visa))) {
                alert("Please select visa");
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
            else if ((AdultAmount != '') && isNaN(parseInt(AdultAmount))) {
                alert("Please enter appropriate extra adult amount ");
                return false;
            }
            else if ((ChildAmount != '') && isNaN(parseInt(ChildAmount))) {
                alert("Please enter appropriate extra child amount ");
                return false;
            }
            return true;

        }
    </script>
</asp:Content>
