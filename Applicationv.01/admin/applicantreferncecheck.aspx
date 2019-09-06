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
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Reference Check</li>
        </ol>
        <h1 class="h2">Applicant Reference Check</h1>
        <div class="card">
            <div class="list-group list-group-fit">
                <asp:HiddenField ID="hdnValue" runat="server" />

                <div class="card">
                    <% 
                        for (int k = 0; k < referenccheckList.Count; k++)
                        {

                    %>
                    <div class="list-group list-group-fit">
                        <div class="list-group-item" style='<%= Name == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelname" for="name" class="col-md-3 col-form-label form-label"><%=Name %></label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].name %></span>
                                        <input type="radio" id="<%="rblNameYes" + k %>" name="<%="Name" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblNameNo" + k %>" name="<%="Name" + k %>" value="0">No
                                        No
                                        <span class="helpicon"><i id="<%="icName" + k %>" class="fa fa-info-circle" data-tipso="<%=NameTooltips %>" style='<%= NameTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="button" value="Add Remarks" id="<%="btnName" + k %>" />
                                        <input id="<%="txtName" + k %>" style="display: none;" type="text" placeholder="Name" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" style='<%= Mobile == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelmobile" for="name" class="col-md-3 col-form-label form-label"><%=Mobile %> </label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].mobile %></span>
                                        <input type="radio" id="<%="rblMobileYes" + k %>" name="<%="Mobile" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblMobileNo" + k %>" name="<%="Mobile" + k %>" value="0">
                                        No

                                        <span class="helpicon"><i id="<%="icMobile" + k %>" class="fa fa-info-circle" data-tipso="<%=MobileTooltips %>" style='<%= MobileTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="button" value="Add Remarks" id="<%="btnMobile" + k %>" />
                                        <input id="<%="txtMobile" + k %>" style="display: none;" type="text" placeholder="Name" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" style='<%= Email == "" ? "display:none;": "display:block;"  %>'>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelEmail" for="Email" class="col-md-3 col-form-label form-label"><%=Email %> </label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].email %></span>
                                        <input type="radio" id="<%="rblEmailYes" + k %>" name="<%="Email" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblEmailNo" + k %>" name="<%="Email" + k %>" value="0">No

                                        <span class="helpicon"><i id="<%="icEmail" + k %>" class="fa fa-info-circle" data-tipso="<%=EmailTooltips %>" style='<%= EmailTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="button" value="Add Remarks" id="<%="btnEmail" + k %>" />
                                        <input id="<%="txtEmail" + k %>" style="display: none;" type="text" placeholder="Name" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%} %>
                        <div id="mainDiv" runat="server"></div>
                        <div class="list-group-item" id="employerwebsite">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btnReference" runat="server" Text="Save Changes" OnClientClick="GetValue();" CssClass="btn btn-success" OnClick="btnReference_Click" />
                                    <div class="col-md-6">
                                        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>


    </div>
</asp:Content>
