<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadAnswerSheet.aspx.cs" Inherits="UploadAnswerSheet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title></title>
    <script src="assets/vendor/jquery.min.js"></script>
    <!-- Bootstrap -->
    <link href="https://fonts.googleapis.com/css?family=Parisienne&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Parisienne&display=swap" rel="stylesheet">
    <link href="assets/dashboard/css/bootstrap.min.css" rel="stylesheet">

    <script>

        function validateUploadedFile() {
            var filePath = $("#<%=FileUpload.ClientID%>").val();
            var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "png"&& fileExtension != "jpeg") {
                alert("Invalid File");
                return false;
            }
            return true;
        }

        function validatForm() {
            var flag = false;
            var answersheet = $("#<%=FileUpload.ClientID%>").val();
             if (answersheet == "")
                 alert("Please select answer sheet.");
             else if (answersheet != "" && !validateUploadedFile()) { }
             else
                 flag = true;
             if (flag) {
                 $("#btnDownload").attr("disabled", "true")
                 $("#progress").removeClass("hide");
                 var progressEle = $("#progress");
                 progressEle.css("background-color", "blue");

                 var formData = new FormData();
                 //var data = $("#FileUpload")[0].files[0];

                 var files = $("#<%=FileUpload.ClientID%>").get(0).files;

                 // Loop through files
                    for (var i = 0; i < files.length ; i++) {
                        var file = files[i];
                        formData.append("files", file);
                    }
                 //formData.append("files", data);

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
                        $("#btnDownload").removeAttr("disabled");
                        alert("Your answer sheets have been upload successfully.");
                        location.replace(hostName + "UploadAnswerSheet.aspx?ID"+<%=assignID%>);
                    }
                }

                req.open("POST", 'UploadAnswerSheet.aspx/uploadVideo', true);
                req.send(formData);
            }
            return false;
        }

    </script>
</head>
<body>
    <form runat="server">

        <div class="card">
            <div class="card-body">
                <asp:HiddenField runat="server" ID="Hidpassword" />
                <div id="toshowDiv" runat="server" style="display: none">
                    <div runat="server" id="Div4" class="form-row justify-content-between" style="margin: auto; width: auto; padding: 10px;">
                        <label>Welcome <%=applicantfirstname %> please upload answer sheets for <%=assessmentname %></label><br />

                    </div>
                    <div runat="server" id="Div3" class="form-row justify-content-between" style="margin: auto; width: auto; padding: 10px;">
                        <label>* Select all your answer sheets in one go by selecting multiple files to submit your response.</label><br />

                    </div>
                    <div runat="server" id="btnDiv" class="form-row justify-content-between" style="margin: auto; width: 50%; padding: 10px;">
                        <%-- <input id="backNavLink" runat="server" type="button" class="btn btn-success" value="Back" onclick="return window.location = '/gte_declaration.aspx?formid=20';"/>--%>
                         <asp:FileUpload runat="server" ID="FileUpload" AllowMultiple="true"/>

                    </div>
                    <div class="media-left col-md-12">
                        <div style="position: relative; width: 202px; background: transparent; margin-bottom: 15px; height: 25px;">
                            <div id="progress" class="hide" style="background: blue; height: 25px; width: 0; color: #fff;margin-left: 32%;">
                                <div class="status" style="margin-left: 10px;"></div>
                            </div>
                        </div>
                    </div>
                    <div runat="server" id="Div2" class="form-row justify-content-between" style="margin: auto; width: 50%; padding: 10px;">

                        <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Submit" OnClientClick="return validatForm()" Width="92%" />

                    </div>

                </div>
                <div runat="server" id="ifanswersubmitted" style="display: none">
                    <div runat="server" id="Div1" class="form-row justify-content-between" style="margin: auto; width: 50%; padding: 10px;">
                        <label id="lblmsg" runat="server"><b></b></label>
                        <label id="Label1" runat="server"><b></b></label>
                    </div>
                </div>
            </div>
        </div>
       <%-- <div class="certificate-container">
        
        </div>--%>

    </form>

</body>
</html>
