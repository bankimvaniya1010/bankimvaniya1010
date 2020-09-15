<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scheduledapplicant_list.aspx.cs" Inherits="admin_scheduledapplicant_list" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>    
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2">Applicant list</h1>
        <div class="card">
            <div class="tab-content card-body">
               <div class="table-responsive">
                    <asp:GridView ID="gvapplicantlist" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="false" EmptyDataText="No Records Found" OnRowCancelingEdit="gvapplicantlist_RowCancelingEdit" OnRowCommand="gvapplicantlist_RowCommand" OnRowEditing="gvapplicantlist_RowEditing" OnRowUpdating="gvapplicantlist_RowUpdating" OnDataBound="gvapplicantlist_DataBound" OnRowDeleting="gvapplicantlist_RowDeleting" OnRowDataBound="gvapplicantlist_RowDataBound" OnPageIndexChanging="gvapplicantlist_PageIndexChanging" OnRowCreated="gvapplicantlist_RowCreated">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />

                            <asp:TemplateField HeaderText="Applicant ID">
                                <EditItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("applicant_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("applicant_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Applicant Name">
                                <EditItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("applicantname") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("applicantname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Institution Name">  
                                <EditItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                    <asp:Label ID="lbluniversityID" runat="server" Text='<%# Bind("universityID") %>' Visible="false"></asp:Label>                                    
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="UTC Meeting Time"> 
                                 <EditItemTemplate>
                                    <asp:Label ID="lblmeetingtime" runat="server" Text='<%# Bind("utc_meeting_time") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblmeetingtime" runat="server" Text='<%# Bind("utc_meeting_time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            
                            <asp:TemplateField HeaderText="Applicant Meeting Time ">  
                                <EditItemTemplate>
                                    <asp:Label ID="lbltimezone" runat="server" Text='<%# Bind("applicant_time_zone") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltimezone" runat="server" Text='<%# Bind("applicant_time_zone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                              
                            <asp:TemplateField HeaderText="OTP"> 
                                <EditItemTemplate>
                                    <asp:Label ID="lblotp" runat="server" Text='<%# Bind("otp") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblotp" runat="server" Text='<%# Bind("otp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Proctor Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtproctorname" TextMode="MultiLine" runat="server" Text='<%# Bind("proctorname") %>' Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Name Cannot Be Empty' ControlToValidate='txtproctorname' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblproctorname" runat="server" Text='<%# Bind("proctorname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Proctor Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtproctorEmail" TextMode="MultiLine" runat="server" Text='<%# Bind("proctorEmail") %>' Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredEdit1' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Email Cannot Be Empty' ControlToValidate='txtproctorEmail' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblproctoremail" runat="server" Text='<%# Bind("proctorEmail") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Proctor Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtproctorMobile" TextMode="MultiLine" runat="server" Text='<%# Bind("proctorMobile") %>' Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredEdit2' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Mobile Cannot Be Empty' ControlToValidate='txtproctorMobile' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblproctormobile" runat="server" Text='<%# Bind("proctorMobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Virtual Meeting Information">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtmeetingInfo" TextMode="MultiLine" runat="server" Text='<%# Bind("meetingInfo") %>' Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredEdit3' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Virtual Meeting Information Cannot Be Empty' ControlToValidate='txtmeetingInfo' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblmeetinginfo" runat="server" Text='<%# Bind("meetingInfo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>                              

                                <ItemTemplate>
                                    <a href="/admin/assignproctor_.aspx?id=<%# Eval("id") %>">Assign Proctor</a>
                                </ItemTemplate>

                            </asp:TemplateField>

                             <%--<asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' CommandArgument='<%#Container.DataItemIndex%>'></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkaddnew" runat="server" CausesValidation="True" CommandName="AddNew" Text="Add New" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>'></asp:LinkButton>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
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
                $('#managemeeting_schedule_list').addClass('open');
                $('.sidebar-menu-item').removeClass('active');
                $('#scheduledapplicant_list').addClass('active');
        });
	</script>
</asp:Content>



