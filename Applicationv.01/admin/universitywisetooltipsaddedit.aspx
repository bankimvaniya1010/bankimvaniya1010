<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywisetooltipsaddedit.aspx.cs" Inherits="admin_universitywisetooltipsaddedit" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <script>function validateForm() {
            var University = $('#<%=ddlUniversity.ClientID%>').val();
    var Form = $('#<%=ddlForm.ClientID%>').val();
    var field = $('#<%=ddlField.ClientID%>').val();
    var ToolTips = $('#<%=txtTooltips.ClientID%>').val();
     if (University == 0 || isNaN(parseInt(University))) {
                alert("Please select Institution ");
                return false;
            }
            if (Form == 0 || isNaN(parseInt(Form))) {
                alert("Please select form name ");
                return false;
            }
            else if (field == 0 || isNaN(parseInt(field))) {
                alert("Please Select field name ");
                return false;
            }
            else if (ToolTips == '') {
                alert("Please enter Tooltips");
                return false;
            }


            return true;

        }
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Add ToolTips</li>
        </ol>
        <h1 class="h2">Student University Wise Add/Edit ToolTips</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">University</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Form Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlForm" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlForm_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Field Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlField" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Tool Tips</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtTooltips" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" OnClientClick="return validateForm()" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
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
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#managetooltips_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#universitywisetooltipslisting').addClass('active');
        });
    </script>
</asp:Content>
