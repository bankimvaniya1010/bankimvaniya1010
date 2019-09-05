<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantreferncecheck.aspx.cs" Inherits="admin_supervisorapplicantreferncecheck" MasterPageFile="~/admin/admin.master" %>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {
            SetValue();
        });
        function SetValue() {
             <% 
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

            <% }
        else
        { %>
            $('input:radio[name=Mobile<%=i%>]')[0].checked = true;
          <%  }
                }
            }
        }
        %>
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
                                    </div>
                                    <div class="col-md-4">   <input type="radio" id="<%="rblNameYes" + k %>" name="<%="Name" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblNameNo" + k %>" name="<%="Name" + k %>" value="0">No
                                        <span id="<%="lblName" + k %>"></span>
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
                                    </div>
                                    <div class="col-md-4"> <input type="radio" id="<%="rblMobileYes" + k %>" name="<%="Mobile" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblMobileNo" + k %>" name="<%="Mobile" + k %>" value="0">
                                        No
                                        <span id="<%="lblmobile" + k %>"></span>
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
                                    </div>
                                    <div class="col-md-4"> <input type="radio" id="<%="rblEmailYes" + k %>" name="<%="Email" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblEmailNo" + k %>" name="<%="Email" + k %>" value="0">No
                                        <span id="<%="lblEmail" + k %>"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%} %><div id="mainDiv" runat="server"></div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                                <div class="form-row">
                                    <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                                    <div class="col-md-4">
                                        <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                        Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="list-group-item" id="employerwebsite">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btnReference" runat="server" Text="Save Changes" OnClick="btnReference_Click" CssClass="btn btn-success" />
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
