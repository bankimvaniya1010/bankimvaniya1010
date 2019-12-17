﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gteadddeclaration_master.aspx.cs" Inherits="admin_gteadddeclaration_master" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Declaration Master</li>
        </ol>
        <h1 class="h2">Declaration Master </h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlUniversity" class="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Statments Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea runat="server" id="txtstatement" class="form-control" style="height: 180px;width: 400px;"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Statement Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlType" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="summary">Summary</asp:ListItem>
                                        <asp:ListItem Value="declaration">Declaration</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_save" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_save_Click" OnClientClick="return validateForm()"/>
                                    
                                </div>
                            </div>
                        </div>
                    </div>



                </div>


            </div>
        </div>

    </div>
    <script>
        function validateForm()
        {
            var university = $('#<%=ddlUniversity.ClientID%>').val();
            var description = $('#<%=txtstatement.ClientID%>').val();
            var statementtype = $('#<%=ddlType.ClientID%>').val();

            if (university == 0) {
                alert("Please select University");
                return false;
            }
            else if (description == '') {
                alert("Please enter Statements");
                return false;
            }
            else if (statementtype == 0) {
                alert("Please select Type of statement");
                return false;
            }
            return true;

        }
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gte_declaration_master').addClass('active');
        });

      
	</script>
</asp:Content>

