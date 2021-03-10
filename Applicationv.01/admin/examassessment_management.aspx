<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examassessment_management.aspx.cs" Inherits="admin_examassessment_management"  MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript">
        function ConfirmOnDelete() {
            if (confirm("Are you sure you want to start this assessment for all verified students?") == true)
                return true;
            else
                return false;
        }
        
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Manage Assessment</li>
        </ol>
        <h1 class="h2">Manage Assessment</h1> 
         <div id="validateDiv" runat="server" class="card">
                       <div class="form-group row">
                           <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                           <div class="col-sm-8">
                               <div class="row">
                                   <div class="col-md-6">
                                       <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="form-group row">
                           <label for="name" class="col-sm-3 col-form-label form-label">Select Invigilator</label>
                           <div class="col-sm-8">
                               <div class="row">
                                   <div class="col-md-6">
                                       <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged"></asp:DropDownList>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="form-group row">
                           <label for="name" class="col-sm-3 col-form-label form-label">Enter Invigilator Passkey</label>
                           <div class="col-sm-8">
                               <div class="row">
                                   <div class="col-md-6">
                                       <input type="text" runat="server" id="txtpasskey" class="form-control" autocomplete="off">
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="form-group row">
                           <div class="col-sm-8 offset-sm-3">
                               <div class="media align-items-center">
                                   <div class="media-left">
                                       <asp:Button ID="btn_submit" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                       <div class="col-md-20">
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>

        <div runat="server" id="creatediv" style="display: none">
            <div class="card">
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Select Class</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8 updt-prftbl">
                                <asp:DropDownList runat="server" ID="ddlclass" CssClass="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Select Group</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8 updt-prftbl">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgroup" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Select Subject</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8 updt-prftbl">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubjcet" OnSelectedIndexChanged="ddlsubjcet_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Select Assessment</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Select Scheduled Date & Time</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlExamDateTime" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDateTime_SelectedIndexChanged1"></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label form-label">Time Zone & Utc Time</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8">
                                <input type="text" runat="server" id="tiemzone" disabled="disabled" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>


                <div id="tblcontent" runat="server" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-4 col-form-label form-label">
                            <asp:Button runat="server" Text="Refresh" CssClass="btn btn-success" ID="refreshbtn" OnClick="refreshbtn_Click" />
                        </div>
                        <div class="col-sm-4" style="margin-top:20px;margin-left:-20%;">
                            <asp:DropDownList runat="server" ID="rejectionlist" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="rejectionlist_SelectedIndexChanged">
                                <asp:ListItem Value="0">Please select</asp:ListItem>
                                <%---Do not change the listitem spelling. acc check was there is exam_verification page --%>
                                <asp:ListItem Value="1">Verified</asp:ListItem>
                                <asp:ListItem Value="2">Not Present</asp:ListItem>
                                <asp:ListItem Value="3">Not Verified</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-4" style="margin-top:11px;">
                            <asp:Button runat="server" ID="btnsave" class="btn btn-success" OnClick="btnsave_Click" OnClientClick="return validate()" Text="Submit" />
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first" style="white-space: nowrap">
                                <div class="table-responsive">
                                    <%-- <asp:CheckBox runat="server" ID="selectAll" Text="Select All"/>--%>
                                    <asp:GridView ID="grid" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                                        DataKeyNames="assignid"
                                        AllowPaging="True"
                                        CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                                        PageSize="50" OnRowDataBound="grid_RowDataBound">

                                        <Columns>
                                            <asp:BoundField DataField="assignid" HeaderText="Record ID" InsertVisible="False"
                                                ReadOnly="True" />
                                            <asp:TemplateField HeaderText="Select Applicant">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chkassign" Visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("showcheckbox"))) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Applicant ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblassignid" runat="server" Text='<%# Eval("assignid") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblapplicantid" runat="server" Text='<%# Eval("applicantid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Applicant Name">

                                                <ItemTemplate>
                                                    <asp:Label ID="lblapplicantname" runat="server" Text='<%# Eval("applicantname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Login Status">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblloggedstatus" Text='<%# Eval("is_studentactiveforexam") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Login Time">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblloggedintime" Text='<%# Eval("loggedintime", "{0:hh:mm tt}") %>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Login Time">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblloggedintime_inUTC" Text='<%# Eval("loggedintime_inLocal")%>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtreason" CssClass="form-control" Visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("showTextbox"))) %>' Width="311px" Height="96px"></asp:TextBox>
                                                    <asp:Label runat="server" ID="lblview" Text='<%# Bind("rejectionreason") %>' Visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("rejectionreason"))) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Exam Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblexamstatus" runat="server" Text='<%# Eval("examstatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Upload Status">

                                                <ItemTemplate>
                                                    <asp:Label ID="lbluploded" runat="server" Text='<%# Eval("lblansweruploded") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Uploded At">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluplodedtime" runat="server" Text='<%# Eval("lblansweruplodedtime_inLocal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Uploded Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblanswercount" runat="server" Text='<%# Eval("answercount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btnstart" class="btn btn-success" OnClick="btnstart_Click" Text="Start Exam" OnClientClick="return ConfirmOnDelete()" />

                    </div>
                </div>
                
                <div runat="server" id="refreshtbl" style="display: none">
                     <%--<div id="clock" runat="server">                   
                                    <div style="font-size: large; text-align: center">
                                        <label id="lblreading" runat="server">READING TIME:</label>
                                        <span id="reading_countdown" style="font-weight: 900; padding-right: 25px;"></span>
                                        <label id="lblexamtime" runat="server">ASSESSMENT TIME: </label>
                                        <span id="countdown" style="font-weight: 900; padding-right: 25px;"></span>
                                        <label id="lbluploadtime" runat="server">UPLOAD TIME:</label>
                                        <span id="upload_countdown" style="font-weight: 900"></span>
                                      
                                        <asp:hiddenfield id="hidTime" runat="server" />
                                    </div>
                                </div>--%>
                    <div class="form-group">
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first1" style="white-space: nowrap">
                                <div class="table-responsive">
                                    <table id="refreshtblcontent" class="table table-bordered" style="border: 1px solid #1b1c1c !important;">
                                        <tr>
                                            <th>Record Id</th>
                                            <th>Applicant ID</th>
                                            <th>Applicant Name</th>
                                            <th>Login Status</th>
                                            <%--<th>Login Time(UTC)</th>--%>
                                            <th>Login Time</th>
                                            <th>Remarks</th>
                                            <th>Exam Status</th>
                                            <th>Upload Status</th>
                                            <th>Uploded At</th>
                                            <th>Uploded Count</th>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="remainingapplicantDiv">

                    </div>
                </div>
                </div>
            </div>
        </div>
    
    <script>
        setInterval(persec, 1000);
            function persec() {
            var examid = $("#<%=ddlexam.ClientID%>").val();
            var proctorid = $("#<%=ddlexaminer.ClientID%>").val();
            var examdatetime = $("#<%=ddlExamDateTime.ClientID%>").val();
            var universityid = $("#<%=ddlUniversity.ClientID%>").val();
            if (examid != null && proctorid != null && examdatetime != null && examdatetime != 0)
                refreshTableContent(examid, proctorid, examdatetime,universityid);
        }
           function refreshTableContent(examid,proctorid,examdatetime,universityid) {
            $.ajax({
                type: "GET",
                url: "examassessment_management.aspx/Getstudentstatus",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: { examid: examid, proctorid: proctorid, assignid:examdatetime, universityid:universityid },
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $('#refreshtblcontent tr').slice(1).remove()
                        for (var i = 0; i < result.length; i++) {
                            var trHTML = '';
                            var style;
                            if (result[i].is_studentactiveforexam == "Logged In")
                                style = 'style ="color:green;"';
                            else
                                style = 'style ="color:red;"';

                            trHTML += '<tr><td>' + result[i].assignid + '</td><td>' + result[i].applicantid + '</td><td>' + result[i].applicantname + '</td><td ' + style + '>' + result[i].is_studentactiveforexam + '</td><td>' + result[i].loggedintime_inLocal + '</td><td>' + result[i].rejectionreason + '</td><td>' + result[i].examstatus + '</td><td>' + result[i].lblansweruploded + '</td><td>' + result[i].lblansweruplodedtime_inLocal + '</td><td>' + result[i].answercount + '</td>/tr>';
                            
                            $('#refreshtblcontent').append(trHTML);
                        }
                    }
                }
            });
        }
        function validate() {
             var flag = false;
            if ($("#<%=rejectionlist.ClientID%>").val() == "0")
                alert("Please select action");
            //else if ($('[name="ContentPlaceHolder1_questionList_chk_3"]').length != 0 && $('[name="ctl00$ContentPlaceHolder1$questionList$ctl03$chk"]:checked').length == 0) 
            //    alert("Please select checkbox .");
            else
                flag = true;
            
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_assessment_management2').addClass('active');

            
        });
        
        function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select University");
            else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                alert("Please select Invigilator");
            else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey");
            else
                flag = true;
            return flag;
        }

        $("#<%=ddlExamDateTime.ClientID%>").change(function () {
            var examid = $("#<%=ddlexam.ClientID%>").val();
            var proctorid = $("#<%=ddlexaminer.ClientID%>").val();
            var examdatetime = $("#<%=ddlExamDateTime.ClientID%>").val();
            var isexamautostart = '<%=isexamautostart%>';

            if (examdatetime != 0) {
                $("#<%=refreshbtn.ClientID%>").show();
                //if (isexamautostart == 1)
                //    callpersec();
            }
            else if (examdatetime == 0) {
                $("#<%=refreshbtn.ClientID%>").hide();
            }
            
            <%--const dataDate =' <%=loggedindatetime%>';
            const utcDate = new Date(dataDate);
            const myLocalDate = new Date(Date.UTC(
                utcDate.getFullYear(),
                utcDate.getMonth(),
                utcDate.getDate(),
                utcDate.getHours(),
                utcDate.getMinutes()
            ));

            document.getElementById("dataDate").innerHTML = dataDate;
            document.getElementById("myLocalDate").innerHTML = myLocalDate; --%>

        });
       
        setInterval(refreshcheckutcexamtime, 1000);
        
        function refreshcheckutcexamtime() {
            var examid = $("#<%=ddlexam.ClientID%>").val();
            var assignid = $("#<%=ddlExamDateTime.ClientID%>").val();
            var universityid = $("#<%=ddlUniversity.ClientID%>").val();

            $.ajax({
                type: "GET",
                url: "examassessment_management.aspx/checkutcexamtime",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: { examid: examid, assignid:assignid, universityid:universityid },
                success: function (response) {
                  if (response.d) {
                      var result = JSON.parse(response.d);
                      
                      if (result != "0") {
                          if (result == "showalert") {
                              alert("Please note. The exam will be starting in 3 minutes , if the students are not verified then they will be reported as Not Present.");
                              return false;
                          }
                          else if (result == "examstarted") {
                              //hide table refersh table
                              var examid = $("#<%=ddlexam.ClientID%>").val();
                              var proctorid = $("#<%=ddlexaminer.ClientID%>").val();
                              var assignid = $("#<%=ddlExamDateTime.ClientID%>").val();
                              var universityid = $("#<%=ddlUniversity.ClientID%>").val();

                              $.ajax({
                                  type: "GET",
                                  url: "examassessment_management.aspx/MarkAbsentBydefaut",
                                  contentType: "application/json; charset=utf-8",
                                  dataType: "json",
                                  data: { examid: examid, assignid: assignid, universityid: universityid, proctorid: proctorid },
                                  success: function (response) {
                                      if (response.d) {
                                          var result = JSON.parse(response.d);
                                      }
                                  }
                              });
                              $("#<%=refreshtbl.ClientID%>").show();
                              <%--$("#<%=tblcontent.ClientID%>").hide();--%>

                          }
                      }
                      else {
                        
                      }
                    }
                }
            });
        }  
        setInterval(funcheckifexamstarted, 1000);
        
        function funcheckifexamstarted() {
            var examid = $("#<%=ddlexam.ClientID%>").val();
            var assignid = $("#<%=ddlExamDateTime.ClientID%>").val();
            var universityid = $("#<%=ddlUniversity.ClientID%>").val();
            var proctorid = $("#<%=ddlexaminer.ClientID%>").val();
            $.ajax({
                type: "GET",
                url: "examassessment_management.aspx/checkifexamstarted",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: { examid: examid, assignid:assignid, universityid:universityid },
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if (result == "startclock") {
                            
                        }
                    }
                }
            });
            
        }
        setInterval(tohidecontent, 1000);

        function tohidecontent() {
            var examid = $("#<%=ddlexam.ClientID%>").val();
            var assignid = $("#<%=ddlExamDateTime.ClientID%>").val();
            var universityid = $("#<%=ddlUniversity.ClientID%>").val();
            var proctorid = $("#<%=ddlexaminer.ClientID%>").val();
            if (examid != null && proctorid != null && assignid != 0) {
                $.ajax({
                    type: "GET",
                    url: "examassessment_management.aspx/Hidestartexamandtable",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { examid: examid, assignid: assignid, universityid: universityid, proctorid: proctorid },
                    success: function (response) {
                        if (response.d) {
                            var result = response.d;
                            if (result == "hide") {

                                $("#<%=tblcontent.ClientID%>").hide();
                            }
                        }
                    }
                });
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   <%--     

        readingtime = '<%=Session["SessionReadingTime"]%>'; 
        uploadtime = '<%=Session["SessionWrittingTime"]%>'; 
        hms = '<%=Session["SessionUpploadTime"]%>'; 

        const countdownEl = document.getElementById('countdown');
        const reading_countdown = document.getElementById('reading_countdown');
        const upload_countdown = document.getElementById('upload_countdown');

        // your input string
        //Convert hh:mm:ss7  string to seconds in one line. Also allowed h:m:s format and mm:ss, m:s etc
        var secondsS;
        if (hms.includes(":"))
            secondsS = hms.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
        else
            secondsS = hms * 60;
        let time = secondsS;

        const minutes = Math.floor(time / 60);
        let seconds = time % 60;
        countdownEl.innerHTML = `${minutes}:${seconds}`;
        var lblexamtime = `${minutes}:${seconds}`;
        //

        var hms1 = '<%=sessionreadingTime%>';   // your input string       
        //Convert hh:mm:ss string to seconds in one line. Also allowed h:m:s format and mm:ss, m:s etc
        var secondsS1;
        if (hms1.includes(":"))
            secondsS1 = hms1.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
        else
            secondsS1 = hms1 * 60;
        let time1 = secondsS1;
        const minutes1 = Math.floor(time1 / 60);
        let seconds1 = time1 % 60;
        reading_countdown.innerHTML = `${minutes1}:${seconds1}`;
        var lblreadingtime = `${minutes1}:${seconds1}`;

        //
        var hms2 = '<%=sessionUploadTime%>';   // your input string       
        //Convert hh:mm:ss string to seconds in one line. Also allowed h:m:s format and mm:ss, m:s etc
        var secondsS2;
        if (hms2.includes(":"))
            secondsS2 = hms2.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
        else
            secondsS2 = hms2 * 60;
        let time2 = secondsS2;
        const minutes2 = Math.floor(time2 / 60);
        let seconds2 = time2 % 60;
        upload_countdown.innerHTML = `${minutes2}:${seconds2}`;
        var lbluploadtime = `${minutes2}:${seconds2}`;

        if (uploadtime == "") {
            upload_countdown.style.display = 'none';
            $("#<%=lbluploadtime.ClientID%>").hide();
        }
        if (readingtime != "") {
            setInterval(updateCountdown1, 1000);
             //$('#userAlertMsg').html("For this assessment you have " + lblreadingtime + " minutes of reading time. Do note start answering your assessment during this time, as it would lead to your disqualification.");
             //$('#alertModal').modal('show');
            //alert("For this assessment you have " + lblreadingtime + " minutes of reading time. Do note start answering your assessment during this time, as it would lead to your disqualification.");
        }
        else {
            setInterval(updateCountdown, 1000); 
            $("#<%=lblreading.ClientID%>").hide();  
            reading_countdown.style.display = 'none';
        }
        function updateCountdown1() {
            
            const minutes = Math.floor(time1 / 60);
            let seconds = time1 % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            reading_countdown.innerHTML = `${minutes}:${seconds}`;
            var displaytime = `${minutes}:${seconds}`;
            time1--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);

            if (reading_countdown.innerHTML == '5:00') {
                $('#userAlertMsg').html("Only 5 minutes remaining");
                $('#alertModal').modal('show');
                //alert("Only 5 minutes remaining. ");
            }
            else {
                if (reading_countdown.innerHTML == '0:00') {
                    reading_countdown.style.display = 'none';
                    $("#<%=lblreading.ClientID%>").hide();
                    setInterval(updateCountdown, 1000);
                    $('#userAlertMsg').html("Your reading time has finished you now have " + lblexamtime + " minutes to answer this assessment");
                    $('#alertModal').modal('show');
                    //setTimeout(function () {
                    //    alert("Your reading time has finished you now have " + lblexamtime + " minutes to answer this assessment");
                    //},1000)
                    
                }
                else
                    return true;
            }
        }

        function updateCountdown() {
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            countdownEl.innerHTML = `${minutes}:${seconds}`;
            time--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);

            //if (countdownEl.innerHTML == '10:00') {
            //    $('#userAlertMsg').html("Only 10 minutes are remaining for your assessment time to end ");
            //    $('#alertModal').modal('show');
            //    //alert("Only 10 minutes are remaining for your assessment time to end ");
            //}
            //else {
                
            //}
            if (countdownEl.innerHTML == '0:00') {
                    countdownEl.style.display = 'none';
                    $("#<%=lblexamtime.ClientID%>").hide();
                    if (uploadtime != "") {
                        setInterval(updateCountdown2, 1000);
                        $('#userAlertMsg').html("Please stop writing and upload your answer sheets now. The assessment time for this assessment is over, If you continue answering the assessment, you would be disqualified");
                        $('#alertModal').modal('show');
                        //alert("Please stop writing and upload your answer sheets now. The assessment time for this assessment is over, If you continue answering the assessment, you would be disqualified ");
                       
                    }
                    else {
                        upload_countdown.style.display = 'none';
                        $("#<%=lbluploadtime.ClientID%>").hide();
                        $('#userAlertMsg').html("Assessmnent upload time exhausted");
                        $('#alertModal').modal('show');
                       
                    }
                }
                else
                    return true;
        }

        function updateCountdown2() {
            const minutes = Math.floor(time2 / 60);
            let seconds = time2 % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            upload_countdown.innerHTML = `${minutes}:${seconds}`;
            time2--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);

            if (upload_countdown.innerHTML == '10:00') {
                alert("Only 10 minutes remaining. ");
            }
            else {
                if (upload_countdown.innerHTML == '0:00') {
                    upload_countdown.style.display = 'none';
                    $("#<%=lbluploadtime.ClientID%>").hide();
                    $('#userAlertMsg').html("Assessmnent upload time exhausted");
                    $('#alertModal').modal('show');
                    //alert("Assessmnent upload time exhausted");

                }
                else
                    return true;
            }
        }--%>

    </script>
</asp:Content>