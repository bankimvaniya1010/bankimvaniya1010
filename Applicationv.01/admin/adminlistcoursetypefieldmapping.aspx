<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlistcoursetypefieldmapping.aspx.cs" Inherits="admin_listcoursetypefieldmapping" MasterPageFile="~/admin/admin.master" %>

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
                    <a href="admincoursemapping.aspx"  style="margin-left:20px; margin-top:10px;" class="btn btn-success">Create Course</a>
                   
                </div>
            </div>
            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="CourseGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25" OnRowCommand="CourseGridView_RowCommand"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="Courseid"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found"  OnPageIndexChanging="CourseGridView_PageIndexChanging">

                       <Columns>
                           <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="edititem" CommandArgument='<%# Eval("Courseid") %>' Text="Edit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                           <asp:BoundField DataField="Courseid" HeaderText="Course ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="CourseID" />
                           <asp:TemplateField HeaderText="Course Type">
                               <ItemTemplate>
                                    <asp:Label ID="lblcoursetype" runat="server" Text='<%# Bind("coursetype") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:BoundField DataField="PartnerCourseID" HeaderText="Partner Course ID" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="university_name" HeaderText="Institution Name" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="type" HeaderText="Short Description" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="LearningObjectives" HeaderText="Learning Objectives" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="MainFeatures" HeaderText="Main Features" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="Fee" HeaderText="Fee" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="CourseContent" HeaderText="CourseContent" InsertVisible="False" ReadOnly="True"  />
                           <%--<asp:BoundField DataField="EligibleforGovtSubsidy" HeaderText="Eligible for Govt Subsidy" InsertVisible="False" ReadOnly="True"  />--%>
                           <%--<asp:BoundField DataField="DescriptionofGovtSubsidy" HeaderText="Description of Govt Subsidy" InsertVisible="False" ReadOnly="True"  />--%>
                         <%--  <asp:BoundField DataField="EligibleforScholarship" HeaderText="Description of Govt Subsidy" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="InstructorDirectorName1" HeaderText="Instructor Director Name" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="InstructorDirectorDescription1" HeaderText="Instructor Director Name" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="InstructorDirectorName2" HeaderText="Instructor Director Name" InsertVisible="False" ReadOnly="True"  />
                           <asp:BoundField DataField="InstructorDirectorDescription2" HeaderText="Instructor Director Name" InsertVisible="False" ReadOnly="True"  />--%>
                         
                           
                       </Columns>
                   </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#course_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#coursemaster').addClass('active');
	    });
	</script>
</asp:Content>
