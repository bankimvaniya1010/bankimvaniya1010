<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examiner_master.aspx.cs" Inherits="admin_examiner_master" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Assessment Role Master</li>
        </ol>
        <h1 class="h2">Assessment Role Master</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="form-group row" id="examname">
                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtname" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                      <div class="form-group row" id="examusernamw">
                        <label for="name" class="col-sm-3 col-form-label form-label">User Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtusername" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="examineremail">
                        <label for="name" class="col-sm-3 col-form-label form-label">email</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtemail" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="examinercontact">
                        <label for="name" class="col-sm-3 col-form-label form-label">Contact Number</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtcontactno" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="roles">
                        <label for="name" class="col-sm-3 col-form-label form-label">Roles</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlroles" CssClass="form-control"></asp:DropDownList>
                                   <%-- <asp:CheckBox ID="chkAll" Text="Select All" runat="server" />
                                    <asp:CheckBoxList ID="chkroles" runat="server" SelectMethod="">
                                        <asp:ListItem Value="1">Exambuilder</asp:ListItem>
                                          <asp:ListItem Value="2">Proctor</asp:ListItem>
                                          <asp:ListItem Value="3">Exam Checker</asp:ListItem>
                                    </asp:CheckBoxList>                    --%>   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="examinerpassword">
                        <label for="name" class="col-sm-3 col-form-label form-label">Your Password</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtpassword" runat="server" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="examinerpasskey">
                        <label for="name" class="col-sm-3 col-form-label form-label">Your Passkey</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtpasskey" runat="server" type="text" class="form-control" disabled="disabled">
                                    <asp:HiddenField runat="server" ID="hidtxtpasskey"/>
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
        </div>
  </div>
   <script>
    //   $(function () {
    //    $("[id*=chkAll]").bind("click", function () {
    //        if ($(this).is(":checked")) {
    //            $("[id*=chkroles] input").attr("checked", "checked");
    //        } else {
    //            $("[id*=chkroles] input").removeAttr("checked");
    //        }
    //    });
    //    $("[id*=chkroles] input").bind("click", function () {
    //        if ($("[id*=chkroles] input:checked").length == $("[id*=chkroles] input").length) {
    //            $("[id*=chkAll]").attr("checked", "checked");
    //        } else {
    //            $("[id*=chkAll]").removeAttr("checked");
    //        }
    //    });
    //});
      function validateForm() {
          var flag = false;
          if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
              alert("Please select institution");
          else if ($("#<%=txtname.ClientID%>").val() == "")
              alert("Please enter name");
          else if ($("#<%=txtusername.ClientID%>").val() == "")
              alert("Please enter username");
          else if ($("#<%=txtemail.ClientID%>").val() == "")
              alert("Please enter email");
          else if ($("#<%=txtcontactno.ClientID%>").val() == "")
              alert("Please enter contact number");
          else if ($("#<%=ddlroles.ClientID%>").val() == "0")
              alert("Please select role");
          else if ($("#<%=txtpassword.ClientID%>").val() == "")
              alert("Please enter password");
               
          else
               flag = true;
           return flag;
       }
       
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#assessmentroles_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#rolemaster').addClass('active');

           $.ajax({
                   type: "GET",
                   url: "examiner_master.aspx/Genrateotp",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       if (response.d) {
                           var result = JSON.parse(response.d);
                           $("#<%=txtpasskey.ClientID%>").val(result); 
                           $("#<%=hidtxtpasskey.ClientID%>").val($("#<%=txtpasskey.ClientID%>").val());
                       }
                   }
               });
       });
    </script>        
</asp:Content>


