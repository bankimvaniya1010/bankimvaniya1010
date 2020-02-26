<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantsocial.aspx.cs" Inherits="admin_applicantsocial" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant social details</li>
        </ol>
        <h1 class="h2">Applicant social details</h1>
        <div class="card">
            <div class="list-group list-group-fit">


                <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                        <div class="form-row">
                            <label id="labellinked" runat="server" for="linked" class="col-md-2 col-form-label form-label">Link to your LinkedIn profile</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblLinkedin" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblLinkedinYes" GroupName="Linkedin" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblLinkedinNo" GroupName="Linkedin" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icLinkedin" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnLinkedn" />
                                <input id="txtLinkedinComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="facebook" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                        <div class="form-row">
                            <label id="labelfacebook" runat="server" for="employer" class="col-md-2 col-form-label form-label">Link to your Facebook profile </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblFacebook" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblFacebookYes" GroupName="Facebook" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblFacebookNo" GroupName="Facebook" Text="No" runat="server" />
                                </div>


                                <span class="helpicon"><i id="icFacebook" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnFaceBook" />
                                <input id="txtFacebookComments" runat="server" type="text" class="form-control" style="display: none" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="twitter" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-twitter">
                        <div class="form-row">
                            <label id="labeltwitter" runat="server" for="twitter" class="col-md-2 col-form-label form-label">Link to your twitter handle </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblTwitterYes" GroupName="twitter" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblTwitterNo" GroupName="twitter" Text="No" runat="server" />
                                </div>


                                <span class="helpicon"><i id="icTwitter" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnTwitter" />
                                <input id="txtTwitterComments" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validateform()"/>
                            <div class="col-md-6">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>
    <script type="text/javascript">        
        $(document).ready(function () {
            if ($("#<%=txtLinkedinComments.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtLinkedinComments.ClientID%>', 'btnLinkedn');

            if ($("#<%=txtFacebookComments.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtFacebookComments.ClientID%>', 'btnFaceBook');

            if ($("#<%=txtTwitterComments.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtTwitterComments.ClientID%>', 'btnTwitter');

            $("#btnLinkedn").click(function () {
                ManageRemarks('<%=txtLinkedinComments.ClientID%>', 'btnLinkedn');
            });
            $("#btnFaceBook").click(function () {
                ManageRemarks('<%=txtFacebookComments.ClientID%>', 'btnFaceBook');
            });
            $("#btnTwitter").click(function () {
                ManageRemarks('<%=txtTwitterComments.ClientID%>', 'btnTwitter');
            });

            $("#<%=rblLinkedinNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtLinkedinComments.ClientID%>', 'btnLinkedn');
            });
            $("#<%=rblFacebookNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtFacebookComments.ClientID%>', 'btnFaceBook');
            });
            $("#<%=rblTwitterNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtTwitterComments.ClientID%>', 'btnTwitter');
            });

            if ($('#<%=rblLinkedinNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtLinkedinComments.ClientID%>', 'btnLinkedn');
            if ($('#<%=rblFacebookNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtFacebookComments.ClientID%>', 'btnFaceBook');
            if ($('#<%=rblTwitterNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtTwitterComments.ClientID%>', 'btnTwitter');

             <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
        %>
            if ($('#<%=txtName%>').val() != "")
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');
            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>

            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }
            function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        });
        function validateform()
        {
            var flag = false;
            if (!$("#<%=linkedin.ClientID%>").is(':hidden') && !($("#<%=rblLinkedinNo.ClientID%>").is(':checked') || $("#<%=rblLinkedinYes.ClientID%>").is(':checked'))) 
                alert("Please seclect option for LinkedIn profile");
            else if (!$("#<%=facebook.ClientID%>").is(':hidden') && !($("#<%=rblFacebookNo.ClientID%>").is(':checked') || $("#<%=rblFacebookYes.ClientID%>").is(':checked'))) 
                alert("Please seclect option for Facebook profile");
            else if (!$("#<%=twitter.ClientID%>").is(':hidden') && !($("#<%=rblTwitterNo.ClientID%>").is(':checked') || $("#<%=rblTwitterYes.ClientID%>").is(':checked'))) 
                alert("Please seclect option for LinkedIn profile");
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
            RadioButton rbDynamicsYes = (RadioButton)mainDiv.FindControl("rblYes" + CustomControls[k].customfieldid);
            RadioButton rbDynamicsNo = (RadioButton)mainDiv.FindControl("rblNo" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if (!($("#<%=rbDynamicsYes.ClientID%>").is(':checked') || $("#<%=rbDynamicsNo.ClientID%>").is(':checked'))) {
                alert("Please Select option for <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#manageapplicantions_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#applicantlist').addClass('active');
	    });
    </script>
</asp:Content>

