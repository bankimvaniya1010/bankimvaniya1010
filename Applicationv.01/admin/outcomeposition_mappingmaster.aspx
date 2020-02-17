<%@ Page Language="C#" AutoEventWireup="true" CodeFile="outcomeposition_mappingmaster.aspx.cs" Inherits="admin_outcomeposition_mappingmaster" MasterPageFile="~/admin/admin.master"%>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Career Position Mapping</li>
        </ol>
        <h1 class="h2">Career Position Mapping</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Courses</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlCourses" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Career Outcomes</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                  <asp:DropDownList ID="ddlcareer" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcareer_SelectedIndexChanged" class="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Positions</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:CheckBoxList ID="chkpositions" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                                </div>

                            </div>
                        </div>
                    </div>
                 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_Save_Click" OnClientClick="return validateForm()"/>
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
        function validateForm() {
            var flag = false;
            if ($("#<%=ddlCourses.ClientID%>").val() == "0")
                alert("Please Select Course");
            else if ($("#<%=ddlcareer.ClientID%>").val() == "0")
                alert("Please Select Career");
            else
                flag = true;

            return flag;

        }        
	    $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#careeroutcomes_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#courseoutcomespositionmapping').addClass('active');
        });
	</script>


</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
