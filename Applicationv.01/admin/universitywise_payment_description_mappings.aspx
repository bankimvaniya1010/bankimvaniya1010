<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywise_payment_description_mappings.aspx.cs" Inherits="admin_universitywise_payment_description_mappings" MasterPageFile="~/admin/admin.master"%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Institution wise Payment Description Mapping</li>
        </ol>
        <h1 class="h2">Institution wise Payment Description Mapping</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row" id="shownotification" style="display:none" runat="server">
                        <label for="name" class="col-sm-12" style="font-weight:500"> [ Payment descriptions which are already in use are bydefault set to non-editable. ]</label>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlUniversity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" class="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Payments</label>                        
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkpaymentdescrip" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>                                    
                                </div>

                            </div>
                        </div>
                    </div>
                 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_Save_Click" OnClientClick="return validateForm()"/>                                    
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
            else 
                flag = true;

            return flag;
             
        }  
        $(document).ready(function () {            
            $('.sidebar-menu-item').removeClass('open');
            $('#payment_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#paymentdescription_mappings').addClass('active');
        });
	</script>


</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
