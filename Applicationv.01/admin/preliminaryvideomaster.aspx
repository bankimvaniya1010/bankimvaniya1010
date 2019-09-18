<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preliminaryvideomaster.aspx.cs" Inherits="admin_preliminaryvideomaster" MasterPageFile="~/admin/admin.master" %>
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
            <li class="breadcrumb-item active">Tutorial Master</li>
        </ol>
        <h1 class="h2">Tutorial Master</h1>
          <div class="media align-items-center">  
            <div class="form-row">
                <a href="tutorialmaster.aspx" class="btn btn-success">Add New</a>
                                      
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnDataBound="QuestiontGridView_DataBound" OnRowDeleting="QuestiontGridView_RowDeleting" >

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                           
                            <asp:TemplateField HeaderText="Description" SortExpression="answer1">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                            
                            <asp:TemplateField HeaderText="type" SortExpression="type">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Institution" SortExpression="universityid">                                                           
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="status">  
                                <ItemTemplate>
                                     <asp:CheckBox ID="chkValid" runat="server" Checked='<%# bool.Parse(Eval("status").ToString()=="1"?"True":"False") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>                          


                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>                              

                                <ItemTemplate>
                                    <a href="/admin/tutorialmaster.aspx?id=<%# Eval("id") %>">Edit</a>
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />


                        </Columns>



                    </asp:GridView>
                </div>


                </div>
            </div>

        </div>
    <script>
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#admin_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#preliminaryvideomaster').addClass('active');
        });
	</script>
</asp:Content>


