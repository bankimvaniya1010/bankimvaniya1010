<%@ Page Language="C#" AutoEventWireup="true" CodeFile="masterfieldmapping.aspx.cs" Inherits="admin_mastermapping"  MasterPageFile="~/admin/admin.master"  %>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
                <li class="breadcrumb-item active">Institution Wise Master Field Mapping</li>
        </ol>
        <h1 class="h2">Institution Wise Master Field Mapping</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Master Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlMaster" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlMaster_SelectedIndexChanged" ></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Master Fields</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-md-12 admin-checkbx">
                                   <asp:CheckBoxList ID="chkMasterField" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click"  OnClientClick="return validateForm()" />                                    
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
           </div>
        </div>
    </div>
  
   <script type="text/javascript">
       function validateForm()
        {
             var flag = false; 
            if ($("#<%=ddlUniversity.ClientID%>").val() === "0")
                alert("Please select institution");           

            else if ($("#<%=ddlMaster.ClientID%>").val() === "0")
                alert("Please Select Master");

            else 
                flag = true;           

            return flag;
             
       }  
       $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#CustomizeForms_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#masterfieldmapping').addClass('active');
	    });
          
    </script>
</asp:Content>

