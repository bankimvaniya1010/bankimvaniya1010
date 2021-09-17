<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="ec_declareaion.aspx.cs" Inherits="ec_declareaion" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR DECLARATION</li>
        </ol>
        <h1 class="h2">YOUR DECLARATION</h1>

        <h3 class="h3">Please read and accept the following Declaration:</h3>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row" style="width: 50%;">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="transportchoice" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <asp:Label ID="lbl_heading" Font-Bold="true" style="font-size:20px;" runat="server" class="col-md-11 col-form-label form-label"></asp:Label><br />
                                        <asp:Label ID="lbl_description" runat="server" class="col-md-11 col-form-label form-label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-left: 40px;" id="btnDiv" runat="server">
            <asp:Button ID="btn_yes" runat="server" Text="Yes, I Have" CssClass="btn btn-success" Style="margin-right: 10px;" OnClick="btn_yes_Click" />
            <asp:Button ID="btn_no" runat="server" Text="No, I Do Not Accept" CssClass="btn btn-success" Style="margin-right: 10px;" OnClick="btn_no_Click" />
        </div>
        <div class="container page__container">
            <div class="footer">
            </div>
        </div>
    </div>
    <script>         
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#ec_declareaion').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#ec_declareaion').addClass('active');
        });
    </script>
</asp:Content>

