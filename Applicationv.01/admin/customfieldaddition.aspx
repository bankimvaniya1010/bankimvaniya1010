<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customfieldaddition.aspx.cs" Inherits="admin_customfieldaddition" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Universitywise Custom Field Add/Edit </li>
        </ol>
        <h1 class="h2">Universitywise Custom Field Add/Edit</h1>

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
                        <label for="name" class="col-sm-3 col-form-label form-label">Form</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlForm" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Label Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Control Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlControlType" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="" Text="Please Select"></asp:ListItem>
                                        <asp:ListItem Value="textbox" Text="Textbox"></asp:ListItem>
                                        <asp:ListItem Value="file" Text="File"></asp:ListItem>
                                    </asp:DropDownList>
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
    <script>function validateForm() {

            var University = $('#<%=ddlUniversity.ClientID%>').val();
    var Form = $('#<%=ddlForm.ClientID%>').val();
    var Description = $('#<%=txtDescription.ClientID%>').val();
    var Control = $('#<%=ddlControlType.ClientID%>').val();
            if (University == 0 || isNaN(parseInt(University))) {
                alert("Please Select University ");
                return false;
            }
            else if (Form == 0 || isNaN(parseInt(Form))) {
                alert("Please Select Form ");
                return false;
            }
            else if (Description == '') {
                alert("Please enter Label Description");
                return false;
            }
            else if (Control == '') {
                alert("Please Select Control");
                return false;
            }

            return true;

        }
    </script>
</asp:Content>


