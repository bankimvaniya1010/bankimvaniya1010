<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="col-lg container-fluid page__container">
        <ol class="breadcrumb" style="    margin-top: -22px;    margin-bottom: 14px;">
            <li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="sidebar-heading h2" style="font-size: 22px;padding-left: 0px;">HELLO <%=applicantname %>, <asp:Label runat="server" ID="isfullservicethenlbl" Visible="false"></asp:Label></h1>
        <div runat="server" id="ifnotverifiedshow" style="display:none">
            <div id="Div1" runat="server" class="form-group">
                <div class="col-lg-12 list-group-item">
                    <label class="form-label" for="password">Your registration is yet to be verified by the Admission Staff of <%=universityName %> this generally takes 24 hours.
                        <%--<br/>
                        Please re-schedule your GTE Certification and Assessment by going to Step 6 – <a href="<%=ScheduleNow %>">Schedule Now</a>.--%>
                    </label>
                </div>
            </div>
        </div>
        <div runat="server" id="ifverifiedshow" style="display:none">
            <div id="domesticDiv" runat="server" class="form-group" style="display: none">
                <div class="col-lg-12 list-group-item">
                    <label class="form-label" for="password">Are you an Australian Citizen, an Australian Permanent Resident or a Citizen of New Zealand?</label>
                    <div class="input-group input-group-merge">
                        <asp:RadioButton ID="rblYes" runat="server" CssClass="form-control frm-cntrl-rdo" GroupName="residency" Text="Yes" />
                        <asp:RadioButton ID="rblNo" runat="server" CssClass="form-control frm-cntrl-rdo" GroupName="residency" Text="No" />
                    </div>
                    <br/>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="h2 mb-0 mr-3 text-primary"></div>
                        <div class="flex" style="display:none;">
                            <h4 class="card-title"> Hello <%=applicantname %>,</h4>
                        </div>
                    </div>
                    <div id="defaultinstructions" runat="server" style="display:none">
                        <div class="card-body">
                            In this Application Center portal, you will be able to:
                        </div>
                        <div>
                            <ol>
                                <li>Start, complete and submit a course application</li><br>
                                <li>Check the status of your course application</li><br>
                                <li>Complete a Genuine Temporary Entrant (GTE) and Genuine Student (GS) assessment</li><br>
                                <li>Start, complete and submit a visa application</li><br>
                                <li>Check the status of your visa application</li><br>
                                <li>Upload supporting documents</li><br>
                                <li>Access your messages, offer letters and other documentation relevant to your applications</li><br>
                                <li>Respond to your offers</li><br>
                                <li>Make payments; and</li><br>
                                <li>Access other relevant information and support services that will be useful as you prepare to commence your studies with <%=_Default.universityName %>.</li></ol>
                        </div>
                    </div>
                    <%--for euc.gte.stude.care i.e universityid 13 instructions //#376 change for all gte services--%>
                    <div id="service_gte_instructions" runat="server" style="display:none">
                        <div class="card-body" style="    margin-top: -22px;    margin-bottom: -9px;}">
                            <%--In the GTE-Direct Online Centre, based on your subscription you will be able to:--%>
                            <p>
                            Congratulations, you have been sponsored by <%=universityname %> to use the <a href="https://www.gtedirect.com/" target="_blank">GTE DIRECT</a> premium service for International Students.
                        </p>
                        <p>
                             <a href="https://www.gtedirect.com/" target="_blank">GTE DIRECT</a> is the world’s first 100% Online, Independent, Standardized, Artificial Intelligence based Genuine Student Training, Evaluation and Document Verification and Validation services using a Proctor. This solution helps Genuine Students produce better quality Course and Visa Applications and reduce the risk of rejection.
                        </p>
                        <p>
                           To ensure you benefit from this service, get an accurate evaluation report and generate a factual Statement of Purpose (SOP),  it is very important that you are honest and genuine with your responses to the assessment questions and upload only genuine documents.
                        </p>
                        <p>
                            Get started with going through the Instructions and orientation videos in the "<a href="preliminary.aspx">Before you start</a>" section.
                        </p>
                        <p>Best of Luck.</p>
                        </div>
                       
                       <%-- <div>
                            <ol>
                                <li>Access the GS(Genuine Student) & GTE (Genuine Temporary Entrant) Tutorial </li><br>
                                <li>On the scheduled time and day test your understanding of GS & GTE.</li><br>
                                <li>Get Certified for your understanding of GS & GTE, download your Certificate</li><br>
                                <li>Start and complete your Proctor based 100% online GS & GTE evaluation</li><br>
                                <li>Upload your documents for verification and validation for GTE </li><br>
                                <li>Use the AI driven GTE SOP builder to create your GTE SOP in minutes</li><br>
                                <li>View and download your detailed GS & GTE Assessment report</li><br>
                                <li>Get access to experienced counsellors for 1-on-1 GS & GTE counselling</li><br>
                                <li>Get support with completing and submitting your Admission Applications</li><br>
                                <li>Get full-service support to complete and file your student VISA Application </li></ol>
                        </div>--%>
                    </div>
                    <%--instruction for service = 2 exammodule--%>
                    <div id="service2_instructions" runat="server" style="display:none">
                        <div class="card-body">
                           In the Assessment Center, you will be able to:
                        </div>
                        <div>
                            <ol>
                                <li>Create and update your profile information. </li><br>
                                <li>Manage your account password.</li><br>
                                <li>View list of your past and upcoming assessments.</li><br>
                                <li>View your ratings or marks obtained along with assessor's comments.</li><br>
                                <li>At the scheduled time and day appear for your Invigilator-based assessment.</li><br>
                                <li>Start and complete your invigilator based 100% online assessments.</li><br>
                             </ol>
                        </div>
                    </div>
                </div>
            </div>
                <div class="col-lg-4" id="DivOthers" runat="server" style="display:none;">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                   <div class="" id="Div2" runat="server" style="border: black;border-style: groove !important;">
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
            <div class="col-lg-4" id="gteDiv" runat="server" style="display:none;">
                <div class="" id="questions" runat="server" style="border: black;border-style: groove !important;">
                    <div class="card-body">

                        <div style="font-size: 19px;">
                                    <b>Benefits of GTE DIRECT for International Applicants:</b>
                                    <table style="font-size:13px;">
                                        <tr>
                                            <td><img src="assets/images/menu_icons/TabFirst_Icon.png" class="img_defltpg"></td>
                                            <td class="paddingleft">Get accurate knowledge of the A to Z of the Student Visa requirements and conditions for <%=Country_of_study %></td>
                                        </tr>
                                        <tr>
                                            <td><img src="assets/images/menu_icons/TagSecond_Icon.png" class="img_defltpg"></td>
                                            <td class="paddingleft">Get an independently verified  Certificate that confirms your level of understanding of the student visa requirements and conditions for <%=Country_of_study %></td>
                                        </tr>
                                        <tr>
                                            <td><img src="assets/images/menu_icons/TagThree_Icon.png" class="img_defltpg"></td>
                                            <td class="paddingleft">After your evaluation assessment get a detailed Counsellor’s Report on how to minimize your refusal risks.</td>
                                        </tr>
                                        <tr>
                                            <td><img src="assets/images/menu_icons/TagFour_icon.png" class="img_defltpg"></td>
                                            <td class="paddingleft">Based on your responses, get an Artificial Intelligence- driven, factual SOP ( Draft Statement of Purpose (SOP) </td>
                                        </tr>
                                        <tr>
                                            <td><img src="assets/images/menu_icons/TagFive_icon.png" class="img_defltpg"></td>
                                            <td class="paddingleft">If additionally opted for, get your Visa documents independently verified and validated by experts</td>
                                        </tr>
                                    </table>
                                </div>

                       <%-- <%  if (allQuestions.Count > 0)
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
                        <%} %>--%>
                    </div>
                </div>
            </div>
        </div>
         </div>
    </div>
    <script>
        $(document).ready(function () {
                $('#lblClick').click(function () {
                var IELTSModal = $('#IELTS-modal');
                $('body').append(IELTSModal);
                $('#IELTS-modal').modal('show');
            });
            $('#lblClick1').click(function () {
                var IELTSModal = $('#IELTS-modal');
                $('body').append(IELTSModal);
                $('#IELTS-modal').modal('show');
            });
            
         <%--   var universityid = '<%= UniversityID%>';
            if (universityid == 13)
                $("#<%=service_gte_instructions.ClientID%>").show();
            else {
                var isfullservice = '<%=isfullservice%>';
                
            }--%>
            var isfullservice = '<%=isfullservice%>';
            if (isfullservice == 0)
                $("#<%=service_gte_instructions.ClientID%>").show();
            else if (isfullservice == 2)
                $("#<%=service2_instructions.ClientID%>").show();
            else
                $("#<%=defaultinstructions.ClientID%>").show();
        });
          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Dashboard').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#Dashboard').addClass('active');
        });

    </script>
</asp:Content>
