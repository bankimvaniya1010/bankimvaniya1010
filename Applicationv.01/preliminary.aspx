<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preliminary.aspx.cs" Inherits="preliminary" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Preliminary Step</li>
        </ol>
        <h1 class="h2">Preliminary Step </h1>

    </div>
    <div class="page ">

        <div class="row" style="margin-left:50px;">
            <div class="col-md-8">

                <div class="card">

                    <div class="card-body">
                        After viewing the below videos, Please proceed for Answer
                         <asp:Button ID="btnAnswer" runat="server" CssClass="btn btn-success" Text="Ready To Answer" OnClick="btnAnswer_Click" />
                    </div>

                </div>
                <div class="card" id="questions" runat="server">
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("preliminaryid") %>'></asp:Label>
                                    </div>
                                    <div class="media align-items-center">

                                        <div class="media-left">
                                            <h4 class="mb-0"><strong># 
                                               <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label></strong></h4>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="card-title">
                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>?
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <%-- <div class="form-group">

                                            <input id="customCheck01" type="checkbox" class="custom-control-input">
                                            <label for="customCheck01" class="custom-control-label">
                                                <asp:Label ID="lblquestion" runat="server" Text='<%# Eval("answerdescription") %>'></asp:Label></label>

                                        </div>--%>

                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("Answer1") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("Answer2") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("Answer3") %>' />
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("Answer4") %>' />
                                    </div>

                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" />

                        <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                    </div>
                </div>
                <div class="card" id="results" runat="server">
                    <div class="card-header">
                        <h4 class="card-title">Result</h4>
                    </div>
                    <div class="card-body media align-items-center">
                        <div class="media-body">
                            <h4 class="mb-0"><%=Score %></h4>
                            <span class="text-muted-light"><%=Results %></span>
                        </div>

                    </div>
                </div>

                <div class="card" id="video" runat="server">
                    <%for (int v = 0; v < VideoList.Count; v++)
                        { %>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="<%=VideoList[v].videourl %>" allowfullscreen=""></iframe>
                    </div>
                    <div class="card-body">
                        <%=VideoList[v].description %>
                    </div>
                    <%} %>
                </div>

            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="secured.pdf" target="_blank" class="btn btn-primary btn-block flex-column">
                            <i class="material-icons">get_app</i> Download  Inforamtion 1
                        </a>
                    </div>
                    <div class="card-body">
                        <a href="wikipedia.pdf" target="_blank" class="btn btn-primary btn-block flex-column">
                            <i class="material-icons">get_app</i> Download  Inforamtion 2
                        </a>
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


