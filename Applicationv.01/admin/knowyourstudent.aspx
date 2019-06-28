<%@ Page Language="C#" AutoEventWireup="true" CodeFile="knowyourstudent.aspx.cs" Inherits="admin_knowyourstudent" MasterPageFile="~/admin/admin.master" %>

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
                              <span>  <i id="icPassport" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtPassportNo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icPassportIssueDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDateOfissue" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icPassportExpiryDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtExpiryDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icCountryofIssue" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtcountryIssue" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icCityofIssue" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtissueplace" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icIdentityProofType" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternateIdentitytype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icIdentityProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternateIdentityNo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icDOBProofType" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternatedobIdentitytype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icDOBProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternatedobIdentityNo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icResidencyProof" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternateresidenceIdentitytype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icResidencyProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtalternateresidenceIdentityNo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
