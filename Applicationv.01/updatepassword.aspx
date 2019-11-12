<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatepassword.aspx.cs" Inherits="updatepassword" MasterPageFile="~/student.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">

            </li>
        </ol>
        <h1 class="h2">CHANGE PASSWORD

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">


                           
                             <div class="list-group-item" id="exsistingpassword" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-password">
                                    <div class="form-row">
                                        <label id="lblexsistingpassword" runat="server" for="exsistingpassword" class="col-md-3 col-form-label form-label">Enter Exsisting password</label>
                                        <div class="col-md-6">
                                            <input id="txtexsistingpassword" runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="password" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-password">
                                    <div class="form-row">
                                        <label id="lblpassword" runat="server" for="password" class="col-md-3 col-form-label form-label">New Password</label>
                                        <div class="col-md-6">
                                            <input id="txtpassword"  runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="confirmpassword" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-confirmpassword">
                                    <div class="form-row">
                                        <label id="lblconfirmpassword" runat="server" for="confirmpassword" class="col-md-3 col-form-label form-label">Confirm New Password</label>
                                        <div class="col-md-6">
                                            <input id="txtconfirmpassword" runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">                                        
                                        <asp:Button ID="btnupdatepassword" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btnupdatepassword_Click"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblErrorMessage" runat="server" Visible="false"></asp:Label>
                                        </div>
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
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
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
    
     function validateForm() {          
            var flag = false;
            if ($("#<%=txtpassword.ClientID%>").val() == "")
                alert("Please enter new password");
            else if ($("#<%=txtconfirmpassword.ClientID%>").val() == "")
                alert("Please enter confirm password");
            else if ($("#<%=txtpassword.ClientID%>").val() != "" && ($("#<%=txtpassword.ClientID%>").val() != $("#<%=txtconfirmpassword.ClientID%>").val()))
                alert("Password and confirm password should be same");
            else
                flag = true;
            return flag;
     }
      $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#profile_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#changepassword').addClass('active');
          });

 </script> 

</asp:Content>
