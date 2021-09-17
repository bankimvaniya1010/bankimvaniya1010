<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_applicant.aspx.cs" Inherits="admin_manage_applicant" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/style.css" rel="stylesheet">

    <script>
        function ConfirmOnResend(item) {
            var txt;
            var person = prompt("Please enter your password :", "");
            if (person == "") {
                alert("Please enter password");
                return false;
            }
            else if (person == null)
                return false;
            else {
                txt = person;
            }
            $("#<%= Hidpassword.ClientID%>").val(txt).html(txt);
        }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Manage Applications</li>
        </ol>

        <div class="card">
            <asp:HiddenField runat="server" ID="Hidpassword" />
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="pg-title">
                        <asp:Button runat="server" ID="btnback" OnClick="btnback_Click" Text="<< Back to Applicant List" CssClass="btn btn-success pre_btn" />
                    </div>
                    <%--<div class="bk-app-list"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/back.png"><span>Back to <br>Applicants List</span></div>    --%>
                </div>

                <div class="col-lg-6 col-12 mrgntop">
                    <div class="search-bar" style="width: 230px; display: none;">
                        <asp:DropDownList ID="ddlapplicant" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlapplicant_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                        <%--<input type="text">
                    <button><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/search-icon.png"></button>--%>
                    </div>
                </div>
            </div>
            <div class="row" style="display: none;">
                <div class="col-12">
                    <div class="nxt-prv-bnt-wrpr mrgntop">
                        <div class="pre-nxt-btn" id="divPrev" runat="server">
                            <asp:Button runat="server" ID="btnprevious" OnClick="btnprevious_Click" Text="<< Previous" CssClass="btn btn-success pre_btn" /><%-- pre_btn--%>
                        </div>
                        <div class="pre-nxt-btn" runat="server" id="divnext">
                            <asp:Button runat="server" ID="btnnext" OnClick="btnnext_Click" Text="Next >>" CssClass="btn btn-success pre_btn" />
                        </div>
                        <%--                    <div class="pre-nxt-btn"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/previous.png"></div>
                    <div class="pre-nxt-btn"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/next.png"></div>--%>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-7 col-12">
                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer">
                        <tbody>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">FAMILY NAME</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value=" <%=familyname %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">FIRST NAME</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value=" <%=firstname %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">MIDDLE NAME/S</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value=" <%=middlename %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-2">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">DATE OF BIRTH</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value="<%=dateofbirth %>">
                                                </td>
                                                <td class="third-row-label third-row-label-g">GENDER</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value="<%=gender %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">COUNTRY OF RESIDENCE</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value="<%=countryofresidence %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">PASSPORT NO.</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value="<%=passportno %>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                        <tbody>
                                            <tr>
                                                <td class="third-row-label">NATIONALITY</td>
                                                <td class="third-row-input">
                                                    <input type="text" name="" disabled="disabled" value="<%=nationality %>">
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="display: flex; margin: 8px;">
                                    <div class="btm-info-img-wrpr" style="min-width: 37%; border: 1px solid; font-weight: bold; text-align: center; border: 1px solid #ccc; margin-right: 5px;">
                                        STUDENT DETAILS
                                        <br />
                                        <u><a href="<%=viewperoonal %>" target="_blank">View Personal</a></u><br />
                                        <u><a href="<%=viewcontact%>" target="_blank">View Contact detail</a></u><br />
                                        <u><a href="<%=viewIdentification%>" target="_blank">View Identification Detail</a></u><br />
                                        <u><a href="<%=viewEducation%>" target="_blank">View Education Details</a></u><br />
                                        <u><a href="<%=viewLanguage%>" target="_blank">View Language detail</a></u><br />
                                        <u><a href="<%=viewEmployment%>" target="_blank">View Employement detail</a></u><br />
                                        <u><a href="<%=viewSocial%>" target="_blank">View Social</a></u><br />
                                        <u><a href="<%=viewReference%>" target="_blank">View Reference</a></u><br />
                                        <asp:Button runat="server" CssClass="fullbtn" ID="btn_downloadalldetails" OnClick="btn_downloadalldetails_Click" Text="Download Full Details"/>
                                    </div>
                                    <div class="btm-info-img-wrpr" style="min-width: 29%; border: 1px solid; margin-bottom: 7px; font-weight: bold; text-align: center; border: 1px solid #ccc; margin-right: 5px;">
                                        ASSESSMENTS
                    <br />
                                        <div id="feedbackDiv" runat="server"><u><a href="<%=feedbackURL %>" target="_blank">GTE Feedback Report</a></u><br />
                                        </div>
                                        <div id="DivCounsellor" runat="server">
                                            <u><a href="<%=counsellorLink%>" target="_blank">GTE Counsellor Report</a></u><br />
                                        </div>
                                        <div id="decalarationDiv" runat="server">
                                            <u><a href="<%=applicantdeclarationLink%>" target="_blank">GTE Declaration</a></u><br />
                                        </div>
                                        <div runat="server" id="sopDiv">
                                            <u><a href="<%=sopReportLink%>" target="_blank">GTE Student SOP</a></u><br />
                                        </div>
                                        <div id="certificateLinkDiv" runat="server">
                                            <u><a href="<%=certificateLink%>" target="_blank">Certificate of Understanding</a></u><br />
                                        </div>
                                        <div id="gtereportDIv" runat="server"><u><a href="<%=gtereportLink%>" target="_blank">GTE Final Report</a></u><br />
                                        </div>
                                    </div>
                                    <div class="btm-info-img-wrpr" style="min-width: 33%; border: 1px solid; font-weight: bold; text-align: center; border: 1px solid #ccc;">
                                        DOCUMENTS
                                        <br />
                                        <u><a href="<%=applicantdocLink %>" target="_blank">View Documents</a></u><br />
                                        <asp:Button runat="server" CssClass="fullbtn" ID="Button1" OnClick="btndocreminder_Click" Text="Send Documents reminder"/>

                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td style="display: flex;">
                                    <div class="btm-info-img-wrpr" style="min-width: 37%; border: 1px solid; font-weight: bold; text-align: center; border: 1px solid #ccc; margin-right: 5px;">
                                        FEE & FUNDING
                                        <br />
                                        <u><a href="<%=processpayment %>" target="_blank">Process Payments</a></u><br />
                                        <u><a href="<%=viewFunding %>" target="_blank">View Funding</a></u><br />
                                        <u><a href="scholarshipmaster.aspx" target="_blank">Manage Scholarships</a></u><br />


                                    </div>
                                    <div class="btm-info-img-wrpr" style="min-width: 29%; border: 1px solid; font-weight: bold; text-align: center; border: 1px solid #ccc; margin-right: 5px;">
                                        REGISTRATION
                                        <br />
                                        <div class="managepg_btn" id="Label7" runat="server" visible="false">Reset Done</div>
                                        <div id="btnresendotpDiv" runat="server">
                                            <asp:Button runat="server" CssClass="managepg_btn" ID="btnresendotp" OnClick="btnresendotp_Click" Text="Resend OTP to Applicant" OnClientClick="return ConfirmOnResend()" />
                                        </div>
                                    </div>
                                    <div class="btm-info-img-wrpr" style="min-width: 32%; border: 1px solid; font-weight: bold; text-align: center; border: 1px solid #ccc;">
                                        APPLICATIONS
                                        <br />
                                        <u><a href="<%=processapplication %>" target="_blank">Process Application</a></u><br />
                                    </div>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-5 col-12">
                    <div class="row ul-img-wrpr">
                        <asp:Label runat="server" Style="width: 67%; font-size: 22px; font-weight: bold; text-align: center;">SID <%=ApplicantID %></asp:Label>
                        <div class="col-lg-8 col-12" id="divProfile" runat="server" style="border: 1px solid;">
                            <img src="<%= profileURL%>" class="img-fluid">
                        </div>
                        <div class="col-lg-7 col-12">
                            <div class="app-id-no text-center"><%=gtereportNo %></div>
                        </div>
                        <div class="col-lg-7 col-12">
                            <div>
                                <label id="lblInstructionHeader" runat="server" style="font-size: medium; font-weight: bold;">Courses for which your Application have been successfully submitted :</label><br />


                                <% if (appliedcourseData.Count > 0)
                                    { %>
                                <ol style="font-size: small; padding-left: 15px;">
                                    <% for (int i = 0; i < appliedcourseData.Count; i++)
                                        { %>
                                    <li>
                                        <%= appliedcourseData[i].coursename %>
                                    </li>
                                    <% } %>
                                </ol>
                                <%}
                                    else
                                    {%>
                                <label runat="server">No Applied Courses.</label>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="display: none;">
                <div class="col-12">
                    <div class="apll-doc-txt">Applicant Documents</div>
                    <div class="app-qus-anw-wrpr">
                        <div class="app-qus-anw-ttl">DOCUMENTS REQUESTED</div>
                        <div class="app-qus-anw-q">Documents as evidence of Identity:</div>
                        <div class="app-qus-anw-a"><span class="app-qus-anw-yes">YES</span>Copy of the bio page of passport</div>
                        <div class="app-qus-anw-a"><span class="app-qus-anw-yes">YES</span>Certified copy of birth certificate</div>
                        <div class="app-qus-anw-a"><span class="app-qus-anw-no">NO</span>Copy of Drivers Licence</div>
                        <div class="app-qus-anw-a"><span class="app-qus-anw-no">NO</span>Copy of National Identity Card</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageregistration_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#registeredapplicants').addClass('active');
        });
    </script>
</asp:Content>

