<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitywisegroupmapping.aspx.cs" Inherits="admin_universitywisegroupmapping" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="alternateIdproofcountrywiselisting.aspx"> Institution Wise Group Mapping </a></li>
        </ol>
        <h1 class="h2">Institution Wise Group Mapping </h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlinstitution" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlinstitution_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Groups</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkIdProof" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>                
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click" OnClientClick="return validateForm()"/>                                    
                                    <asp:Label runat="server" ID="lblMessage" Visible="false"></asp:Label>
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
            if ($("#<%=ddlinstitution.ClientID%>").val() == "0")
                alert("Please Select institution");                       
            else 
                flag = true;           

            return flag;
             
       }  
       $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#class_group_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#countrywise_groupmapping').addClass('active');
	    });

          
    </script>
</asp:Content>



