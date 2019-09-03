<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantdeclaration.aspx.cs" Inherits="applicantdeclaration"  MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2">Declaration (Step 3/3)

        </h1>
        <h2 style="font-size: 24px">Please read and accept the User Agreement and Declarations:

        </h2>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card">
                        <div class="list-group list-group-fit">
                            <label style="font-size:large;">The following information will be reported:</label>
                            <div class="list-group-item">
                                <div class="form-group">
                                    <div class="form-row">
                                        <label id="lblSummaryHeader" runat="server" style="font-size:large;font-weight:500;">Summary</label><br />
                                    </div>
                                    <div class="form-row">
                                        <label id="lblSummaryPoint1" runat="server" style="font-size:small;">I have met the requirements in my Job Plan for this period.</label><br />
                                        <label id="lblSummaryPoint2" runat="server" style="font-size:small;">I have worked 4 hours for PAINT STORE and earned $120.00 this period.</label><br />
                                        <label id="lblSummaryPoint3" runat="server" style="font-size:small;">My partner has worked 2 hours for SHOP 2 and earned $42.00 this period.</label>
                                    </div>
                                    <div class="form-row">
                                        <label id="lblDeclarationHeader1" runat="server" style="font-size:large;font-weight:500;margin-left: 20px;">
                                            <input type="checkbox" id="decHeader1" style="margin-left: -20px;"/>
                                            I hereby declare that the information given by me is true and correct to the best of my knowledge and belief.
                                        </label>
                                    </div>
                                    <div class="form-row">
                                        <label id="lblDeclarationHeader2" runat="server" style="font-size: medium;">I understand that:</label><br />
                                    </div>
                                    <div class="form-row">
                                        <label id="lblDeclarationPoint1" runat="server" style="font-size:small;margin-left: 20px;">
                                            <input type="checkbox" id="decPoint1" style="margin-left: -20px;"/>
                                            Giving false or misleading information is a serious offence.
                                        </label>
                                        <label id="lblDeclarationPoint2" runat="server" style="font-size:small;margin-left: 20px;">
                                            <input type="checkbox" id="decPoint2" style="margin-left: -20px;"/>
                                            The Department of Human Services can make any enquiry necessary to ensure I receive the correct payment.
                                        </label>
                                        <label id="lblDeclarationPoint3" runat="server" style="font-size:small;margin-left: 20px;">
                                            <input type="checkbox" id="decPoint3" style="margin-left: -20px;"/>
                                            I need to advise Department of Human Services of any changes to my circumstances as soon as the change occurs.
                                        </label>
                                        <label id="lblDeclarationPoint4" runat="server" style="font-size:small;margin-left: 20px;">
                                            <input type="checkbox" id="decPoint4" style="margin-left: -20px;"/>
                                            I may need to provide further information if requested. I must keep a record of my job search efforts for each reporting period, as I may be requested to provide this information.
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">                                         
                                        <a href="preliminary.aspx" class="btn btn-success" style="margin-right:90px;">I do not accept</a> 
                                        <asp:Button ID="btnSave" runat="server" Text="I accept" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validate()"/>                                      
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <label id="lblInstructionHeader" runat="server" style="font-size:medium;">Instructions:</label><br />
                            <label id="lblInstruct1" runat="server" style="font-size:small;">1. Completing this section is mandatory.</label><br />
                            <label id="lblInstruct2" runat="server" style="font-size:small;">2. Please Read the attached documents carefully and watch the recommended videos.</label><br />
                        
                            <label id="lblInstruct4" runat="server" style="font-size:small;">3. Take a quick test to check the knowledge you have gained after reading
                                                                                                the suggested documents and watching the videos.
                                                                                                Please note that you can proceed to the next section only if you achieve a
                                                                                                65% above.</label><br />
                            <label id="lblInstruct7" runat="server" style="font-size:small;">4. Lastly, please accept the declarations given below.</label><br />
                        </div>
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>
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
    <script>
        var questionGiven = '<%=questionGiven%>';
        
        function validate() {
            if (questionGiven == 0) {
                alert("Please first complete Quick Test");
            }
            else if (!$('#decHeader1').is(":checked") && !$('#decPoint1').is(":checked") && !$('#decPoint2').is(":checked") && !$('#decPoint3').is(":checked") && !$('#decPoint4').is(":checked")) {
                alert("Please tick all check boxes before proceeding.");
                return false;
            }
            return !(questionGiven == 0);
        }

         $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#preliminary_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#applicantdeclaration').addClass('active');
          });
    </script>
</asp:Content>
