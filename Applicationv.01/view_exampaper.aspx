<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_exampaper.aspx.cs" Inherits="view_exampaper" MasterPageFile="~/student.master" %>

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
                <div class="row">
                    <%--<div class="col-md-12">--%>
                    <div class="col-md-12">
                        <div class="card" id="questions" runat="server">
                            <div style="font-size: medium; text-align: center">
                                Question Paper <%=ViewState["answeredpapersheetscount"] %> / <%=allpapersheetscount%>
                            </div>
                            <div style="font-size: medium; text-align: center">
                                <span id="countdown"></span>                                
                                <asp:HiddenField ID="hidTime" runat="server" />
                            </div>
                            <div style="text-align: right;display:none;">
                               <asp:Button runat="server" ID="disqualifiedbtn" OnClick="disqualifiedbtn_Click" Text="DisQualified"/>
                            </div>
                            <div style="text-align: right">
                                <label>Marks : <%=exammarks%></label>
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
                                                        <asp:Image src='<%# Eval("questionpaper") %>' Width="800" Height="750" Style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;" runat="server"></asp:Image>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group row" id="extrafiledocument" style="<%# (Eval("extrasheetpath") == null && Eval("fileinstruction") == null && Eval("audiovideofilepath") == null)? "visibility: hidden;": " "  %>">
                                                <label for="avatar" class="col-sm-4 col-form-label form-label">Assessmnent related Documents </label>
                                                <div class="col-sm-8">
                                                    <div class="media align-items-center">
                                                        <div class="media-body">
                                                            <div class="custom-file" style="width: auto;">
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("extrasheetpath") == null? "visibility: hidden;": "visibility:visible;"  %>"><b>RESOURCE DOCUMENT:</b> <a href="<%# Eval("extrasheetpath") %>" target="_blank" >View File</a></label><br/>
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("fileinstruction") == null? "visibility: hidden;": "visibility:visible;"  %>"><b>Instructions : </b> <%#Eval("fileinstruction") %></label><br/>
                                                                <label for="choice" class="col-form-label form-label" style="<%# Eval("audiovideofilepath") == null? "visibility: hidden;": "visibility:visible;"  %>"> <b>RESOURCE AUDIO/VIDEO: </b> <a href="<%# Eval("audiovideofilepath") %>" target="_blank">View File</a></label>
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
                                                                <asp:Label ID="lblavatar" runat="server" />
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
                                                                <asp:Label ID="Label1" runat="server" />
                                                                <asp:FileUpload ID="extrasheet" runat="server" />
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
                 <%--    <div class="col-md-4">
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
                   </div> --%>
                </div>
            </div>
        </div>

        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>

      
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exam_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
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
        function ajaxcall() {
            var assignID = '<%= assignID%>';
            $.ajax({
                       type: "POST",
                       url: "view_exampaper.aspx/Saveresponse",
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
            var allpapersCount = <%=allpapersCount%>;
            for (var i = 0; i < allpapersCount; i++) {
                var answersheet = $("#ContentPlaceHolder1_questionList_ansersheet_" + i).val();
                var extrasheet = $("#ContentPlaceHolder1_questionList_extrasheet_" + i).val();

                if (answersheet == "") {
                    alert("Please upload answer sheet.");
                    return false;
                }
            }
            return true;
        }
    </script>

</asp:Content>
