<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantdeclaration.aspx.cs" Inherits="applicantdeclaration"  MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2">DECLARATION (STEP 3/3)

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
                            <%--<label style="font-size:large;margin-left: 12px;margin-top: 10px;">The following information will be reported:</label>--%>
                            <div class="list-group-item">
                                <div class="form-group">                                   
                                    <div >                                        
                                    <% if (allStatements.Count > 0)
                                    {%>                                        
                                        <% for (int v = 0; v < allStatements.Count; v++)
                                            { %>            
                                                
                                                <div class="form-row" style="font-size:small;">
                                                    <label> <%=allStatements[v].header_description.Replace(Environment.NewLine, "<br />") %></label><br />                                                    
                                                </div> <br />
                                                 <div class="form-row" style="font-size:small;">
                                                       <label> <%=allStatements[v].statement_description.Replace(Environment.NewLine, "<br /><br />") %></label><br /><br />                                                   
                                                 </div>      
                                            <%}
                                    }%>
                                </div>
                                <%--<div class="form-row" style="margin-top: 15px;}">
                                    <label id="lblDeclarationHeader1" runat="server" style="font-size:large;font-weight:500;margin-left: 20px;">
                                        <input type="checkbox" id="decHeader1" style="margin-left: -20px;"/>
                                        I hereby declare that the information given by me is true and correct to the best of my knowledge and belief.
                                    </label>
                                </div>--%>                                    
                                </div>
                            </div>
                            <% if (allStatements.Count > 0)
                                { %>
                                <div class="list-group-item" id="employerwebsite">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">                                         
                                            <a href="preliminary.aspx" class="btn btn-danger" style="margin-right:90px;">I do not accept</a> 
                                            <asp:Button ID="btnSave" runat="server" Text="I accept" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validate()"/>                                      
                                        </div>
                                    </div>
                                </div>
                            <% }
                               else
                               { %>
                                     <div runat="server" class="list-group-item">                                      
                                            <asp:Label ID="lblmsg" runat="server" Text="Declations Not Set By Institution"></asp:Label>                                      
                                     </div>
                            <% } %>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <label id="lblInstructionHeader" runat="server" style="font-size:medium;">Instructions:</label><br />
                            <ol style="font-size:small; padding-left:15px">
                                <li>Completing this section is mandatory.</li><br/>
                                <li>Please Read the attached documents carefully and watch the recommended videos.</li><br/>
                                <li>Take a quick test to check the knowledge you have gained after reading the suggested documents and watching the videos. Please note that you can proceed to the next section only if you achieve a 65% above.</li><br/>
                                <li>Lastly, please accept the declarations given below.</li>
                            </ol>
                        </div>
                    </div>
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allQuestions[q].question%> </label>
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
       <%-- var allstatementscount = '<%=allStatements.Count%>';
        var summarycount = '<%=summarystatCount%>';--%>

        function validate() {
            if (questionGiven == 0) {
                alert("Please first complete Quick Test");
                return false;
            }
            //else if (!$('#decHeader1').is(":checked")) {
            //    alert("Please tick all check boxes before proceeding.");
            //    return false;
            //}
            //for (var i = summarycount; i < allstatementscount; i++) {
            //    var chk = $("#declarationchk_" + i);

            //    if (!chk.is(':checked')) {
            //        alert("Please tick all check boxes before proceeding.");
            //        return false;
            //    }
            //}
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
