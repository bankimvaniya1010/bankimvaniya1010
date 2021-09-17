<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_join_MyClass.aspx.cs" Inherits="ec_join_MyClass" MasterPageFile="~/student.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">

            </li>
        </ol>
        <h3>JOIN A CLASS</h3>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                      <%--  <div class="card-body">
                             <div class="list-group-item border" id="divexamname" runat="server">
                                <label id="Label7" runat="server" for="divexamname">
                                   
                                </label>
                            </div>
                              <div class="list-group-item border" id="para1" runat="server">
                                <label id="lblwithoutotp" runat="server" for="withoutotp">Hello , </label>
                                <br/>
                                <ul typeof="disc">
                                     <li>
                                        <label id="lblcusttime" runat="server" for="withoutotp"></label>
                                    </li>
                                    <li>
                                        <label id="lblutctime" runat="server" for="withoutotp"></label>
                                    </li>
                                   
                                </ul>
                            </div>
                            <div id="div1">
                                <div class="list-group-item border">
                                    <b>
                                        <label id="Label1" runat="server">
                                            Hello <%=studentname %> please wait to be verified by <%=InvigilatorName %>, your Invigilator for this assessment. 
                                        </label></b>
                                </div>
                            </div>

                            <div id="div2">
                                <div class="list-group-item border">
                                    <b>
                                        <label id="Label2" runat="server">
                                            <%=studentname %>, you have been successfully verified. Please wait for <%=InvigilatorName %>, your Invigilator to start this assessment. 
                                        </label>
                                    </b>
                                </div>
                            </div>

                            <div id="div3">
                                <div class="list-group-item border">
                                    <b>
                                        <label id="lbl" runat="server"><%=studentname %>,You have been verified by the invigilator.Time in minutes remaining for this assessment to start automatically </label>
                                        <span id="countdown"></span></b>
                                    <asp:HiddenField ID="hidTime" runat="server" />
                                </div>
                            </div>

                            <div class="list-group-item border">
                                Do not close the browser or click on the back button, or move away from this page. Doing so will result in you being reported as "Logged Out". Only verified & logged in candidates will be able to access and complete this assessment.
                            </div>
                            <div class="list-group-item border">
                                Please ensure you do not have any other browser window or tabs open other than the Assessment Centre and the virtual meeting. You are not permitted to take screen shots, use the copy and edit function doing so will result in your disqualification. 
                                </div>
                           <div class="list-group-item border" id="reasonDiv">
                                <label id="lblreason" runat="server" for="reasonDiv">
                                </label>
                            </div>
                        </div>--%>
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
  <%--  <script>
        setInterval(refreshTableContent, 1000);
        function refreshTableContent() {
            
            var assignID='<%=assignid%>';
            $.ajax({
                type: "POST",
                url: "exam_verification.aspx/isaccesstoexamgiven",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                  if (response.d) {
                      var result = JSON.parse(response.d);
                      var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                      
                      if (result != "0") {
                          
                          if (result == "1") {
                              location.replace(hostName + "view_exampaper.aspx?assignID=<%=assignid%>");
                              return false;
                          }
                          else if (result == "2") {
                              location.replace(hostName + "view_exampaper2.aspx?assignID=<%=assignid%>");
                              return false;
                          }
                          else if (result == "3") {
                              location.replace(hostName + "view_exampaper3.aspx?assignID=<%=assignid%>");
                              return false;
                          }
                          else if (result == "NoAccess") {
                             
                              $("#div1").show();
                              $("#div2").hide();
                              $("#div3").hide();
                          }
                          else if (result == "Notstarted") {
                              $("#div1").hide();
                              $("#div2").show();
                              $("#div3").hide();
                          }
                          else if (result == "Not Present" || result == "Not Verified") {
                              $('#userAlertMsg').html("You have been marked " + result + " by invigilator.");
                              $('#alertModal').modal('show');
                              location.replace(hostName + "exammodule.aspx");
                          }
                          else if (result == "showclock")
                          {
                              var pagerefreshed = '<%= pagerefreshed%>';
                              if (pagerefreshed == 1) {
                                  $("#div1").hide();
                                  $("#div2").hide();
                                  $("#div3").show();
                                  updateCountdown();
                              }
                              else
                                  location.replace(hostName + "exam_verification.aspx?assignid=<%=assignid%>");
                          }
                      }
                      else {
                         $("#div1").show();
                          $("#div2").hide();
                          $("#div3").hide();
                      }
                    }
                }
            });
        }

      
        //setInterval(updateCountdown, 1000);
        

        var hms = '<%=examtime%>';
        var secondsS;
        
        if (hms.includes(":"))
            secondsS = hms.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
        else
            secondsS = hms * 60;
        let time = secondsS;
        const countdownEl = document.getElementById('countdown');

        function updateCountdown() {
          
            const minutes = Math.floor(time / 60);
            let seconds = time % 60;

            seconds = seconds < 10 ? '0' + seconds : seconds;
            countdownEl.innerHTML = `${minutes}:${seconds}`;
            time--;
            $("#<%=hidTime.ClientID%>").val(`${minutes}:${seconds}`);	

            if (countdownEl.innerHTML == '0:00') {
                countdownEl.style.display = 'none';
           }
           else
               return true;
        }
        $(document).ready(function () {
            
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');

           <%--  window.addEventListener("beforeunload", function (e) {
           // ajaxCall();
            var confirmationMessage = 'It looks like you have been editing something. '
                + 'If you leave before saving, your changes will be lost.';

            (e || window.event).returnValue = confirmationMessage; //Gecko + IE

            return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
        });

        $(window).on('unload', function () {
            //ajaxCall();
        });

        document.onkeydown = checkKeycode
    function checkKeycode(e) {
        var keycode;
        if (window.event)
            keycode = window.event.keyCode;
        else if (e)
            keycode = e.which;

        // Mozilla firefox
        if ($.browser.mozilla) {
            if (keycode == 116 ||(e.ctrlKey && keycode == 82)) {
                if (e.preventDefault)
                {
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        } 
        // IE
        else if ($.browser.msie) {
            if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
                window.event.returnValue = false;
                window.event.keyCode = 0;
                window.status = "Refresh is disabled";
            }
        }
    }  

function ajaxCall() {
            var assignID = '<%=assignid%>';
            $.ajax({
                type: "POST",
                url: "exam_verification.aspx/islogout",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                    }
                }
            });

        }--%>


        });
    </script>--%>
</asp:Content>
