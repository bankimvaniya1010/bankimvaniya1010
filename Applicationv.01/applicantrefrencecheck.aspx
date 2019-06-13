<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantrefrencecheck.aspx.cs" Inherits="applicantrefrencecheck" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Refernece Check</li>
        </ol>
        <h1 class="h2">Applicant Refernece Check</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="Name" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelname" runat="server" for="email" class="col-md-3 col-form-label form-label">Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtName" runat="server" type="text" placeholder="Name" value="" required="" class="form-control">
                                            <span class="helpicon"><i id="icName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Mobile" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-6">
                                            <input id="txtMobile" runat="server" type="tel" placeholder="Mobile/Cellular Number" required="" value="" class="form-control">
                                            <span class="helpicon"><i id="icMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Email" runat="server" style="display: none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="labelEmail" runat="server" for="phone" class="col-md-3 col-form-label form-label">Email</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email">
                                            <span class="helpicon"><i id="icEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btnReference" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnReference_Click" OnClientClick="return validateForm()" />
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="highergrade">
                        <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">

                            <div class="form-row">
                                <div class="col-md-9">
                                    <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                        <asp:GridView ID="grdRefernce" DataKeyNames="id" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDeleting="grdtrefernce_RowDeleting" OnDataBound="grdRefernce_DataBound" OnRowCommand="grdRefernce_RowCommand" OnRowEditing="grdRefernce_RowEditing">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server"
                                                            Text='<%#Eval("Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Email">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmail" runat="server"
                                                            Text='<%#Eval("email")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Mobile">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMobile" runat="server"
                                                            Text='<%#Eval("Mobile")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container page__container">
        <div class="footer">
        </div>
    </div>
    <script>
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }

        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            TextBox txtDynamic = (TextBox)mainDiv.FindControl("txt" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if ($("#<%=txtDynamic.ClientID%>").val() == "") {
                alert("Please enter <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }

        function validateForm() {
            var flag = false;
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (!$("#<%=Name.ClientID%>").is(':hidden') && $("#<%=txtName.ClientID%>").val() == "")
                alert("Please Enter Name");
            else if (!$("#<%=Mobile.ClientID%>").is(':hidden') && $("#<%=txtMobile.ClientID%>").val() == "")
                alert("Please Enter Mobile Number");
            else if (!$("#<%=Email.ClientID%>").is(':hidden') && $("#<%=txtEmail.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtEmail.ClientID%>").val())))
                alert("Please Enter Valid Email");
            else
                flag = true;
            if (flag == true)
                flag = customcontrolValidation();
            return flag;
        }

        $(document).ready(function () {

            $('.fa-question-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
            var input = document.querySelector("#ContentPlaceHolder1_txtMobile");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });

        });

    </script>
</asp:Content>


