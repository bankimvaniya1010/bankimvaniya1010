<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploaddocuments.aspx.cs" Inherits="uploaddocuments" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">DOCUMENTS UPLOAD

            </li>
        </ol>
        <h1 class="h2">UPLOAD YOUR DOCUMENT(S)

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body">
                       <%-- <ul class="nav nav-tabs nav-tabs-card" style="background:#fff;border-bottom:0;">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">Upload Document</a>
                            </li>

                        </ul>--%>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">
                       

                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Document Name</label>
                                    <div class="col-sm-7">
                                        <div class="" style="padding-left:0px;">
                                            <div class="">
                                                <asp:DropDownList ID="ddlDocuments" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="avatar" class="col-sm-4 col-form-label form-label">DOCUMENT UPLOAD</label>                                    

                                    <div class="col-sm-8">
                                        <div class="media align-items-center">
                                           
                                            <div class="media-body">
                                                <div class="custom-file" style="width: auto;">
                                                <asp:Label ID="lblavatar" runat="server" />
                                                <asp:FileUpload ID="avatar" runat="server" />
                                                <label style="font-size: small;" class="marginright">The file formats you can upload are -  jpg, png, pdf</label>
                                                </div>
                                            </div>                                             

                                        </div>
                                    </div>
                                </div>                                 
                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Button ID="btn_login" runat="server" Text="Save" CssClass="btn btn-success" OnClientClick="return validateUploadedFile()"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="position:relative;width:202px;margin-bottom: 15px;height:25px;display:block;margin-left:100px;"> 
                                    <div id="progress" class="hide" style="background:#f0f0f0; height: 25px;width:0;color:#fff;">
                                        <div class="status" style="margin-left:10px;"></div>
                                    </div> 
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Repeater ID="rptVideo" runat="server">
                                                    <HeaderTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <table class="table">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("documentname") %>' Font-Bold="true" />
                                                                </td>
                                                                <td>
                                                                    <a href="<%#Eval("filename") %>" target="_blank">View this document</a>                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
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
                <div id="page-nav" class="col-lg-auto page-nav">
                    
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>      
        function validfileExtention(ddlDocuments ,filepath) {
            if (filepath == "")            
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (ddlDocuments == "Profile Photo for Application Centre" && filepath != "") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg")
                    return false;
            }
            else if (ddlDocuments != "Profile Photo for Application Centre" && filepath != "") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "pdf")
                    return false;
            }
            return true;
        }

        function validateUploadedFile() {                    
            var flag = false;
            if ($("#<%=ddlDocuments.ClientID%>").val() == "0")
                alert("Please select document name");
            else if (!validfileExtention($("#<%=ddlDocuments.ClientID%>").val() , $("#<%=avatar.ClientID%>").val()))
                alert("Please upload valid document");            
            else
                flag = true;            
            if (flag) {
                <%--$("#<%=btn_login.ClientID%>").attr("disabled", "disabled"); --%>
                $("#ContentPlaceHolder1_btn_login").attr("disabled", "true");
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "red");

                var formData = new FormData();                
                var data = $("#ContentPlaceHolder1_avatar")[0].files[0];               
                formData.append("doc_name", $("#<%=ddlDocuments.ClientID%>").val());
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
                        $("#ContentPlaceHolder1_btn_login").removeAttr("disabled");
                        alert("uploaded successfully");
                        location.reload();
                    }
                }
                req.open("POST", 'uploaddocuments.aspx/uploadDoc', true);
                req.send(formData);
            }
            return false;
        }
        $(document).ready(function () {           
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploaddocuments').addClass('active');
        });
    </script>
</asp:Content>



