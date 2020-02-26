<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visastatus.aspx.cs" Inherits="visastatus" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Your Student Visa : View</li>
        </ol>
        <h1 class="h2">YOUR STUDENT VISA : VIEW</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit list-group-item">
                       <h3>INSTRUCTIONS</h3>
                       <div style="margin-left:-20px;" class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                       </div>
                   </div>
                <div class="card" id="services" runat="server" style="padding-right:0px;">
                    <div class="card-body" style="padding-left:15px;padding-right:10px;">    
                        <div class="">
                            <div class="form-group m-0">
                                <div class="form-row">
                                    <div class="col-form-label form-label list-group-item visaStatusBox">
                                        <div>   
                                            <label class="col-form-label form-label">Application Completed by student: </label>
                                            <asp:Label ID="lblvisastatus" runat="server"></asp:Label>
                                        </div>                                            
                                    </div> 
                                    <div class="col-form-label form-label list-group-item visaStatusBox">
                                        <div>   
                                            <label class="col-form-label form-label">Visa Fee Paid by student: </label>
                                            <asp:Label ID="lblvisafee" runat="server"> </asp:Label>
                                        </div>
                                    </div>
                                     <div class="col-form-label form-label list-group-item visaStatusBox">
                                        <div>   
                                            <label class="col-form-label form-label">Application Verified by Visa Staff: </label>
                                            <asp:Label ID="lblverfiedbystaff" runat="server"> </asp:Label>
                                        </div>
                                    </div>
                                     <div class="col-form-label form-label list-group-item visaStatusBox">
                                        <div>   
                                            <label class="col-form-label form-label">Application Submitted To Department: </label>
                                            <asp:Label ID="lblsubmited" runat="server"> </asp:Label>
                                        </div>
                                    </div>
                                     <div class="col-form-label form-label list-group-item visaStatusBox">
                                        <div>   
                                            <label class="col-form-label form-label">VISA DECISION RECEIVED : </label>
                                            <asp:Label ID="lbldecisionreceived" runat="server"> </asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-control visaStatusBox col-md-4" style="margin-top: 25px;margin-left: 155px;">
                                <asp:Label runat="server" ID="lblstatus"> </asp:Label>
                            </div>
                            <div class="form-control visaStatusBox" style="margin-top:10px">
                                <asp:Label runat="server" ID="lblvisaremark"></asp:Label>
                            </div>
                        </div>      
                    </div>
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
        $('#visaapplication_list').addClass('open');
        $('.sidebar-menu-item').removeClass('active');
        $('#Viewvisastatus').addClass('active');
    });
</script>
</asp:Content>