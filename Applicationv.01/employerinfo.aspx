<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employerinfo.aspx.cs" Inherits="employerinfo" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Employment Details</li>
            </ol>
            <h1 class="h2">Employment Details</h1>

        </div>
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-financial">
                                    <div class="form-row">
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=Designation %></label>
                                        <div class="col-md-9">
                                            <input id="txtDesignation" runat="server" type="text" placeholder="Name of Financial Institution" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=Organisation %></label>
                                        <div class="col-md-9">
                                            <input id="txtOrganisation" runat="server" type="text" placeholder="Organisation" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=Contact %></label>
                                        <div class="col-md-9">
                                            <input id="txtContactPerson" runat="server" type="text" placeholder="Contact Person" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managername">
                                    <div class="form-row">
                                        <label id="label-managername" for="managername" class="col-md-3 col-form-label form-label"><%=Salary %></label>
                                        <div class="col-md-9">
                                            <input id="txtSalary" runat="server" type="text" placeholder="Salary" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-managermobile">
                                    <div class="form-row">
                                        <label id="label-managermobile" for="financial" class="col-md-3 col-form-label form-label"><%=DurationFrom %></label>
                                        <div class="col-md-9">
                                            <input id="txtEmploymentStart" runat="server" type="text" class="form-control" placeholder="Duration From" data-toggle="flatpickr" value="today">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managerPhone">
                                    <div class="form-row">
                                        <label id="label-managerPhone" for="managerPhone" class="col-md-3 col-form-label form-label"><%=DurationTo %></label>
                                        <div class="col-md-9">
                                             <input id="txtEmploymentEnd" runat="server" type="text" class="form-control" placeholder="Durationto" data-toggle="flatpickr" value="today">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                            <asp:GridView ID="grdEmployment" runat="server" CssClass="table" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldesignation" runat="server"
                                                                Text='<%#Eval("designation")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Organization">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblorganization" runat="server"
                                                                Text='<%#Eval("organization")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Contact Person">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                Text='<%#Eval("contactpersonwithdetails")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Salary">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSalary" runat="server"
                                                                Text='<%#Eval("salary")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="From">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStart" runat="server" Text='<%#Eval("durationfrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="To">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldurationto" runat="server" Text='<%#Eval("durationto", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div data-perfect-scrollbar>
                        <div class="page-section pt-lg-32pt">
                            <ul class="nav page-nav__menu">
                                <li class="nav-item">
                                    <a href="basicprofile.aspx" class="nav-link">Basic Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="educationinfo.aspx" class="nav-link">Education Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="languageproficiency.aspx" class="nav-link">Language Proficiency</a>
                                </li>
                                <li class="nav-item">
                                    <a href="backlog.aspx" class="nav-link">Backlog</a>
                                </li>
                                <li class="nav-item">
                                    <a href="employerinfo.aspx" class="nav-link active">Employers Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="sponsor.aspx" class="nav-link">Sponsors Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                <asp:Button ID="btnEmployment" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnEmployment_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container page__container">
            <div class="footer">
            </div>
        </div>
    </div>
      <script>
        $('#ContentPlaceHolder1_txtEmploymentStart').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtEmploymentEnd').flatpickr({

            dateFormat: 'Y-m-d'
        });

    </script>
</asp:Content>
