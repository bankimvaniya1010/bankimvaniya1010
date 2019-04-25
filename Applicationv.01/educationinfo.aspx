<%@ Page Language="C#" AutoEventWireup="true" CodeFile="educationinfo.aspx.cs" Inherits="educationinfo" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Education Info</li>
        </ol>
        <h1 class="h2">Education Info</h1>

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
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=Course %></label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" AutoPostBack="false" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                <asp:ListItem Text="10Th" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="12Th" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Diploma" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="UG" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="PG" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Others" Value="6"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="txtOtherCourse" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=Board %></label>
                                        <div class="col-md-9">
                                            <input id="txtBoardUniversity" runat="server" type="text" placeholder="Board/University" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=Institute %></label>
                                        <div class="col-md-9">
                                            <input id="txtInstitute" runat="server" type="text" placeholder="Institute" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managername">
                                    <div class="form-row">
                                        <label id="label-managername" for="managername" class="col-md-3 col-form-label form-label"><%=Percentage %></label>
                                        <div class="col-md-9">
                                            <input id="txtPercentage" runat="server" type="text" placeholder="Percentage" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-managermobile">
                                    <div class="form-row">
                                        <label id="label-managermobile" for="financial" class="col-md-3 col-form-label form-label"><%=DurationFrom %></label>
                                        <div class="col-md-9">
                                            <input id="durationfrom" runat="server" type="text" class="form-control" placeholder="Durationto" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managerPhone">
                                    <div class="form-row">
                                        <label id="label-managerPhone" for="managerPhone" class="col-md-3 col-form-label form-label"><%=DurationTo %></label>
                                        <div class="col-md-9">
                                            <input id="durationto" runat="server" type="text" class="form-control" placeholder="Durationto" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fundtype">
                                    <div class="form-row">
                                        <label id="label-fundtype" for="fundtype" class="col-md-3 col-form-label form-label"><%=BackLog %></label>
                                        <div class="col-md-9">
                                            <input id="txtRepeats" runat="server" type="text" placeholder="Reapats/Backlog" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                            <asp:GridView ID="grdEducation" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="grdEducation_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCourse" runat="server"
                                                                Text='<%#Eval("courseId")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Board/Univercities">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBoard" runat="server" Text='<%#Eval("board_universityname")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Institute">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstitute" runat="server" Text='<%#Eval("Institute")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Percentage">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpercentage" runat="server" Text='<%#Eval("percentage")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStart" runat="server" Text='<%#Eval("course_startdate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="End Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEnd" runat="server" Text='<%#Eval("course_enddate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Repeats/Backlog">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBacklog" runat="server" Text='<%#Eval("repeats_backlog")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Other Course Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOther" runat="server" Text='<%#Eval("othercourse_name")%>'></asp:Label>
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
                                    <a href="educationinfo.aspx" class="nav-link  active">Education Information</a>
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
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                <asp:Button ID="btnEducation" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnEducation_Click" />

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
        $('#ContentPlaceHolder1_durationfrom').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_durationto').flatpickr({

            dateFormat: 'Y-m-d'
        });

    </script>
</asp:Content>
