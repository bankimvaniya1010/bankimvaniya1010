<%@ Page Language="C#" AutoEventWireup="true" CodeFile="languageproficiency.aspx.cs" Inherits="languageproficiency" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">>Language Proficiency</li>
        </ol>
        <h1 class="h2">Language Proficiency</h1>

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
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=TestGiven %>?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdoYes" runat="server" GroupName="English" Text="Yes" />
                                            <asp:RadioButton ID="rdoNo" runat="server" GroupName="English" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=BookedExamDate %></label>
                                        <div class="col-md-9">
                                            <input id="txtEnglishTest" runat="server" type="text" class="form-control" placeholder="Date of Exam booked" data-toggle="flatpickr" value="today">
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=TestName %></label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlEnglish" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="1" Text="IELTS"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PTE"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="TOFEL"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managername">
                                    <div class="form-row">
                                        <label id="label-managername" for="managername" class="col-md-3 col-form-label form-label"><%=OverAll %></label>
                                        <div class="col-md-9">
                                            <input id="txtOverAll" runat="server" type="text" placeholder="Overall score" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-managermobile">
                                    <div class="form-row">
                                        <label id="label-managermobile" for="financial" class="col-md-3 col-form-label form-label"><%=Speaking %></label>
                                        <div class="col-md-9">
                                            <input id="txtSpeaking" runat="server" type="text" placeholder="Speaking" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-managerPhone">
                                    <div class="form-row">
                                        <label id="label-managerPhone" for="managerPhone" class="col-md-3 col-form-label form-label"><%=Listening %></label>
                                        <div class="col-md-9">
                                            <input id="txtListening" runat="server" type="text" placeholder="Listening" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fundtype">
                                    <div class="form-row">
                                        <label id="label-fundtype" for="fundtype" class="col-md-3 col-form-label form-label"><%=Reading %></label>
                                        <div class="col-md-9">
                                            <input id="txtReading" runat="server" type="text" placeholder="Reading" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-acoountholder">
                                    <div class="form-row">
                                        <label id="label-acoountholder" for="acoountholder" class="col-md-3 col-form-label form-label"><%=Writing %></label>
                                        <div class="col-md-9">
                                            <input id="txtWriting" runat="server" type="text" placeholder="Writing" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                                    <div class="form-row">
                                        <label id="label-relationship" for="relationship" class="col-md-3 col-form-label form-label"><%=TestDate %></label>
                                        <div class="col-md-9">
                                              <input id="ProfiencyTestDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                            <asp:GridView ID="grdEnglish" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="grdEnglish_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Test Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server"
                                                                Text='<%#Eval("testId")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Overallscore">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbloverallscore" runat="server" Text='<%#Eval("overallscore")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Speaking">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSpeaking" runat="server" Text='<%#Eval("Speaking")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Reading">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblreading" runat="server" Text='<%#Eval("reading")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Listening">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbllistening" runat="server" Text='<%#Eval("listening")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Writing">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblwriting" runat="server" Text='<%#Eval("writing")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Test Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStart" runat="server" Text='<%#Eval("examDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
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
                                    <a href="languageproficiency.aspx" class="nav-link active">Language Proficiency</a>
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
                                <asp:Button ID="btnProeficiency" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnProeficiency_Click" />

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
        $('#ContentPlaceHolder1_ProfiencyTestDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtEnglishTest').flatpickr({

            dateFormat: 'Y-m-d'
        });

    </script>
</asp:Content>
