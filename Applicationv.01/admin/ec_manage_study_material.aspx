<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ec_manage_study_material.aspx.cs" Inherits="admin_ec_manage_study_material" %>


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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Manage Study Material</li>
        </ol>
        <h1 class="h2">CREATE A STUDY MATERIAL</h1>
        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Create A Study Material" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                                <asp:Button ID="btn_downloadexcel" runat="server" Text="Download List of All Study Materials" CssClass="btn btn-success" OnClick="btn_downloadexcel_Click" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="tab-content card-body" id="gridDiv" runat="server" style="white-space: nowrap; text-align: center;">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="grd_study_material" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="material_id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="grd_study_material_PageIndexChanging" OnRowDeleting="grd_study_material_RowDeleting" OnRowCommand="grd_study_material_RowCommand" OnRowEditing="grd_study_material_RowEditing" OnRowDataBound="grd_study_material_RowDataBound">
                        <columns>
                            <asp:TemplateField HeaderText="Delete">
                                <itemtemplate>
                                  <asp:Label ID="lblIsClassInUse" runat="server" Text='<%#Bind("material_In_Use") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("material_id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("material_id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <itemtemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("material_id")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="View">
                                <itemtemplate>
                                    <asp:HyperLink ID="lnk_view" target="_blank" runat="server" href='<%#Eval("Get_Material_link")%>' Text="View" CommandName="View" CommandArgument='<%#Eval("material_type")%>' ></asp:HyperLink>
                                    <%--<asp:HyperLink ID="lnk_view" target="_blank" runat="server" href='<%#Eval("material_link")%>' Text="View" CommandName="View" CommandArgument='<%#Eval("material_type")%>' ></asp:HyperLink>--%>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="material_name" HeaderText="Study Material Name" InsertVisible="False"
                                ReadOnly="True" />
                            <asp:TemplateField HeaderText="Institution Name">
                                <itemtemplate>
                                    <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityid") %>'></asp:Label>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Study Material Type">
                                <itemtemplate>
                                    <asp:Label ID="lbl_type" runat="server" Text='<%# Bind("Get_Material_Name") %>'></asp:Label>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created By">
                                <itemtemplate>
                                    <asp:Label ID="lbl_create" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
                                </itemtemplate>
                            </asp:TemplateField>
                        </columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
     <script>

         $(document).ready(function () {
             $('.sidebar-menu-item').removeClass('open');
             $('#studymateriallist').addClass('open');
             $('.sidebar-menu-item').removeClass('active');
             $('#createstudymaterial6').addClass('active');
         });
     </script>
</asp:Content>
