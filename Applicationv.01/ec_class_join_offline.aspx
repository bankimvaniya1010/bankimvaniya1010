<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_join_offline.aspx.cs" Inherits="ec_class_join_offline" MasterPageFile="~/student.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        table, th, td {
            border:1px solid ;
        }
        </style>
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/qrcode.min.js"></script>
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/qrcode.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/style.css">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item"><a href="ec_my_class.aspx">MY CLASSES</a></li>
            <li class="breadcrumb-item active">
                Join A Class
            </li>
        </ol>
        
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-body">
                          
                        <div class="table-responsive">
                            <table class="table"style="width:50%;">
                                <tr>
                                    <td>
                                        <div class="col-lg-8 col-12" id="divProfile" runat="server" style="border: 1px solid;">
                                            <img src="<%= profileURL%>" class="img-fluid">
                                        </div>
                                    </td>
                                    <td class="barcoder-wrpr col-lg-4 col-12">
                                        <div id="qrcode"></div>
                                        <br>
                                       <span style="    font-size: x-small;"> *QR is for Instructor use only. </span>
                                    </td>
                                   
                                </tr>
                                  <tr>
                                    <td><b>Class Name</b></td>
                                    <td><%= classname %></td>
                                </tr>
                                <tr>
                                    <td><b>Class Date</b></td>
                                    <td><%= classdate%></td>
                                </tr>
                                <tr>
                                    <td><b>Start Time</b></td>
                                    <td><%= class_starttime %></td>
                                </tr>
                                <tr>
                                    <td><b>End Time</b></td>
                                    <td><%= class_endtime %></td>
                                </tr>
                               
                            </table>
                        </div>
                       
                    </div></div>
                    </div>
                    
            </div>
        </div>
        
    </div>
  <script>
       $(document).ready(function () {
           
            new QRCode(document.getElementById("qrcode"), "<%=webURL%>admin/ec_class_Verification.aspx?ID=<%=RecordID%>&SID=<%=UserID%>");
                 
      });
              $(document).keydown(function (event) {
            if (event.keyCode == 123) { // Prevent F12
                return false;
            } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
                return false;
            }
        });
        $(document).on("contextmenu", function (e) {   //prevent inspect     
            e.preventDefault();
        });
  </script>
</asp:Content>
