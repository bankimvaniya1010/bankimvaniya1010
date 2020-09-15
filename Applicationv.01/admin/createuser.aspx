<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuser.aspx.cs" Inherits="createuser" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create New User</li>
        </ol>
        <h1 class="h2">Create New User </h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtName" type="text" runat="server" class="form-control" placeholder=" Name">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">User Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUsername" type="text" runat="server" class="form-control" placeholder=" User Name">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Email</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtEmail" type="text" runat="server" class="form-control" placeholder="Email">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Mobile</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="TxtMobile" type="text" runat="server" class="form-control" placeholder="Mobile">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Password</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="Txtpassword" type="text" runat="server" class="form-control" placeholder="Password">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Role</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div runat="server" id="subroles" style="display:none">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label"></label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                          <asp:CheckBox ID="chkAll" Text="Select All" runat="server" />
                                        <asp:CheckBoxList ID="chkroles" runat="server" name="subroles">
                                            <%--<asp:ListItem Value="1">Exambuilder</asp:ListItem>
                                              <asp:ListItem Value="2">Proctor</asp:ListItem>
                                              <asp:ListItem Value="3">Exam Checker</asp:ListItem>--%>
                                        </asp:CheckBoxList>                       
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="Divpasskey" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Passkey</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                          <input type="text" runat="server" ID="txtpasskey" class="form-control" disabled="disabled"/>
                                        <asp:HiddenField runat="server" ID="hidpasskey"/>
                                    </div>

                                </div>
                            </div>
                        </div>
                      </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_login" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" OnClientClick="return validateForm();"/>
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>


            </div>
        </div>

    </div>
    <script>
            $(function () {
        $("[id*=chkAll]").bind("click", function () {
            if ($(this).is(":checked")) {
                $("[id*=chkroles] input").attr("checked", "checked");
            } else {
                $("[id*=chkroles] input").removeAttr("checked");
            }
        });
        $("[id*=chkroles] input").bind("click", function () {
            if ($("[id*=chkroles] input:checked").length == $("[id*=chkroles] input").length) {
                $("[id*=chkAll]").attr("checked", "checked");
            } else {
                $("[id*=chkAll]").removeAttr("checked");
            }
        });
    });
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#role_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createuser').addClass('active');
            
        });
        
        $("#<%=ddlRole.ClientID%>").change(function () {
             var mode = '<%=pagemode %>';
            if ($("#<%=ddlRole.ClientID%>").val() == 13) {
                $("#<%=subroles.ClientID%>").show();
                if (mode == 'new') {
                    $.ajax({
                        type: "GET",
                        url: "createuser.aspx/Genrateotp",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d) {
                                var result = JSON.parse(response.d);
                                $("#<%=txtpasskey.ClientID%>").val(result);
                                $("#<%=hidpasskey.ClientID%>").val(result);
                            }
                        }
                    });
                }
                else {
                    $("#<%=txtpasskey.ClientID%>").val($("#<%=hidpasskey.ClientID%>").val());                  
                }

            }
            else
                $("#<%=subroles.ClientID%>").hide();
            
        });
        function validateForm()
        {
            var mode = '<%=pagemode %>';
            var name = $('#<%=txtName.ClientID%>').val();
            var username = $('#<%=txtUsername.ClientID%>').val();
            var email = $('#<%=txtEmail.ClientID%>').val();
            var mobile = $('#<%=TxtMobile.ClientID%>').val();
            var password = $('#<%=Txtpassword.ClientID%>').val();
            var role = $('#<%=ddlRole.ClientID%>').val();

            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;

            if (name == '') {
                alert("Please enter name");
                return false;
            }
            else if (username == '') {
                alert("Please enter user name");
                return false;
            }
            else if (email == '' || !emailRegex.test(email)) {
                alert("Please enter valid user email Id");
                return false;
            }
            else if (mobile == '') {
                alert("Please enter user mobile number");
                return false;
            }
            else if (mode == 'new' && password == '') {
                alert("Please enter user password");
                return false;
            }
            else if (role == 0) {
                alert("Please select Role of user");
                return false;
            }
            //else if (role == 13 && $('[name="subroles"]:checked').length == 0) {
            //    alert("Please select assessment roles.");
            //    return false;
            //}
            return true;
        }
	</script>
</asp:Content>

