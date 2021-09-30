﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_clarificationquestions.aspx.cs" Inherits="gte_clarificationquestions" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Clarification Questions</li>
        </ol>
        <h1 class="h2">Clarification Questions

        </h1>

    </div>

    <div class="page ">
      <div class="container page__container">
        <div class="row">
            <div class="col-md-8">
              
                <div class="card" id="clarity" runat="server">
                    <div class="card-body list-group-fit">
                    <asp:DataList ID="clarificationList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </div>
                                    <div class="media align-items-center">

                                        <div class="media-body">
                                            <h4 class="card-title">
                                                <asp:Label ID="lblClarificationText" runat="server" Text='<%# Eval("clarification_question") %>'></asp:Label>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body" style="padding-left: 1px;">

                                    <div class="form-group option">
                                        <textarea ID="txtResponse" runat="server" class="form-control"></textarea>
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
                    
                            <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">                    
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
            var questionCount = <%=gte_clarificationquestions.QuestionsCount%>;
            for (var i = 0; i < questionCount; i++) {
                var txtBox = $("#ContentPlaceHolder1_clarificationList_txtResponse_" + i);

                if (txtBox.val() == "") {
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
              $('#gteclarification').addClass('active');

              $('.sidebar-menu-item').removeClass('open');
            $('#Gte_new_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#Li6').addClass('active');
        });

    </script>
</asp:Content>