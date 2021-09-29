<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicant_sop.aspx.cs" Inherits="applicant_sop" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Applicant SOP (Statement of purpose)

            </li>
        </ol>
        <h1 class="h2">YOUR SOP (STATEMENT OF PURPOSE)</h1>
    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-md-8">
                    <div class="card" runat="server">
                        <div class="card-body list-group-fit">
                            <h3>INSTRUCTION FOR WRITING YOUR STATEMENT OF PURPOSE (SOP) / ESSAY:</h3>
                            <div class="list-group list-group-fit" runat="server" id="universityInstruction">
                            </div>
                            <br/>
                            <h3>Student SOP:</h3>
                            <div class="list-group list-group-fit" runat="server" id="studentSOP">
                                <asp:TextBox ID="txtStudentSOP" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>

                        <div class="card-footer" runat="server">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClientClick="return validateForm()" OnClick="btnsubmit_Click" />
                            <input id="btnEdit" type="button" runat="server" class="btn btn-success" value="Edit" />
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSave_Click" OnClientClick="return validateForm()" />
                            
                            <div style="margin-left:60%">
                                <asp:Button ID="gotoNextPage" runat="server" Text="Go to Credit Transfer section" CssClass="btn btn-success" OnClick="gotoNextPage_Click" />
                            </div>
                            

                        </div>                       
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="Div1" runat="server">
                        <div class="card-body">
                            <%  if (allfaqQuestion.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                <h5>Frequently Asked Questions (FAQs)</h5>
                                <div class="">
                                    <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                        {%>
                                    <div class="star-list">
                                        <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allfaqQuestion[q].question%> </label>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        function validateForm() {
            if ($('#<%=txtStudentSOP.ClientID%>').val() == "" || $('#<%=txtStudentSOP.ClientID%>').val() == null) {
                alert("SOP text block is empty. Please fill SOP block as per instruction before proceeding.");
                return false;
            }
            if ($('#<%=txtStudentSOP.ClientID%>').val().match(/\S+/g).length > 200) {
                alert("SOP exceeds 200 words. Please review SOP once again before proceeding.");
                return false;
            }
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#your_sop').addClass('active');

            $("#<%=btnEdit.ClientID%>").click(function () {
                var btnEdit = this;
                btnEdit.style.display = "none";

                $("#<%=btnsubmit.ClientID%>").hide();
                $("#<%=btnSave.ClientID%>").show();
            });
        });
    </script>
</asp:Content>
