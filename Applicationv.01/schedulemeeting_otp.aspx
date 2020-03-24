<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schedulemeeting_otp.aspx.cs" Inherits="schedulemeeting_otp" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">

            </li>
        </ol>       
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">


                            <div class="list-group-item" id="withoutotp" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                                    <div class="form-row">
                                        <label id="lblwithoutotp" runat="server" for="withoutotp" class="col-md-12 col-form-label form-label"></label>
                                        <div class="col-md-6">                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="withotp" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                                    <div class="form-row">
                                        <label id="lblwithotp" runat="server" for="employer" class="col-md-06 col-form-label form-label"></label>
                                        <div class="col-md-6">
                                            <input id="txtpassskey" runat="server" type="text" class="form-control" placeholder="Enter the Passkey">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="otpbtn">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click"/>                                        
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                           <%-- <div class="card-body">
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
                                     
                            </div>--%>
                        </div>
                    </div>
                
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
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            //$('#gtepreliminarysection1').addClass('active');
        });
    </script>
</asp:Content>
