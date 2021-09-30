﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_documentupload.aspx.cs" Inherits="gte_documentupload" MasterPageFile="~/student.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Upload Document</li>
        </ol>
        <h1 class="h2">UPLOAD DOCUMENT</h1>
    </div>

    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <ul class="nav nav-tabs nav-tabs-card" style="background:#fff;border-bottom:0;">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">*Please upload documents in .docx, .xlsx, .pdf, .jpg formats.  </a>                                
                            </li>
                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">       
                                <div id="mainDiv" runat="server"></div>
                                 <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Button ID="uploadbtn" runat="server" Text="Upload Documents" CssClass="btn btn-success" OnClick="uploadbtn_Click" OnClientClick="return validateUploadedFile()"/>
                                            </div>
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
                                    <h5>Frequently Asked Questions (FAQs)</h5>
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
                </div>
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>                     
        
    </div>
    <script>

        var customerControlArr = [];
        var uploadedFileControlArr = [];

        function customcontrolValidation() {
            var flag = false;
            if (customerControlArr.length == 0)
                flag = true;
            for (var i = 0; i < customerControlArr.length; i++) {
                var fileElement = $("#" + customerControlArr[i].fileElement);
                var anchorElement = $("#" + customerControlArr[i].anchorElement);
                if (!validfileExtention(fileElement.val(), anchorElement.attr("href"))) {
                    alert("Please select valid file \n");
                    flag = false;
                    return false;
                }
                else
                    flag = true;
            }
            return flag;
        }

        function validateUploadedFile() {
            var flag = false;
            if (uploadedFileControlArr.length == 0)
                flag = true;

            for (var i = 0; i < uploadedFileControlArr.length; i++) {
                var fileElement = $("#" + uploadedFileControlArr[i].fileElement);
                var anchorElement = $("#" + uploadedFileControlArr[i].anchorElement);
                if (!validfileExtention(fileElement.val(), anchorElement.attr("href"))) {
                    alert("Please select valid file \n");
                    flag = false;
                    return false;
                }
                else
                    flag = true;
            }

            if (flag)
                flag = customcontrolValidation();
            <%--if (flag) {
                <%--$("#<%=btn_login.ClientID%>").attr("disabled", "disabled");
                $("#ContentPlaceHolder1_uploadbtn").attr("disabled", "true");
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "red");

                var formData = new FormData();                
                var data = $("#ContentPlaceHolder1_avatar")[0].files[0];               
<%--                formData.append("doc_name", $("#<%=ddlDocuments.ClientID%>").val());
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
                    if (req.status && req.status == 200 && (req.readyState == 4)) {                        
                        $("#ContentPlaceHolder1_uploadbtn").removeAttr("disabled");
                        alert("uploaded successfully");
                        location.reload();
                    }
                }
                req.open("POST", 'uploaddocuments.aspx/uploadDoc', true);
                req.send(formData);
            }--%>
            return flag;
        }
                    
        function validfileExtention(filepath , hidDocumentPath) {
            if (filepath == "")
            {
               filepath = hidDocumentPath;
            }
            if (!filepath)
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (filepath != "")
            {  
                if (fileExtension != "pdf" && fileExtension != "jpg" && fileExtension != "docx" && fileExtension != "xlsx")
                    return false;
            }
            return true;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#gtedocument_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtedocmentupload').addClass('active');

            var fieldscount = $('input[type="file"]');
            for (var i = 0; i < fieldscount.length; i++) {
                if ($('input[type="file"]')[i].id.indexOf("ContentPlaceHolder1_filenonstatic") >= 0) {
                    var elementId = $('input[type="file"]')[i].id.replace("ContentPlaceHolder1_filenonstatic", "");
                    uploadedFileControlArr.push({ fileElement: $('input[type="file"]')[i].id, anchorElement: "ContentPlaceHolder1_hyperlinknonstatic" + elementId });
                }
                else if ($('input[type="file"]')[i].id.indexOf("ContentPlaceHolder1_file") >= 0) {
                    var elementId = $('input[type="file"]')[i].id.replace("ContentPlaceHolder1_file", "");
                    customerControlArr.push({ fileElement: $('input[type="file"]')[i].id, anchorElement: "ContentPlaceHolder1_hyperlink" + elementId });
                }
            }
        });
    </script>
</asp:Content>



