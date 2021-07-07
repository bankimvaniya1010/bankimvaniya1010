<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_assignclass_create.aspx.cs" Inherits="admin_ec_assignclass_create" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_assignclass_mange.aspx">Mange Classes</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">SCHEDULE & ASSIGN A CLASS</h1>
        <div class="row" style="margin-right: -1.625rem;">
            <div class="col-md-8">
                <div class="card" id="createDiv" runat="server">
                    <div class="tab-content card-body">
                        <div class="tab-pane active" id="first">

                            <div class="form-group row" id="group">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" OnSelectedIndexChanged="ddlgrade_SelectedIndexChanged" AutoPostBack="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="examsubject">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="grade">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Class</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlclass" class="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"/>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="subject">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Start Date</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlstartdate" class="form-control" OnSelectedIndexChanged="ddlstartdate_SelectedIndexChanged" AutoPostBack="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Recurrence</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlrecurrence" class="form-control">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                <asp:ListItem Value="1">Daily</asp:ListItem>
                                                <asp:ListItem Value="2">Weekly</asp:ListItem>
                                                <asp:ListItem Value="3">Monthly</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivDaily">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input id="txtrepeatsevery_day" runat="server" type="text" class="form-control" autocomplete="off">Day(s)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_daily" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivWeekly">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input id="txtrepeateevery_week" runat="server" type="text" class="form-control" autocomplete="off">Week(s)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Day(s) of Week</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:ListBox ID="lstDayofWeek" SelectionMode="Multiple" CssClass="form-control" runat="server" Height="120px">
                                                    <asp:ListItem Value="1">Monday</asp:ListItem>
                                                    <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="5">Friday</asp:ListItem>
                                                </asp:ListBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_weekly" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivMonthly">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input id="txtrepeateevery_months" runat="server" type="text" class="form-control" autocomplete="off">Month(s)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Days(s) of Month</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="radio" runat="server" id="rblday" name="dayofmonths"><input type="text" runat="server" id="txtday_months" class="form-control">Day<br />
                                                <input type="radio" runat="server" id="rblday2" name="dayofmonths">
                                                <asp:DropDownList runat="server" ID="ddlday" class="form-control">
                                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                                    <asp:ListItem Value="1">First</asp:ListItem>
                                                    <asp:ListItem Value="2">Second</asp:ListItem>
                                                    <asp:ListItem Value="3">Third</asp:ListItem>
                                                    <asp:ListItem Value="4">Fourth</asp:ListItem>
                                                    <asp:ListItem Value="5">Last</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList runat="server" ID="ddlday2" class="form-control">
                                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                                    <asp:ListItem Value="1">Monday</asp:ListItem>
                                                    <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="5">Friday</asp:ListItem>
                                                    <asp:ListItem Value="6">Saturday</asp:ListItem>
                                                    <asp:ListItem Value="7">Sunday</asp:ListItem>
                                                    <asp:ListItem Value="8">Day</asp:ListItem>
                                                    <asp:ListItem Value="9">Week Day</asp:ListItem>
                                                    <asp:ListItem Value="10">Weekend Day</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_monthly" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row" runat="server">
                                <label for="name" class="col-sm-3 col-form-label form-label">Class Start Time</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="time" runat="server" id="txtclassstarttime" class="form-control" style="width: 135px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" runat="server">
                                <label for="name" class="col-sm-3 col-form-label form-label">Class End Time</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="time" runat="server" id="txtclassendtime" class="form-control" style="width: 135px;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-8 offset-sm-3">
                                    <div class="media align-items-center">
                                        <div class="media-left">
                                            <asp:Button ID="btn_submit" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                            <div class="col-md-20">
                                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-checkbox-list" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-12 col-form-label form-label">Select Assignee(s)</label>
                    </div>
                    <div class="">
                        <div class="col-md-12">
                            <asp:CheckBox ID="chkAll" Text="Select All" runat="server" />
                            <asp:CheckBoxList ID="ddlstudentid" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"></asp:CheckBoxList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#schedule_service5').addClass('active');


            $('#ContentPlaceHolder1_txtenddate_daily').datepicker({ dateFormat: 'dd-mm-yy' });
            $('#ContentPlaceHolder1_txtenddate_weekly').datepicker({ dateFormat: 'dd-mm-yy' });
            $('#ContentPlaceHolder1_txtenddate_monthly').datepicker({ dateFormat: 'dd-mm-yy' });

            var recurrrenceID = $("#<%=ddlrecurrence.ClientID%>").val();
            if (recurrrenceID == 1) {
                $("#<%=DivDaily.ClientID%>").show();
                 $("#<%=DivWeekly.ClientID%>").hide();
                 $("#<%=DivMonthly.ClientID%>").hide();
             } 
             else if (recurrrenceID == 2) {
                 $("#<%=DivDaily.ClientID%>").hide();
                 $("#<%=DivWeekly.ClientID%>").show();
                 $("#<%=DivMonthly.ClientID%>").hide();
             }
             else if (recurrrenceID == 3) {
                 $("#<%=DivDaily.ClientID%>").hide();
                 $("#<%=DivWeekly.ClientID%>").hide();
                 $("#<%=DivMonthly.ClientID%>").show();
             }
             else {
                 $("#<%=DivDaily.ClientID%>").hide();
                 $("#<%=DivWeekly.ClientID%>").hide();
                 $("#<%=DivMonthly.ClientID%>").hide();
            }
        });

        $("#<%=ddlrecurrence.ClientID%>").change(function () {
            var recurrrenceID = $("#<%=ddlrecurrence.ClientID%>").val();
            if (recurrrenceID == 1) {
                $("#<%=DivDaily.ClientID%>").show();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 2) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").show();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 3) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").show();
            }
            else {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
        });

        
        $(function () {
            $("[id*=chkAll]").bind("click", function () {
                if ($(this).is(":checked")) {
                    $("[id*=ddlstudentid] input").attr("checked", "checked");
                } else {
                    $("[id*=ddlstudentid] input").removeAttr("checked");
                }
            });
            $("[id*=ddlstudentid] input").bind("click", function () {
                if ($("[id*=ddlstudentid] input:checked").length == $("[id*=ddlstudentid] input").length) {
                    $("[id*=chkAll]").attr("checked", "checked");
                } else {
                    $("[id*=chkAll]").removeAttr("checked");
                }
            });
        });
    </script>
</asp:Content>