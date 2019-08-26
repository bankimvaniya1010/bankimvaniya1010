<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/preliminaryquestion.aspx.cs" Inherits="preliminary" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Preliminary Step</li>
        </ol>
        <h1 class="h2">Test Your Knowledge (Step 2/3)</h1>

    </div>
    <div class="page ">

        <div class="row" style="margin-left:50px;">
            <div class="col-md-8">
              
                <div class="card" id="questions" runat="server" visible ="true">
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("preliminaryid") %>'></asp:Label>
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

                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("Answer1") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("Answer2") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("Answer3") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("Answer4") %>' />
                                    </div>

                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />

                        <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                    </div>
                </div>
                <div class="list-group-item" id="messagediv">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">                                                            
                            <div class="col-md-6">
                                <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>                                            
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
                    <div class="card faq-qwrp" id="Div1" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                                <label onclick="openLink('<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>                                                             
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
            var questionCount = <%=preliminary.QuestionsCount%>;
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
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' +url+ '</div></div></div></div></div>'  );
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
            });
        }
         $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#preliminary_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#preliminaryquestion').addClass('active');
          });
    </script>

</asp:Content>


