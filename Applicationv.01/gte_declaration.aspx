<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_declaration.aspx.cs" Inherits="gte_declaration" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration

            </li>
        </ol>
        <h1 class="h2">DECLARATION (STEP 4/4)

        </h1>
        <h2 style="font-size: 24px">Read and accept the User Agreement and Declarations:

        </h2>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item">
                                <%--<label style="font-size:large;">Student Declaration:</label>--%>
                                <div class="form-group">
                                     <% if (allStatements.Count > 0)
                                    {%>
                                        
                                        <% for (int v = 0; v < allStatements.Count; v++)
                                            { %>            
                                                
                                                <div class="form-row" style="font-size:small;">
                                                    <label> <%=allStatements[v].header_description.Replace(Environment.NewLine, "<br />") %></label><br />                                                    
                                                </div><br />
                                                <div class="form-row" style="font-size:small;">
                                                    <label> <%=allStatements[v].statementdescription.Replace(Environment.NewLine, "<br />") %></label><br />                                                    
                                                </div>      
                                            <%}
                                    }%>                                                                        
                                </div>
                            </div>
                             <% if (allStatements.Count > 0)
                                { %>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btnSave" runat="server" Text="I Accept" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validate()"/>                                      
                                        <a href="Default.aspx" class="btn btn-danger" style="margin-right:90px;">I Do Not Accept</a> 
                                    </div>
                                </div>
                            </div>
                              <% }
                               else
                               { %>
                                    <div id="Div2" runat="server" class="list-group-item">                                      
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
                                <li>Please read all the conditions given on the left carefully.</li><br/>
                                <li>After you agree to all the conditions, click on the ‘I Accept’ button to proceed further</li><br/>
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
       <%-- var allstatementscount = '<%=allStatements.Count%>';
        var summarycount = '<%=summarystatCount%>';--%>

        function validate() {            
           
            if (questionsCompleted == "False") {
                alert("Please first complete Quick Test");
                return false;
            }
            //for (var i = summarycount; i < allstatementscount; i++) {
            //    var chk = $("#declarationchk_" + i);

            //    if (!chk.is(':checked')) {
            //        alert("Please tick all check boxes before proceeding.");
            //        return false;
            //    }
            //}
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
