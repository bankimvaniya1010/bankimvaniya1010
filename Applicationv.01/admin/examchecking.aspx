<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examchecking.aspx.cs" Inherits="admin_examchecking" MasterPageFile="~/admin/admin.master"%>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Assign Checker</li>
        </ol>
        <h1 class="h2">Assign Checker</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div> 
                     <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                         <asp:DropDownList runat="server" ID="ddlclass" class="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group">
                            <label for="name" class="col-sm-3 col-form-label form-label">Group</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                       <asp:DropDownList runat="server" ID="ddlgroup" class="form-control" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="examsubject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true"/>
                                     <%--   <input id="txtsubject" runat="server" type="text" class="form-control" autocomplete="off">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Assessment</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Scheduled Date & Time</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlExamDateTime" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>                     
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Checker</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                             </div>
                         </div>
                     </div> 
                    
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Checker Passkey</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtexaminerpasskey" runat="server" class="form-control" disabled="disabled"/>
                                    <asp:HiddenField runat="server" ID="hidtxtexaminerpasskey"/>
                                </div>
                             </div>
                         </div>
                     </div> 
                   
                    </div> 
           </div>
                <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()"/>
                                   <div class="col-md-20">
                                         <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                   </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
           </div>
    </div>
    
  
   <script>
      
       function validateForm() {
           var flag = false;
           if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please select institution");
           else if ($("#<%=ddlclass.ClientID%>").val() == "0")
               alert("Please select class");
           else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
               alert("Please select group");
           else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
               alert("Please select subject");
           else if ($("#<%=ddlexam.ClientID%>").val() == "0")
               alert("Please select exam");
           else if ($("#<%=ddlExamDateTime.ClientID%>").val() == "0")
               alert("Please select assessmnent time");
           else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
               alert("Please select Checker");           
           else
               flag = true;
           return flag;
       }
       $("#<%=ddlexaminer.ClientID%>").change(function () {      
           if ($("#<%=ddlexaminer.ClientID%>").val() != "0") {
               $.ajax({
                   type: "GET",
                   url: "examchecking.aspx/Genrateotp",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       if (response.d) {
                           var result = JSON.parse(response.d);
                           $("#<%=txtexaminerpasskey.ClientID%>").val(result);
                           $("#<%=hidtxtexaminerpasskey.ClientID%>").val(result);
                       }
                   }
               });
           }
       });
    
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#examchecking').addClass('active');
       });
   </script>        
</asp:Content>
