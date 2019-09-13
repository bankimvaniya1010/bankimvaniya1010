<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_declaration.aspx.cs" Inherits="gte_declaration" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2">Declaration (Step 3/3)

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
                                <label style="font-size:large;">The following information will be reported:</label>
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
                                        <label id="lblDeclarationHeader1" runat="server" style="font-size:large;font-weight:500;">I declare that the information I have given is correct.</label>
                                    </div>
                                    <div class="form-row">
                                        <label id="lblDeclarationHeader2" runat="server" style="font-size: medium;">I understand that:</label><br />
                                    </div>
                                    <div class="form-row">
                                        <label id="lblDeclarationPoint1" runat="server" style="font-size:small;">Giving false or misleading information is a serious offence.</label><br />
                                        <label id="lblDeclarationPoint2" runat="server" style="font-size:small;">The Department of Human Services can make any enquiry necessary to ensure I receive the correct payment.</label>
                                        <label id="lblDeclarationPoint3" runat="server" style="font-size:small;">I need to advise Department of Human Services of any changes to my circumstances as soon as the change occurs.</label>
                                        <label id="lblDeclarationPoint4" runat="server" style="font-size:small;">I may need to provide further information if requested. i must keep a record of my job search efforts for each reporting period, as I may be requested to provide this information.</label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">                                         
                                        <a href="preliminary.aspx" class="btn btn-success" style="margin-right:90px;">Cancel</a> 
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
                            <label id="lblInstruct1" runat="server" style="font-size:small;">1. Completing this section is mandatory.</label><br />
                            <label id="lblInstruct2" runat="server" style="font-size:small;">2. Read the attached documents and watch the videos carefully.</label><br />
                            <label id="lblInstruct3" runat="server" style="font-size:small;">3. Please accept the declaration that you have successfully reviewed and understood the information.</label><br />
                            <label id="lblInstruct4" runat="server" style="font-size:small;">4. Take a quick test to check your knowledge.</label><br />
                            <label id="lblInstruct5" runat="server" style="font-size:small;">5. To go to the next section you need to successfully answer the test question and achieve >65% grade.</label><br />
                            <label id="lblInstruct6" runat="server" style="font-size:small;">6. Else you would required to take the test again post going through the tutorial again.</label><br />
                            <label id="lblInstruct7" runat="server" style="font-size:small;">7. Lastly please accept the declarations.</label><br />
                        </div>
                    </div>
                    <div id="faq" class="card faq-qwrp">
                           <div class="card faq-qwrp" id="Div1" runat="server">
                    <div>
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
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
