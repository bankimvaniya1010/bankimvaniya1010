<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_exampaper.aspx.cs" Inherits="admin_list_exampaper" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Create Assessment</li>
        </ol>
        <h1 class="h2">Create Assessment</h1> 
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
                           <label for="name" class="col-sm-3 col-form-label form-label">Select Creator</label>
                           <div class="col-sm-8">
                               <div class="row">
                                   <div class="col-md-6">
                                       <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged"></asp:DropDownList>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="form-group row">
                           <label for="name" class="col-sm-3 col-form-label form-label">Enter Creator Passkey</label>
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

         <div runat="server" id="creatediv" style="display:none">
               <div class="media align-items-center">  
            <div class="form-row">
               <asp:Button ID="btn_addnew" runat="server" Text="Create New" CssClass="btn btn-success" OnClick="btn_addnew_Click"/>
            </div>
        </div>
               <div class="card">
                  
            <div class="tab-content card-body" id="gridDiv" runat="server">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="exampapersid"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowCommand="QuestiontGridView_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="exampapersid" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="exampapersid" />
                           
                            <asp:TemplateField HeaderText="Institution">
                                <ItemTemplate>
                                    <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Assessment Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("paper_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  

                             <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                                <ItemTemplate>
                                     <a href="<%# Eval("editpageLink") %>">Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Assessment Name">
                                <ItemTemplate>
                                    <a href="<%# Eval("uploadpagelink") %>">Uploaded Paper</a>
                                </ItemTemplate>
                             </asp:TemplateField>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("exampapersid")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("exampapersid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>



                    </asp:GridView>
                </div>


                </div>
            </div>
            </div>
        </div>
    <script>
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
        });
         function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                 alert("Please select institution");
             else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
               alert("Please select creator");
           else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey");
            else
                flag = true;
            return flag;
        }
    </script>
</asp:Content>





