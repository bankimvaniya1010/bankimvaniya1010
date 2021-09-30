<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_institution_mapping.aspx.cs" Inherits="admin_course_institution_mapping" MasterPageFile="~/admin/admin.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
                <li class="breadcrumb-item active">Course Mapping</li>
        </ol>
        <h1 class="h2">Course Mapping</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Head Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lblheadUniversityId" runat="server" CssClass="form-control"></asp:Label>
                                </div>

                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Groupped Institutions Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlgroupuniversity" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlgroupuniversity_SelectedIndexChanged" >
                                        <asp:ListItem Value="-1">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Course Name</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-md-12 admin-checkbx">
                                     <asp:CheckBox ID="chkAll" Text="Select All" runat="server" onclick="javascript:Header_Click(this);" />
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
            if ($("#<%=ddlgroupuniversity.ClientID%>").val() === "0")
                alert("Please Select Master");
            else if ($("input[type=checkbox]:checked").length == 0)
                alert("Please select Course");
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
             function Header_Click(isChecked) {
            if (isChecked.checked == true) {
                $('input[type="checkbox"]').each(function () {
                    this.checked = true;
                });
            }
            else {
                $('input[type="checkbox"]').each(function () {
                    if(!$(this).prop('disabled'))
                        this.checked = false;
                });
            }
         }  
    </script>
</asp:Content>

