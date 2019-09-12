<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcredittransfer.aspx.cs" Inherits="applicantcredittransfer" MasterPageFile="~/student.master" %>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Credit Transfer </li>
        </ol>
        <h1 class="h2">Credit Transfer </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">

                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="credittransfer">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-email" for="email" class="col-md-3 col-form-label form-label">Do you plan to undertake a credit transfer  </label>
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                            <asp:RadioButton ID="rblCreditYes" runat="server" CssClass="form-control" GroupName="credittransfer" Text="Yes" />
                                            <asp:RadioButton ID="rblCreditNo" runat="server" CssClass="form-control" GroupName="credittransfer" Text="No" />
                                           
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_credit" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_credit_Click" OnClientClick="return validateForm()" />
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                    </div>
                    <div class="col-md-4">
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                               <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>
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
            var flag = false;
             if (!$("#<%=rblCreditYes.ClientID%>").is(':checked') && !$("#<%=rblCreditNo.ClientID%>").is(':checked'))
                    alert("Please Select Do you plan to undertake a credit transfer");
            else
                flag = true;           
            return flag;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantfunding').addClass('active');
        });
       
    </script>
    
</asp:Content>
