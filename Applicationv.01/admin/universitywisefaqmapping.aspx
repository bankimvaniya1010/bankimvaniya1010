<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywisefaqmapping.aspx.cs" Inherits="admin_universitywisefaqmapping" MasterPageFile="~/admin/admin.master"%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Institution Faq Mapping</li>
        </ol>
        <h1 class="h2">Institution Faq Mapping</h1>

                <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlUniversity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Form Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlForm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlForm_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                  <%--  <div style="display:none;" runat="server" id="serviceDiv">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">service</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlservice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlservice_SelectedIndexChanged" CssClass="form-control">
                                            <asp:ListItem Value="Please select">Please Select</asp:ListItem>
                                            <asp:ListItem Value="0">GTE</asp:ListItem>
                                            <asp:ListItem Value="1">Full Service</asp:ListItem>
                                            <asp:ListItem Value="2">Assessment</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Faq Question</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-md-12 admin-checkbx">
                                   <asp:CheckBoxList ID="chkField" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>
                 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_save" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_save_Click" OnClientClick="return validateForm()" />
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
       function validateForm()
        {
            var flag = false; 
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select institution");
            else if ($("#<%=ddlForm.ClientID%>").val() == "0")
                alert("Please Select Form");
            else 
                flag = true;

            return flag;
             
        }  
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#FaqManage_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#faqmanage').addClass('active');
        });
	</script>

</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
