<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantreferncecheck.aspx.cs" Inherits="admin_applicantreferncecheck" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {
        
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
             <%    for (int k = 0; k < CustomControls.Count; k++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[k].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[k].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[k].customfieldid.ToString();
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

         <%  }

        for (int n = 0; n < referenccheckList.Count; n++)
        {%>
            //comment box
            if ($("#txtName<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtName<%=n%>', 'btnName<%=n%>');
            if ($("#txtMobile<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtMobile<%=n%>', 'btnMobile<%=n%>');
            if ($("#txtEmail<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtEmail<%=n%>', 'btnEmail<%=n%>');

            $("#btnName<%=n%>").click(function () {
                ManageRemarks('txtName<%=n%>', 'btnName<%=n%>');
            });
            $("#rblNameNo<%=n%>").click(function () {
                ManageRemarks('txtName<%=n%>', 'btnName<%=n%>');
            });
            $("#btnEmail<%=n%>").click(function () {
                ManageRemarks('txtEmail<%=n%>', 'btnEmail<%=n%>');
            });
            $("#rblEmailNo<%=n%>").click(function () {
                ManageRemarks('txtEmail<%=n%>', 'btnEmail<%=n%>');
            });
            $("#btnMobile<%=n%>").click(function () {
                ManageRemarks('txtMobile<%=n%>', 'btnMobile<%=n%>');
            });
            $("#rblMobileNo<%=n%>").click(function () {
                ManageRemarks('txtMobile<%=n%>', 'btnMobile<%=n%>');
            });

         <%  }
        for (int k = 0; k < Comments.Count; k++)
        {

            string fieldName = Comments[k].fieldname;
            string AdminComments = Comments[k].comments;
            int Adminaction = Convert.ToInt32(Comments[k].adminaction);
            int RefrenceCount = referenccheckList.Count;
            for (int i = 0; i < RefrenceCount; i++)
            {
            %>
            <% if (fieldName == Name + (i + 1))
        {%> 


            $("#txtName<%=i%>").val('<%=AdminComments%>');
            <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=Name<%=i%>]')[1].checked = true;
            ManageRemarksIfNoCheked('txtName<%=i%>','btnName<%=i%>');
            <% }
        else
        { %>
            $('input:radio[name=Name<%=i%>]')[0].checked = true;
          <%  }
        }
        else if (fieldName == Email + (i + 1))
        {%>

            $("#txtEmail<%=i%>").val('<%=AdminComments%>');
           <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=Email<%=i%>]')[1].checked = true;

            ManageRemarksIfNoCheked('txtEmail<%=i%>','btnEmail<%=i%>');
            <% }
        else
        { %>
            $('input:radio[name=Email<%=i%>]')[0].checked = true;
          <%  }
        }
        else if (fieldName == Mobile + (i + 1))
        {%> 

            $("#txtMobile<%=i%>").val('<%=AdminComments%>');
            <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=Mobile<%=i%>]')[1].checked = true;
            ManageRemarksIfNoCheked('txtMobile<%=i%>','btnMobile<%=i%>');
            <% }
        else
        { %>
            $('input:radio[name=Mobile<%=i%>]')[0].checked = true;
          <%  }
                }
            }
        }
        %>

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

        function GetValue() {
            
            var inputValue = "";
            var inputactionValue = "";
         <% 
        for (int k = 0; k < referenccheckList.Count; k++)
        { %>

            <%if (Name != "")
        {%>
            if ($('#rblNameNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue +"<%=Name + (k + 1)%>" + ":" + $("#txtName<%=k%>").val() + "~" + inputactionValue + "|";

            <%}%>
               <%if (Email != "")
        {%>
            if ($('#rblEmailNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue +"<%=Email + (k + 1)%>" + ":" + $("#txtEmail<%=k%>").val() + "~" + inputactionValue + "|";

            <%}%>
               <%if (Mobile != "")
        {%>  if ($('#rblMobileNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue +"<%=Mobile + (k + 1)%>" + ":" + $("#txtMobile<%=k%>").val() + "~" + inputactionValue + "|";

            <%}%>

        <% }

        %>
            $("#<%=hdnValue.ClientID%>").val(inputValue);



        }
        function validateform()
        {
             <% for (int k = 0; k < referenccheckList.Count; k++)
           { %>
            var flag = false;
            if (!$("#name").is(':hidden') && !($('#rblNameYes<%=k%>').is(':checked') || $('#rblNameNo<%=k%>').is(':checked')))
                alert("Please select option for Name of reference");
            else if (!$("#mobile").is(':hidden') && !($('#rblMobileYes<%=k%>').is(':checked') || $('#rblMobileNo<%=k%>').is(':checked')))
                alert("Please select option for Mobile of reference");
            else if (!$("#Email").is(':hidden') && !($('#rblEmailYes<%=k%>').is(':checked') || $('#rblEmailNo<%=k%>').is(':checked')))
                alert("Please select option for Email of reference");
            else
                flag = true;
            if (flag == true)
                flag == customcontrolValidation();
            
        <% } %> 
            GetValue();
            return true;
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
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Applicant Reference Check</li>
        </ol>
        <h1 class="h2">Applicant Reference Check</h1>
        <div class="">
            <div class="list-group list-group-fit">
                <asp:HiddenField ID="hdnValue" runat="server" />

                <div class="card">
                    <% if(referenccheckList.Count > 0) { 
                        for (int k = 0; k < referenccheckList.Count; k++)
                        {

                    %>
                    <div class="list-group list-group-fit">
                        <div class="list-group-item" id="name" style='<%= Name == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelname" for="name" class="col-md-2 col-form-label form-label"><%=Name %></label>

                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <span><%=referenccheckList[k].name %></span>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <input type="radio" id="<%="rblNameYes" + k %>" name="<%="Name" + k %>" value="1">Yes
                                            <input type="radio" id="<%="rblNameNo" + k %>" name="<%="Name" + k %>" value="0">No
                                        </div>
                                        <span class="helpicon"><i id="<%="icName" + k %>" class="fa fa-info-circle" data-tipso="<%=NameTooltips %>" style='<%= NameTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="<%="btnName" + k %>" />
                                        <input id="<%="txtName" + k %>" style="display: none;" type="text" placeholder="Add Comments" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="mobile" style='<%= Mobile == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelmobile" for="mobile" class="col-md-2 col-form-label form-label"><%=Mobile %> </label>

                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <span><%=referenccheckList[k].mobile %></span>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <input type="radio" id="<%="rblMobileYes" + k %>" name="<%="Mobile" + k %>" value="1">Yes
                                            <input type="radio" id="<%="rblMobileNo" + k %>" name="<%="Mobile" + k %>" value="0">No
                                        </div>

                                        <span class="helpicon"><i id="<%="icMobile" + k %>" class="fa fa-info-circle" data-tipso="<%=MobileTooltips %>" style='<%= MobileTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="<%="btnMobile" + k %>" />
                                        <input id="<%="txtMobile" + k %>" style="display: none;" type="text" placeholder="Add Comments" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="Email" style='<%= Email == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelEmail" for="Email" class="col-md-2 col-form-label form-label"><%=Email %> </label>

                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <span><%=referenccheckList[k].email %></span>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <input type="radio" id="<%="rblEmailYes" + k %>" name="<%="Email" + k %>" value="1">Yes
                                            <input type="radio" id="<%="rblEmailNo" + k %>" name="<%="Email" + k %>" value="0">No
                                        </div>

                                        <span class="helpicon"><i id="<%="icEmail" + k %>" class="fa fa-info-circle" data-tipso="<%=EmailTooltips %>" style='<%= EmailTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="<%="btnEmail" + k %>" />
                                        <input id="<%="txtEmail" + k %>" style="display: none;" type="text" placeholder="Add Comments" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                         <%} %>
                        <div id="mainDiv" runat="server"></div>
                        <div class="list-group-item" id="employerwebsite">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btnReference" runat="server" Text="Save Changes" OnClientClick="return validateform()" CssClass="btn btn-success" OnClick="btnReference_Click"/>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                        else if (referenccheckList.Count == 0) { %>
                    <div class="list-group-item">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                            <div class="form-row">
                                <label id="norecord" for="employment" class="col-md-12 col-form-label form-label">NO Data Found</label>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>

            </div>
        </div>


    </div>
   
</asp:Content>
