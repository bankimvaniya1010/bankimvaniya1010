<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_join.aspx.cs" Inherits="ec_class_join" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        table, th, td {
            border:1px solid ;
        }
        
        </style>
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
                            <h2>JOIN A CLASS <label runat="server" id="verificationStatus"/></h2>

                            <label id="lblclock"></label>
                        <div>
                            
                            <h5><b>Hello <%=username %>,
                                <Label id="statement" runat="server"/>
                               <br />
                                
                            <br />
                            *Click on the green "Join This Class" button below to join this class.</b></h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table"style="width:50%;">
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
                        <div>
                            <h4>
                                Please read the instructions given below:
                            </h4>
                            <div>
                                <p>
                                    Do not close your browser, click on the back button, or go away from this webpage.<br/>
                                    If you do either of the aforementioned, you will be reported as logged out to your class instructor.
                                </p>
                                <p>
                                    Only verified & logged in student(s) will be able to join this class .
                                </p>
                            </div>
                        </div>
                            </div>
                        <div>
                            <asp:Button id="btn_active" CssClass="btn btn-success" onclick="btn_active_Click" runat="server" Text="Ask Your Instructor to Verify You"/>
                            <button id="btn_joinclass" class="btn btn-success" type="button" onclick=" window.open('<%=joinclass_link%>','_blank')">Join This Class</button>
                            
                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                   
                    </div>
                
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>
        setInterval(set_statement, 1000);
        function set_statement() {
            var RecordID='<%=RecordID%>';
            $.ajax({
                type: "POST",
                url: "ec_class_join.aspx/class_statement",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: "{'RecordID': '" + RecordID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                        $("#ContentPlaceHolder1_statement").val(result);
                        $("#ContentPlaceHolder1_statement").text(result);
                    }
                }
            });
        }
        setInterval(refreshstatus, 1000);
        function refreshstatus() {
            var RecordID='<%=RecordID%>';
            $.ajax({
                type: "POST",
                url: "ec_class_join.aspx/class_status",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: "{'RecordID': '" + RecordID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        
                        $("#ContentPlaceHolder1_verificationStatus").val(result);
                        $("#ContentPlaceHolder1_verificationStatus").text(result);
                    }
                }
            });
        }
        setInterval(check_if_class_started, 1000);
        function check_if_class_started() {
            var RecordID='<%=RecordID%>';
            $.ajax({
                type: "POST",
                url: "ec_class_join.aspx/class_start_status",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: "{'RecordID': '" + RecordID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        
                        if (result == "NO")
                            $("#btn_joinclass").attr('disabled', 'disabled');
                        else if (result == "Manual")
                            $("#btn_joinclass").attr('style', 'display:none');
                        else if (result == "Hide") {
                            $("#btn_joinclass").attr('style', 'display:none');
                            $("#ContentPlaceHolder1_btn_active").attr('style', 'display:none');
                        }
                        //else
                        //    $("#btn_joinclass").removeAttr('disabled');
                    }
                }
            });
        }
         setInterval(startClock, 1000);
        function startClock() {
            var RecordID='<%=RecordID%>';
            $.ajax({
                type: "POST",
                url: "ec_class_join.aspx/isaccesstoexamgiven",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: "{'RecordID': '" + RecordID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        
                        $("#lblclock").val(result);
                        $("#lblclock").text(result);
                        if (result == "startClass") {
                            var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                            location.replace("<%=joinclass_link%>");
                        }
                        if (result == "ClassStop") {
                            $("#lblclock").val("");
                            $("#lblclock").text("");
                        }
                        if (result == "Manualclassstart") {
                            $("#lblclock").val("");
                            $("#lblclock").text("");
                        }
                    }
                }
            });
        }
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
