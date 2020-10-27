<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_details.aspx.cs" Inherits="exam_details" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">

            </li>
        </ol>
        <h3>Assessment Details</h3>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body">
                             <div class="list-group-item border" id="Div1" runat="server" style="display:none">
                                <label runat="server" id="lblmsg">
                                    
                                </label>
                            </div>
                            <div class="list-group-item border" id="meetingrexpiresDiv" runat="server" style="display:none">
                                <label runat="server">
                                    No Show.Assessmnent time is expired.
                                </label>
                            </div>
                            <div class="list-group-item border" id="divexamname" runat="server">
                                <label id="Label7" runat="server" for="divexamname">
                                   <b>Assessmnent Name :</b> <%=examname %>
                                </label>
                            </div>
                             <div class="list-group-item border" id="divInstruction" runat="server">
                                <label id="Label5" runat="server" for="divInstruction">
                                   <b>Instructions :</b> <%=examinstruction %>
                                </label>
                            </div>
                            <div class="list-group-item border" id="para1" runat="server">
                                <label id="lblwithoutotp" runat="server" for="withoutotp">Your Assessment is scheduled for </label>
                                <br/>
                                <ul typeof="disc">
                                    <li>
                                        <label id="lblutctime" runat="server" for="withoutotp"></label>
                                    </li>
                                    <li>
                                        <label id="lblcusttime" runat="server" for="withoutotp"></label>
                                    </li>
                                </ul>
                            </div>

                            <div class="list-group-item border" id="para2" runat="server" style="display:none">
                                <div class="form-group m-0" role="group">
                                    <div class="form-row">
                                        <label id="lblwithotp" runat="server" for="employer" style="margin-right: 15px;" >Enter Student Passkey :</label>&nbsp;
                                        <div class="col-md-4">
                                            <input id="txtstudepassskey" runat="server" type="text" class="form-control" placeholder="Enter the Passkey"  autocomplete="off">
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <div class="list-group-item border" id="para21" runat="server" style="display:none">
                                <div class="form-group m-0" role="group">
                                    <div class="form-row">
                                        <label id="Label6" runat="server" for="employer" >Enter Invigilator Passkey :</label>&nbsp;
                                        <div class="col-md-4">
                                            <input id="txtproctorepasskey" runat="server" type="text" class="form-control" placeholder="Enter the Passkey" autocomplete="off">
                                        </div>
                                        <div class="col-md-3" style="margin-top: -1%;">
                                             <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" OnClientClick="return validateForm();"/>     
                                        </div>
                                        <br/>
                                        <label> The invigilator Passkey would be provided to you by your Invigilator during the session post verification of your identity. </label>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item border" id="para3" runat="server" style="display:none">
                                <label id="Label1" runat="server" for="employer">
                                    Please ensure you are logged in to the Application Center, at least 10 minutes before the scheduled time and are fully prepared for the session based on instructions provided via email and also available in the <a href="gte_tutorial.aspx?formid=17" target="_blank"> Tutorial section</a>.
                                </label>
                            </div>

                            <div class="list-group-item border" id="para4" runat="server" style="display:none">
                                <label id="Label2" runat="server" for="employer">
                                    Post logging in to the Application Center, at least 5 minutes before the scheduled time please use the Virtual Meeting information provided in the Exam Assessment confirmation email and also provided below for ready reference to simultaneously join the Virtual Meeting.
                                </label>
                            </div>

                            <div class="list-group-item border" id="para5" runat="server" style="display:none">
                                <label id="Label3" runat="server" for="employer">
                                    Join the Virtual Meeting using the link <a href='<%=virtualmeetinglink %>' target="_blank"><%= virtualmeetinglink %> </a>.Please ensure you have enabled your webcam, mic and speakers (or headphone), have a stable internet connection with speeds above 2Mbps, and are using Google Chrome as your web browser.
                                </label>
                            </div>

                            <div class="list-group-item border" id="para6" runat="server" style="display:none">
                                <label id="Label4" runat="server" for="employer">
                                    Your Invigilator for the session will be <%=proctorname %>. You may contact your Invigilator via <u><%=proctoremail %> </u> for any assistance or clarifications.
                                </label>
                            </div>


                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
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
         function validateForm() {

            var flag = false;
            if ($("#<%=txtstudepassskey.ClientID%>").val() == "")
                alert("Please enter valid student passkey");
            else if ($("#<%=txtproctorepasskey.ClientID%>").val() == "")
                 alert("Please enter valid Invigilator passkey");
            else
                flag = true;            
            return flag;

        }
        $(document).ready(function () {
            
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
        });
    </script>
</asp:Content>
