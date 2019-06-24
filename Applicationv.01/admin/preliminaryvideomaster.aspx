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
            <li class="breadcrumb-item active">Preliminary Video Master</li>
        </ol>
        <h1 class="h2">Preliminary Video Master</h1>
          <div class="media align-items-center">  
            <div class="media-left">
                <a class="dropdown-item" href="tutorialmaster.aspx">Add New</a>                          
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="400px"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnDataBound="QuestiontGridView_DataBound" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowDataBound="QuestiontGridView_RowDataBound">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />

                            <asp:TemplateField HeaderText="Video URL" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtVideoURL" TextMode="MultiLine" runat="server" Text='<%# Bind("videourl") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredVideoEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Video Cannot Be Empty' ControlToValidate='txtVideoURL' />
                                </EditItemTemplate>                               
                                <ItemTemplate>
                                    <asp:Label ID="lblVideo" runat="server" Text='<%# Bind("videourl") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="answer1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescriptionEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>                               
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="University" SortExpression="universityid">
                                <EditItemTemplate>
                                     <asp:Label ID="lblUniversityEdit" style="display:none" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlUniversity"  runat="server" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredUniversityEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please Select University ' ControlToValidate='ddlUniversity' />
                                </EditItemTemplate>                             
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="status">
                                <EditItemTemplate>
                                     <asp:CheckBox ID="chkValidEdit" runat="server"  />             </EditItemTemplate>
                               
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

                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />


                        </Columns>



                    </asp:GridView>
                </div>


            </div>
        </div>

    </div>
</asp:Content>


