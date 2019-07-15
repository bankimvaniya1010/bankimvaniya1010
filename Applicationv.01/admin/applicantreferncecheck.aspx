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
            SetValue();
        });
        function SetValue() {
             <% 
        for (int k = 0; k < Comments.Count; k++)
        {
            string fieldName = Comments[k].fieldname;
            string AdminComments = Comments[k].comments;
            int RefrenceCount = referenccheckList.Count;
            for (int i = 0; i < RefrenceCount; i++)
            {
            %>
           <% if (fieldName == Name + (i + 1))
        {%>

            $("#txtName<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == Email + (i + 1))
        {%>

            $("#txtEmail<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == Mobile + (i + 1))
        {%>

            $("#txtmobile<%=i%>").val('<%=AdminComments%>');
          <%   }


            }
        }
        %>
        }
        function GetValue() {

            var inputValue = "";
         <% 
        for (int k = 0; k < referenccheckList.Count; k++)
        { %>

            <%if (Name != "")
        {%>
            inputValue = inputValue +"<%=Name + (k + 1)%>" + ":" + $("#txtName<%=k%>").val() + "|";

            <%}%>
               <%if (Email != "")
        {%>
            inputValue = inputValue +"<%=Email + (k + 1)%>" + ":" + $("#txtEmail<%=k%>").val() + "|";

            <%}%>
               <%if (Mobile != "")
        {%>
            inputValue = inputValue +"<%=Mobile + (k + 1)%>" + ":" + $("#txtmobile<%=k%>").val() + "|";

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
                                        <span class="helpicon"><i id="<%="icName" + k %>" class="fa fa-info-circle" data-tipso="<%=NameTooltips %>" style='<%= NameTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtName" + k %>" type="text" placeholder="Name" value="" class="form-control">
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
                                        <span class="helpicon"><i id="<%="icMobile" + k %>" class="fa fa-info-circle" data-tipso="<%=MobileTooltips %>" style='<%= MobileTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtmobile" + k %>" type="text" placeholder="Name" value="" class="form-control">
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
                                        <span class="helpicon"><i id="<%="icEmail" + k %>" class="fa fa-info-circle" data-tipso="<%=EmailTooltips %>" style='<%= EmailTooltips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtEmail" + k %>" type="text" placeholder="Name" value="" class="form-control">
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
