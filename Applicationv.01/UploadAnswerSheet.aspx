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
     <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/dashboard/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/jquery-ui-1.12.1.min.js"></script>
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/jquery-ui-1.12.1.min.css" rel="stylesheet">


    <script>
        var pagebackDone ='<%=pagebackDone%>';
          function ajaxcalltocheckisanswersubmitted() {
            var assignID = '<%= assignID%>';
            $.ajax({
                type: "POST",
                url: "UploadAnswerSheet.aspx/isanswersubmitted",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'assignID': '" + assignID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if (result != "NOresponsesubmitted") {
                            var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                            location.replace(hostName + "UploadAnswerSheet.aspx?ID=" + <%=assignID%>);
                        }
                    }
                }
            });

        }
        if(pagebackDone == 0)
            setInterval(ajaxcalltocheckisanswersubmitted, 1000);
        
        

        function validateUploadedFile() {
            var filePath = $("#<%=FileUpload.ClientID%>").val();
            var fileuploadtype = $("#<%=ddltype.ClientID%>").val();

            var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileuploadtype == 1) {
                if (fileExtension != "pdf") {
                    alert("Invalid File. Please select file of type .pdf");
                    return false;
                }
            }
            else {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Invalid File. Please select file of type .jpg, .jpeg, .png");
                    return false;
                }
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
            else 
                validExtensions[0] = 'jpg';
            
            for (var i = 0; i < validExtensions.length; i++) {
                if (ext == validExtensions[i])
                    return true;
            }
            alert('The file extension ' + ext.toUpperCase() + ' is not allowed!');
            elem.value = "";
            return false;
        }

        function validatForm() {
            var flag = false;
            var answersheet = $("#<%=FileUpload.ClientID%>").val();
             if ($("#<%=ddltype.ClientID%>").val() == 0)
                alert("Please select answer sheet type.");
             else if (answersheet == "")
                 alert("Please select answer sheet.");
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
                 formData.append("doc_type", $("#<%=ddltype.ClientID%>").val());
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
                        location.replace(hostName + "UploadAnswerSheet.aspx?ID="+<%=assignID%>);
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
                     <div class="form-group row  justify-content-between" id="selecttype" style="margin: auto; padding: 10px;">
                                <label for="name" class="col-sm-3 col-form-label form-label"> Please Select file type you want to upload </label>
                                <div class="col-sm-8">
                                    <div class="row">                                        
                                    </div>
                                </div>
                            </div>
                    <div runat="server" id="Div5" class="form-row justify-content-between" style="margin: auto; width: 50%; padding: 10px;">
                        <asp:DropDownList runat="server" ID="ddltype" CssClass="form-control">
                            <asp:ListItem Value="0"> Please Select</asp:ListItem>
                             <asp:ListItem Value="1">PDF</asp:ListItem>
                             <asp:ListItem Value="2"> Images</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div runat="server" id="btnDiv" class="form-row justify-content-between" style="margin: auto; width: 50%; padding: 10px;">
                        <%-- <input id="backNavLink" runat="server" type="button" class="btn btn-success" value="Back" onclick="return window.location = '/gte_declaration.aspx?formid=20';"/>--%>
                         <asp:FileUpload runat="server" ID="FileUpload" AllowMultiple="true"  onchange ="checkFiletest(this);"/>

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
