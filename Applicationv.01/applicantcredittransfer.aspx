﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcredittransfer.aspx.cs" Inherits="applicantcredittransfer" MasterPageFile="~/student.master" %>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Credit Transfer </li>
        </ol>
        <h1 class="h2">Credit Transfer </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-email" for="email" class="col-md-3 col-form-label form-label">Do you plan to undertake a credit transfer  </label>
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                            <asp:RadioButton ID="rblCreditYes" runat="server" CssClass="form-control" GroupName="credittransfer" Text="Yes" />
                                            <asp:RadioButton ID="rblCreditNo" runat="server" CssClass="form-control" GroupName="credittransfer" Text="No" />
                                           
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success"  />
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
