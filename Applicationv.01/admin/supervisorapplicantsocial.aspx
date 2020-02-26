<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantsocial.aspx.cs" Inherits="admin_supervisorapplicantsocial" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblLinkedinYes" GroupName="Linkedin" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblLinkedinNo" GroupName="Linkedin" Text="No" runat="server" /><asp:Label ID="lblLinkedinComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblFacebookYes" GroupName="Facebook" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblFacebookNo" GroupName="Facebook" Text="No" runat="server" /><asp:Label ID="lblFacebookComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblTwitterYes" GroupName="twitter" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblTwitterNo" GroupName="twitter" Text="No" runat="server" /><asp:Label ID="lblTwitterComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

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
