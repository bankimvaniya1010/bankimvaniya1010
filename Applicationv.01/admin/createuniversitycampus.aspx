<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuniversitycampus.aspx.cs" Inherits="admin_createuniversitycampus" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create University Campus</li>
        </ol>

        <h1 class="h2">University Campus Create</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="campName" class="col-sm-3 col-form-label form-label">Campus Name</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampName" type="text" runat="server" class="form-control" placeholder="Campus Name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campID" class="col-sm-3 col-form-label form-label">University ID</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniID" type="text" runat="server" class="form-control" placeholder="University ID" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campDescription" class="col-sm-3 col-form-label form-label">Campus Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampDescription" type="text" runat="server" class="form-control" placeholder="Campus Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campFacility" class="col-sm-3 col-form-label form-label">Campus Facilities</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampFacility" type="text" runat="server" class="form-control" placeholder="Campus Facilities" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campResearch" class="col-sm-3 col-form-label form-label">Campus Research</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCampResearch" type="text" runat="server" class="form-control" placeholder="Campus Research" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campFacultyDescription" class="col-sm-3 col-form-label form-label">Campus Faculty Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtFacultyDescription" type="text" runat="server" class="form-control" placeholder="Campus Faculty Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="campFacilities" class="col-sm-3 col-form-label form-label">Select Campus Facility</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlFacilities" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
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

            var campName = $('#<%=txtCampName.ClientID%>').val();
            var universityID = $('#<%=txtUniID.ClientID%>').val();

            if (campName == '') {
                alert("Please enter university campus name");
                return false;
            }
            else if (universityID == '') {
                alert("Please enter university campus ID");
                return false;
            }            
        }
    </script>
</asp:Content>
