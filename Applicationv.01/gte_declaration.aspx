<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_declaration.aspx.cs" Inherits="gte_declaration" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/style.css">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2" style="margin-bottom: 0.5rem; margin-top: -15px;">DECLARATION

        </h1>
        <h2 style="font-size: 24px; margin-bottom: -0.5rem;" id="headlbl" runat="server">Read and accept the User Agreement and Declarations:

        </h2>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row" style="margin-left: -3.625rem !important;">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="CompleteDiv" style="display: none;" runat="server">
                                <asp:Label runat="server" ID="declbl"> Declaration completed <%=declarationsubmitteddate %></asp:Label>
                            </div>
                            <%--if gTE --%>
                            <div runat="server" style="display: none;" id="gtedecDiv">
                                <div>
                                    <%--style="margin-left: 602px;margin-top: -134px;margin-bottom:66px;"--%>
                                    <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download" OnClick="btnDownload_Click" Visible="true" />
                                </div>
                                <div class="certificate-wrpr" style="padding: 0px !important; width: 100%">

                                    <table class="certificate-table" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <table cellspacing="0" cellpadding="0" class="first-row-table">
                                                    <tr class="first-row">
                                                        <td class="min-20">
                                                            <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                                                        </td>
                                                        <td class="min-60">
                                                            <span class="cer-ttl">Candidate Declaration</span>
                                                            <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                                            <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                                                        </td>
                                                        <td class="min-20">
                                                            <div class="cer-flg-wrpr clearfix">
                                                                <img src="<%=UniLogURL%>" class="cer-flag">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="cer-sep">
                                                <div></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="cer-note-wrpr">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>

                                                            <td>
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <div style="font-size: medium; font-weight: 800; margin-left: 19px;">CANDIDATE DECLARATION & ACCEPTANCE OF TERMS OF USE & PRIVACY POLICY</div>
                                                                            <%--<img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/dcl-txt.png">--%>
                                                                            <div class="std-bx-wrpr">
                                                                                <span><%=Student_name %></span> has made a declaration and accepted the terms of use at: <span><%=reportsubmitteddate %> using IP address: <%=ipaddress %></span>
                                                                            </div>
                                                                        </td>
                                                                        <td class="pr-15">
                                                                            <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/accepted.png">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <br />
                                                                            <br />
                                                                            <span class="cer-note-wrpr pt-20">
                                                                                <%=universityName %> Student Declaration for Genuine Student (GS) and Genuine Temporary Entrant (GTE)
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td class="cer-btm-txt-1">
                                                                            <br />
                                                                            <br />
                                                                            <p class="cer-note-wrpr">
                                                                                I <%=Student_name%>, citizen of <%=Country_of_Citizenship %> born on <%=dob %>  holding passport number <%=passport_number%> and residing at <%=current_address%> declare that I am a genuine temporary entrant and genuine student.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I declare that the information and documents upload in the <%=universityName%> GTE Direct Centre are true, accurate and complete representation of myself and my history. I understand that no further documents can be submitted after an assessment is done.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that giving false or misleading information is a serious offence under Australian law and will impact negatively on my application to study in Australia.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I declare that the course I have chosen to study at <%=universityName%> is my decision and not my agent’s.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I agree that <%=universityName%>, can vary or reverse any decision made on the basis of any incorrect, incomplete, fraudulent or misleading information that I have provided. This may result in my enrolment being terminated.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I am aware that my spouse is required to abide by my student visa conditions as he/she is a dependent on my visa.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I agree to tell <%=universityName%> immediately if there is any change to the information I have given in this application.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I declare that if my spouse moves to another city, I am aware that it is not grounds for release letter because I am required to maintain my enrolment as per my visa conditions.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that if I am unable to pay my tuition fees in line with the payment due date, <%=universityName%> may cancel my enrolment which may affect my student visa.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand my obligation to have sufficient funds to pay for Overseas Student Health Cover, all tuition fees and associated student costs and all living and travel expense for myself and any dependent/s (if applicable) for the entire duration of my stay in Australia.
                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that while, as part of my student visa, I am allowed to work a maximum of 40 hours per fortnight (with unlimited work-rights during semester breaks), these funds are to be used to supplement my living costs but must not be my only source of income to pay my tuition fees and living expenses.
                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that my visa may be rejected or cancelled by the Department of Home Affairs (DHA) if it is determined that documents supporting my application are fraudulent or I have made a false declaration.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that my visa application will be denied if I do not pass DHA’s health and character checks.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that my visa application will be rejected if DHA is not satisfied that I am a genuine student: 
                                                        <a href="https://www.homeaffairs.gov.au/trav/stud/more/genuine-temporary-entrant">https://www.homeaffairs.gov.au/trav/stud/more/genuine-temporary-entrant</a>

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that my visa may be cancelled by DHA if I do not abide by the conditions of my visa. Please go to the following link for more information: <a href="https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions">https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions</a>

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that I will be required to update any changes to my personal details direct to the <%=universityName%> Student System within seven days of my arrival in Australia. These details will only be passed onto DHA when requested by DHA.

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I fully understand that if I request a transfer to another provider (release letter) within the first six months of my study, <%=universityName%> may refuse my request. <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses">https://www.homeaffairs.gov.au/trav/stud/more/changing-courses</a>

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I fully understand that if I decide to downgrade i.e. go to a course that has a lower AQF level I will not be released from <%=universityName%> and will be required to apply for another visa. 
                                                        <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses">https://www.homeaffairs.gov.au/trav/stud/more/changing-courses</a>

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I understand that if I am unsuccessful in my visa application <%=universityName%> may not issue another offer and Confirmation of Enrolment

                                                                            </p>
                                                                            <p class="cer-note-wrpr">
                                                                                I, <%=Student_name%> confirm that my agent or any third person is not helping me in completing this GTE assessment and / or has not completed this on my behalf.

                                                                            </p>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                            <div id="declarationDiv" runat="server" style="display: none;">
                                <div class="list-group-item">
                                    <%--<label style="font-size:large;">Student Declaration:</label>--%>
                                    <div class="form-group">
                                        <% if (allStatements.Count > 0)
                                            {%>

                                        <% for (int v = 0; v < allStatements.Count; v++)
                                            { %>

                                        <div class="form-row" style="font-size: small;">
                                            <label><%=allStatements[v].header_description.Replace(Environment.NewLine, "<br />") %></label><br />
                                        </div>
                                        <br />
                                        <div class="form-row" style="font-size: small;">
                                            <label><%=allStatements[v].statementdescription.Replace(Environment.NewLine, "<br />") %></label><br />
                                        </div>
                                        <%}
                                            }%>
                                    </div>
                                </div>

                                <div id="Div2" runat="server" class="list-group-item">
                                    <asp:Label ID="lblmsg" runat="server" Text="Declations Not Set By Institution"></asp:Label>
                                </div>

                            </div>
                            <% if (isGteDeclarationDoneByApplicant == false)
                                {
                            %>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btnSave" runat="server" Text="I Accept" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validate()" />
                                        <a href="Default.aspx" class="btn btn-danger" style="margin-right: 90px;">I Do Not Accept</a>
                                    </div>
                                </div>
                            </div>
                            <% }
                            %>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <label id="lblInstructionHeader" runat="server" class="instructn">Instructions:</label><br />
                            <ol style="font-size: small; padding-left: 15px">
                                <li>Completing this section is mandatory.</li>
                                <br />
                                <li>Please read all the conditions given on the left carefully.</li>
                                <br />
                                <li>After you agree to all the conditions, click on the ‘I Accept’ button to proceed further</li>
                                <br />
                            </ol>
                        </div>
                    </div>
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div id="faq" class="card faq-qwrp">
                        <div class="" id="Div1" runat="server">

                            <div class="card-body">
                                <%  if (allQuestions.Count > 0)
                                    { %>
                                <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                        <%for (int q = 0; q < allQuestions.Count; q++)
                                            {%>
                                        <div class="star-list">
                                            <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')"><%=allQuestions[q].question%> </label>
                                        </div>
                                        <%} %>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        var applicantdetailsCompleted = '<%=applicantdetailsCompleted%>';
       <%-- var allstatementscount = '<%=allStatements.Count%>';
        var summarycount = '<%=summarystatCount%>';--%>

        function validate() {

            if (applicantdetailsCompleted == "False") {
                alert("Please first complete Your details");
                return false;
            }
            //for (var i = summarycount; i < allstatementscount; i++) {
            //    var chk = $("#declarationchk_" + i);

            //    if (!chk.is(':checked')) {
            //        alert("Please tick all check boxes before proceeding.");
            //        return false;
            //    }
            //}
            return !(applicantdetailsCompleted == "False");
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#Declaration').addClass('active');

            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_new_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#pgae1').addClass('active');
        });
    </script>
</asp:Content>
