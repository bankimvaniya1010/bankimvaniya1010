<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywise_videoMapping.aspx.cs" Inherits="admin_universitywise_videoMapping" MasterPageFile="~/admin/admin.master"%>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Video Mapping For University </li>
        </ol>
        <h1 class="h2">Video Mapping For University </h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlUniversity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Video</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkForm" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>
                 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_login" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click" />
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
            $('#videolist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#manageuploadvideo').addClass('active');
        });
	</script>


</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>