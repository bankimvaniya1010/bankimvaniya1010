<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selfassesment.aspx.cs" Inherits="selfassesment" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Self Assesment</li>
        </ol>
        <h1 class="h2">Self Assesment</h1>

    </div>
    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Personal">
                                    <div class="form-row">
                                        <label id="label-Personal" for="Personal" class="col-md-3 col-form-label form-label"><%=Personal %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdPersonal1" runat="server" GroupName="Personal" Text="1" />
                                            <asp:RadioButton ID="rdPersonal2" runat="server" GroupName="Personal" Text="2" />
                                            <asp:RadioButton ID="rdPersonal3" runat="server" GroupName="Personal" Text="3" />
                                            <asp:RadioButton ID="rdPersonal4" runat="server" GroupName="Personal" Text="4" />
                                            <asp:RadioButton ID="rdPersonal5" runat="server" GroupName="Personal" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Academic">
                                    <div class="form-row">
                                        <label id="label-Academic" for="Academic" class="col-md-3 col-form-label form-label"><%=Academic %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdAcademic1" runat="server" GroupName="Academic" Text="1" />
                                            <asp:RadioButton ID="rdAcademic2" runat="server" GroupName="Academic" Text="2" />
                                            <asp:RadioButton ID="rdAcademic3" runat="server" GroupName="Academic" Text="3" />
                                            <asp:RadioButton ID="rdAcademic4" runat="server" GroupName="Academic" Text="4" />
                                            <asp:RadioButton ID="rdAcademic5" runat="server" GroupName="Academic" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-English">
                                    <div class="form-row">
                                        <label id="label-English" for="English" class="col-md-3 col-form-label form-label"><%=Langugae %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdEnglish1" runat="server" GroupName="English" Text="1" />
                                            <asp:RadioButton ID="rdEnglish2" runat="server" GroupName="English" Text="2" />
                                            <asp:RadioButton ID="rdEnglish3" runat="server" GroupName="English" Text="3" />
                                            <asp:RadioButton ID="rdEnglish4" runat="server" GroupName="English" Text="4" />
                                            <asp:RadioButton ID="rdEnglish5" runat="server" GroupName="English" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Age">
                                    <div class="form-row">
                                        <label id="label-Age" for="Age" class="col-md-3 col-form-label form-label"><%=Age %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdAge1" runat="server" GroupName="Age" Text="1" />
                                            <asp:RadioButton ID="rdAge2" runat="server" GroupName="Age" Text="2" />
                                            <asp:RadioButton ID="rdAge3" runat="server" GroupName="Age" Text="3" />
                                            <asp:RadioButton ID="rdAge4" runat="server" GroupName="Age" Text="4" />
                                            <asp:RadioButton ID="rdAge5" runat="server" GroupName="Age" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Financial">
                                    <div class="form-row">
                                        <label id="label-Financial" for="Financial" class="col-md-3 col-form-label form-label"><%=Finance %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rdFinancial1" runat="server" GroupName="Financial" Text="1" />
                                            <asp:RadioButton ID="rdFinancial2" runat="server" GroupName="Financial" Text="2" />
                                            <asp:RadioButton ID="rdFinancial3" runat="server" GroupName="Financial" Text="3" />
                                            <asp:RadioButton ID="rdFinancial4" runat="server" GroupName="Financial" Text="4" />
                                            <asp:RadioButton ID="rdFinancial5" runat="server" GroupName="Financial" Text="5" />
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
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link active">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                <asp:Button ID="Button2" runat="server" Text="Save Changes" OnClick="btnSelfAssesment_Click" CssClass="btn btn-success" />

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

</asp:Content>
