<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="ec_create_my_study_materials.aspx.cs" Inherits="ec_create_my_study_materials" %>

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
                color: #FF7182;
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
    </style>
    <div class="container" style="margin-left: 22px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_assignclass_mange.aspx">My Study Materials</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">My Study Materials</h1>
        <div id="div1_main" runat="server">
            <div runat="server" id="Div1" style="display: block">
                <div class="media align-items-center">
                    <div class="form-row">
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlfilter" Style="width: 240px;">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="4">Filter By Study Material Name</asp:ListItem>
                                        <asp:ListItem Value="1">Filter By Class Name</asp:ListItem>
                                        <asp:ListItem Value="2">Filter By Grade</asp:ListItem>
                                        <asp:ListItem Value="3">Filter By Subject</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
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
                                    <div id="divstudymaterial" runat="server">
                                        <asp:DropDownList runat="server" ID="ddl_study" OnSelectedIndexChanged="ddl_study_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-left: 10%;">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div>
                <%
                    if (study_material_list.Any())
                    {
                %>
                <div class="container">
                    <div class="row mainclass_paging mt-2">
                        <%--<div class="mainclass_paging">--%>
                        <%
                            for (int i = 0; i < study_material_list.Count; i++)
                            {
                        %>
                        <div class="col-sm-3 card pageclass" style="<%=study_material_list[i].toshow_material == null ? "display: none;": "display:block;margin-right: 20px;flex: 0 0 23%; "%>" id="<%=study_material_list[i].material_id%>">
                            <label style="font-size: 10px; margin-bottom: 0px;">Study Material Type :
                                <label style="color: #00BFFF; margin-bottom: 0px;"><%=study_material_list[i].Get_Material_type%></label></label>
                            <h5 class="border-bottom border-red"><i style="color: deeppink;" class="<%=study_material_list[i].Get_Material_type_wise_icons%>"></i>&nbsp;&nbsp;<%=study_material_list[i].study_material_name%></h5>
                            <table style="font-size: 80%;">
                                <tr>
                                    <td>Class Name:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=study_material_list[i].classname%></td>
                                </tr>
                                <tr>
                                    <td>Grade:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=study_material_list[i].grade%></td>
                                </tr>
                                <tr>
                                    <td><i class="<% %>"></i>Subject:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=study_material_list[i].subject%></td>
                                </tr>
                                <tr>
                                    <td>Uploaded On:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=Convert.ToDateTime(study_material_list[i].Studymaterialstarttime).ToString("dd/MM/yyyy hh:mm tt")%></td>
                                </tr>
                                <tr>
                                    <td>Expires On:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=Convert.ToDateTime(study_material_list[i].Studymaterialendtime).ToString("dd/MM/yyyy hh:mm tt")%></td>
                                </tr>
                                <tr>
                                    <td>Remarks:</td>
                                    <td style="text-align: left; color: #00BFFF;"><%=study_material_list[i].remark%></td>
                                </tr>
                            </table>
                            <div class="border-top border-red"></div>

                            <button class="btn btn-success" type="button" style="height: 9%; width: 50%; font-size: 70%; margin-bottom: 0px;" onclick=" window.open('<%=study_material_list[i].Get_Material_link%>','_blank')">View File</button>
                        </div>
                        <%} %>
                        <%--</div>--%>
                    </div>
                </div>
                <%} %>

                <div id="pagination_container"></div>
            </div>
        </div>
        <div runat="server" id="div_nodata" style="display:none;">
            <label id="lblnodata" runat="server">Study Materials Not Yet Assigned By Institution.</label>
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
    </script>
    <script>
        $("#<%=ddlfilter.ClientID%>").change(function () {
            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").show();
            }
            else if (filterid == 2) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").show();
            }
            else if (filterid == 3) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").show();
            }
            else if (filterid == 4) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").show();
            }
            else {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
            }
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');

            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divclassname.ClientID%>").show();
            }
            else if (filterid == 2) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").show();
            }
            else if (filterid == 3) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").show();
            }
            else if (filterid == 4) {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").show();
            }
            else {
                $("#<%=Divclassname.ClientID%>").hide();
                $("#<%=Divgrade.ClientID%>").hide();
                $("#<%=divstudymaterial.ClientID%>").hide();
                $("#<%=Divsubject.ClientID%>").hide();
            }
        });
         setInterval(ajaxcall, 5000);

         function ajaxcall() {
             var assignid = '1';
             $.ajax({
                 type: "GET",
                 url: "ec_create_my_study_materials.aspx/Refresh_table",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 data: { assignid:assignid},
                 success: function (response) {
                     if (response.d) {
                        var result = JSON.parse(response.d);
                      
                    }
                 }
             });
         }

    </script>
</asp:Content>

