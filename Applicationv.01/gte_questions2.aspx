<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_questions2.aspx.cs" Inherits="gte_questions2" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Evaluation - Stage 3</li>
        </ol>
        <h1 class="h2">GTE Evaluation - Stage 3</h1>

    </div>
    <div class="page ">

       <div class="container page__container">
           <div class="row">
            <%--<div class="col-md-12">--%>
                <div class="col-md-8">
                <div class="card" id="questions" runat="server">
                    <div style="font-size:medium;text-align:center">
                        Questions <%=ViewState["Display"] %> out of <%=ViewState["QuestionsCount"] %>
                        <br/>
                        <label id="minutes"></label><label id="seconds"></label>
                        <asp:HiddenField ID="hidTime" runat="server" />
                    </div>
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("id") %>'></asp:Label>
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

                                    <div class="form-group option fontsize-radioButtonList">
                                        <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text="True" />
                                    </div>
                                    <div class="form-group option fontsize-radioButtonList">
                                        <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text="False" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />

                    </div>
                </div>
                 <div id="completedDiv" runat="server" style="display: none;">
                    <div>
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
                                                <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')" >  <%=allfaqQuestion[q].question%> </label>
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

        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
   
    <script>
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' +url+ '</div></div></div></div></div>'  );
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
            });
        }
        function validateForm() {
            var questionCount = <%=gte_questions2.QuestionsCount%>;
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

         $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#gteevalution_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtepart1').addClass('active');

            var minutesLabel = document.getElementById("minutes");	
            var secondsLabel = document.getElementById("seconds");	
            var totalSeconds = <%=(int)Session["totalResponseTimeQue2"]%>;	
            setInterval(setTime, 1000);	
             function setTime() {	
                ++totalSeconds;	
                var questionTime = totalSeconds - <%=(int)Session["totalResponseTimeQue2"]%>;	
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
