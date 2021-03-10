<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit_studentDetails.aspx.cs" Inherits="admin_edit_studentDetails" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Student Details</li>
        </ol>

        <h1 class="h2">Student Details</h1>

        <div class="card">
            <div>
                <asp:label runat="server">Go To applicantid</asp:label> <asp:DropDownList runat="server" ID="ddlapplicantlist" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                     <div class="list-group-item" id="Div2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label2" for="title" class="col-md-4 col-form-label form-label">Applicant Name</label>
                                        <div class="col-md-6">
                                            <input type ="text" runat="server" class="form-control" id="lblname" disabled="disabled"/>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="list-group-item" id="Div15" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label15" for="title" class="col-md-4 col-form-label form-label">Institution Student ID</label>
                                        <div class="col-md-6">                                            
                                           <input type ="text" runat="server" class="form-control" id="txtstudentid"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div16" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label16" for="title" class="col-md-4 col-form-label form-label">CLASS / PROGRAM</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlclass"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HidclassID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div17" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label17" for="title" class="col-md-4 col-form-label form-label">Group</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlgroup"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HidGroupID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                             <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="col-md-3 col-form-label form-label">Subjects</label>
                                        <div class="col-md-7">                                            
                                           <asp:CheckBoxList ID="ddlsubject" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"></asp:CheckBoxList>
                                            <asp:HiddenField runat="server" ID="HidSubjectID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function validateForm() {
            var flag = false;

            if ($("#<%=txtstudentid.ClientID%>").val() == "")
                alert("Please enter institution student id");
            else if ($("#<%=ddlclass.ClientID%>").val() == "0")
                alert("Please select class");
            else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
                alert("Please select group");
            else if ($("input[type=checkbox]:checked").length == 0)
                 alert("Please select subject");
            else
                flag = true;            
            return flag;    
        }
        $(document).ready(function () {
	            $('.sidebar-menu-item').removeClass('open');
	            $('#manageregistration_list').addClass('open');
	            $('.sidebar-menu-item').removeClass('active');
	            $('#registeredapplicants').addClass('active');
	        });
    </script>
</asp:Content>
