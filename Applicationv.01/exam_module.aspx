<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_module.aspx.cs" Inherits="exam_module"  MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">VIEW YOUR SHEDULED EXAM</li>
        </ol>
        <h1 class="h2">VIEW YOUR SHEDULED EXAM</h1>
    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit list-group-item">
                        <h3>INTSRUCTIONS FOR EXAM:</h3>
                        <div class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                        </div>
                    </div>
                <br/>
                   <div id="emptyChoicesDiv" runat="server" class="card" visible="false">
                       <div class="card-body">
                           <asp:Label ID="lblEmptyList" runat="server" Text=""> No Exam Are Schedule By Institution.</asp:Label>
                       </div>
                   </div>
                <div class="card" id="coeCard" runat="server">
                    <asp:DataList ID="coeList" runat="server" GridLines="Horizontal">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-body">
                                    <div style="display: none;">
                                        <asp:Label ID="lblApplicationMasterId" runat="server" Text='<%# Eval("exampapersid") %>'></asp:Label>
                                        <asp:Label ID="lblUniversityId" runat="server" Text='<%# Eval("exampapersid") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label" style="margin-right: 60%;">Exam Name : <%# Eval("exam_name") %></label>
                                        <div style:'<%# Eval("status") == null ? "visibility: visible;": "visibility:hidden;"  %>'>
                                        <label for="choice" class="col-form-label form-label"> <a href="<%# Eval("exampage_link") %>" >View more</a></label>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label">Date : <%# Eval("exam_datetime") %></label>
                                    </div>                                   
                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label">Short Remarks: <%# Eval("shortremarks") %></label>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label for="choice" class="col-form-label form-label"><a href='<%# Eval("Downloadfile") %>' target="_blank">Download </a></label>
                                    </div>
                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label">Status : <%# Eval("status") %></label>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                
               </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                <div class="card faq-qwrp" id="Div1" runat="server">
                    <div class="card-body">
                        <%  if (allfaqQuestion.Count > 0)
                            { %>
                        <div id="question" runat="server">
                            <h5>Frequently Asked Questions (FAQs)</h5>
                            <div class="">
                                <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                    {%>
                                <div class="star-list">
                                    <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allfaqQuestion[q].question%> </label>
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
       

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');

        });
    </script>

</asp:Content>