﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_videoquestion.aspx.cs" Inherits="gte_videoquestion" MasterPageFile="~/student.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Video Question</li>
        </ol>
        <h1 class="h2">GTE Video Question</h1>
    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card faq-lftcard" style="width: 650px;">
                        <div class="list-group list-group-fit">

                             <div class="list-group-item" id="question1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dateofissue">
                                    <div class="form-row">
                                        <label id="questionno" runat="server" for="passportno" class="col-md-3 col-form-label form-label">
                                            How would pursuing your selected course at 
                                            <asp:Label ID="lblinstitutename" runat="server"></asp:Label>, <asp:Label ID="lblcity" runat="server"></asp:Label>      
                                            help you ? What do you plan to do after completing this course.
                                        </label>    
                                        <div class="col-md-6">
                                      
                                        </div>
                                    </div>
                                </div>
                            </div>                               
                             <div class="list-group-item" id="uploadbtn">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                     
                                          <input type="file" runat="server" name="FileUpload" id="FileUpload"/>
                                        <asp:Label ID="lblupload" runat="server" />
                                         <input type="hidden" id="hidDocumentPath" runat="server" />
                                         <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                        <div class="col-md-6">
                                        </div>
                                         <div class="media-left">                                  
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-primary btn-block" OnClientClick="return validateUploadedFile()" OnClick="btnupload_Click" />                                                                                                               
                                         </div>
                                    </div>
                                </div>
                            </div>                          
                        </div>
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                                <label onclick="openLink('<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>                                                             
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

        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' +url+ '</div></div></div></div></div>'  );
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
            });
        }

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

            return flag;
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

