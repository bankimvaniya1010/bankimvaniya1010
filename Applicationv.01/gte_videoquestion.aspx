<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_videoquestion.aspx.cs" Inherits="gte_videoquestion" MasterPageFile="~/student.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Video Question</li>
        </ol>
        <h1 class="h2">GTE VIDEO QUESTION</h1>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">

                             <div class="list-group-item" id="question1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dateofissue">
                                    <div class="form-row">
                                        <label id="questionno" runat="server" for="passportno" class="col-md-12 col-form-label form-label">
                                            How would pursuing your selected course at 
                                            <asp:Label ID="lblinstitutename" runat="server"></asp:Label>, <asp:Label ID="lblcity" runat="server"></asp:Label>      
                                            help you ? What do you plan to do after completing this course.
                                        </label>
                                    </div>
                                </div>
                            </div>                               
                             <div class="list-group-item" id="uploadbtn">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="row">
                                        <div class="col-md-12 get-upldv">
                                          <input type="file" runat="server" name="FileUpload" id="FileUpload"/>
                                        </div>
                                        <div class="media-left col-md-12">
                                            <div style="position:relative;width:202px;background:transparent;margin-bottom: 15px;height:25px;"> 
                                                <div id="progress" class="hide" style="background: blue; height: 25px;width:0;color:#fff;">
                                                    <div class="status" style="margin-left:10px;"></div>
                                                </div> 
                                            </div> 
                                        </div>
                                        <div class="media-left col-md-6">                                  
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-primary btn-block" OnClientClick="return validateUploadedFile()" />
                                         </div>
                                        <div class="col-md-6 d-flex align-self-center">
                                            <asp:Label ID="lblupload" runat="server" />
                                         <input type="hidden" id="hidDocumentPath" runat="server" />
                                         <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>                          
                        </div>
                    </div>
                    </div>
                   <div class="col-md-4">
                       <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                    
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
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
        function checkFileType() {
            var fileName = $("#ContentPlaceHolder1_FileUpload")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1);
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "ogv");
        }

        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 20);
        }

        function checkDuration() {
            while (!videoDurationReceived) {

            }
            return (videoDuration < 75);
        }

        var videoDurationReceived = false, videoDuration = 0;
        function validateUploadedFile() {
            var flag = false;
            if ($("#ContentPlaceHolder1_FileUpload")[0].files.length == 0) {
                alert("Please Select a video"); 
            }
            else if (!checkFileType()) {
                alert("Please upload a valid video")
            }
            else if (!checkFileSize()) {
                alert("Video Size should be less than 20MB")
            }
            else if (!checkDuration()) {
                alert("Video duration should be less than 75 Seconds")
            }
            else
                flag = true;

            if (flag) {
                $("#ContentPlaceHolder1_btnupload").attr("disabled", "true")
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "blue");

                var formData = new FormData();
                var data = $("#ContentPlaceHolder1_FileUpload")[0].files[0];

                formData.append("files", data);

                var dummyProgress = 1;
                var intervalId = -1;
                var req = new XMLHttpRequest();

                req.upload.addEventListener("progress", function (event) {

                    var percent = (event.loaded / event.total) * 90;
                    var progress = Math.round((event.loaded / event.total) * 90);
                    console.log("progress:" + progress);
                    if (progress < 90) {
                        $(".status").html(progress + "%");
                        progressEle.width(progress + "%");
                    }
                    else {
                        progress = progress + dummyProgress;
                        if (progress <= 99) {
                            $(".status").html(progress + "%");
                            progressEle.width(progress + "%");
                        }
                        if (intervalId == -1) {
                            intervalId = setInterval(function () {
                                progress = progress + dummyProgress;
                                dummyProgress++;
                                if (progress <= 99) {
                                    $(".status").html(progress + "%");
                                    progressEle.width(progress + "%");
                                }
                                else
                                    clearInterval(intervalId);
                            }, 2500);
                        }
                    }
                });

                req.onreadystatechange = function () {
                    var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                    if (req.status && req.status == 200 && (req.readyState == 4)) {
                        $("#ContentPlaceHolder1_btnupload").removeAttr("disabled");
                        alert("Video uploaded successfully");
                        location.replace(hostName + "gte_sop.aspx");
                    }
                }

                req.open("POST", 'gte_videoquestion.aspx/uploadVideo', true);
                req.send(formData);
            }
            return false;
        }

        function getFileInfo() {
            videoDurationReceived = false;
            var video = document.createElement('video');
            video.preload = 'metadata';
            var URL = window.URL || window.webkitURL;

            video.onloadedmetadata = function () {
                URL.revokeObjectURL(video.src);
                videoDuration = video.duration;
                videoDurationReceived = true;
            }

            video.src = URL.createObjectURL($("#ContentPlaceHolder1_FileUpload")[0].files[0]);
        }
      
        $(document).ready(function () {

            $('#ContentPlaceHolder1_FileUpload').bind('change', function () {
                if (checkFileType())
                    getFileInfo();
            });

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });           
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtevideoquestion').addClass('active');
        });

       
       
    </script>
</asp:Content>

