<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicant_sop.aspx.cs" Inherits="applicant_sop" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant SOP (Statement of purpose)

            </li>
        </ol>
        <h1 class="h2">Your SOP (Statement of purpose)</h1>
    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-md-8">
                    <div class="card" runat="server">
                        <div class="card-body list-group-fit">
                            <h3>INSTRUCTIONS FOR WRITING YOUR SOP</h3>
                            <div class="list-group list-group-fit" runat="server" id="universityInstruction">
                            </div>
                            <br/>
                            <h3>Student SOP:</h3>
                            <div class="list-group list-group-fit" runat="server" id="studentSOP">
                                <asp:TextBox ID="txtStudentSOP" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>

                        </div>

                        <div class="card-footer" runat="server">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClientClick="return validateForm()" OnClick="btnsubmit_Click" />
                            <input id="btnEdit" type="button" runat="server" class="btn btn-success" value="Edit" />
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSave_Click" OnClientClick="return validateForm()" />

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
                                <h5>FAQ's</h5>
                                <div class="">
                                    <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                        {%>
                                    <div>
                                        <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer%>')">* <%=allfaqQuestion[q].question%> </label>
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
            $('#student_application').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#your_application').addClass('active');

            $("#<%=btnEdit.ClientID%>").click(function () {
                var btnEdit = this;
                btnEdit.style.display = "none";

                $("#<%=btnsubmit.ClientID%>").hide();
                $("#<%=btnSave.ClientID%>").show();
            });
        });
    </script>
</asp:Content>
