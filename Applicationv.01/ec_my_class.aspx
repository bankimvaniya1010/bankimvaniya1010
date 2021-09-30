<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_my_class.aspx.cs" Inherits="ec_my_class" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style type="text/css">
        table, th, td {
        border: 1px solid black;} 
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
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">MY CLASS</li>
        </ol>
        <h1 class="h2">My Class</h1>
        <div runat="server" id="creatediv">
            <div class="media align-items-center">
                <div class="form-row">
                    <h3 style="margin-left: 10px;">Your Class Timetable</h3>
                   
                                <asp:Button ID="btn_today_class" runat="server" Text="Class(es) Today" CssClass="btn btn-success" OnClick="btn_today_class_Click" />
                                <asp:Button ID="btn_week_class" runat="server" Text="Class(es) This Week" CssClass="btn btn-success" OnClick="btn_week_class_Click"  />
                                <asp:Button ID="btn_monthly_class" runat="server" Text="Class(es) This Months" CssClass="btn btn-success" OnClick="btn_monthly_class_Click"  />
                                <asp:Button ID="btn_dw_weekly" runat="server" Text="Download Weekly Schedule" CssClass="btn btn-success" OnClick="btn_dw_weekly_Click"  />
                                <asp:Button ID="btn_dw_monthly" runat="server" Text="Download Monthly Schedule" CssClass="btn btn-success" OnClick="btn_dw_monthly_Click"  />
                                <br />
                            
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body" id="gridDiv" runat="server" style="white-space: nowrap; text-align: center;margin-left: -49px;">
          
                  <%
                    if (applicant.Any())
                    {
                %>
                <div class="">
                    <div class="row mainclass_paging mt-2">
                       
                        <table class="table">
                            <tr>
                                <th></th>
                                <th>Class Name</th>
                                <th>Time Zone</th>
                                <th>Date</th>
                                <th>Start Time</th>
                                <th>End Time</th>
                                <th>Subject </th>
                                <th>Mode</th>
                                <th>Location</th>
                                <th>Join Class</th>
                            </tr>
                             <%
                            for (int i = 0; i < applicant.Count; i++)
                            { %>
                        
                            <tr class="pageclass">
                                <td><%=i+1%></td>
                                    <td><%=applicant[i].classname%></td>
                                    <td><%=applicant[i].timezone%></td>
                                    <td><%=Convert.ToDateTime(applicant[i].startdate).ToString("dd/MM/yyyy")%></td>
                                    <td><%=applicant[i].classstarttime%></td>
                                    <td><%=applicant[i].classendtime%></td>
                                    <td><%=applicant[i].subject%></td>
                                    <td><%=applicant[i].mode%></td>
                                    <td><%=applicant[i].location_name%></td>
                                    <td>
                                        
                                        <u> <a href="<%=applicant[i].virtuallink%>" target="_blank">
                                            <%=applicant[i].linkname%></a>

                                           </u>
                                    </td>
                                </tr>
                            <%} %>
                        </table>
                       
                    </div>
                </div>
                <%} %>

                <div id="pagination_container" style="margin-top:40px;margin-left: 50px;"></div>
            </div>
        <div class="card-body">
            <h4 class="h3">Class(es) You Have Enrolled For </h4>
            <%
                if (class_enroll.Count > 0)
                {
            %>
            <div class="">
                <div class="row">
                    <%
                        for (int i = 0; i < class_enroll.Count; i++)
                        {
                    %>
                    <div class="col-4 card" style="margin-right:20px;">
                        <h3 class="border-bottom border-red"><%=class_enroll[i].classname%></h3>
                        <table>
                            <tr>
                                <td><i class="fas fa-graduation-cap fa"> Grade:</i></td>
                                <td><%=class_enroll[i].grade%></td>
                            </tr>
                            <tr>
                                <td><i class="fal fa-book fa"> Subject:</i></td>
                                <td><%=class_enroll[i].subject%></td>                                
                            </tr>
                            <tr>
                                <td><i class="fas fa-toggle-on fa"> Type:</i></td>
                                <td><%=class_enroll[i].grade%></td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-book-open fa"> Mode:</i></td>
                                <td><%=class_enroll[i].mode%></td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-map-marker-alt fa"> Location:</i></td>
                                <td><%=class_enroll[i].location_name%></td>
                            </tr>
                            <tr>
                                <td><i class="far fa-calendar fa"> Start Date:</i></td>
                                <td><%=class_enroll[i].startdate_str%></td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-user-clock fa"> Duration:</i></td>
                                <td><%=class_enroll[i].duration%></td>
                            </tr>
                        </table>
                        <div class="border-top border-red"></div>
                        <button id="<%=class_enroll[i].assignID %>"" value="Download Class Schedule" name="btn" onClick="addToCall" class="btn btn-success" style="display:none">Download Class Schedule</button>
                        <%--<button id="<%=class_enroll[i].assignID %>"" value="Download Class Schedule" name="btn" onClick="return reply_click(this.id)" class="btn btn-success">Download Class Schedule</button>--%>
                        <%--<asp:Button ID="btn_yes" runat="server" Text="Download Class Schedule" CssClass="btn btn-success " Style="margin-right: 10px;"/>--%>
                    </div>
                    <%} %>
                </div>
            </div>
            <%} %>
        </div>
    </div>
 </div>
       <script>
  //         function reply_click(clicked_id)
  //         {
  //             //alert(clicked_id);
  //             $.ajax({
  //                  type: "POST",
  //                  url: "ec_my_class.aspx/Download_Excel",
  //                  contentType: "application/json; charset=utf-8",
  //                  dataType: "json",
  //                  data: "{'clicked_id': '" + clicked_id + "'}",
  //                  success: function (result) {
  //                      if (result) {                            
  //                          //alert("Request send to mention email id of agent");
  //                      }
  //                  }
  //              });
  //             return false;
  //}
          

        var items = $(".mainclass_paging .pageclass");
        var numItems = items.length;
        var perPage = 10;
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

           $(document).ready(function () {
               $('.sidebar-menu-item').removeClass('open');
               $('#ec_my_class').addClass('open');
               $('.sidebar-menu-item').removeClass('active');
               $('#ec_my_class').addClass('active');
           });
       </script>
</asp:Content>

