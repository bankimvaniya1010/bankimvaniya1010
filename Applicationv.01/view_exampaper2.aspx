<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_exampaper2.aspx.cs" Inherits="view_exampaper2" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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
                <div class="col-md-12">
                    <div class="card" id="questions" runat="server">
                        <div style="font-size: medium; text-align: center">
                            Question Paper <%=ViewState["answeredpapersheetscount"] %> / <%=allpapersheetscount%>
                        </div>
                        <div style="font-size: medium; text-align: center">
                            <label>Time in minutes remaining for this assessment to end automatically </label>
                            <span id="countdown"></span>
                            <asp:HiddenField ID="hidTime" runat="server" />
                        </div>
                        <div style="text-align: right;display:none;">
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
                                            <asp:Label ID="lblquestiontype" runat="server" Text='<%# Eval("questiontype") %>'></asp:Label>
                                        </div>
                                        <div class="media align-items-center">

                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:Label runat="server" ID="lblquestion" Text='<%#Eval("question") %>'></asp:Label>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="mcq" style='<%= MCQ == "" ? "display:none;": "display:block;"  %>'>
                                            <div class="form-group option">
                                                <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("answer1") %>' />
                                                <i id="correctTick1" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="incorrectTick1" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="icincorrectTick1" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                            <div class="form-group option">
                                                <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("answer2") %>' />
                                                <i id="correctTick2" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="incorrectTick2" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="icincorrectTick2" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                            <div class="form-group option">
                                                <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("answer3") %>' />
                                                <i id="correctTick3" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="incorrectTick3" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="icincorrectTick3" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                            <div class="form-group option">
                                                <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("answer4") %>' />
                                                <i id="correctTick4" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="incorrectTick4" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="icincorrectTick4" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                        <div id="truefalse" style='<%= TrueFalse == "" ? "display:none;": "display:block;"  %>'>
                                            <div class="form-group option fontsize-radioButtonList">
                                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="A" Text='<%# Eval("answer1") %>' />
                                                <i id="I1" style="display: none;" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="i2" style="display: none;" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="i3" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                            <div class="form-group option fontsize-radioButtonList">
                                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="A" Text='<%# Eval("answer2") %>' />
                                                <i id="I4" style="display: none" runat="server" class="fas fa-check-circle fontsize correcttickclr"></i>
                                                <i id="i5" style="display: none" runat="server" class="fas fa-times-circle fontsize crosstickcolor"></i>
                                                <span class="helpicon"><i id="i6" runat="server" class="fa fa-info-circle fontsize infotickclr" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                        <div id="openanswer" style='<%= openanswer == "" ? "display:none;": "display:block;"  %>'>
                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <label id="lblopenans" style="<%# Eval("openanswertype") == null? "display: block;": "display:none;"  %>">Note: <%# Eval("answer1") %></label>

                                                    <label for="choice" class="col-form-label form-label" style="<%# Eval("openanswertype") == null? "display: none;": "display:block;"  %>"><b>File : </b><a href="<%# Eval("answer1") %>" target="_blank">View File</a></label>
                                                </h4>
                                            </div>
                                            <br />
                                            <div class="form-group row">
                                                <label for="avatar" class="col-sm-2 col-form-label form-label">Answer</label>
                                                <div class="col-sm-8">
                                                    <div class="media align-items-center">
                                                        <div class="media-body">
                                                            <asp:TextBox runat="server" ID="txtopenanswer" class="form-control" TextMode="MultiLine" Height="157px"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="uploadanswer" style='<%= uploadanswer == "" ? "display:none;": "display:block;"  %>'>
                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:Image src='<%# Eval("upload_questionpath") %>' Width="800" Height="750" Style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;" runat="server"></asp:Image>
                                                </h4>
                                            </div>

                                      <div style="<%# (Eval("upload_extrasheetpath") == null && Eval("upload_fileinstruction") == null && Eval("upload_filepath") == null)? "visibility: hidden;": " "  %>">

                                        <div class="list-group-item" id="extrafileDiv" style="<%# Eval("upload_extrasheetpath") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label class="col-md-3 col-form-label form-label"><b>RESOURCE DOCUMENT: </b></label>
                                                    <div class="col-md-6">
                                                        <a href="<%# Eval("upload_extrasheetpath") %>" target="_blank">View File</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item" id="InstructionDiv" style="<%# Eval("upload_fileinstruction") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label for="choice" class="col-md-3 col-form-label form-label"><b>Instructions : </b></label>
                                                    <div class="col-md-6">
                                                        <asp:Label runat="server" Text='<%#Eval("upload_fileinstruction") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="audiiovideoDIv" >
                                        <div class="list-group-item" id="videoDIv" style="<%# Eval("upload_filepath") == null? "display:none;": "display:block;border: none;margin-left:20px;"%>">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                                <div class="form-row">
                                                    <label for="choice" class="col-md-3 col-form-label form-label" id="auidovideolink"><b>RESOURCE AUDIO/VIDEO: </b></label>
                                                    <div class="col-md-6">
                                                         <%--<a href="<%# Eval("upload_filepath") %>" target="_blank" id="aurdiovideohyperlink">View File</a>--%>
                                                         <div style="<%# Eval("iffile_isaudio_orvideo") == null? "display:none;": "display:block;border: none;"%>">
                                                            <video height="57px"; width="348px";  oncontextmenu="return false;" id="myVideo" controls controlslist="nodownload" disablepictureinpicture>
                                                                <source src='<%# Eval("upload_filepath") %>'>
                                                            </video>
                                                        </div>
                                                          <div style="<%# Eval("iffile_isaudio_orvideo") == null? "display:block;": "display:none;border: none;"%>">
                                                            <video width="320" height="240" oncontextmenu="return false;" id="myVideo" controls controlslist="nodownload" disablepictureinpicture>
                                                                <source src='<%# Eval("upload_filepath") %>'>
                                                            </video>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                    </div>                                         
                                            <div class="form-group row">
                                                <label for="avatar" class="col-sm-4 col-form-label form-label">Answer sheet</label>
                                                <div class="col-sm-8">
                                                    <div class="media align-items-center">
                                                        <div class="media-body">
                                                            <div class="custom-file" style="width: auto;">
                                                                <asp:Label ID="Label2" runat="server" />
                                                                <asp:FileUpload ID="ansersheet" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="avatar" class="col-sm-4 col-form-label form-label">Extra sheets</label>
                                                <div class="col-sm-8">
                                                    <div class="media align-items-center">
                                                        <div class="media-body">
                                                            <div class="custom-file" style="width: auto;">
                                                                <asp:Label ID="Label3" runat="server" />
                                                                <asp:FileUpload ID="extraasnwersheet" runat="server" />
                                                            </div>
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
                        <div class="card-footer" id="button" runat="server">

                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateForm()" />

                        </div>
                    </div>
                    <div id="completedDiv" runat="server" style="display: none;">
                        <div>
                            <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%--  <div class="col-md-4">
                    <div class="banImg-wrp">
                    <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                <div class="card faq-qwrp" id="Div1" runat="server">
                        <div class="card-body">
                        <%  if (allQuestions.Count > 0)
                            { %>
                        <div id="question" runat="server">
                                <h5>Frequently Asked Questions (FAQs)</h5>
                                <div class="">
                                <%for (int q = 0; q < allQuestions.Count; q++)
                                    {%>  <div class="star-list">                                                             
                                            <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')" >  <%=allQuestions[q].question%> </label>
                                        </div>                                                  
                                <%} %>
                            </div>
                        </div>      
                            <%} %>  
                                     
                        </div>
                    </div>
                </div>--%>
               
            </div>        
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
        </div>
    <script>

        $(document).ready(function () {           

            setInterval(ajaxcalltocheckisanswersubmitted, 1000);

            var hms = '<%=Session["totalResponseTime"]%>';   // your input string       
            //Convert hh:mm:ss string to seconds in one line. Also allowed h:m:s format and mm:ss, m:s etc
            var secondsS;
            //alert(secondsS);
            if (hms != "") {
                if (hms.includes(":"))
                    secondsS = hms.split(':').reverse().reduce((prev, curr, i) => prev + curr * Math.pow(60, i), 0);
                else
                    secondsS = hms * 60;
                let time = secondsS;
                const countdownEl = document.getElementById('countdown');
                if (time != null || time != "")
                    setInterval(updateCountdown, 1000);


                function updateCountdown() {
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
                    var applicantid = '<%=HttpContext.Current.Session["UserID"]%>';
                        var exampaper_id = '<%= exampaper_id%>';
                        var assignID = '<%= assignID%>';

                        if (countdownEl.innerHTML == '0:00') {
                            countdownEl.style.display = 'none';
                            alert("Assessmnent time exhausted");
                            $.ajax({
                                type: "POST",
                                url: "view_exampaper2.aspx/Saveresponse",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: "{'assignID': '" + assignID + "'}",
                                success: function (response) {
                                    if (response.d) {
                                        var result = JSON.parse(response.d);

                                    }
                                }
                            });
                            var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                            location.replace(hostName + "exammodule.aspx");

                        }
                        else
                            return true;
                    }
                }

            }
        });

         function ajaxcalltocheckisanswersubmitted() {
            var assignID = '<%= assignID%>';
            $.ajax({
                type: "POST",
                url: "view_exampaper2.aspx/isanswersubmitted",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                         if (result == "Disqualified") {
                             var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                             location.replace(hostName + "exammodule.aspx");
                        }
                    }
                }
            });

        }
        function validateForm() {
            var MCQ = '<%=MCQ%>';
            var TrueFalse = '<%=TrueFalse%>';
            var openanswer = '<%=openanswer%>';
            var uploadanswer = '<%=uploadanswer%>';

            var allpapersCount = <%=allpapersCount%>;

            if (MCQ != "") {
                for (var i = 0; i < allpapersCount; i++) {
                    var rdoans1 = $("#ContentPlaceHolder1_questionList_rdoans1_" + i);
                    var rdoans2 = $("#ContentPlaceHolder1_questionList_rdoans2_" + i);
                    var rdoans3 = $("#ContentPlaceHolder1_questionList_rdoans3_" + i);
                    var rdoans4 = $("#ContentPlaceHolder1_questionList_rdoans4_" + i);

                    if (!(rdoans1.is(':checked') || rdoans2.is(':checked') || rdoans3.is(':checked') || rdoans4.is(':checked'))) {
                        alert("Please select one option for question");
                        return false;
                    }
                }
                return true;
            }
            else if (TrueFalse != "") {
                for (var i = 0; i < allpapersCount; i++) {
                    var rdoans1 = $("#ContentPlaceHolder1_questionList_RadioButton1_" + i);
                    var rdoans2 = $("#ContentPlaceHolder1_questionList_RadioButton2_" + i);

                    if (!(rdoans1.is(':checked') || rdoans2.is(':checked'))) {
                        alert("Please select one option for question");
                        return false;
                    }
                }
                return true;
            }
            else if (openanswer != "") {
                for (var i = 0; i < allpapersCount; i++) {
                    var txtanswer = $("#ContentPlaceHolder1_questionList_txtopenanswer_" + i);

                    if (txtanswer.val() == "") {
                        alert("Please enter answer.");
                        return false;
                    }
                }
                return true;
            }
            else if (uploadanswer != "") {
                for (var i = 0; i < allpapersCount; i++) {
                    var answersheet = $("#ContentPlaceHolder1_questionList_ansersheet_" + i).val();
                    var extrasheet = $("#ContentPlaceHolder1_questionList_extraasnwersheet_" + i).val();

                    if (answersheet == "") {
                        alert("Please upload answer sheet.");
                        return false;
                    }
                }
                return true;
            }

            return true;
        }
        var is_onetimeshow = '<%=is_onetimeshow%>';
        var examid = '<%=examid%>';
        var examsheetid = '<%=examsheetid%>';
        var examdatetime = '<%=examdatetime%>';

        if (is_onetimeshow == 1) {
            var aud = document.getElementById("myVideo");
            aud.onended = function () {
                alert("The file has ended");
                $('#audiiovideoDIv').hide();
            };

            $.ajax({
                type: "POST",
                url: "view_exampaper2.aspx/Saveaudiovideoresponse",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'examid': '" + examid + "','examsheetid': '" + examsheetid + "', 'is_onetimeshow': '" + is_onetimeshow + "', 'examdatetime': '" + examdatetime + "'}",                             
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                    }
                }
            });
        }
        
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
        });


    </script>

</asp:Content>
