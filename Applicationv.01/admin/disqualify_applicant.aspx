<%@ Page Language="C#" AutoEventWireup="true" CodeFile="disqualify_applicant.aspx.cs" Inherits="admin_disqualify_applicant" MasterPageFile="~/admin/admin.master" %>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript">
        
        function ConfirmOnResend(item) {
            var txt;
            var person = prompt("Please enter reason for disqualify:", "");
            if (person == "") {
                alert("Please enter reason for disqualify");
                return false;
            }
            else if (person == null)
                return false;
            else {
                txt =  person ;
            }
            $("#<%= Hidpassword.ClientID%>").val(txt).html(txt);
        }
    </script>
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Disqualify Applicant</li>
        </ol>
        <h1 class="h2">Disqualify Applicant</h1>
        <div class="row" style="margin-right: -1.625rem;">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">
                                <div id="validatediv" runat="server">
                                    <div class="form-group row" runat="server">
                                        <label for="name" class="col-sm-4 col-form-label form-label">Select Institution </label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="name" class="col-sm-4 col-form-label form-label">Assign Invigilator</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <asp:DropDownList ID="ddlproctor" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="name" class="col-sm-4 col-form-label form-label">Invigilator Passkey</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <input type="text" id="txtproctorpasskey" runat="server" class="form-control" autocomplete="off"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                                    <div class="col-md-20">
                                                        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="disqualify" runat="server" style="display: none">
                                    <asp:HiddenField runat="server" ID="Hidpassword"/>
                                    <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                        <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="assignid"
                                            AllowPaging="True"
                                            CellPadding="2"
                                            PageSize="25"
                                            BorderStyle="None"
                                            BorderWidth="1px"
                                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowCommand="QuestiontGridView_RowCommand" OnRowDataBound="QuestiontGridView_RowDataBound" OnDataBinding="QuestiontGridView_DataBinding">

                                            <Columns>

                                                <asp:BoundField DataField="assignid" HeaderText="Id" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="assignid" />

                                                <asp:TemplateField HeaderText="Institution">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Applicant ID Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltimezone" runat="server" Text='<%# Bind("studentname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Assessment Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpapername" runat="server" Text='<%# Bind("paper_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                              

                                                <asp:TemplateField HeaderText="Assessment Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblutcdatetime" runat="server" Text='<%# Bind("exam_datetime") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Verified">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblisverified" runat="server" Text='<%# Bind("isverified")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Disqualify Reason">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldisqualify_reason" runat="server" Text='<%# Bind("disqualify_reason") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkSubmit" runat="server" CommandName="Disqualify" Text="Disqualify" CommandArgument='<%#Eval("assignid")%>' OnClientClick='<%# Eval("assignid","return ConfirmOnResend({0})") %>'></asp:LinkButton>
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
        </div>
    </div>


    <script>

        function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please Select University");
            else if ($("#<%=ddlproctor.ClientID%>").val() == "0")
                alert("Please select invigilator");
            else if ($("#<%=txtproctorpasskey.ClientID%>").val() == "")
                alert("Please enter virtual link");
            else
                flag = true;
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#examdisqualify').addClass('active');
        });
    </script>
</asp:Content>
