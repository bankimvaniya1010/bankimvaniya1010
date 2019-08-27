<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploaddocuments.aspx.cs" Inherits="uploaddocuments" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Upload Document

            </li>
        </ol>
        <h1 class="h2">Upload Document

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <ul class="nav nav-tabs nav-tabs-card">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">Upload Document</a>
                            </li>

                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">


                                <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">File Name</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input id="name" type="text" runat="server" class="form-control" placeholder="File Name" value="">
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="avatar" class="col-sm-3 col-form-label form-label">Documents</label>
                                    <div class="col-sm-9">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <div class="icon-block rounded">
                                                    <i class="material-icons text-muted-light md-36">photo</i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <div class="custom-file" style="width: auto;">
                                                    <asp:FileUpload ID="avatar" runat="server" CssClass="custom-file-input" />

                                                    <label for="avatar" class="custom-file-label">Choose file</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Button ID="btn_login" runat="server" Text="Save Documents" CssClass="btn btn-success" OnClick="btn_login_Click" />

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Repeater ID="rptVideo" runat="server">
                                                    <HeaderTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <table class="table">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("documentname") %>' Font-Bold="true" />
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="btnDownoad" CommandArgument='<%#Eval("filename") %>' runat="server" OnClick="Download">View Documents</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
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

                            <label class="form-label">Passport Size Photo Graph</label>
                            <label class="form-label">Passport Copy (Bio Pages)</label>
                          <%--  <%if ((appDetails.Count > 0) && (appDetails[0].alternativeiddentiproof == 1))
                                { %>
                            <label class="form-label">Proof of Identity </label>
                            <%} %>
                            <%if ((appDetails.Count > 0) && (appDetails[0].alternativedobproof == 1))
                                { %>
                            <label class="form-label">Proof of Date of Birth</label>
                            <%} %>
                            <%if ((appDetails.Count > 0) && (appDetails[0].alternativeresidenceproof == 1))
                                { %>
                            <label class="form-label">Proof of Residence </label>
                            <%} %>--%>
                            <%if ((appEduDetails.Count > 0) && appEduDetails[0].ishighschooldone == 1)
                                { %>
                            <label class="form-label">Proof of High School</label>
                            <%} %>
                            <%if ((appEduDetails.Count > 0) && (appEduDetails[0].issecondarydone == 1))
                                { %>
                            <label class="form-label">Proof of Senior Secondary School</label>
                            <%} %>
                            <%if ((appEduDetails.Count > 0) && (appEduDetails[0].ishighereducation == 1))
                                {
                                    for (int higher = 0; higher < appHigherDetails.Count; higher++)
                                    {
                                        if (appHigherDetails[higher].coursename == "UG")
                                        { %>
                            <label class="form-label">Proof of High Education(UG)</label>
                            <%}

                                if (appHigherDetails[higher].coursename == "PG")
                                { %>
                            <label class="form-label">Proof of High Education(PG)</label>
                            <%}
                                if (appHigherDetails[higher].coursename == "Phd")
                                { %>
                            <label class="form-label">Proof of High Education(Phd)</label>
                            <%}
                                    }
                                }%>
                            <%if ((appEduDetails.Count > 0) && (appEduDetails[0].isdiplomadone == 1))
                                { %>
                            <label class="form-label">Proof of Certificate / Diploma</label>
                            <%} %>
                            <%if ((appLangDetails.Count > 0) && (appLangDetails[0].isenglishintesive == 1))
                                { %>
                            <label class="form-label">Proof of Study - English Language Intensive </label>
                            <%} %>
                            <%if ((appLangDetails.Count > 0) && (appLangDetails[0].testname != ""))
                                { %>
                            <label class="form-label">Proof of English Language Test</label>
                            <%} %>
                            <%if (appEmpDetails.Count > 0)
                                    {
                                        if ((appLangDetails.Count > 0) && (appEmpDetails[0].wishtoaddemployer == 1))
                                        { %>
                            <label class="form-label">Proof of Work Experience </label>
                            <%}
                                    } %>
                        </div>
                    </div>
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploaddocuments').addClass('active');
        });
    </script>
</asp:Content>



