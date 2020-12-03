<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_assignList.aspx.cs" Inherits="admin_exam_assignList" MasterPageFile="~/admin/admin.master" %>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Assign Assessment</li>
        </ol>
        <h1 class="h2">Assign Assessment</h1>
        <div id="validateDiv" runat="server" class="card">
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Assigner</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Enter Assigner Passkey</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" runat="server" id="txtpasskey" class="form-control" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-8 offset-sm-3">
                    <div class="media align-items-center">
                        <div class="media-left">
                            <asp:Button ID="btn_submit" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                            <div class="col-md-20">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="creatediv" style="display: none">
            <div class="media align-items-center">
                <div class="form-row">
                    <asp:Button ID="btn_addnew" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="btn_addnew_Click"/>
                </div>
            </div>
            <div class="card">


                <div class="tab-content card-body">
                    <%--<div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>--%>
                     <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Class</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" ID="ddlclass" CssClass="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Group</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgroup" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Subject</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubjcet" OnSelectedIndexChanged="ddlsubjcet_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Assessment</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Scheduled Date & Time</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlExamDateTime" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlExamDateTime_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    <div runat="server" id="DivGrid">
                    <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="assignid"
                            AllowPaging="True"
                            CellPadding="2"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px"
                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging">

                            <Columns>

                                <asp:BoundField DataField="assignid" HeaderText="Id" InsertVisible="False"
                                    ReadOnly="True" SortExpression="assignid" />

                                <asp:TemplateField HeaderText="Institution">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assessment Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpapername" runat="server" Text='<%# Bind("paper_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Applicant ID Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltimezone" runat="server" Text='<%# Bind("studentname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Assessment Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lblutcdatetime" runat="server" Text='<%# Bind("exam_datetime") %>'></asp:Label>
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
    <script>
        function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select University");
            else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                alert("Please select Assigner");
            else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey");
            else
                flag = true;
            return flag;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#examsassign').addClass('active');
        });

    </script>
</asp:Content>
