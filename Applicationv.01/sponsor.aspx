<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sponsor.aspx.cs" Inherits="sponsor" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Sponsors Detail</li>
        </ol>
        <h1 class="h2">Sponsors Detail</h1>

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
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=NameOFSponsor %></label>
                                        <div class="col-md-9">
                                            <input id="txtSponsor" runat="server" type="text" placeholder="Name of Sponsor" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=Relationship %></label>
                                        <div class="col-md-9">
                                            <input id="txtRelationship" runat="server" type="text" placeholder="Relationship" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=Designation %></label>
                                        <div class="col-md-9">
                                            <input id="txtSponsarDesignation" runat="server" type="text" placeholder="Designation" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managername">
                                    <div class="form-row">
                                        <label id="label-managername" for="managername" class="col-md-3 col-form-label form-label"><%=EmployersDetail %></label>
                                        <div class="col-md-9">
                                            <input id="txtEmployers" runat="server" type="text" placeholder="Employers details" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-managermobile">
                                    <div class="form-row">
                                        <label id="label-managermobile" for="financial" class="col-md-3 col-form-label form-label"><%=AnnualIncome %></label>
                                        <div class="col-md-9">
                                            <input id="txtAnnual" runat="server" type="text" placeholder="Annual Income" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managerPhone">
                                    <div class="form-row">
                                        <label id="label-managerPhone" for="managerPhone" class="col-md-3 col-form-label form-label"><%=ITR %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdITRYes" runat="server" GroupName="ITR" Text="Yes" />
                                            <asp:RadioButton ID="rdITRNo" runat="server" GroupName="ITR" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fundtype">
                                    <div class="form-row">
                                        <label id="label-fundtype" for="fundtype" class="col-md-3 col-form-label form-label"><%=DurationFrom %></label>
                                        <div class="col-md-9">
                                             <input id="txtSponsersFrom" runat="server" type="text" class="form-control" placeholder="Duration From" data-toggle="flatpickr" value="today">
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-acoountholder">
                                    <div class="form-row">
                                        <label id="label-acoountholder" for="acoountholder" class="col-md-3 col-form-label form-label"><%=DurationTo %></label>
                                        <div class="col-md-9">
                                               <input id="txtSponsersTo" runat="server" type="text" class="form-control" placeholder="Duration to" data-toggle="flatpickr" value="today">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                            <asp:GridView ID="grdSponsers" runat="server" CssClass="table" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblname" runat="server"
                                                                Text='<%#Eval("name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Employment Details">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblemployment_details" runat="server"
                                                                Text='<%#Eval("employment_details")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldesignation" runat="server"
                                                                Text='<%#Eval("designation")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Relationship">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrelationship" runat="server"
                                                                Text='<%#Eval("relationship")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Annual Income">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblannualincome" runat="server"
                                                                Text='<%#Eval("annualincome")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="FiledITR">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblisfiledItr" runat="server"
                                                                Text='<%#Eval("isfiledItr").ToString() == "0" ? "NO" : "YES"%>'></asp:Label>
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
                                    <a href="sponsor.aspx" class="nav-link active">Sponsors Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                <asp:Button ID="btnSponsors" runat="server" Text="Save Changes" OnClick="btnSponsers_Click" CssClass="btn btn-success" />

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
        $('#ContentPlaceHolder1_txtSponsersFrom').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtSponsersTo').flatpickr({

            dateFormat: 'Y-m-d'
        });

    </script>
</asp:Content>
