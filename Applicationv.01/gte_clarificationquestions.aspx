<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_clarificationquestions.aspx.cs" Inherits="gte_clarificationquestions" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Clarification Question</li>
        </ol>
        <h1 class="h2">Clarification Question

        </h1>

    </div>

    <div class="page ">

        <div class="row" style="margin-left:50px;">
            <div class="col-md-8">
              
                <div class="card" id="clarity" runat="server">
                    <asp:DataList ID="clarificationList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
                                    <div style="display: none;">
                                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </div>
                                    <div class="media align-items-center">

                                        <div class="media-body">
                                            <h4 class="card-title">
                                                <asp:Label ID="lblClarificationText" runat="server" Text='<%# Eval("clarification_question") %>'></asp:Label>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">

                                    <div class="form-group option">
                                        <asp:TextBox ID="txtResponse" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />

                    </div>
                </div>
                <div class="row" id="completedDiv" runat="server" style="display: none;">
                    <div class="col-md-8">
                        <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
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
        function validateForm() {
            var questionCount = <%=gte_clarificationquestions.QuestionsCount%>;
            for (var i = 0; i < questionCount; i++) {
                var txtBox = $("#ContentPlaceHolder1_clarificationList_txtResponse_" + i);

                if (txtBox.val() == "") {
                    alert("Please select one option for question no: " + (i + 1));
                    return false;
                }
            }
            return true;
        }

          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gteclarification').addClass('active');
        });
    </script>
</asp:Content>