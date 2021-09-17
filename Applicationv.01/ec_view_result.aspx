<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_view_result.aspx.cs" Inherits="ec_view_result" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h3><%=examname %> Assessment Result</h3>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body">


                            <div class="list-group-item" id="title" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="labeltitle" for="title" class="">Marks Obtained :</label>
                                        <div class="col-md-6">
                                            <label id="lblmarksobtain" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="">Maximum Marks : </label>
                                        <div class="col-md-6">
                                            <label id="lbltotalmarks" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div9" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label3" for="title" class="col-md-3 col-form-label form-label"></label>
                                        <div class="col-md-6">
                                            <label id="Label4" runat="server"><b>View Your Marked Sheets</b></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="DivType1" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">

                                         <%for (int i = 0; i < chekedlist.Count; i++)
                                                { %>
                                            
                                                    File : <a href='<%=chekedlist[i].checkedsheet %>' target="_blank" style="<%= chekedlist[i].checkedsheet == null? "display: none;": "display:block;"%>"> View Checked File </a>
                                                    <label style="<%= chekedlist[i].checkedsheet == null? "display: block;": "display:none;"%>"> NOT APPERED</label>
                                            
                                            <%} %>

                                       <%-- <table class="table">
                                            <tr>
                                                <th class="bordertb"></th>
                                                <th class="bordertb" style="width:auto;">Applicant Response</th>
                                                <th class="bordertb" style="<%= uploadtype == 1 || uploadtype == 3? "visibility: hidden;": "visibility:visible;"  %>">Comments</th>
                                                <th class="bordertb" style="<%= uploadtype == 1 || uploadtype ==3 ? "visibility: hidden;": "visibility:visible;"  %>">Marks</th>
                                            </tr>
                                            <%for (int i = 0; i < chekedlist.Count; i++)
                                                { %>
                                            <tr>
                                                <td class="bordertb"><%=i+1%> )</td>
                                                <td class="bordertb">
                                                    <a href='<%=chekedlist[i].checkedsheet %>' target="_blank" style="<%= chekedlist[i].checkedsheet == null? "display: none;": "display:block;"%>">View Checked File </a>
                                                    <label style="<%= chekedlist[i].checkedsheet == null? "display: block;": "display:none;"%>"> NOT APPERED</label>
                                                </td>
                                                <td class="bordertb" style="<%= uploadtype == 1 || uploadtype == 3? "visibility: hidden;": "visibility:visible;"  %>"><%=chekedlist[i].comments %></td>
                                                <td class="bordertb" style="<%= uploadtype == 1 || uploadtype == 3? "visibility: hidden;": "visibility:visible;"  %>"><%=chekedlist[i].marks %></td>
                                            </tr>
                                            <%} %>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <div id="DivType2" runat="server" style="display: none;" class="">
                                <div id="answer_records" runat="server">
                                    <asp:DataList ID="questionList" runat="server" Width="100%">
                                        <ItemTemplate>
                                            <asp:Panel ID="options" runat="server">
                                                <div class="card-header">
                                                    <div style="display: none;">
                                                        <asp:Label ID="lblbindId" runat="server" Text='<%# Eval("lblbindId") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="">
                                                     <div class="list-group-item" id="Div2" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label5" for="title" class="col-md-3 col-form-label form-label">Question</label>
                                                                <div class="col-md-6">
                                                                    <div Style='<%# Eval("ifdownloadquestiontype") == null? "display:block;": "display:none;"  %>'>
                                                                    <asp:Label runat="server" ID="Label6" Text='<%#Eval("question") %>'></asp:Label>
                                                                        </div>
                                                                    <%-- for download --%>
                                                                    <div style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>'>
                                                                        <a href='<%#Eval("question") %>' target="_blank">View File</a>
                                                                    </div>
                                                                    <div style='<%# Eval("question_extrasheet") == null? "display:none;": "display:block;"  %>'>
                                                                        <a href='<%#Eval("question_extrasheet") %>' target="_blank">View Extra Sheet</a>
                                                                    </div>
                                                                    <div style='<%# Eval("question_extrafile") == null? "display:none;": "display:block;"  %>'>
                                                                        <a href='<%#Eval("question_extrafile") %>' target="_blank">View Extra File</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                   <%-- <div style='<%# Eval("ifopenasnwer") == null? "display:none;": "display:block;"  %>'>                                                   
                                                        <div class="list-group-item" id="Div3" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label8" for="title" class="col-md-3 col-form-label form-label">Note</label>
                                                                <div class="col-md-6">
                                                                   <asp:Label runat="server" ID="Label9" Text='<%#Eval("openasnwernote") %>' Style='<%# Eval("openasnwernotetype") == null? "display:block;": "display:none;"  %>'></asp:Label>
                                                                        <a href='<%#Eval("openasnwernote") %>' style='<%# Eval("openasnwernotetype") == null? "display:none;": "display:block;"  %>' target="_blank">View File</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                        </div>
                                                         <div class="list-group-item" id="Div4" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label10" for="title" class="col-md-3 col-form-label form-label">Applicant Response</label>
                                                                <div class="col-md-6">
                                                                   <asp:Label runat="server" ID="Label11" Text='<%#Eval("applicantanswer_description") %>'></asp:Label><br />
                                                                   <div  style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>' >
                                                                        <a href='<%#Eval("applicantanswer") %>' target="_blank">View Response File</a>
                                                                    </div>
                                                                    <div style='<%# Eval("applicantanswer_extrafile") == null? "display:none;": "display:block;"  %>' >
                                                                        <a href='<%#Eval("applicantanswer_extrafile") %>' target="_blank">View Response Extra File</a>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <div style='<%# Eval("correctansfileFlag") == null? "display:block;": "display:none;"  %>'>
                                                      <div class="list-group-item" id="Div5" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label7" for="title" class="col-md-3 col-form-label form-label">Correct Answer</label>
                                                                <div class="col-md-6">
                                                                    <asp:Label runat="server" ID="Label12" Text='<%#Eval("correctanswer_description") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                     <div style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>'>
                                                    <div class="list-group-item" id="Div6" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label2" for="title" class="col-md-3 col-form-label form-label">checked Sheet</label>
                                                                <div class="col-md-6">
                                                                    <a href='<%#Eval("checkedsheetpath") %>' target="_blank">View Checked File</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                         </div>
                                                     <div class="list-group-item" id="Div7" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label13" for="title" class="col-md-3 col-form-label form-label">Comment</label>
                                                                <div class="col-md-6">
                                                                  <asp:Label runat="server" ID="Label14" Text='<%#Eval("comments") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="list-group-item" id="Div8" runat="server">
                                                        <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                                            <div class="form-row">
                                                                <label runat="server" id="label15" for="title" class="col-md-3 col-form-label form-label">Marks</label>
                                                                <div class="col-md-6">
                                                                   <asp:Label runat="server" ID="Label16" Text='<%#Eval("perquestionmarks") %>'></asp:Label> / <asp:Label runat="server" ID="Label17" Text='<%#Eval("questionfinalmarks") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>                                                   
                                                </div>
                                            </asp:Panel>
                                        </ItemTemplate>
                                    </asp:DataList>
                                     <div class="card-footer" id="button" runat="server">
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--    <div class="col-md-4">
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
                --%>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
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

        $(document).ready(function () {

            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
        });
    </script>
</asp:Content>
