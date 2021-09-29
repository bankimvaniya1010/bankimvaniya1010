<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subjectwisecountrymapping.aspx.cs" Inherits="admin_subjectwisecountrymapping" MasterPageFile="~/admin/admin.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Subjectwise Country Mapping </li>
        </ol>
        <h1 class="h2">Subjectwise Country Mapping</h1>

                <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                   
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Subject Mapping</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkSubject" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>
                 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click"    />
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
        $('#CustomizeForms_list').addClass('open');
        $('.sidebar-menu-item').removeClass('active');
        $('#subjectwisecountrymapping').addClass('active');
    });
</script>
</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

