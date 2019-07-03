<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorknowyourstudent.aspx.cs" Inherits="admin_supervisorknowyourstudent" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Identification Details</li>
        </ol>
        <h1 class="h2">Identification Details</h1>
        <div class="card">
            <div class="list-group list-group-fit">

                <div class="list-group-item" id="passportno" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-passportno">
                        <div class="form-row">
                            <label id="labelpassportno" runat="server" for="passportno" class="col-md-3 col-form-label form-label">Passport Number </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblPassportNo" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="labelpassportnoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="dateofissue" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-dateofissue">
                        <div class="form-row">
                            <label id="labeldateofissue" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Issue </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDateOfissue" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblDateOfissueComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" runat="server" style="display: none;" id="expirydate">
                    <div class="form-group m-0" role="group" aria-labelledby="label-expirydate">
                        <div class="form-row">
                            <label id="labelexpirydate" runat="server" for="expirydate" class="col-md-3 col-form-label form-label">Expiry Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpiryDate" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpiryDateComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" runat="server" style="display: none;" id="countryIssue">
                    <div class="form-group m-0" role="group" aria-labelledby="label-countryIssue">
                        <div class="form-row">
                            <label id="labelcountryIssue" runat="server" for="countryIssue" class="col-md-3 col-form-label form-label">COUNTRY OF ISSUE </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblcountryIssue" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblcountryIssueComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="issueplace" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-issueplace">
                        <div class="form-row">
                            <label id="labelissueplace" runat="server" for="issueplace" class="col-md-3 col-form-label form-label">CITY OF ISSUE </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblissueplace" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblissueplaceComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="alternateIdentitytype" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentitytype">
                        <div class="form-row">
                            <label id="labelalternateIdentitytype" runat="server" for="alternateIdentitytype" class="col-md-3 col-form-label form-label">Select Identity Proof Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateIdentitytype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateIdentitytypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="alternateIdentityNo" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentityNo">
                        <div class="form-row">
                            <label id="labelalternateIdentityNo" runat="server" for="alternateIdentityNo" class="col-md-3 col-form-label form-label">Identity Proof Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateIdentityNo" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateIdentityNoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="list-group-item" id="alternatedobIdentitytype" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternatedobIdentitytype">
                        <div class="form-row">
                            <label id="labelalternatedobIdentitytype" runat="server" for="alternatedobIdentitytype" class="col-md-3 col-form-label form-label">Select DOB Proof Type </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternatedobIdentitytype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternatedobIdentitytypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="alternatedobIdentityNo" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternatedobIdentityNo">
                        <div class="form-row">
                            <label id="labelalternatedobIdentityNo" runat="server" for="alternatedobIdentityNo" class="col-md-3 col-form-label form-label">DOB proof Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternatedobIdentityNo" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternatedobIdentityNoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="alternateresidenceIdentitytype" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternateresidenceIdentitytype">
                        <div class="form-row">
                            <label id="labelalternateresidenceIdentitytype" runat="server" for="alternateresidenceIdentitytype" class="col-md-3 col-form-label form-label">Select Residence Proof Type </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateresidenceIdentitytype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateresidenceIdentitytypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="alternateresidenceIdentityNo" runat="server" style="display: none;">
                    <div class="form-group m-0" role="group" aria-labelledby="label-alternateresidenceIdentityNo">
                        <div class="form-row">
                            <label id="labelalternateresidenceIdentityNo" runat="server" for="alternateresidenceIdentityNo" class="col-md-3 col-form-label form-label">Residence Proof Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateresidenceIdentityNo" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblalternateresidenceIdentityNoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div><div id="mainDiv" runat="server"></div>
                 <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction"> Approved
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
                                <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
