<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_assignList.aspx.cs" Inherits="admin_exam_assignList" MasterPageFile="~/admin/admin.master"%>


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
            <li class="breadcrumb-item active">Exam Assigned</li>
        </ol>
        <h1 class="h2">Exam Module</h1>
          <div class="media align-items-center">  
            <div class="form-row">
                <a href="exam_assign.aspx" class="btn btn-success">Add New</a>
                                      
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
                  <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="assignid"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found">

                        <Columns>

                            <asp:BoundField DataField="assignid" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="assignid" />
                           
                            <asp:TemplateField HeaderText="Institution">
                                <ItemTemplate>
                                    <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Exam Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblpapername" runat="server" Text='<%# Bind("paper_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                            
                             <asp:TemplateField HeaderText="Applicant ID Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbltimezone" runat="server" Text='<%# Bind("studentname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  
                           
                             <asp:TemplateField HeaderText="Exam Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblutcdatetime" runat="server" Text='<%# Bind("exam_datetime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  


                          <%--  <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>                              

                                <ItemTemplate>
                                    <a href="/admin/create_exampaper.aspx?exampapersid=<%# Eval("exampapersid") %>">Edit</a>
                                </ItemTemplate>

                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("exampapersid")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("exampapersid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>--%>


                        </Columns>



                    </asp:GridView>
                </div>


                </div>
            </div>

        </div>
    <script>
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#examsassign').addClass('active');
        });
        
    </script>
</asp:Content>