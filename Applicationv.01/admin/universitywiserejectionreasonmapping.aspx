<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywiserejectionreasonmapping.aspx.cs" Inherits="admin_universitywiserejectionreasonmapping" MasterPageFile="~/admin/admin.master"%>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Rejection Reason Mapping University Wise</li>
        </ol>
        <h1 class="h2">Rejection Reason Mapping University Wise</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlUniversity" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Reasons</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkrejectionreason" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
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
            var flag = false; 
            if ($("#<%=ddlUniversity.ClientID%>").val() === "0")
                alert("Please Select University");
            else 
                flag = true;

            return flag;
             
       }  
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#rejectionreasonmapping').addClass('active');
        });
	</script>


</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>