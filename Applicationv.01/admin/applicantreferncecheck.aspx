<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantreferncecheck.aspx.cs" Inherits="admin_applicantreferncecheck" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
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
            <li class="breadcrumb-item active">Applicant Reference Check</li>
        </ol>
        <h1 class="h2">Applicant Reference Check</h1>
        <div class="card">
            <div class="list-group list-group-fit">


                <div class="card">
                    <% 
                        for (int k = 0; k < referenccheckList.Count; k++)
                        {

                    %>
                    <div class="list-group list-group-fit">
                        <div class="list-group-item" style=<%= Name == "" ? "display:none;": "display:block;"  %>>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelname" for="name" class="col-md-3 col-form-label form-label"><%=Name %></label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].name %></span>
                                        <span class="helpicon"><i id="<%="icName" + k %>" class="fa fa-question-circle" data-tipso="<%=NameTooltips %>" style=<%= NameTooltips == "" ? "display:none;": "display:block;"  %>></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtName" + k %>" type="text" placeholder="Name" value="" required="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" style=<%= Mobile == "" ? "display:none;": "display:block;"  %>>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelmobile" for="name" class="col-md-3 col-form-label form-label"><%=Mobile %> </label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].mobile %></span>
                                        <span class="helpicon"><i id="<%="icMobile" + k %>" class="fa fa-question-circle" data-tipso="<%=MobileTooltips %>" style=<%= MobileTooltips == "" ? "display:none;": "display:block;"  %>></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtmobile" + k %>" type="text" placeholder="Name" value="" required="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" style=<%= Email == "" ? "display:none;": "display:block;"  %>>
                            <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                <div class="form-row">
                                    <label id="labelEmail" for="Email" class="col-md-3 col-form-label form-label"><%=Email %> </label>

                                    <div class="col-md-4">
                                        <span><%=referenccheckList[k].email %></span>
                                        <span class="helpicon"><i id="<%="icEmail" + k %>" class="fa fa-question-circle" data-tipso="<%=EmailTooltips %>" style=<%= EmailTooltips == "" ? "display:none;": "display:block;"  %>></i></span>
                                    </div>
                                    <div class="col-md-4">
                                        <input id="<%="txtEmail" + k %>" type="text" placeholder="Name" value="" required="" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%} %>
                        <div id="mainDiv" runat="server"></div>
                        <div class="list-group-item" id="employerwebsite">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btnReference" runat="server" Text="Save Changes" CssClass="btn btn-success" />
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
