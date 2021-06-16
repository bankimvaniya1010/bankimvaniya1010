<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_preliminary_section.aspx.cs" Inherits="gte_preliminary_section" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Certificate Test - Stage 1</li>
        </ol>
        <h1 class="h2">Certificate Test - Stage <%=pagecount %></h1>

    </div>
    <div class="page ">
       <div class="container page__container">
        <div class="row">
            <div class="col-md-12">
                <div id="questions" runat="server" style="display: none;">
                    <div class="card">
                        <asp:DataList ID="questionList" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="card-header">
                                        <div style="display: block;">
                                            <asp:Label ID="lblno" runat="server" Text='<%# Eval("gte_questionID") %>'></asp:Label>
                                            (<asp:Label ID="Label1" runat="server" Text='<%# Eval("question_tag") %>'></asp:Label>)
                                        </div>
                                        <div class="media align-items-center">

                                            <div class="media-left">
                                                <h4 class="mb-0"><strong># 
                                               <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label></strong></h4>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
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

                                        <div class="form-group option fontsize-radioButtonList">
                                            <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("answer1") %>' />
                                            <i id="correctTick1" style="display: none;" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick1" style="display: none;" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick1" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>
                                        <div class="form-group option fontsize-radioButtonList">
                                            <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("answer2") %>' />
                                            <i id="correctTick2" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick2" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick2" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="card-footer" id="button" runat="server">
                            <div class="form-row justify-content-between">
                                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />
                                <asp:Button ID="btnGoToNextPage" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnGoToNextPage_Click" OnClientClick="return validateForm()" />
                            </div>

                            <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                        </div>
                    </div>
                </div>
                <div id="questions2" runat="server" style="display: none;">
                    <div class="card">
                        <div id="divUserScore" runat="server" style="font-size: medium; display: none">
                            <p style="float: left; text-align: left; width: 66.66666%; padding-left: 15px">
                                Score :
                                <label id="lblUserScore" runat="server" />
                            </p>
                            <label runat="server" id="linkCertificate" style="color: DodgerBlue; float: left; text-align: right; width: 33.33333%;">View Certificate </label>
                        </div>
                        <asp:DataList ID="questionList2" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="card-header">
                                        <div style="display: block;">
                                            <asp:Label ID="lblno2" runat="server" Text='<%# Eval("gte_preliminaryid") %>'></asp:Label>
                                           ( <asp:Label ID="Label2" runat="server" Text='<%# Eval("question_tag") %>'></asp:Label>)
                                        </div>
                                        <div class="media align-items-center">

                                            <div class="media-left">
                                                <h4 class="mb-0"><strong># 
                                               <asp:Label ID="lblSrNo2" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label></strong></h4>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:Label ID="lblQuestion2" runat="server" Text='<%# Eval("question") %>'></asp:Label>
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
                                            <asp:RadioButton ID="rdoans12" runat="server" GroupName="A" Text='<%# Eval("answer1") %>' />
                                            <i id="correctTick12" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick12" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick12" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>
                                        <div class="form-group option">
                                            <asp:RadioButton ID="rdoans22" runat="server" GroupName="A" Text='<%# Eval("answer2") %>' />
                                            <i id="correctTick22" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick22" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick22" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>
                                        <div class="form-group option">
                                            <asp:RadioButton ID="rdoans32" runat="server" GroupName="A" Text='<%# Eval("answer3") %>' />
                                            <i id="correctTick32" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick32" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick32" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>
                                        <div class="form-group option">
                                            <asp:RadioButton ID="rdoans42" runat="server" GroupName="A" Text='<%# Eval("answer4") %>' />
                                            <i id="correctTick42" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                            <i id="incorrectTick42" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                            <span class="helpicon"><i id="icincorrectTick42" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                        </div>

                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="card-footer" id="Div2" runat="server">
                            <div class="form-row justify-content-between">
                                <asp:Button ID="btnsubmit2" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit2_Click" OnClientClick="return validateForm2()" />
                                <asp:Button ID="btnGoToDeclaration" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnGoToDeclaration_Click" OnClientClick="return validateForm2()" />
                            </div>

                            <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                        </div>
                    </div>
                </div>
             </div>
                <div class="col-md-4" style="display:none;">  
                <div class="card">
                    <div class="card-body">
                        <label id="lblInstructionHeader" runat="server" class="instructn">Instructions:</label><br />
                        <ol style="font-size:small; padding-left:15px">
                            <li>Completing this section is mandatory.</li><br/>
                            <li>Please go through all the questions on this page carefully and answer them to the best of your knowledge.</li><br/>
                            <li>After you have answered all questions, click on Submit.</li><br/>
                            <li>Click on Next to proceed to the next section.</li>
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
           
        </div>
        </div>
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>
        function validateForm() {
            var questionCount = <%=gte_preliminary_section.QuestionsCount%>;
            for (var i = 0; i < questionCount; i++) {
                var rdoans1 = $("#ContentPlaceHolder1_questionList_rdoans1_" + i);
                var rdoans2 = $("#ContentPlaceHolder1_questionList_rdoans2_" + i);
                
                if (!(rdoans1.is(':checked') || rdoans2.is(':checked'))) {
                    alert("Please select one option for question no: " + (i + 1));
                    return false;
                }
            }
            return true;

        }
          function validateForm2() {
            var questionCount = <%=gte_preliminary_section.QuestionsCount2%>;
            for (var i = 0; i < questionCount; i++) {
                var rdoans1 = $("#ContentPlaceHolder1_questionList2_rdoans12_" + i);
                var rdoans2 = $("#ContentPlaceHolder1_questionList2_rdoans22_" + i);
                var rdoans3 = $("#ContentPlaceHolder1_questionList2_rdoans32_" + i);
                var rdoans4 = $("#ContentPlaceHolder1_questionList2_rdoans42_" + i);

                if (!(rdoans1.is(':checked') || rdoans2.is(':checked') || rdoans3.is(':checked') || rdoans4.is(':checked'))) {
                    alert("Please select one option for question no: " + (i + 1));
                    return false;
                }
            }
            return true;

        }

        $(document).ready(function () {
            $('.fa-info-circle').tipso({
                position: 'left',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtepreliminarysection1').addClass('active');

               $("#<%=linkCertificate.ClientID%>").click(function () {
                var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                location.replace(hostName + "gte_certificateN_IN.aspx");
            });
        });
    </script>

</asp:Content>