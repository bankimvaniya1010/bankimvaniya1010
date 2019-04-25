<%@ Page Language="C#" AutoEventWireup="true" CodeFile="referencecheck.aspx.cs" Inherits="referencecheck" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Reference Check </li>
        </ol>
        <h1 class="h2">Reference Check </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="confirmation" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-email" for="email" class="col-md-3 col-form-label form-label">Please check the check for confimation </label>
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                            <asp:CheckBox ID="chkVerify" runat="server" CssClass="form-control" />
                                       
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="message" runat="server" visible ="false">
                                <div class="form-group m-0" role="group" aria-labelledby="label-message">
                                    <div class="form-row">
                                        <label id="label-message" for="message" class="col-md-3 col-form-label form-label">You have already verified</label>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="button" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click"  />
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>


            </div>
        </div>


        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    
</asp:Content>
