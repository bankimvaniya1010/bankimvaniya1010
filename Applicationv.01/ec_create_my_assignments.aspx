<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="ec_create_my_assignments.aspx.cs" Inherits="ec_create_my_assignments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <style type="text/css">
        body {
            font-family: 'Roboto', sans-serif;
            font-size: 14px;
            line-height: 18px;
            background: #f4f4f4;
        }

        .list-wrapper {
            padding: 15px;
            overflow: hidden;
        }

        .list-item {
            border: 1px solid #EEE;
            background: #FFF;
            margin-bottom: 10px;
            padding: 10px;
            box-shadow: 0px 0px 10px 0px #EEE;
        }

            .list-item h4 {
                color: #000;
                font-size: 18px;
                margin: 0 0 5px;
            }

            .list-item p {
                margin: 0;
            }

        .simple-pagination ul {
            margin: 0 0 20px;
            padding: 0;
            list-style: none;
            text-align: left;
        }

        .simple-pagination li {
            display: inline-block;
            margin-right: 5px;
        }

            .simple-pagination li a,
            .simple-pagination li span {
                color: #666;
                padding: 5px 10px;
                text-decoration: none;
                border: 1px solid #EEE;
                background-color: #FFF;
                box-shadow: 0px 0px 10px 0px #EEE;
            }

        .simple-pagination .current {
            color: #FFF;
            background-color: #FF7182;
            border-color: #FF7182;
        }

        .simple-pagination .prev.current,
        .simple-pagination .next.current {
            background: #e04e60;
        }
        h1.h2.title-heading{
            color:#000;

        }
        h5.border-bottom.border-red{
            color:#000;
        }
    </style>
    <div class="container" style="margin-left:10px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_assignclass_mange.aspx">My Assignments</a></li>
            <%--<li class="breadcrumb-item">create</li>--%>
        </ol>
      
        <asp:ScriptManager runat="server" ID="smq"></asp:ScriptManager>
        <div runat="server" id="Div1" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                              <h1 class="h2 title-heading">My Assignments</h1>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlfilter" Style="width: 240px;margin-left:50px;">
                                    <asp:ListItem Value="0">Filter By</asp:ListItem>
                                    <asp:ListItem Value="1">Assignment Name</asp:ListItem>
                                    <asp:ListItem Value="2">Class Name</asp:ListItem>
                                    <asp:ListItem Value="3">Grade</asp:ListItem>
                                    <asp:ListItem Value="4">Subject</asp:ListItem>
                                    <%--<asp:ListItem Value="5">Submission Status</asp:ListItem>--%>
                                </asp:DropDownList>
                            </td>
                            <td>
                                 <div id="divAssignmentname" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlAssignmentName" OnSelectedIndexChanged="ddlAssignmentName_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="Divclassname" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlclassname" OnSelectedIndexChanged="ddlclassname_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="Divgrade" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlgrade" OnSelectedIndexChanged="ddlgrade_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="Divsubject" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlsubject" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="divStatus" runat="server">
                                    <asp:DropDownList runat="server" ID="ddl_study" OnSelectedIndexChanged="ddl_study_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td>
                                <asp:button runat="server" id="btn_today" class="btn btn-success" onclick="btn_today_Click" Text="Assignment(s) To Submit Today"/>
                            </td>
                            <td>
                                <asp:button runat="server" id="btn_week" class="btn btn-success" onclick="btn_week_Click" Text="Assignment(s) To Submit This Week"/>
                            </td>
                            <td>
                                <asp:button runat="server" id="btn_month" class="btn btn-success" onclick="btn_month_Click" Text="Assignment(s) To Submit This Month"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div>
            <%
                if (assignmentList.Any())
                {
            %>
            <div class="">
                <div class="row mainclass_paging mt-2" style="margin-left: -3px;margin-right: -180px;">
                    <%--<div class="mainclass_paging">--%>
                    <%
                        for (int i = 0; i < assignmentList.Count; i++)
                        {
                    %>
                    <div class="col-sm-3 card pageclass" id="<%=assignmentList[i].assignId%>" style="margin-right:2%; padding: 7px 13px;flex: 0 0 23%; ">
                        <input type="hidden" id="hid_assign_<%=assignmentList[i].assignmentid%>" value="<%=assignmentList[i].assignmentid%>" />
                        <label style="font-size: 10px; margin-bottom: 0px;">Submission Status : <label style="color: #00BFFF; margin-bottom: 0px;"><%=assignmentList[i].status%></label></label>
                        <h5 class="border-bottom border-red"><i style="color: deeppink; font-size:22px;" class="fas fa-file - pdf"></i>&nbsp;&nbsp;<%=assignmentList[i].assignment_name%></h5>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;">
                            Class Name :<label style="color: #00BFFF; display:contents;"> <%=assignmentList[i].classname%></label>
                        </div>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;">
                            Grade :<label style="color: #00BFFF; display:contents;"> <%=assignmentList[i].grade%></label>
                        </div>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;">
                            Subject : <label style="color: #00BFFF; display:contents;"> <%=assignmentList[i].subject%></label>
                        </div>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;">
                            Uploaded On : <label style="color: #00BFFF; display:contents;"><%=Convert.ToDateTime(assignmentList[i].assignmentstarttime).ToString("dd/MM/yyyy hh:mm tt")%></label>
                        </div>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;">
                            Expires On : <label style="color: #00BFFF; display:contents;"><%=Convert.ToDateTime(assignmentList[i].assignmentendtime).ToString("dd/MM/yyyy hh:mm tt")%></label>
                        </div>
                        <div class="row" style="padding-left: 2%; font-size: 80%; color:#000;;min-height:105px;">
                            Remarks : <label style="color: #00BFFF; display:contents;"><%=assignmentList[i].remark%></label>
                        </div>
                        <div class="border-top border-red"></div>
                       <div class="row" style="padding: 0%;">
                           <button class="btn btn-success" type="button" style="width: 38%;font-size: 83%; height:50% " onclick=" window.open('<%=assignmentList[i].userdownloadfile%>','_blank')">View File</button>
                        
                           <button class="btn btn-success" type="button" style="<%=assignmentList[i].Is_toshow_checkingguid_link == 0 ? "display: none;": "display:block;font-size: 11px;height:23%;"  %>" onclick=" window.open('<%=assignmentList[i].checkingguid_link%>','_blank')">View Checking Guide</button>
                           
                          <button class="btn btn-success" type="button" style="<%=assignmentList[i].assignment_Link == null ? "display: none;": "display:block;font-size: 11px;height:23%;"  %>" onclick=" window.open('<%=assignmentList[i].assignment_Link%>','_blank')">Go to Assignment</button>
                        </div>
                        <div style="<%= assignmentList[i].Is_resultdeclared == 0 ? "display:none;": "display:block;font-size: 10px; margin-bottom: 0px;"%>">
                        <label>Result will be Declared on : <label style="color: #00BFFF; margin-bottom: 0px;"><%=assignmentList[i].result_release_date%></label></label>
                        </div>

                        <div style="<%= assignmentList[i].Is_resultdeclared == 0 ? "display:none;": "display:block;font-size: 14px; margin-bottom: 0px;"%>">
                        <label>Marks : <label style="color: #00BFFF; margin-bottom: 0px;"><%=assignmentList[i].marks_obtained%></label></label>
                        <a href="<%=assignmentList[i].resultLink%>" target="_blank" style="margin-left:100px;">View Result</a>
                       </div>
                    </div>
                    <%} %>
                    <%--</div>--%>
                </div>
            </div>
            <%} %>
            <div id="pagination_container"></div>
        </div>
    </div>
     <script>
        var items = $(".mainclass_paging .pageclass");
        var numItems = items.length;
        var perPage = 4;
        items.slice(perPage).hide();
        $('#pagination_container').pagination({
            items: numItems,
            itemsOnPage: perPage,
            prevText: "&laquo;",
            nextText: "&raquo;",
            onPageClick: function (pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
            }
        });
        $("#<%=ddlfilter.ClientID%>").change(function () {
            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=divAssignmentname.ClientID%>").show();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 2) {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").show();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 3) {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").show();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 4) {
              $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").show();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');

            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=divAssignmentname.ClientID%>").show();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 2) {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").show();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 3) {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").show();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else if (filterid == 4) {
              $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").show();
                $("#<%=divStatus.ClientID%>").hide();
            }
            else {
                $("#<%=divAssignmentname.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divStatus.ClientID%>").hide();
            }
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#assignments_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assignments_list').addClass('active');
         });

         setInterval(ajaxcall, 1000);

         function ajaxcall() {

             $.ajax({
                 type: "POST",
                 url: "ec_create_my_assignments.aspx/Refresh_table",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",

                 success: function (response) {
                     if (response.d) {
                         var result = JSON.parse(response.d);

                     }
                 }
             });
         }

     </script>
</asp:Content>
