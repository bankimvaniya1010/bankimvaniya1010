<%@ Page Language="C#" AutoEventWireup="true" CodeFile="coursemaster.aspx.cs" Inherits="admin_coursemaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Course Master</li>
        </ol>
        <h1 class="h2">Course Master</h1>
        
        <div class="card">

             <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                <div class="form-row">
                    <a href="createcourse.aspx"  style="margin-left:20px; margin-top:10px;" class="btn btn-success">Create Course</a>
                   
                </div>
            </div>
            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="CourseGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="Courseid"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="CourseGridView_RowEditing" >

                       <Columns>
                           <asp:BoundField DataField="Courseid" HeaderText="Course ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="Courseid" />
                           <asp:TemplateField HeaderText="Course Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblcourseName" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Major Discipline Name">
                               <ItemTemplate>
                                    <asp:Label ID="lbldisciplineName" runat="server" Text='<%# Bind("displineDesc") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Study Mode">
                               <ItemTemplate>
                                    <asp:Label ID="lblstudyMode" runat="server" Text='<%# Bind("studyDesc") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Study Level">
                               <ItemTemplate>
                                    <asp:Label ID="lblStudyLevel" runat="server" Text='<%# Bind("studylevel") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course Fee">
                               <ItemTemplate>
                                    <asp:Label ID="lblCourseFee" runat="server" Text='<%# Bind("coursefee") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                       </Columns>
                   </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#universitymenu_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#coursemaster').addClass('active');
	    });
	</script>
</asp:Content>
