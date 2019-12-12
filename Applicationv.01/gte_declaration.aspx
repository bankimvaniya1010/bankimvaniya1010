<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_declaration.aspx.cs" Inherits="gte_declaration" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2">DECLARATION (STEP 3/3)

        </h1>
        <h2 style="font-size: 24px">Read and accept user agreement and declarations:

        </h2>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item">
                                <label style="font-size:large;">Student Declaration:</label>
                                <div class="form-group">
                                    <div class="form-row">
                                        <label id="lblDeclarationPoint1" runat="server" style="font-size:small;">I declare that I am a genuine temporary entrant and genuine student.</label><br />
                                        <label id="lblDeclarationPoint2" runat="server" style="font-size:small;">I declare that the information and documents upload in this tool are true, accurate and complete representation of myself and my history. I understand that no further documents can be submitted after assessment is done.</label><br />
                                        <label id="lblDeclarationPoint3" runat="server" style="font-size:small;">I understand that giving false or misleading information is a serious offence under Australian law and will impact negatively on my application to study in Australia.</label> <br />
                                        <label id="lblDeclarationPoint4" runat="server" style="font-size:small;">I declare that the course I have chosen to study <%=gte_declaration.universityName %> is my decision and not my agent’s.</label> <br />
                                        <label id="lblDeclarationPoint5" runat="server" style="font-size:small;">I agree that <%=gte_declaration.universityName %> can vary or reverse any decision made on the basis of any incorrect, incomplete, fraudulent or misleading information that I have provided. This may result in my enrolment being terminated.</label> <br />
                                        <label id="lblDeclarationPoint6" runat="server" style="font-size:small;">I am aware that my spouse is required to abide by my student visa conditions as he/she is a dependent on my visa.</label> <br />
                                        <label id="lblDeclarationPoint7" runat="server" style="font-size:small;">I agree to tell the <%=gte_declaration.universityName %> immediately if there is any change to the information I have given in this application.</label> <br />
                                        <label id="lblDeclarationPoint8" runat="server" style="font-size:small;">I declare that if my spouse moves to another city, I am aware that it is not grounds for release letter because I am required to maintain my enrolment as per my visa conditions.</label> <br />
                                        <label id="lblDeclarationPoint9" runat="server" style="font-size:small;">I understand that if I am unable to pay my tuition fees in line with the payment due date, <%=gte_declaration.universityName %> may cancel my enrolment which may affect my student visa.</label> <br />
                                        <label id="lblDeclarationPoint10" runat="server" style="font-size:small;">I understand my obligation to have sufficient funds to pay for Overseas Student Health Cover, all tuition fees and associated student costs and all living and travel expense for myself and any dependent/s (if applicable) for the entire duration of my stay in Australia.</label> <br />
                                        <label id="lblDeclarationPoint11" runat="server" style="font-size:small;">I understand that while, as part of my student visa, I am allowed to work a maximum of 40 hours per fortnight (with unlimited work-rights during semester breaks), these funds are to be used to supplement my living costs but must not be my only source of income to pay my tuition fees and living expenses.</label> <br />
                                        <label id="lblDeclarationPoint12" runat="server" style="font-size:small;">I understand that my visa may be rejected or cancelled by the Department of Home Affairs (DHA) if it is determined that documents supporting my application are fraudulent or I have made a false declaration.</label> <br />
                                        <label id="lblDeclarationPoint13" runat="server" style="font-size:small;">I understand that my visa application will be denied if I do not pass DHA’s health and character checks.</label> <br />
                                        <label id="lblDeclarationPoint14" runat="server" style="font-size:small;">I understand that my visa application will be rejected if DHA is not satisfied that I am a genuine student – <a href="https://www.homeaffairs.gov.au/trav/stud/more/genuine-temporary-entrant" target="_blank"> Click here to know more </a> </label> <br />
                                        <label id="lblDeclarationPoint15" runat="server" style="font-size:small;">I understand that my visa may be cancelled by DHA if I do not abide by the conditions of my visa. Please go to the following link for more information: <a href="https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions" target="_blank"> https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions </a> </label> <br />
                                        <label id="lblDeclarationPoint16" runat="server" style="font-size:small;">I understand that I will be required to update any changes to my personal details direct to the <%=gte_declaration.universityName %> Student System within seven days of my arrival in Perth. These details will only be passed onto DHA when requested by DHA.</label> <br />
                                        <label id="lblDeclarationPoint17" runat="server" style="font-size:small;">I fully understand that if I request a transfer to another provider (release letter) within the first six months of my study, <%=gte_declaration.universityName %> may refuse my request - <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses" target="_blank"> Click here to know more </a> </label> <br />
                                        <label id="lblDeclarationPoint18" runat="server" style="font-size:small;">I fully understand that if I decide to downgrade i.e. go to a course that has a lower AQF level I will not be released from <%=gte_declaration.universityName %> and will be required to apply for another visa - <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses" target="_blank"> Click here to know more </a> </label> <br />
                                        <label id="lblDeclarationPoint19" runat="server" style="font-size:small;">I understand that if I am unsuccessful in my visa application <%=gte_declaration.universityName %> may not issue another offer and Confirmation of Enrolment.</label> <br />
                                        <label id="lblDeclarationPoint20" runat="server" style="font-size:small;">I confirm that my agent or any third person is not helping me in completing this GTE assessment and / or has not completed this on my behalf.</label> <br />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">                                         
                                        <a href="Default.aspx" class="btn btn-danger" style="margin-right:90px;">Cancel</a> 
                                        <asp:Button ID="btnSave" runat="server" Text="Accept Declaration and Submit" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validate()"/>                                      
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
                            <ol style="font-size:small; padding-left:15px">
                                <li>Completing this section is mandatory.</li><br/>
                                <li>Read the attached documents and watch the videos carefully.</li><br/>
                                <li>Please accept the declaration that you have successfully reviewed and understood the information.</li><br/>
                                <li>Take a quick test to check your knowledge.</li><br/>
                                <li>To go to the next section you need to successfully answer the test question and achieve >65% grade.</li><br/>
                                <li>Else you would required to take the test again post going through the tutorial again.</li><br/>
                                <li>Lastly please accept the declarations.</li>
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
                                        <h5>FAQ's</h5>
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
                </div>
            </div>
        </div>
    </div>
    <script>
        
        var questionsCompleted = '<%=questionsCompleted%>';
        function validate() {
           
            if (questionsCompleted == "False") {
                alert("Please first complete Quick Test");
            }
            
            return !(questionsCompleted == "False");
        }
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtedeclaration').addClass('active');
        });
    </script>
</asp:Content>
