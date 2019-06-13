<%@ Page Language="C#" AutoEventWireup="true" CodeFile="knowyourstudent.aspx.cs" Inherits="knowyourstudent" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Identification Details</li>
        </ol>
        <h1 class="h2">Identification Details</h1>
    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">

                            <div class="list-group-item" id="passportno" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-passportno">
                                    <div class="form-row">
                                        <label id="labelpassportno" runat="server" for="passportno" class="col-md-3 col-form-label form-label">Passport Number </label>
                                        <div class="col-md-6">
                                            <input id="txtPassportNo" runat="server" type="text" class="form-control" placeholder="Passport Number"><span class="helpicon"><i id="icPassport" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="dateofissue" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dateofissue">
                                    <div class="form-row">
                                        <label id="labeldateofissue" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Issue </label>
                                        <div class="col-md-6">
                                            <input id="txtdateofissue" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value=""><span class="helpicon"><i id="icPassportIssueDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" runat="server" style="display: none;" id="expirydate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-expirydate">
                                    <div class="form-row">
                                        <label id="labelexpirydate" runat="server" for="expirydate" class="col-md-3 col-form-label form-label">Expiry Date </label>
                                        <div class="col-md-6">
                                            <input id="txtexpirydate" runat="server" type="text" class="form-control" placeholder="Expiry Date" data-toggle="flatpickr" value=""><span class="helpicon"><i id="icPassportExpiryDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" runat="server" style="display: none;" id="countryIssue">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryIssue">
                                    <div class="form-row">
                                        <label id="labelcountryIssue" runat="server" for="countryIssue" class="col-md-3 col-form-label form-label">COUNTRY OF ISSUE </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountryofIssue" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icCountryofIssue" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="issueplace" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-issueplace">
                                    <div class="form-row">
                                        <label id="labelissueplace" runat="server" for="issueplace" class="col-md-3 col-form-label form-label">CITY OF ISSUE </label>
                                        <div class="col-md-6">
                                            <input id="txtissueplaceCity" runat="server" type="text" class="form-control" placeholder="City of Issue" />
                                            <span class="helpicon"><i id="icCityofIssue" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="alternateIdentitytype" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentitytype">
                                    <div class="form-row">
                                        <label id="labelalternateIdentitytype" runat="server" for="alternateIdentitytype" class="col-md-3 col-form-label form-label">Select Identity Proof Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlalternateIdentitytype" CssClass="form-control" runat="server">
                                            </asp:DropDownList><span class="helpicon"><i id="icIdentityProofType" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="alternateIdentityNo" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentityNo">
                                    <div class="form-row">
                                        <label id="labelalternateIdentityNo" runat="server" for="alternateIdentityNo" class="col-md-3 col-form-label form-label">Identity Proof Number</label>
                                        <div class="col-md-6">
                                            <input id="txtalternateIdentityNo" runat="server" type="text" class="form-control" placeholder="Identity Number"><span class="helpicon"><i id="icIdentityProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="list-group-item" id="alternatedobIdentitytype" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternatedobIdentitytype">
                                    <div class="form-row">
                                        <label id="labelalternatedobIdentitytype" runat="server" for="alternatedobIdentitytype" class="col-md-3 col-form-label form-label">Select DOB Proof Type </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlalternatedobIdentitytype" runat="server" CssClass="form-control">
                                            </asp:DropDownList><span class="helpicon"><i id="icDOBProofType" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="alternatedobIdentityNo" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternatedobIdentityNo">
                                    <div class="form-row">
                                        <label id="labelalternatedobIdentityNo" runat="server" for="alternatedobIdentityNo" class="col-md-3 col-form-label form-label">DOB proof Number</label>
                                        <div class="col-md-6">
                                            <input id="txtalternatedobIdentityNo" runat="server" type="text" class="form-control" placeholder="Identity Number"><span class="helpicon"><i id="icDOBProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="alternateresidenceIdentitytype" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateresidenceIdentitytype">
                                    <div class="form-row">
                                        <label id="labelalternateresidenceIdentitytype" runat="server" for="alternateresidenceIdentitytype" class="col-md-3 col-form-label form-label">Select Residence Proof Type </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlalternateresidenceIdentitytype" runat="server" CssClass="form-control">
                                            </asp:DropDownList><span class="helpicon"><i id="icResidencyProof" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="alternateresidenceIdentityNo" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateresidenceIdentityNo">
                                    <div class="form-row">
                                        <label id="labelalternateresidenceIdentityNo" runat="server" for="alternateresidenceIdentityNo" class="col-md-3 col-form-label form-label">Residence Proof Number</label>
                                        <div class="col-md-6">
                                            <input id="txtalternateresidenceIdentityNo" runat="server" type="text" class="form-control" placeholder="Residence Proof Number"><span class="helpicon"><i id="icResidencyProofNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicanteducation.aspx" class="btn btn-success" style="margin-right: 10px;">Education Details</a>
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" OnClientClick="return validateForm()" />
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
                <div id="page-nav" class="col-lg-auto page-nav">

                    <div>
                        <span id="tooltip"></span>
                    </div>


                </div>

            </div>
        </div>


        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>

        $('#ContentPlaceHolder1_txtdateofissue').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtexpirydate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });

        function validateForm() {
            var flag = false;
            if (!$("#<%=passportno.ClientID%>").is(':hidden') && $("#<%=txtPassportNo.ClientID%>").val() == "")
                alert("Please Enter Passport Number");
            else if (!$("#<%=dateofissue.ClientID%>").is(':hidden') && $("#<%=txtdateofissue.ClientID%>").val() == "")
                alert("Please Enter Date Of Issue");
            else if (!$("#<%=expirydate.ClientID%>").is(':hidden') && $("#<%=txtexpirydate.ClientID%>").val() == "")
                alert("Please Select Expiry Date");
            else if (!$("#<%=countryIssue.ClientID%>").is(':hidden') && $("#<%=ddlCountryofIssue.ClientID%>").val() === "0")
                alert("Please Select Country");
            else if (!$("#<%=issueplace.ClientID%>").is(':hidden') && $("#<%=txtissueplaceCity.ClientID%>").val() == "")
                alert("Please Enter City name");
            else if (!$("#<%=alternateIdentitytype.ClientID%>").is(':hidden') && $("#<%=ddlalternateIdentitytype.ClientID%>").val() === "0")
                alert("Please Select Alternate Identity Proof");
            else if (!$("#<%=alternateIdentityNo.ClientID%>").is(':hidden') && $("#<%=txtalternateIdentityNo.ClientID%>").val() == "")
                alert("Please Enter Identity Proof Number");
            else if (!$("#<%=alternatedobIdentitytype.ClientID%>").is(':hidden') && $("#<%=ddlalternatedobIdentitytype.ClientID%>").val() === "0")
                alert("Please Select Alternate DOB Proof");
            else if (!$("#<%=alternatedobIdentityNo.ClientID%>").is(':hidden') && $("#<%=txtalternatedobIdentityNo.ClientID%>").val() == "")
                alert("Please Enter DOB Proof Number");
            else if (!$("#<%=alternateresidenceIdentitytype.ClientID%>").is(':hidden') && $("#<%=ddlalternateresidenceIdentitytype.ClientID%>").val() === "0")
                alert("Please Select Alternate Residence Proof");
            else if (!$("#<%=alternateresidenceIdentityNo.ClientID%>").is(':hidden') && $("#<%=txtalternateresidenceIdentityNo.ClientID%>").val() == "")
                alert("Please Enter Residence Proof Number");
            else
                flag = true;
            if (flag == true)
                flag = customcontrolValidation();
            return flag;
        }
        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            TextBox txtDynamic = (TextBox)mainDiv.FindControl("txt" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if ($("#<%=txtDynamic.ClientID%>").val() == "") {
                alert("Please enter <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
</asp:Content>

