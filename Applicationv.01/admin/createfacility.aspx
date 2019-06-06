<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createfacility.aspx.cs" Inherits="admin_addfacility" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Add Facility</li>
        </ol>

        <h1 class="h2">Add Facility</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                         <label for="campName" class="col-sm-3 col-form-label form-label">Facility Name</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtFacilityName" type="text" runat="server" class="form-control" placeholder="Facility Name" />
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

            var universityValue = $('#<%=txtFacilityName.ClientID%>').val();

            if (universityValue == 0 || isNaN(parseInt(universityValue))) {
                alert("Please enter facility");
                return false;
            }

            return true;         
        }
    </script>
</asp:Content>
