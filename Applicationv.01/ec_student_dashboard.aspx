<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="ec_student_dashboard.aspx.cs" Inherits="ec_student_dashboard" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <%--<li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>--%>
            <li class="breadcrumb-item active">MY DASHBOARD</li>
        </ol>
        <h1 class="h2">My Dashboard</h1>
        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <h3 style="margin-left: 10px;">Your Class TimeTable</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_today_class" runat="server" Text="Class(es) Today" CssClass="btn btn-success" OnClick="btn_today_class_Click" />
                                <asp:Button ID="btn_week_class" runat="server" Text="Class(es) This Week" CssClass="btn btn-success" OnClick="btn_week_class_Click" />
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
                    <asp:GridView ID="grd_class" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="assignID"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="grd_class_PageIndexChanging" OnRowDeleting="grd_class_RowDeleting" OnRowCommand="grd_class_RowCommand" OnRowEditing="grd_class_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Class Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_class_name" runat="server" Text='<%# Bind("classname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Zone">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_time_zone" runat="server" Text='<%# Bind("timezone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbldate" runat="server" Text='<%# Bind("startdate_str") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblstarttime" runat="server" Text='<%# Bind("classstarttime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class End Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblendtime" runat="server" Text='<%# Bind("classendtime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubject" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <asp:Label ID="lblgrade" runat="server" Text='<%# Bind("grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mode">
                                <ItemTemplate>
                                    <asp:Label ID="lblmode" runat="server" Text='<%# Bind("mode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Recurrence">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubject" runat="server" Text='<%# Bind("recurrence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_location" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Join Class">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("assignID")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
     <div class="col-lg container-fluid page__container">
        <h1 class="h2">Your Communicationa</h1>
        <div class="row" style="width:35%;">
            <div class="col-lg-12">
                <div class="card">
                    <div id="defaultinstructions" runat="server" >                        
                        <div class="card-body">
                            <h4> The World's first AI driven, turnkey student application & offer management solution, with integrated conversion optimization services</h4>
                            <h3>KEY FEATURES:</h3>
                        </div>
                        <div>
                            <ul>
                                <li>Private label application & offer management solution</li>
                                <br>
                                <li>Multilingual, fully customizable, flexible integration</li>
                                <br>
                                <li>Enhanced student experience and advocacy </li>
                                <br>
                                 <li>AI Driven - Smart forms, Real-time clarification & more</li>
                                <br>
                                <li>Criteria based course selection & recommendation</li>
                                <br>
                                <li>Integrated micro-conversion optimization module </li>
                                <br>
                                <li>Integrated offer management & acceptance module   </li>
                                <br>
                                <li>High quality student data & drill down data analysis   </li>
                                <br>
                                <li>Add-ons: GTE (AU only)/Scholarship/SOP/Fee pay  </li>
                                <br>
                                <li>Full suite document validation services*    </li>
                                <br>
                                <li>Worldwide toll-free Application Concierge*   </li>
                                <br>
                                <li>Full suite, Private label VISA and student services*</li>
                            </ul>   
                            <ul>
                                <li>
                                    <b>Enhance Student & Agent experience  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Generate Instant / one-touch offers </b>
                                </li>
                                <br>
                                <li>
                                    <b>Increase student conversion levels  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Save costs and time. Consistent service </b>
                                </li>
                            </ul>
                        </div>
                    </div>

              
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg container-fluid page__container">
        <h1 class="h2">Your Courses For You</h1>
        <div class="row" style="width:35%;">
            <div class="col-lg-12">
                <div class="card">
                    <div id="Div1" runat="server" >                        
                        <div class="card-body">
                            <h4> The World's first AI driven, turnkey student application & offer management solution, with integrated conversion optimization services</h4>
                            <h3>KEY FEATURES:</h3>
                        </div>
                        <div>
                            <ul>
                                <li>Private label application & offer management solution</li>
                                <br>
                                <li>Multilingual, fully customizable, flexible integration</li>
                                <br>
                                <li>Enhanced student experience and advocacy </li>
                                <br>
                                 <li>AI Driven - Smart forms, Real-time clarification & more</li>
                                <br>
                                <li>Criteria based course selection & recommendation</li>
                                <br>
                                <li>Integrated micro-conversion optimization module </li>
                                <br>
                                <li>Integrated offer management & acceptance module   </li>
                                <br>
                                <li>High quality student data & drill down data analysis   </li>
                                <br>
                                <li>Add-ons: GTE (AU only)/Scholarship/SOP/Fee pay  </li>
                                <br>
                                <li>Full suite document validation services*    </li>
                                <br>
                                <li>Worldwide toll-free Application Concierge*   </li>
                                <br>
                                <li>Full suite, Private label VISA and student services*</li>
                            </ul>   
                            <ul>
                                <li>
                                    <b>Enhance Student & Agent experience  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Generate Instant / one-touch offers </b>
                                </li>
                                <br>
                                <li>
                                    <b>Increase student conversion levels  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Save costs and time. Consistent service </b>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#ec_dashboard').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#ec_dashboard').addClass('active');
        });
    </script>
</asp:Content>

