<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantsocial.aspx.cs" Inherits="admin_applicantsocial" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant social details</li>
        </ol>
        <h1 class="h2">Applicant social details</h1>
        <div class="card">
            <div class="list-group list-group-fit">


                <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                        <div class="form-row">
                            <label id="labellinked" runat="server" for="linked" class="col-md-3 col-form-label form-label">Link to your LinkedIn profile</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblLinkedin" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icLinkedin" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtLinkedinComments" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="facebook" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                        <div class="form-row">
                            <label id="labelfacebook" runat="server" for="employer" class="col-md-3 col-form-label form-label">Link to your Facebook profile </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblFacebook" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icFacebook" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtFacebookComments" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="twitter" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-twitter">
                        <div class="form-row">
                            <label id="labeltwitter" runat="server" for="twitter" class="col-md-3 col-form-label form-label">Link to your twitter handle </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icTwitter" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtTwitterComments" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <div class="col-md-6">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>
</asp:Content>
