<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_create_assign_instructor.aspx.cs" Inherits="admin_ec_class_create_assign_instructor" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item"><a href="ec_manageclass.aspx">MANAGE CLASSES</a></li>
            <li class="breadcrumb-item">ASSIGN INSTRUCTOR(S)</li>
        </ol>
        <h1 class="h2">ASSIGN INSTRUCTOR(S) To A CLASS</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">

                        <div class="form-group row" id="grade">
                            <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="subject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                            <asp:ListItem Value="2">1-on-1</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Mode</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlmode" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">F2F</asp:ListItem>
                                            <asp:ListItem Value="2">Online</asp:ListItem>
                                            <asp:ListItem Value="3">At Students's Home</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">SELECT Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlclass" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"/>
                                        <asp:HiddenField runat="server" ID="HidClassID" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group row">
                            <label for="name" class="col-sm-4 col-form-label form-label">Select INSTRUCTOR(s) for this class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8 updt-prftbl">
                                        <asp:DropDownList runat="server" ID="ddlintructor" CssClass="form-control"></asp:DropDownList>
                                        <asp:RadioButtonList runat="server" ID="ddlinstr"></asp:RadioButtonList>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <asp:Button ID="btn_submit" runat="server" Text="Assign Instructor" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btn_submit_Click" />
                                        <div class="col-md-20">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                        <div class="tab-content card-body">
                            <asp:CheckBox ID="chkAll" Text="Select All" runat="server" onclick="javascript:Header_Click(this);" />
                            <div class="tab-pane active" style="white-space: nowrap">
                                <div class="table-responsive">
                                    <asp:GridView ID="grid" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                                        DataKeyNames="assignid"
                                        AllowPaging="True"
                                        CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                                        PageSize="50">

                                        <Columns>
                                            <asp:BoundField DataField="assignid" HeaderText="Record ID" InsertVisible="False"
                                                ReadOnly="True" />
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblassignid" runat="server" Text='<%# Eval("assignid") %>' Visible="false"></asp:Label>
                                                    <asp:CheckBox runat="server" ID="chkassign" Visible='<%# String.IsNullOrEmpty(Convert.ToString(Eval("showcheckbox"))) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Class Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblclassdate" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Class Start Time">

                                                <ItemTemplate>
                                                    <asp:Label ID="lblclassstarttime" runat="server" Text='<%# Eval("classstarttime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Class End Time">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblclassendtime" Text='<%# Eval("classendtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Instructor">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblinstructor" Text='<%# Eval("instructor")%>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <a href="<%# Eval("conductLink")%>" target="_blank"">Class Attendance</a>

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
            if ($("#<%=ddlclass.ClientID%>").val() == "0") {
                alert("Please select class.");
                return false;
            }
            else if ($("#<%=ddlintructor.ClientID%>").val() == "0") {
                alert("Please select instructor.");
                return false;
            }
            return true;
        }
         function Header_Click(isChecked) {
            if (isChecked.checked == true) {
                $('input[type="checkbox"]').each(function () {
                    this.checked = true;
                });
            }
            else {
                $('input[type="checkbox"]').each(function () {
                    this.checked = false;
                });
            }
         }
          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assigninstructor').addClass('active');
            
         });
          function Header_Click(isChecked) {
            if (isChecked.checked == true) {
                $('input[type="checkbox"]').each(function () {
                    this.checked = true;
                });
            }
            else {
                $('input[type="checkbox"]').each(function () {
                    if(!$(this).prop('disabled'))
                        this.checked = false;
                });
            }
         }
         $(document).ready(function () {
             $('.sidebar-menu-item').removeClass('open');
             $('#classlist').addClass('open');
             $('.sidebar-menu-item').removeClass('active');
             $('#createclass_service5').addClass('active');
         });
    </script>
</asp:Content>