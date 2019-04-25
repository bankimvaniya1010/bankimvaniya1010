<%@ Page Language="C#" AutoEventWireup="true" CodeFile="financial.aspx.cs" Inherits="financial" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Financial Information</li>
        </ol>
        <h1 class="h2">Financial Information</h1>

    </div>
    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-financial">
                                    <div class="form-row">
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=NameOFInstitue %></label>
                                        <div class="col-md-9">
                                            <input id="txtFinancialName" runat="server" type="text" placeholder="Name of Financial Institution" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=BranchAddress %></label>
                                        <div class="col-md-9">
                                            <input id="txtBranchAddress" runat="server" type="text" placeholder="Branch Address" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=PhoneNumber %></label>
                                        <div class="col-md-9">
                                            <input id="txtBranchPhone" runat="server" type="text" placeholder="Branch Phone no" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managername">
                                    <div class="form-row">
                                        <label id="label-managername" for="managername" class="col-md-3 col-form-label form-label"><%=ManagerName %></label>
                                        <div class="col-md-9">
                                            <input id="txtManagerName" runat="server" type="text" placeholder="Branch Manager's Name" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-managermobile">
                                    <div class="form-row">
                                        <label id="label-managermobile" for="financial" class="col-md-3 col-form-label form-label"><%=ManagerMobile %></label>
                                        <div class="col-md-9">
                                            <input id="txtManagerMobile" runat="server" type="text" placeholder=" Manager Mobile No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managerPhone">
                                    <div class="form-row">
                                        <label id="label-managerPhone" for="managerPhone" class="col-md-3 col-form-label form-label"><%=ManagerPhone %></label>
                                        <div class="col-md-9">
                                            <input id="txtManagerPhoneNo" runat="server" type="text" placeholder="Manager Phone number" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fundtype">
                                    <div class="form-row">
                                        <label id="label-fundtype" for="fundtype" class="col-md-3 col-form-label form-label"><%=TypeOFFunds %></label>
                                        <div class="col-md-9">
                                            <input id="txtFundType" runat="server" type="text" placeholder="Type of Funds" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-acoountholder">
                                    <div class="form-row">
                                        <label id="label-acoountholder" for="acoountholder" class="col-md-3 col-form-label form-label"><%=AccountHolderName %></label>
                                        <div class="col-md-9">
                                            <input id="txtAccountHolderName" runat="server" type="text" placeholder="Account Holder Name" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                                    <div class="form-row">
                                        <label id="label-relationship" for="relationship" class="col-md-3 col-form-label form-label"><%=Relations %></label>
                                        <div class="col-md-9">
                                            <input id="txtRelationshipWithApplicant" runat="server" type="text" placeholder="Relationship to the Applicant" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-accountno">
                                    <div class="form-row">
                                        <label id="label-accountno" for="accountno" class="col-md-3 col-form-label form-label"><%=AccountNo %></label>
                                        <div class="col-md-9">
                                            <input id="txtAccountno" type="text" runat="server" placeholder="Account Number" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-openiningdate">
                                    <div class="form-row">
                                        <label id="label-openiningdate" for="relationship" class="col-md-3 col-form-label form-label"><%=AccountOpeningDate %></label>
                                        <div class="col-md-9">
                                            <input id="txtAccountopeningdate" runat="server" type="text" class="form-control" placeholder="Account opening Date" data-toggle="flatpickr" value="today">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-accountbalance">
                                    <div class="form-row">
                                        <label id="label-accountbalance" for="accountbalance" class="col-md-3 col-form-label form-label"><%=AccountBalance %></label>
                                        <div class="col-md-9">
                                            <input id="txtBalanceAmount" runat="server" type="text" placeholder="Account Number" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                            <asp:GridView ID="grdLoans" Visible="true" runat="server" CssClass="table" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblfinancial_intstitue_name" runat="server"
                                                                Text='<%#Eval("financial_intstitue_name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbladdress" runat="server"
                                                                Text='<%#Eval("address")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Contact No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcontact_no" runat="server"
                                                                Text='<%#Eval("contact_no")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbranch_manager_name" runat="server"
                                                                Text='<%#Eval("branch_manager_name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Contactno">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbranch_manager_contactno" runat="server"
                                                                Text='<%#Eval("branch_manager_contactno")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Mobile">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbranch_manager_mobile" runat="server"
                                                                Text='<%#Eval("branch_manager_mobile")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Fund Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbltypeoffunds" runat="server"
                                                                Text='<%#Eval("typeoffunds")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Account Holder Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblaccountholdername" runat="server" Text='<%#Eval("accountholdername") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Relationship">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrelationship" runat="server" Text='<%#Eval("relationship") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Accountno">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblaccountno" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblaccountbalance" runat="server" Text='<%#Eval("accountbalance") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Opening Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblaccountopeningDate" runat="server" Text='<%#Eval("accountopeningDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
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
                                    <a href="basicprofile.aspx" class="nav-link ">Basic Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="educationinfo.aspx" class="nav-link">Education Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="languageproficiency.aspx" class="nav-link ">Language Proficiency</a>
                                </li>
                                <li class="nav-item">
                                    <a href="backlog.aspx" class="nav-link">Backlog</a>
                                </li>
                                <li class="nav-item">
                                    <a href="employerinfo.aspx" class="nav-link ">Employers Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="sponsor.aspx" class="nav-link">Sponsors Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="financial.aspx" class="nav-link active">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                <asp:Button ID="Button1" runat="server" Text="Save Changes" OnClick="btnFinancial_Click" CssClass="btn btn-success" />

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
        $('#ContentPlaceHolder1_txtAccountopeningdate').flatpickr({

            dateFormat: 'Y-m-d'
        });


    </script>
</asp:Content>
