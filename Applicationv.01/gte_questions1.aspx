<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_questions1.aspx.cs" Inherits="gte_questions1" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Questions</li>
        </ol>
        <h1 class="h2">GTE-QUESTIONS - PART 1</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
           <!-- <div class="col-md-12 d-flex justify-content-end"> -->
              <div class="row">
                  <div class="col-md-8">
                <div class="card" id="questions" runat="server">
                    <div style="font-size:medium;text-align:center">
                        Question <%=ViewState["AnsweredQuestionCount"] %> / <%=ViewState["QuestionsCount"] %>
                        <br/>
                        <label id="minutes"></label><label id="seconds"></label>
                        <asp:HiddenField ID="hidTime" runat="server" />
                    </div>
                    <div class="card-body">
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_0" runat="server" Text='<%# Eval("answerId0") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_1" runat="server" Text='<%# Eval("answerId1") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_2" runat="server" Text='<%# Eval("answerId2") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_3" runat="server" Text='<%# Eval("answerId3") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_4" runat="server" Text='<%# Eval("answerId4") %>'></asp:Label>
                                        <asp:Label ID="lblAnswerID_5" runat="server" Text='<%# Eval("answerId5") %>'></asp:Label>
                                    </div>
                                    <div class="media align-items-center">

                                        <div class="media-body">
                                            <h4 class="card-title">
                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">

                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("option0") %>' />
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("option1") %>' />
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("option2") %>' />
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("option3") %>' />
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans5" runat="server" GroupName="A" Text='<%# Eval("option4") %>' />
                                    </div>
                                    <div class="form-group option">
                                        <asp:RadioButton ID="rdoans6" runat="server" GroupName="A" Text='<%# Eval("option5") %>' />
                                    </div>

                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />

                    </div>
                   </div>
                </div>
                 <div id="completedDiv" runat="server" style="display: none;">
                  <div class="">
                        <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
                  </div>
                 </div>
                 </div>
                  <div class="col-md-4">
                      <div class="banImg-wrp">
                            <img src="/assets/images/Banner1.jpg" class="img-fluid">
                        </div>
                    <div class="card faq-qwrp" id="Div1" runat="server">
                        
                                <div class="card-body" style="flex:none;background:#fff;">
                                <%  if (allfaqQuestion.Count > 0)
                                    { %>
                                <div id="question" runat="server">
                                        <h5>Frequently Asked Questions (FAQs)</h5>
                                        <div class="">
                                        <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                            {%>  <div class="star-list">                                                             
                                                    <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allfaqQuestion[q].question%> </label>
                                                </div>                                                  
                                        <%} %>
                                    </div>
                                </div>      
                                    <%} %>  
                                     
                                </div>
                           </div>
                    </div>
                </div>
            <div style="display: none;" runat="server">
                <div class="modal" id="IELTS-modal" tabindex="-1" role="dialog">
                   <div class="modal-dialog" role="document">
                      <div class="modal-content">
                         <div class="faq-modal-header modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                         </div>
                         <div class="modal-body">
                            <div class="">
	                            <table border="1">
                                    <tr>
                                        <td>*Academic International English Language Testing System (IELTS)</td>
                                        <td>6.0 with no band below 6.0 for Reading and Writing and no band below 5.5 in Speaking and Listening</td>
                                    </tr>
                                    <tr>
                                        <td>*Cambridge Advanced English prior to January 2015 (CAE)</td>
                                        <td>52 with no section less than Borderline</td>
                                    </tr>
                                    <tr>
                                        <td>*Cambridge Advanced English after January 2015 (CAE)</td>
                                        <td>169 with no band below 162</td>
                                    </tr>
                                    <tr>
                                        <td>*Pearson Test of English (PTE)</td>
                                        <td>54 with no band below 46</td>
                                    </tr>
                                    <tr>
                                        <td>*Test of English as a Foreign Language - IBT (TOEFL IBT)</td>
                                        <td>73 with no band less than 16</td>
                                    </tr>
                                    <tr>
                                        <td>* *Test of English as a Foreign Language - Paper Based (TOEFL - Paper Based)</td>
                                        <td>534 (Test of Written English 4.0)</td>
                                    </tr>
                                    <tr>
                                        <td>Occupational English Test (OET)</td>
                                        <td>OET with a minimum of C in the four components</td>
                                    </tr>
                                    <tr>
                                        <td>Special Tertiary Admissions Test (STAT)</td>
                                        <td>Written English Score 140</td>
                                    </tr>
                                </table>
                            </div>
                         </div>
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
            var rdoans1 = $("#ContentPlaceHolder1_questionList_rdoans1_0");
            var rdoans2 = $("#ContentPlaceHolder1_questionList_rdoans2_0");
            var rdoans3 = $("#ContentPlaceHolder1_questionList_rdoans3_0");
            var rdoans4 = $("#ContentPlaceHolder1_questionList_rdoans4_0");
            var rdoans5 = $("#ContentPlaceHolder1_questionList_rdoans5_0");
            var rdoans6 = $("#ContentPlaceHolder1_questionList_rdoans6_0");

            if (!(rdoans1.is(':checked') || rdoans2.is(':checked') || rdoans3.is(':checked') || rdoans4.is(':checked') || rdoans5.is(':checked') || rdoans6.is(':checked'))) {
                alert("Please select one option for question");
                return false;
            }
            return true;
        }

         $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtepart1').addClass('active');

            $('#lblClick').click(function () {
                var IELTSModal = $('#IELTS-modal');
                $('body').append(IELTSModal);
                $('#IELTS-modal').modal('show');
            });

            var minutesLabel = document.getElementById("minutes");	
            var secondsLabel = document.getElementById("seconds");	
            var totalSeconds = <%=(int)Session["totalResponseTime"]%>;	
            setInterval(setTime, 1000);	
             function setTime() {	
                ++totalSeconds;	
                var questionTime = totalSeconds - <%=(int)Session["totalResponseTime"]%>;	
                secondsLabel.innerHTML = ":" + pad(totalSeconds % 60);	
                minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));	
                $("#<%=hidTime.ClientID%>").val(questionTime);	
            }	
             function pad(val) {	
                var valString = val + "";	
                if (valString.length < 2) {	
                    return "0" + valString;	
                } else {	
                    return valString;	
                }	
            }	

        });
    </script>

</asp:Content>
