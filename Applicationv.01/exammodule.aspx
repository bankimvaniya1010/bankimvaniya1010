  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="exammodule.aspx.cs" Inherits="exammodule" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">VIEW YOUR SCHEDULED ASSESSMENTS</li>
        </ol>
        <h1 class="h2">VIEW YOUR SCHEDULED ASSESSMENTS</h1>
    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit list-group-item">
                        <h3>Instructions for your assessments:</h3>
                        <div class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                        </div>
                    </div>
                <br/>
                   <div id="emptyChoicesDiv" runat="server" class="card" visible="false">
                       <div class="card-body">
                           <asp:Label ID="lblEmptyList" runat="server" Text=""> No Assessmnent are schedule by institution.</asp:Label>
                       </div>
                   </div>
                <div class="card" id="coeCard" runat="server">
                    <asp:DataList ID="coeList" runat="server" GridLines="Horizontal">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-body">
                                    <div style="display: none;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("applicantid") %>'></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("universityid") %>'></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("examdatetime") %>'></asp:Label>
                                        <asp:Label ID="lblApplicationMasterId" runat="server" Text='<%# Eval("exampapersid") %>'></asp:Label>
                                        <asp:Label ID="lblUniversityId" runat="server" Text='<%# Eval("exampapersid") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label" style="font-size: large;">Assessment Name : <%# Eval("exam_name") %></label>
                                    </div>
                                    <div class="form-group" style="font-size: medium;">
                                        <label for="choice" class="col-form-label form-label">Assessment Date & Time: <%# Eval("exam_datetime", "{0:dd/MMM/yyyy hh:mm tt}") %></label> 
                                         <label for="choice" class="col-form-label form-label"> <%# Eval("examtimezonetoshow") %></label>
                                    </div>  
                                     <div class="form-group">
                                        <label for="choice" class="col-form-label form-label">Assessment UTC Date & Time: <%# Eval("examutctime", "{0:dd/MMM/yyyy hh:mm tt}") %></label>
                                    </div>  

                                    <div class="form-group">
                                        <label for="choice" class="col-form-label form-label">Short Remarks: <%# Eval("shortremarks") %></label>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label for="choice" class="col-form-label form-label" style="<%# Eval("Downloadfile") == null? "display: none;": "display:block;"  %>"><a href='<%# Eval("Downloadfile") %>' target="_blank">Download </a></label>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-row">
                                            <label class="col-md-7 col-form-label form-label"  style="font-size: large;" >Status : <%# Eval("showstatus") %></label>
                                        <div class="col-md-5">                                            
                                            <label for="choice" class="btn btn-success"  style="<%# Eval("status") == null? "visibility: visible;color: rgb(20 24 27 / 85%);font-weight: 600;": "visibility:hidden;"%>"> <a href="<%# Eval("exampage_link") %>" >Go to assessment >></a></label>
                                        </div>
                                    </div>
                                    <div class="form-group">                                        
                                        <div class="form-row">
                                            <label class="col-md-6 col-form-label form-label"  style="<%# Eval("result") == null? "display:none ;": "display:block;"  %>"> Result Declaration Date : <%# Eval("result" , "{0:dd/MMM/yyyy hh:mm tt}")%>  </label>
                                        <div class="col-md-4">                                            
                                            <label for="choice" class="col-form-label form-label"> <%# Eval("resulttimezone") %></label>
                                        </div>
                                    </div>
                                        <label for="choice" class="col-form-label form-label" style="<%# Eval("gotoresultpage") == null? "display:none ;": "display:block;"  %>"><a href='<%# Eval("gotoresultpage") %>' target="_blank">View Result </a></label>
                                        
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