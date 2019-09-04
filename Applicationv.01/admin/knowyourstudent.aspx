﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="knowyourstudent.aspx.cs" Inherits="admin_knowyourstudent" MasterPageFile="~/admin/admin.master" %>
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
                                <asp:RadioButton ID="rblPassportNoYes" GroupName="PassportNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblPassportNoNo" GroupName="PassportNo" Text="No" runat="server" />
                                <span><i id="icPassport" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnPassportNo" />
                                <input id="txtPassportNo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblDateOfissueYes" GroupName="DateOfissue" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDateOfissueNo" GroupName="DateOfissue" Text="No" runat="server" />
                                <span class="helpicon"><i id="icPassportIssueDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnDateOfissue" />
                                <input id="txtDateOfissue" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblExpiryDateYes" GroupName="ExpiryDate" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblExpiryDateNo" GroupName="ExpiryDate" Text="No" runat="server" />
                                <span class="helpicon"><i id="icPassportExpiryDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnExpiryDate" />
                                <input id="txtExpiryDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblcountryIssueYes" GroupName="countryIssue" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblcountryIssueNo" GroupName="countryIssue" Text="No" runat="server" />
                                <span class="helpicon"><i id="icCountryofIssue" style="display: none" runat="server" class="fa fa-info-circle" ></i></span>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btncountryIssue" />
                                <input id="txtcountryIssue" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblissueplaceYes" GroupName="issueplace" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblissueplaceNo" GroupName="issueplace" Text="No" runat="server" />
                                <span class="helpicon"><i id="icCityofIssue" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnissueplace" />
                                <input id="txtissueplace" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternateIdentitytypeYes" GroupName="alternateIdentitytype" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternateIdentitytypeNo" GroupName="alternateIdentitytype" Text="No" runat="server" />
                                <span class="helpicon"><i id="icIdentityProofType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternateIdentitytype" />
                                <input id="txtalternateIdentitytype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternateIdentityNoYes" GroupName="alternateIdentityNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternateIdentityNoNo" GroupName="alternateIdentityNo" Text="No" runat="server" />
                                <span class="helpicon"><i id="icIdentityProofNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternateIdentityNo" />
                                <input id="txtalternateIdentityNo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternatedobIdentitytypeYes" GroupName="alternatedobIdentitytype" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternatedobIdentitytypeNo" GroupName="alternatedobIdentitytype" Text="No" runat="server" />
                                <span class="helpicon"><i id="icDOBProofType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternatedobIdentitytype" />
                                <input id="txtalternatedobIdentitytype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternatedobIdentityNoYes" GroupName="alternatedobIdentityNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternatedobIdentityNoNo" GroupName="alternatedobIdentityNo" Text="No" runat="server" />
                                <span class="helpicon"><i id="icDOBProofNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternatedobIdentityNo" />
                                <input id="txtalternatedobIdentityNo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternateresidenceIdentitytypeYes" GroupName="alternateresidenceIdentitytype" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternateresidenceIdentitytypeNo" GroupName="alternateresidenceIdentitytype" Text="No" runat="server" />
                                <span class="helpicon"><i id="icResidencyProof" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternateresidenceIdentitytype" />
                                <input id="txtalternateresidenceIdentitytype" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblalternateresidenceIdentityNoYes" GroupName="alternateresidenceIdentityNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblalternateresidenceIdentityNoNo" GroupName="alternateresidenceIdentityNo" Text="No" runat="server" />
                                <span class="helpicon"><i id="icResidencyProofNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnalternateresidenceIdentityNo" />
                                <input id="txtalternateresidenceIdentityNo" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
    </div><script type="text/javascript">
        $(document).ready(function () {
            $("#btnPassportNo").click(function () {
                ManageRemarks('<%=txtPassportNo.ClientID%>', 'btnPassportNo');
            });
            $("#<%=rblPassportNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtPassportNo.ClientID%>', 'btnPassportNo');
            });
            $("#btnDateOfissue").click(function () {
                ManageRemarks('<%=txtDateOfissue.ClientID%>', 'btnDateOfissue');
            });
            $("#<%=rblDateOfissueNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDateOfissue.ClientID%>', 'btnDateOfissue');
            });
            $("#btnExpiryDate").click(function () {
                ManageRemarks('<%=txtExpiryDate.ClientID%>', 'btnExpiryDate');
            });
            $("#<%=rblExpiryDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpiryDate.ClientID%>', 'btnExpiryDate');
            });

            $("#btnissueplace").click(function () {
                ManageRemarks('<%=txtissueplace.ClientID%>', 'btnissueplace');
            });
            $("#<%=rblissueplaceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtissueplace.ClientID%>', 'btnissueplace');
            });
            $("#btncountryIssue").click(function () {
                ManageRemarks('<%=txtcountryIssue.ClientID%>', 'btncountryIssue');
            });
            $("#<%=rblcountryIssueNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtcountryIssue.ClientID%>', 'btncountryIssue');
            });
            $("#btnalternateIdentitytype").click(function () {
                ManageRemarks('<%=txtalternateIdentitytype.ClientID%>', 'btnalternateIdentitytype');
            });
            $("#<%=rblalternateIdentitytypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternateIdentitytype.ClientID%>', 'btnalternateIdentitytype');
            });
            $("#btnalternateIdentityNo").click(function () {
                ManageRemarks('<%=txtalternateIdentityNo.ClientID%>', 'btnalternateIdentityNo');
            });
            $("#<%=rblalternateIdentityNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternateIdentityNo.ClientID%>', 'btnalternateIdentityNo');
            });
            $("#btnalternatedobIdentitytype").click(function () {
                ManageRemarks('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
            });
            $("#<%=rblalternatedobIdentitytypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
            });
             $("#btnalternatedobIdentitytype").click(function () {
                ManageRemarks('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
            });
            $("#<%=rblalternatedobIdentitytypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
            });
            $("#btnalternatedobIdentityNo").click(function () {
                ManageRemarks('<%=txtalternatedobIdentityNo.ClientID%>', 'btnalternatedobIdentityNo');
            });
            $("#<%=rblalternatedobIdentityNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternatedobIdentityNo.ClientID%>', 'btnalternatedobIdentityNo');
            });
            $("#btnalternateresidenceIdentitytype").click(function () {
                ManageRemarks('<%=txtalternateresidenceIdentitytype.ClientID%>', 'btnalternateresidenceIdentitytype');
            });
            $("#<%=rblalternateresidenceIdentitytypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternateresidenceIdentitytype.ClientID%>', 'btnalternateresidenceIdentitytype');
            });
            $("#btnalternateresidenceIdentityNo").click(function () {
                ManageRemarks('<%=txtalternateresidenceIdentityNo.ClientID%>', 'btnalternateresidenceIdentityNo');
            });
            $("#<%=rblalternateresidenceIdentityNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtalternateresidenceIdentityNo.ClientID%>', 'btnalternateresidenceIdentityNo');
            });
           
             if ($('#<%=rblPassportNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtPassportNo.ClientID%>', 'btnPassportNo');
             if ($('#<%=rblDateOfissueNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDateOfissue.ClientID%>', 'btnDateOfissue');
             if ($('#<%=rblExpiryDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpiryDate.ClientID%>', 'btnExpiryDate');
             if ($('#<%=rblissueplaceNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtissueplace.ClientID%>', 'btnissueplace');
             if ($('#<%=rblcountryIssueNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtcountryIssue.ClientID%>', 'btncountryIssue');
             if ($('#<%=rblalternateIdentitytypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternateIdentitytype.ClientID%>', 'btnalternateIdentitytype');
             if ($('#<%=rblalternateIdentityNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternateIdentityNo.ClientID%>', 'btnalternateIdentityNo');
             if ($('#<%=rblalternatedobIdentitytypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
             if ($('#<%=rblalternatedobIdentitytypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternatedobIdentitytype.ClientID%>', 'btnalternatedobIdentitytype');
             if ($('#<%=rblalternatedobIdentityNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternatedobIdentityNo.ClientID%>', 'btnalternatedobIdentityNo');
             if ($('#<%=rblalternateresidenceIdentitytypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternateresidenceIdentitytype.ClientID%>', 'btnalternateresidenceIdentitytype');
             if ($('#<%=rblalternateresidenceIdentityNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtalternateresidenceIdentityNo.ClientID%>', 'btnalternateresidenceIdentityNo');
           
              function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
           
            function ManageRemarks(control1, control2) {
                if ($("#" + control1 + "").is(':hidden')) {
                    $("#" + control1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + control1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }

        });</script>
</asp:Content>
