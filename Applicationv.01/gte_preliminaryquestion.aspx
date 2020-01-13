<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_preliminaryquestion.aspx.cs" Inherits="gte_preliminaryquestion" MasterPageFile ="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Preliminary Step</li>
        </ol>
        <h1 class="h2">TEST YOUR KNOWLEDGE (STEP 2/3)</h1>

    </div>
    <div class="page ">
       <div class="container page__container">
        <div class="row">
            <div class="col-md-8">
              
                <div class="card" id="questions" runat="server">
                    <div id="divUserScore" runat="server" style="font-size:medium;display:none">
                        <p style="float: left;text-align:left;width:66.66666%;padding-left:15px">
                        Score : <label id="lblUserScore" runat="server" />
                        </p>
                        <label runat="server" id="linkCertificate" style="color: DodgerBlue;float: left;text-align:right;width:33.33333%;"> View Certificate </label>
                    </div>
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("gte_preliminaryid") %>'></asp:Label>
                                    </div>
                                    <div class="media align-items-center">

                                        <div class="media-left">
                                            <h4 class="mb-0"><strong># 
                                               <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label></strong></h4>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="card-title">
                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>?
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <%-- <div class="form-group">

                                            <input id="customCheck01" type="checkbox" class="custom-control-input">
                                            <label for="customCheck01" class="custom-control-label">
                                                <asp:Label ID="lblquestion" runat="server" Text='<%# Eval("answerdescription") %>'></asp:Label></label>

                                        </div>--%>

                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("answer1") %>' />
                                        <i id="correctTick1" style="display: none" runat="server" class="fas fa-check-circle"></i>
                                        <i id="incorrectTick1" style="display:none" runat="server" class="fas fa-times-circle"></i>
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("answer2") %>' />
                                        <i id="correctTick2" style="display:none" runat="server" class="fas fa-check-circle"></i>
                                        <i id="incorrectTick2" style="display:none" runat="server" class="fas fa-times-circle"></i>
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("answer3") %>' />
                                        <i id="correctTick3" style="display:none" runat="server" class="fas fa-check-circle"></i>
                                        <i id="incorrectTick3" style="display:none" runat="server" class="fas fa-times-circle"></i>
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("answer4") %>' />
                                        <i id="correctTick4" style="display:none" runat="server" class="fas fa-check-circle"></i>
                                        <i id="incorrectTick4" style="display:none" runat="server" class="fas fa-times-circle"></i>
                                    </div>

                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">
                        <div class="form-row justify-content-between">
                        	<asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />
                            <asp:Button ID="btnGoToDeclaration" runat="server" CssClass="btn btn-success" Text="Go To Declaration" OnClick="btnGoToDeclaration_Click" OnClientClick="return validateForm()" />
                        </div>

                        <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
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
                    <div class="card faq-qwrp" id="Div1" runat="server">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
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
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>
        function validateForm() {
            var questionCount = <%=gte_preliminaryquestion.QuestionsCount%>;
            for (var i = 0; i < questionCount; i++) {
                var rdoans1 = $("#ContentPlaceHolder1_questionList_rdoans1_" + i);
                var rdoans2 = $("#ContentPlaceHolder1_questionList_rdoans2_" + i);
                var rdoans3 = $("#ContentPlaceHolder1_questionList_rdoans3_" + i);
                var rdoans4 = $("#ContentPlaceHolder1_questionList_rdoans4_" + i);

                if (!(rdoans1.is(':checked') || rdoans2.is(':checked') || rdoans3.is(':checked') || rdoans4.is(':checked'))) {
                    alert("Please select one option for question no: " + (i + 1));
                    return false;
                }
            }
            return true;

        }

          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtequicktest').addClass('active');

            $("#<%=linkCertificate.ClientID%>").click(function () {
                var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                location.replace(hostName + "gte_certificate.aspx");
            });
        });
    </script>

</asp:Content>
