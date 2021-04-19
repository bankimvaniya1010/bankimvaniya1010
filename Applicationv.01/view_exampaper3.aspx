<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_exampaper3.aspx.cs" Inherits="view_exampaper3" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="assets/js/qrcode.min.js"></script>
    <script src="assets/js/qrcode.js"></script>


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2"></h1>
    </div>
    <div class="page">
        <div class="container page__container">
            <div class="row">
                <%--<div class="col-md-12">--%>
                <div class="col-md-11">
                    <div class="card" id="questions" runat="server">
                        <div style="font-size: medium; text-align: center; display: none">
                            Question Paper <%=answeredpapersheetscount %> / <%=allpapersheetscount%>
                        </div>
                        <div style="font-size: large; text-align: center">
                            <label id="lblreading" runat="server">READING TIME:</label> <span id="reading_countdown" style="font-weight:900;padding-right:25px;"></span>
                            <label id="lblexamtime" runat="server">ASSESSMENT TIME: </label> <span id="countdown" style="font-weight:900;padding-right:25px;"></span>
                            <label id="lbluploadtime" runat="server">UPLOAD TIME:</label> <span id="upload_countdown" style="font-weight:900"></span>
                           <%-- <label>Time in minutes remaining for this assessment to end automatically </label>
                            <span id="countdown"></span>--%>
                            <asp:HiddenField ID="hidTime" runat="server" />
                        </div>
                        <div style="text-align: right; display: none;">
                            <asp:Button runat="server" ID="disqualifiedbtn" OnClick="disqualifiedbtn_Click" Text="DisQualified" />
                        </div>
                        <div style="text-align: right">
                            <label style="font-size: 20px;">Marks : <%=exammarks%></label>
                        </div>
                        <asp:DataList ID="questionList" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="card-header">
                                        <div style="display: none;">
                                            <asp:Label ID="lblexampapersheetID" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                            <asp:Label ID="lblquestionpaperID" runat="server" Text='<%# Eval("questionpaperID") %>'></asp:Label>
                                        </div>
                                        <div class="media align-items-center">

                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:ListView runat="server" ID="listview" />
                                                    <iframe src='<%# Eval("questionpaper") %>' runat="server" width="800" height="750" style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%; width: 100%;" id="myframe" class="disableRightClick"  oncontextmenu=" return disableRightClick();" onmousedown="return false;"></iframe>
                                                    <%--  <asp:Image src='<%# Eval("questionpaper") %>' Width="800" Height="750" Style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;" runat="server"></asp:Image>--%>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="<%# (Eval("extrasheetpath") == null && Eval("fileinstruction") == null && Eval("audiovideofilepath") == null)? "display:none;": " "  %>">

                                        <div class="list-group-item" id="extrafileDiv" style="<%# Eval("extrasheetpath") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label class="col-md-3 col-form-label form-label"><b>RESOURCE DOCUMENT: </b></label>
                                                    <div class="col-md-6">
                                                        <a href="<%# Eval("extrasheetpath") %>" target="_blank">View File</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item" id="InstructionDiv" style="<%# Eval("fileinstruction") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label for="choice" class="col-md-3 col-form-label form-label"><b>Instructions : </b></label>
                                                    <div class="col-md-6">
                                                        <asp:Label runat="server" Text='<%#Eval("fileinstruction") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="audiiovideoDIv" >
                                        <div class="list-group-item" id="videoDIv" style="<%# Eval("audiovideofilepath") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label for="choice" class="col-md-3 col-form-label form-label" id="auidovideolink"><b>RESOURCE AUDIO/VIDEO: </b></label>
                                                    <div class="col-md-6">
                                                         <%--<a href="<%# Eval("audiovideofilepath") %>" target="_blank" id="aurdiovideohyperlink">View File</a>--%>
                                                         <div style="<%# Eval("iffile_isaudio_orvideo") == null? "display:none;": "display:block;border: none;"%>">
                                                            <video height="57px"; width="348px";  oncontextmenu="return false;" id="myAudio" controls controlslist="nodownload" disablepictureinpicture>
                                                                <source src='<%# Eval("audiovideofilepath") %>'>
                                                            </video>
                                                        </div>
                                                        
                                                        <div style="<%# Eval("iffile_isaudio_orvideo") == null? "display:block;": "display:none;border: none;"%>">
                                                            <video width="320" height="240" oncontextmenu="return false;" id="myVideo" controls controlslist="nodownload" disablepictureinpicture>
                                                                <source src='<%# Eval("audiovideofilepath") %>'>
                                                            </video>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="form-group row" id="button" style="display: none">
                            <div id="previousDiv" runat="server">
                                <asp:Button ID="btnprevious" runat="server" CssClass="btn btn-success" Text="View Previous" OnClick="btnprevious_Click1" />
                            </div>
                            <div id="nextDiv" runat="server" style="margin-left: 68%;">
                                <asp:Button ID="btnnext" runat="server" CssClass="btn btn-success" OnClick="btnnext_Click1" Text="Next" />

                            </div>
                        </div>
                    </div>

                    <div class="card" id="upload" runat="server">
                        <div class="card-body">
                            <div class="form-group row">
                                <div>
                                    In case you are using a mobile device to capture images of your answer sheets, "Use QR Code" to open the upload link on your mobile device. Ensure you select and upload all files (images) together, as you can only upload once.
                                    <br />

                                    In case you are uploading your answer sheets from your computer "Select Answer Sheet" option.  
                                </div>
                            </div>
                            <div class="form-group row" id="selecttype">
                                <label for="name" class="col-sm-3 col-form-label form-label">Upload Your Answer Sheet</label>

                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rblupload">Select Answer Sheet 
                                    <br />
                                            <div style="display: block">
                                                <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rblQR">Use QR Code (upload using your mobile device)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="uploadDiv" runat="server" style="display: none">
                                <label for="avatar" class="col-sm-4 col-form-label form-label"></label>
                                <div class="col-sm-8">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <div class="custom-file" style="width: auto;">
                                                <asp:DropDownList runat="server" ID="ddltype" CssClass="form-control">
                                                    <asp:ListItem Value="0"> Please Select</asp:ListItem>
                                                    <asp:ListItem Value="1">PDF</asp:ListItem>
                                                    <asp:ListItem Value="2"> Images</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:FileUpload ID="ansersheet" runat="server" AllowMultiple="true"  onchange ="checkFiletest(this);"/>
                                                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Upload" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />
                                                <br />
                                                <asp:Label ID="lblavatar" runat="server" Text="Select multiple files to be uploaded at one go, OR a single file containing all answer sheets" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="QRCodeDiv" runat="server" style="display: none">
                                <label for="avatar" class="col-sm-4 col-form-label form-label"></label>
                                <div class="col-sm-8">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <div>
                                                <%--<asp:button id="btnGenrateQR" runat="server" cssclass="btn btn-success" text="Genrate" OnClientClick="return generateQRCode()" />--%>
                                                <div id="qrcode"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="completedDiv" runat="server" style="display: none;">
                        <div>
                            <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>


        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$exampaper']").click(function () {
                if ($("#<%=rblupload.ClientID%>").is(":checked")) {
                    $("#<%=uploadDiv.ClientID%>").show();
                    $("#<%=QRCodeDiv.ClientID%>").hide();
                }
                else if ($("#<%=rblQR.ClientID%>").is(":checked")) {
                    $("#<%=QRCodeDiv.ClientID%>").show();
                    $("#<%=uploadDiv.ClientID%>").hide();
                }
            });
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');

            new QRCode(document.getElementById("qrcode"), "<%=webURL%>UploadAnswerSheet.aspx?ID=<%=assignID%>");

            if ($("#<%=rblupload.ClientID%>").is(":checked")) {
                $("#<%=uploadDiv.ClientID%>").show();
                $("#<%=QRCodeDiv.ClientID%>").hide();
            }
            else if ($("#<%=rblQR.ClientID%>").is(":checked")) {
                $("#<%=QRCodeDiv.ClientID%>").show();
                $("#<%=uploadDiv.ClientID%>").hide();
            }
        });

        var applicantid = '<%=HttpContext.Current.Session["UserID"]%>';

        var readingtime = '<%=Session["readingtime"]%>';
        var uploadtime ='<%=Session["uploadtime"]%>';
        var hms = '<%=Session["totalResponseTime"]%>';

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

        var hms1 = '<%=Session["readingtime"]%>';   // your input string       
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
        var hms2 = '<%=Session["uploadtime"]%>';   // your input string       
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

            if (countdownEl.innerHTML == '10:00') {
                $('#userAlertMsg').html("Only 10 minutes are remaining for your assessment time to end ");
                $('#alertModal').modal('show');
                //alert("Only 10 minutes are remaining for your assessment time to end ");
            }
            else {
                if (countdownEl.innerHTML == '0:00') {
                    countdownEl.style.display = 'none';
                    $("#<%=lblexamtime.ClientID%>").hide();
                    if (uploadtime != "") {
                        setInterval(updateCountdown2, 1000);
                        $("#<%=questionList.ClientID%>").hide();
                        $('#userAlertMsg').html("Please stop writing and upload your answer sheets now. The assessment time for this assessment is over, If you continue answering the assessment, you would be disqualified");
                        $('#alertModal').modal('show');
                        //alert("Please stop writing and upload your answer sheets now. The assessment time for this assessment is over, If you continue answering the assessment, you would be disqualified ");
                       
                    }
                    else {
                        upload_countdown.style.display = 'none';
                        $("#<%=lbluploadtime.ClientID%>").hide();
                        $('#userAlertMsg').html("Assessmnent upload time exhausted");
                        $('#alertModal').modal('show');
                        //alert("Assessmnent upload time exhausted");
                        ajaxcall();
                        var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                        location.replace(hostName + "exammodule.aspx");
                    }
                }
                else
                    return true;
            }
        }

        function updateCountdown2() {
            const minutes = Math.floor(time2 / 60);
            let seconds = time2 % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            upload_countdown.innerHTML = `${minutes}:${seconds}`;
            time2--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);

            if (upload_countdown.innerHTML == '5:00') {
                $('#userAlertMsg').html("Only 10 minutes remaining.");
                $('#alertModal').modal('show');
                //alert("Only 10 minutes remaining. ");
            }
            else {
                if (upload_countdown.innerHTML == '0:00') {
                    upload_countdown.style.display = 'none';
                    $("#<%=lbluploadtime.ClientID%>").hide();
                    $('#userAlertMsg').html("Assessmnent upload time exhausted");
                    $('#alertModal').modal('show');
                    //alert("Assessmnent upload time exhausted");
                    ajaxcall();
                    var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                    location.replace(hostName + "exammodule.aspx");
                }
                else
                    return true;
            }
        }

        setInterval(ajaxcalltocheckisanswersubmitted, 1000);

        function ajaxcalltocheckisanswersubmitted() {
            var assignID = '<%= assignID%>';
            $.ajax({
                type: "POST",
                url: "view_exampaper3.aspx/isanswersubmitted",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                        if (result == "responsesubmitted") 
                            location.replace(hostName + "exammodule.aspx");
                        else if (result == "Disqualified") 
                            location.replace(hostName + "exammodule.aspx");
                            //location.replace(hostName + "view_exampaper3.aspx?assignID=" + <%=assignID%>);
                    }
                }
            });

        }
        setInterval(ajaxcalltocheckRefreshTime, 1000);
        function ajaxcalltocheckRefreshTime() {
            var assignID = '<%= assignID%>';
             var exampaperid = '<%= exampaperid%>';
             $.ajax({
                 type: "POST",
                 url: "view_exampaper3.aspx/RefreshTime",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                  data: "{'assignID': '" + assignID + "'}",
                 success: function (response) {
                     if (response.d) {
                         var result = JSON.parse(response.d);

                     }
                 }
             });

         }
        function ajaxcall() {
            var assignID = '<%= assignID%>';
            $.ajax({
                type: "POST",
                url: "view_exampaper3.aspx/Saveresponse",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                    }
                }
            });
        }
        function ajaxcallTosavedViewedTime(time, type) {
            $.ajax({
                type: "POST",
                url: "view_exampaper3.aspx/SaveTime",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'time': '" + time + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                    }
                }
            });
        }
        function validateUploadedFile(Fileupload) {
            var filePath = Fileupload;
            var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf" ) {
                alert("Invalid File");
                return false;
            }
            return true;
        }
        function checkFiletest(elem) {
            var type = $("#<%=ddltype.ClientID%>").val();
            if (type == "" || type == "0") {
                alert("Please select file type");
                return false;
            }
            var filePath = elem.value;
            if (filePath.indexOf('.') == -1)
                return false;

            var validExtensions = new Array();
            var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            //Add valid extentions in this array
            if (type == "1")
                validExtensions[0] = 'pdf';
            else {
                validExtensions[0] = 'jpg';
                validExtensions[1] = 'jpeg';
                validExtensions[2] = 'png';
            }
            
            for (var i = 0; i < validExtensions.length; i++) {
                if (ext == validExtensions[i])
                    return true;
            }
            alert('The file extension ' + ext.toUpperCase() + ' is not allowed!');
            elem.value = "";
            return false;
        }



        function validateForm() {
            var answersheet = $("#ContentPlaceHolder1_ansersheet").val();

            if ($("#<%=ddltype.ClientID%>").val() == 0) {
                alert("Please select answer sheet type.");
                return false;
            }
            else if (answersheet == "") {
                alert("Please upload answer sheet.");
                return false;
            }
            else
                return true;
            
        }
        function checkFileUploadExt(type) {
            var control = $("#ContentPlaceHolder1_ansersheet").val();        //document.getElementById("ansersheet");
            var filelength = $("#ContentPlaceHolder1_ansersheet").files.length; 

            for (var i = 0; i < filelength; i++) {
                var file = control.files[i];
                var FileName = file.name;
                var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1).toLowerCase();
                if (type == "1") {
                    if ((FileExt != "pdf")) {
                        var error = "File type : " + FileExt + "\n\n";
                        error += "Please make sure your file is in pdf  format .\n\n";
                        console.error(error);
                    }
                }
                else {
                    if (FileExt != "jpg" && FileExt != "png" && FileExt != "jpeg") {
                        var error = "File type : " + FileExt + "\n\n";
                        error += "Please make sure your file is in jpg or jpeg or png format .\n\n";
                        console.error(error);
                    }
                }
            }
        }

        //$(document).keydown(function (event) {
        //    console.log(event);
        //    if (event.keyCode == 123) { // Prevent F12
        //        return false;
        //    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        //        return false;
        //    }
        //});
        //$(document).on("contextmenu", function (e) {   //prevent inspect     
        //    e.preventDefault();
        //});
              
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="' + url + '" allowfullscreen></iframe></div></div></div></div></div>');
            $('#video-modal').modal('show');
            $('#video-modal').on('hidden.bs.modal', function () {
                $('#video-modal').remove();
            });
        }
        var is_onetimeshow = '<%=is_onetimeshow%>';
        var examid = '<%=examid%>';
        var examsheetid = '<%=examsheetid%>';
        var examdatetime = '<%=examdatetime%>';
        var assignID = '<%= assignID%>';
        var isaudio_orvideo = '<%= isaudio_orvideo%>';

        if (is_onetimeshow == 1) {
            var aud;
            if (isaudio_orvideo == "audio")
                aud = document.getElementById("myAudio");
            else
                aud = document.getElementById("myVideo");

            aud.setAttribute("video:-webkit-media-controls-timeline", "display: none");
            
            aud.onended = function () {
                $.ajax({
                    type: "POST",
                    url: "view_exampaper3.aspx/Saveaudiovideoresponse",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'examid': '" + examid + "','examsheetid': '" + examsheetid + "', 'is_onetimeshow': '" + is_onetimeshow + "', 'assignID': '" + assignID + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                        }
                    }
                });
                alert("The file has ended");
                $('#audiiovideoDIv').hide();
            };
        }
      //  var audio =document.getElementById("myAudio");
      //  audio.onplay = function () {
      //      audio.controls = false;//.removeAttribute('controls');
      //      //alert("The video has started to play");
      //  };
      //var vid =document.getElementById("myVideo");
      //  vid.onplay = function () {
      //      vid.controls = false;//.removeAttribute('controls');
      //      //alert("The video has started to play");
      //  };
    </script>
</asp:Content>
