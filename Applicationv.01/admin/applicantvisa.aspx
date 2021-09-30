<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantvisa.aspx.cs" Inherits="admin_applicantvisa" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Applicant visa details</li>
        </ol>
        <h1 class="h2">Applicant visa details</h1>
        <div class="card">

            <div class="list-group list-group-fit">
                <div class="list-group-item" id="applyvisa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-havevisa">
                        <div class="form-row">
                            <label id="label-havevisa" for="havevisa" class="col-md-2 col-form-label form-label">
                                Do you currently have a visa that allows you to study in {insert name of country}

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblHaveVisa" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblHaveVisaYes" GroupName="HaveVisa" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblHaveVisaNo" GroupName="HaveVisa" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icHaveVisa" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnHaveVisa" />
                                <input id="txtHaveVisa" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="visa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visa">
                        <div class="form-row">
                            <label id="label-visa" for="visa" class="col-md-2 col-form-label form-label">Which Visa Do You Hold</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvisa" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvisaYes" GroupName="visa" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvisaNo" GroupName="visa" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvisa" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvisa" />
                                <input id="txtVisa" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="validityFrom">
                    <div class="form-group m-0" role="group" aria-labelledby="label-validityFrom">
                        <div class="form-row">
                            <label id="label-validityFrom" for="EnglishCourse" class="col-md-2 col-form-label form-label">Validity From </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvalidityFrom" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvalidityFromYes" GroupName="validityFrom" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvalidityFromNo" GroupName="validityFrom" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvalidityFrom" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvalidityFrom" />
                                <input id="txtvalidityFrom" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="validityTo">
                    <div class="form-group m-0" role="group" aria-labelledby="label-validityTo">
                        <div class="form-row">
                            <label id="label-validityTo" for="EnglishCourse" class="col-md-2 col-form-label form-label">Validity To </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvalidityTo" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvalidityToYes" GroupName="validityTo" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvalidityToNo" GroupName="validityTo" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvalidityTo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvalidityTo" />
                                <input id="txtvalidityTo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="visano">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visano">
                        <div class="form-row">
                            <label id="label-visano" for="visano" class="col-md-2 col-form-label form-label">Visa No</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvisano" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvisanoYes" GroupName="visano" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvisanoNo" GroupName="visano" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="i4" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvisano" />
                                <input id="txtvisano" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visaappliedCountry">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visaappliedCountry">
                        <div class="form-row">
                            <label id="label-visaappliedCountry" for="visaappliedCountry" class="col-md-2 col-form-label form-label">
                                Where would you be making your Visa application 

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvisaapplied" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvisaappliedCountryYes" GroupName="visaappliedCountry" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvisaappliedCountryNo" GroupName="visaappliedCountry" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvisaappliedCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvisaappliedCountry" />
                                <input id="txtvisaappliedCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visacity">
                    <div class="form-group m-0" role="group" aria-labelledby="label-city">
                        <div class="form-row">
                            <label id="label-city" for="city" class="col-md-2 col-form-label form-label">
                                City

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvisacity" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvisacityYes" GroupName="visacity" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvisacityNo" GroupName="visacity" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvisacity" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvisacity" />
                                <input id="txtvisacity" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visacountry">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                        <div class="form-row">
                            <label id="label-highschoolCountry" for="highschoolCountry" class="col-md-2 col-form-label form-label">Visa Application Country</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblvisacountry" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblvisacountryYes" GroupName="visacountry" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblvisacountryNo" GroupName="visacountry" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icvisacountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnvisacountry" />
                                <input id="txtvisacountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="firstvisit">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstvisit">
                        <div class="form-row">
                            <label id="label-firstvisit" for="firstvisit" class="col-md-2 col-form-label form-label">Date of first Visit to Country of Application </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblfirstvisit" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblfirstvisitYes" GroupName="firstvisit" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblfirstvisitNo" GroupName="firstvisit" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icfirstvisit" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnfirstvisit" />
                                <input id="txtfirstvisit" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="Previuosstay">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Previuosstay">
                        <div class="form-row">
                            <label id="label-Previuosstay" for="Previuosstay" class="col-md-2 col-form-label form-label">
                                Have you ever, lived, worked, studied in Country of Application before

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblPreviuosstay" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblPreviuosstayYes" GroupName="Previuosstay" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblPreviuosstayNo" GroupName="Previuosstay" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icPreviuosstay" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnPreviuosstay" />
                                <input id="txtPreviuosstay" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="parent">
                    <div class="form-group m-0" role="group" aria-labelledby="label-parent">
                        <div class="form-row">
                            <label id="label-parent" for="parent" class="col-md-2 col-form-label form-label">
                                Do your parents/step parents/spouse/partner/children/step-children live, study, work in Country of Application

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblparent" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblparentYes" GroupName="parent" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblparentNo" GroupName="parent" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icparent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnparent" />
                                <input id="txtparent" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="DeniedVisa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-DeniedVisa">
                        <div class="form-row">
                            <label id="label-DeniedVisa" for="DeniedVisa" class="col-md-2 col-form-label form-label">
                                Have you ever been refused a Visa or Deported by Country of Application
                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblDeniedVisa" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblDeniedVisaYes" GroupName="DeniedVisa" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblDeniedVisaNo" GroupName="DeniedVisa" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icDeniedVisa" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnDeniedVisa" />
                                <input id="txtDeniedVisa" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="parentdeny">
                    <div class="form-group m-0" role="group" aria-labelledby="label-parentdeny">
                        <div class="form-row">
                            <label id="label-parentdeny" for="parentdeny" class="col-md-2 col-form-label form-label">
                                Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from

                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblparentdeny" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblparentdenyYes" GroupName="parentdeny" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblparentdenyNo" GroupName="parentdeny" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icparentdeny" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnparentdeny" />
                                <input id="txtparentdeny" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />

                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnHaveVisa").click(function () {
                ManageRemarks('<%=txtHaveVisa.ClientID%>', 'btnHaveVisa');
            });
            $("#<%=rblHaveVisaNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtHaveVisa.ClientID%>', 'btnHaveVisa');
            });
            $("#btnvisa").click(function () {
                ManageRemarks('<%=txtVisa.ClientID%>', 'btnvisa');
            });
            $("#<%=rblvisaNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtVisa.ClientID%>', 'btnvisa');
            });
            $("#btnvalidityFrom").click(function () {
                ManageRemarks('<%=txtvalidityFrom.ClientID%>', 'btnvalidityFrom');
            });
            $("#<%=rblvalidityFromNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvalidityFrom.ClientID%>', 'btnvalidityFrom');
            });
            $("#btnvalidityTo").click(function () {
                ManageRemarks('<%=txtvalidityTo.ClientID%>', 'btnvalidityTo');
            });
            $("#<%=rblvalidityToNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvalidityTo.ClientID%>', 'btnvalidityTo');
            });
            $("#btnvisano").click(function () {
                ManageRemarks('<%=txtvisano.ClientID%>', 'btnvisano');
            });
            $("#<%=rblvisanoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvisano.ClientID%>', 'btnvisano');
            });
            $("#btnvisaappliedCountry").click(function () {
                ManageRemarks('<%=txtvisaappliedCountry.ClientID%>', 'btnvisaappliedCountry');
            });
            $("#<%=rblvisaappliedCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvisaappliedCountry.ClientID%>', 'btnvisaappliedCountry');
            });
            $("#btnvisacity").click(function () {
                ManageRemarks('<%=txtvisacity.ClientID%>', 'btnvisacity');
            });
            $("#<%=rblvisacityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvisacity.ClientID%>', 'btnvisacity');
            });

             $("#btnvisacountry").click(function () {
                ManageRemarks('<%=txtvisacountry.ClientID%>', 'btnvisacountry');
            });
            $("#<%=rblvisacountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtvisacountry.ClientID%>', 'btnvisacountry');
            });
            $("#btnfirstvisit").click(function () {
                ManageRemarks('<%=txtfirstvisit.ClientID%>', 'btnfirstvisit');
            });
            $("#<%=rblfirstvisitNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtfirstvisit.ClientID%>', 'btnfirstvisit');
            });
            $("#btnPreviuosstay").click(function () {
                ManageRemarks('<%=txtPreviuosstay.ClientID%>', 'btnPreviuosstay');
            });
            $("#<%=rblPreviuosstayNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtPreviuosstay.ClientID%>', 'btnPreviuosstay');
            });
            $("#btnparent").click(function () {
                ManageRemarks('<%=txtparent.ClientID%>', 'btnparent');
            });
            $("#<%=rblparentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtparent.ClientID%>', 'btnparent');
            });
            $("#btnDeniedVisa").click(function () {
                ManageRemarks('<%=txtDeniedVisa.ClientID%>', 'btnDeniedVisa');
            });
            $("#<%=rblvisaappliedCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDeniedVisa.ClientID%>', 'btnDeniedVisa');
            });
            $("#btnparentdeny").click(function () {
                ManageRemarks('<%=txtparentdeny.ClientID%>', 'btnparentdeny');
            });
            $("#<%=rblparentdenyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtparentdeny.ClientID%>', 'btnparentdeny');
            });

             if ($('#<%=rblHaveVisaNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtHaveVisa.ClientID%>', 'btnHaveVisa');
             if ($('#<%=rblvisaNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtVisa.ClientID%>', 'btnvisa');
             if ($('#<%=rblvalidityFromNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvalidityFrom.ClientID%>', 'btnvalidityFrom');
             if ($('#<%=rblvalidityToNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvalidityTo.ClientID%>', 'btnvalidityTo');
             if ($('#<%=rblvisanoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvisano.ClientID%>', 'btnvisano');
             if ($('#<%=rblvisaappliedCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvisaappliedCountry.ClientID%>', 'btnvisaappliedCountry');
             if ($('#<%=rblvisacityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvisacity.ClientID%>', 'btnvisacity');
             if ($('#<%=rblvisacountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtvisacountry.ClientID%>', 'btnvisacountry');
             if ($('#<%=rblfirstvisitNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtfirstvisit.ClientID%>', 'btnfirstvisit');
             if ($('#<%=rblPreviuosstayNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtPreviuosstay.ClientID%>', 'btnPreviuosstay');
             if ($('#<%=rblparentNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtparent.ClientID%>', 'btnparent');
             if ($('#<%=rblvisaappliedCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDeniedVisa.ClientID%>', 'btnDeniedVisa');
             if ($('#<%=rblparentdenyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtparentdeny.ClientID%>', 'btnparentdeny');
           <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
        %>

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>
            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }
             function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        }); 
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#manageapplicantions_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#applicantlist').addClass('active');
	    });
    </script>
</asp:Content>
