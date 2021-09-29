<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ec_create_declaretion_master.aspx.cs" Inherits="admin_ec_create_declaretion_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">CREATE A DECLARATION</li>
        </ol>
        <h1 class="h2">CREATE A DECLARATION</h1>
        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlUniversity" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Declaration Heading</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea runat="server" id="txtheaderstatements" class="form-control" style="height: 180px;width: 400px;"></textarea>                                    
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Declaration Body<br/><br/>
                           <%-- (*Please enter next statements in new line)--%></label>                          
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea runat="server" id="txtstatement" class="form-control" style="height: 180px;width: 400px;"></textarea>                                                                      
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
            var university = $('#<%=ddlUniversity.ClientID%>').val();
            var description = $('#<%=txtstatement.ClientID%>').val();
            var statementtype = $('#<%=txtheaderstatements.ClientID%>').val();

            if (university == 0) {
                alert("Please select institution");
                return false;
            }
            else if (statementtype == '') {
                alert("Please enter declaration heading");
                return false;
            }
            else if (description == '') {
                alert("Please enter declaration body");
                return false;
            }
            return true;

        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#resource_create').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#resource_declare').addClass('active');
        });
    </script>
</asp:Content>



