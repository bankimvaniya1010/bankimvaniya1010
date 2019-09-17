<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuniversitycrendentials.aspx.cs" Inherits="admin_createuniversitycrendentials" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create Credentials</li>
        </ol>

        <h1 class="h2">Create Credentials</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="university" class="col-sm-3 col-form-label form-label">Select University</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="credetialDescription" class="col-sm-3 col-form-label form-label">Credential Description</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCredDescription" type="text" runat="server" class="form-control" placeholder="Credentials Descriptions" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="rankType1" class="col-sm-3 col-form-label form-label">Rank Type 1</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtRankType1" type="text" runat="server" class="form-control" placeholder="Overall Rank Type 1" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="rankType2" class="col-sm-3 col-form-label form-label">Rank Type 2</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtRankType2" type="text" runat="server" class="form-control" placeholder="Overall Rank Type 2" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="rankType3" class="col-sm-3 col-form-label form-label">Rank Type 3</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtRankType3" type="text" runat="server" class="form-control" placeholder="Overall Rank Type 3" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="rankSubject" class="col-sm-3 col-form-label form-label">Ranking by Subject</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtRankSubject" type="text" runat="server" class="form-control" placeholder="Ranking by Subject" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="rankRegion" class="col-sm-3 col-form-label form-label">Ranking by Region</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtRankRegion" type="text" runat="server" class="form-control" placeholder="Ranking by Region" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                         <label for="awards" class="col-sm-3 col-form-label form-label">Awards</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtAwards" type="text" runat="server" class="form-control" placeholder="Awards" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()"/>
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

            var txtCredDescription = $('#<%=txtCredDescription.ClientID%>').val();
            var txtRankType1 = $('#<%=txtRankType1.ClientID%>').val();
            var txtRankType2 = $('#<%=txtRankType2.ClientID%>').val();
            var txtRankType3 = $('#<%=txtRankType3.ClientID%>').val();
            var txtRankSubject = $('#<%=txtRankSubject.ClientID%>').val();
            var txtRankRegion = $('#<%=txtRankRegion.ClientID%>').val();
            var universityValue = $('#<%=ddlUniversity.ClientID%>').val();
            var txtAwards = $('#<%=txtAwards.ClientID%>').val();
   
            if (universityValue == 0 || isNaN(parseInt(universityValue))) {
                alert("Please select university");
                return false;
            }
            else if (txtCredDescription == '') {
                alert("Please enter description for crendential");
                return false;
            }
            else if (txtRankType1 == '') {
                alert("Please enter rank type 1");
                return false;
            }
            else if (txtRankType2 == '') {
                alert("Please enter rank type 2");
                return false;
            }
            else if (txtRankType3 == '') {
                alert("Please enter rank type 3");
                return false;
            }
            else if (txtRankSubject == '') {
                alert("Please enter ranking by Subject");
                return false;
            }
            else if (txtRankRegion == '') {
                alert("Please enter ranking by Region");
                return false;
            }
            else if (txtAwards == '') {
                alert("Please enter awards for university");
                return false;
            }
                
            return true;
            
        }
        $(document).ready(function () {
	            $('.sidebar-menu-item').removeClass('open');
	            $('#universitymenu_list').addClass('open');
	            $('.sidebar-menu-item').removeClass('active');
	            $('#createuniversitycrendentials').addClass('active');
	        });
    </script>

</asp:Content>
