<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_subjectInstitutionmapping.aspx.cs" Inherits="admin_exam_subjectInstitutionmapping" MasterPageFile="~/admin/admin.master"%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Institution Subject Mapping</li>
        </ol>
        <h1 class="h2">Institution Subject Mapping</h1>

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
                        <label for="name" class="col-sm-3 col-form-label form-label">Subjects</label>
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
            else 
                flag = true;

            return flag;
             
        }  
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#class_group_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_subjectInstitutionmapping').addClass('active');
        });
	</script>

</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
