<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantsocial.aspx.cs" Inherits="applicantsocial" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">SOCIAL PROFILE

            </li>
        </ol>
        <h1 class="h2">SOCIAL PROFILE

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">


                            <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                                    <div class="form-row">
                                        <label id="labellinked" runat="server" for="linked" class="col-md-3 col-form-label form-label">LINKEDIN PROFILE</label>
                                        <div class="col-md-6">
                                            <input id="txtLinkedin" runat="server" type="text" class="form-control" placeholder="Enter the link to your LinkedIN profile">
                                            <asp:CheckBox ID="chkLinkeIn" runat="server" Text="I DO NOT HAVE A LINKEDIN ACCOUNT." class="form-label"/>
                                            <span class="helpicon"><i id="icLinkedin" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="facebook" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                                    <div class="form-row">
                                        <label id="labelfacebook" runat="server" for="employer" class="col-md-3 col-form-label form-label">FACEBOOK PROFILE</label>
                                        <div class="col-md-6">
                                            <input id="txtFacebook" runat="server" type="text" class="form-control" placeholder="Enter the link to your Facebook profile">
                                            <asp:CheckBox ID="ChkFacebook" runat="server" Text="I DO NOT HAVE A FACEBOOK ACCOUNT." class="form-label"/>
                                            <span class="helpicon"><i id="icFacebook" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="twitter" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-twitter">
                                    <div class="form-row">
                                        <label id="labeltwitter" runat="server" for="twitter" class="col-md-3 col-form-label form-label">TWITTER HANDLE</label>
                                        <div class="col-md-6">
                                            <input id="txtTwitter" runat="server" type="text" class="form-control" placeholder="Enter the link to your Twitter handle">
                                            <asp:CheckBox ID="chkTwitter" runat="server" Text="I DO NOT HAVE A TWITTER ACCOUNT." class="form-label" />
                                            <span class="helpicon"><i id="icTwitter" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btnsocial" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsocial_Click" OnClientClick="return validateForm()" />
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go to Review and Submit" CssClass="btn btn-success" OnClick="gotoNextPage_Click" OnClientClick="return validateForm()"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
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
            if (!$("#<%=linkedin.ClientID%>").is(':hidden') && $("#<%=txtLinkedin.ClientID%>").val() == "" && !$("#<%=chkLinkeIn.ClientID%>").is(":checked"))
                 alert("Please Enter LinkedIn Profile");
             else if (!$("#<%=facebook.ClientID%>").is(':hidden') && $("#<%=txtFacebook.ClientID%>").val() == "" && !$("#<%=ChkFacebook.ClientID%>").is(":checked"))
                alert("Please Enter Facebook Profile");
            else if (!$("#<%=twitter.ClientID%>").is(':hidden') && $("#<%=txtTwitter.ClientID%>").val() == "" && !$("#<%=chkTwitter.ClientID%>").is(":checked"))
                alert("Please Select Twitter Profile");
            else
                flag = true;

            if (flag == true)
                flag = customcontrolValidation();
            return flag;


        }

        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            TextBox txtDynamic = (TextBox)mainDiv.FindControl("txt" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if ($("#<%=txtDynamic.ClientID%>").val() == "") {
                alert("Please enter <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }


        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            if ($("#<%=chkLinkeIn.ClientID%>").is(":checked"))
                $("#<%=txtLinkedin.ClientID%>").attr("disabled", "disabled");
            else
                $("#<%=txtLinkedin.ClientID%>").removeAttr("disabled");
        
            if ($("#<%=ChkFacebook.ClientID%>").is(":checked"))
                $("#<%=txtFacebook.ClientID%>").attr("disabled", "disabled");
            else
                $("#<%=txtFacebook.ClientID%>").removeAttr("disabled");
        
            if ($("#<%=chkTwitter.ClientID%>").is(":checked"))
                $("#<%=txtTwitter.ClientID%>").attr("disabled", "disabled");
            else
                $("#<%=txtTwitter.ClientID%>").removeAttr("disabled");
        
        });

         $("#<%=chkLinkeIn.ClientID%>").change(function () {
            if ($(this).is(":checked")) {
                $("#<%=txtLinkedin.ClientID%>").val("");
                $("#<%=txtLinkedin.ClientID%>").attr("disabled", "disabled");
            }
            else
                $("#<%=txtLinkedin.ClientID%>").removeAttr("disabled");
        });

        $("#<%=ChkFacebook.ClientID%>").change(function () {
            if ($(this).is(":checked")) {
                $("#<%=txtFacebook.ClientID%>").val("");
                $("#<%=txtFacebook.ClientID%>").attr("disabled", "disabled");
            }
            else
                $("#<%=txtFacebook.ClientID%>").removeAttr("disabled");
        });

        $("#<%=chkTwitter.ClientID%>").change(function () {
            if ($(this).is(":checked")) {
                $("#<%=txtTwitter.ClientID%>").val("");
                $("#<%=txtTwitter.ClientID%>").attr("disabled", "disabled");
            }
            else
                $("#<%=txtTwitter.ClientID%>").removeAttr("disabled");
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantsocial').addClass('active');
        });
    </script>
</asp:Content>
