<%@ Page Language="C#" AutoEventWireup="true" CodeFile="download_gtereport.aspx.cs" Inherits="download_gtereport" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Download your GTE Report 

            </li>
        </ol>
        <h1 class="h2">Download your GTE Report 

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="list-group-item" runat="server" style="display:none" id="gtedoc">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" class="col-md-6 col-form-label form-label">Download Your Final GTE Report</label>
                                        <div class="col-md-6">
                                            <asp:Button ID="btngte" runat="server" Text="Download" CssClass="btn btn-success" OnClick="btngte_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="list-group-item" >
                                <asp:Label runat="server" ID="lblmsg" Visible="false"></asp:Label>
                            </div>                            
                        </div>
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
                <div id="page-nav" class="col-lg-auto page-nav">
                    
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script> 
        $(document).ready(function () {           
            $('.sidebar-menu-item').removeClass('open');
            $('#gteevalution_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#download_gtereport').addClass('active');
        });
    </script>
</asp:Content>