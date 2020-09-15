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
    <div class="page ">
        <div class="container page__container">           
                <div class="row">
                    <%--<div class="col-md-12">--%>
                    <div class="col-md-11">
                        <div class="card" id="questions" runat="server">
                            <div style="font-size: medium; text-align: center; display: none">
                                Question Paper <%=answeredpapersheetscount %> / <%=allpapersheetscount%>
                            </div>
                            <div style="font-size: medium; text-align: center">
                                <span id="countdown"></span>
                                <asp:hiddenfield id="hidTime" runat="server" />
                            </div>
                            <div style="text-align: right;display:none;">
                                <asp:button runat="server" id="disqualifiedbtn" onclick="disqualifiedbtn_Click" text="DisQualified" />
                            </div>
                            <div style="text-align: right">
                                <label>Marks : <%=exammarks%></label>
                            </div>
                            <asp:datalist id="questionList" runat="server">
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
                                                        <asp:ListView runat="server" ID="listview"/>
                                                       <iframe src='<%# Eval("questionpaper") %>' runat="server" Width="800" Height="750" Style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%; width:100%;" id="myframe"> </iframe>
                                                      <%--  <asp:Image src='<%# Eval("questionpaper") %>' Width="800" Height="750" Style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;" runat="server"></asp:Image>--%>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                          
                                        <div class="">
                                            <div class="form-group row" id="extrafiledocument" style="<%# (Eval("extrasheetpath") == null && Eval("fileinstruction") == null && Eval("audiovideofilepath") == null)? "display:none;": " "  %>">
                                                <label for="avatar" class="col-sm-4 col-form-label form-label">Assessmnent related Documents </label>
                                                <div class="col-sm-8">
                                                    <div class="media align-items-center">
                                                        <div class="media-body">
                                                            <div class="custom-file" style="width: auto;">
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("extrasheetpath") == null? "display:none;": "display:block;"  %>"><b>Extra Sheet : </b> <a href="<%# Eval("extrasheetpath") %>" target="_blank" >View File</a></label><br/>
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("fileinstruction") == null? "display:none;": "display:block;"  %>"><b>Instructions : </b> <%#Eval("fileinstruction") %></label>
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("audiovideofilepath") == null? "display:none;": "display:block;"  %>"> <b>File : </b> <a href="<%# Eval("audiovideofilepath") %>" target="_blank">View File</a></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                                                          
                                        </div>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:datalist>
                             <div class="form-group row" id="button" style="display:none">
                                 <div id="previousDiv" runat="server">
                                     <asp:button id="btnprevious" runat="server" cssclass="btn btn-success" text="View Previous" onclick="btnprevious_Click1" />
                                 </div>
                                 <div id="nextDiv" runat="server" style="margin-left:68%;">
                                     <asp:button id="btnnext" runat="server" cssclass="btn btn-success" onclick="btnnext_Click1" text="Next"  />
                                     
                                 </div>
                             </div>
                        </div>
                    
                    <div class="card" id="upload" runat="server">
                        <div class="card-body">
                            <div class="form-group row" id="selecttype">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload Your Answer Sheet</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rblupload">Select Answer Sheet 
                                    <br />
                                        <div style="display:block">
                                        <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rblQR" >Use QR Code
                                            </div>                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="form-group row" id="uploadDiv" runat="server" style="display:none">
                                <label for="avatar" class="col-sm-4 col-form-label form-label"></label>
                                <div class="col-sm-8">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <div class="custom-file" style="width: auto;">
                                                <asp:fileupload id="ansersheet" runat="server" allowmultiple="true" />
                                                <asp:button id="btnsubmit" runat="server" cssclass="btn btn-success" text="Upload" onclick="btnsubmit_Click" onclientclick="return validateForm()" />
                                                <br/>
                                                <asp:label id="lblavatar" runat="server" Text="Select Multiple answer sheet to be upload at once OR you can also upload pdf of your answer sheet."/>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="QRCodeDiv" runat="server" style="display:none">
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
                                <asp:label id="lblCompleted" runat="server" text=""></asp:label>
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


        var hms = '<%=Session["totalResponseTime"]%>';   // your input string       
        //Convert hh:mm:ss string to seconds in one line. Also allowed h:m:s format and mm:ss, m:s etc
        var secondsS;
        //alert(secondsS);

        if (hms.includes(":"))
            secondsS = hms.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
        else
            secondsS = hms * 60;
        let time = secondsS;
        const countdownEl = document.getElementById('countdown');

        setInterval(updateCountdown, 1000);
        
        function updateCountdown() {
             ajaxcalltocheckisanswersubmitted();
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            countdownEl.innerHTML = `${minutes}:${seconds}`;            
            time--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);	

            if (countdownEl.innerHTML == '10:00') {
                alert("Only 10 minutes remaining. ");
                return false;
            }
            else {
                if (countdownEl.innerHTML == '0:00') {
                    countdownEl.style.display = 'none';
                    alert("Assessmnent time exhausted");
                    ajaxcall();
                    var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                    location.replace(hostName + "exammodule.aspx");
                  
                }
                else
                    return true;
               
            }

            
        }
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
                        if (result == "responsesubmitted") {
                            var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                            location.replace(hostName + "exammodule.aspx");
                        }

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
        function validateForm() {
           var answersheet = $("#ContentPlaceHolder1_ansersheet").val();
            if (answersheet == "") {
                alert("Please upload answer sheet.");
                return false;
            }
            else
                return true;
        }

        $(document).keydown(function (event) {
            console.log(event);
            if (event.keyCode == 123) { // Prevent F12
                return false;
            } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
                return false;
            }
        });
        $(document).on("contextmenu", function (e) {   //prevent inspect     
            e.preventDefault();
        });
        //window.frames["iframe"].contentDocument.oncontextmenu = function () {
        //    return false;
        //};
        
    </script>

</asp:Content>
