<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ec_edit_study_material.aspx.cs" Inherits="ec_edit_study_material" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_manageclass.aspx">Mange Study Material</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">CREATE A STUDY MATERIAL</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">
                        <div class="form-group row" runat="server">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Study Material Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txt_name" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="classname">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Study Material Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control" Style="width: 240px;">
                                            <asp:ListItem Value="0">Please Select Type</asp:ListItem>
                                            <asp:ListItem Value="1">PDF</asp:ListItem>
                                            <asp:ListItem Value="2">Audio</asp:ListItem>
                                            <asp:ListItem Value="3">Presentation</asp:ListItem>
                                            <asp:ListItem Value="4">Web Link</asp:ListItem>
                                            <asp:ListItem Value="5">Video</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" runat="server" id="classuloadfile">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Upload FIle</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:Label ID="lblfile" runat="server" />
                                        <asp:FileUpload ID="materialfile" runat="server" onchange="UploadFile();"></asp:FileUpload>
                                        <asp:HiddenField runat="server" ID="Hidmaterial" />
                                        <asp:HyperLink runat="server" ID="materiallink" Target="_blank"></asp:HyperLink>
                                        <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>
                                        <h3 style="font-size: 80%; margin-left: 30%;" id="status"></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" runat="server" id="classwebpageURL">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Insert Link</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txt_link" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="group">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:ListBox runat="server" ID="list_grade" SelectionMode="Multiple" CssClass="form-control"></asp:ListBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="examsubject">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:ListBox runat="server" ID="list_suject" SelectionMode="Multiple" CssClass="form-control"></asp:ListBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="grade">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Remark</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txt_remark" Height="150px" Width="412px" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="subject">
                            <label for="name" style="font-size: 15px;" class="col-sm-3 col-form-label form-label">Created BY</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txt_created_by" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">--%>
                        <center>
                            <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                        </center>
                        <%--  <div class="col-md-20">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <script>
           var counter;
           function UploadFile() {
               debugger;
               if (!vali_type()) {
               }
               else {
                   var files = $("#<%=materialfile.ClientID%>").get(0).files;
                   counter = 0;

                   // Loop through files
                   for (var i = 0; i < files.length; i++) {
                       var file = files[i];
                       var formdata = new FormData();
                       formdata.append("materialfile", file);
                       var ajax = new XMLHttpRequest();

                       ajax.upload.addEventListener("progress", progressHandler, false);
                       ajax.open("POST", "fileuploadhandler.ashx");
                       ajax.send(formdata);
                   }
               }
           }
           function progressHandler(event) {
               debugger;
               var percent = (event.loaded / event.total) * 100;
               $("#progressBar").val(Math.round(percent));
               $("#status").html(Math.round(percent) + "%");
               if (Math.round(percent) == 100) {
                   $("#status").html("Upload Successfully.....");
               }
           }

       </script>
    <script>
        function validateUploadedFile(filepath) {
            debugger;
            var hidfilepath = $("#<%=Hidmaterial.ClientID%>").val();
            if (filepath == "")
                filepath = hidfilepath;

            if (filepath == "") {
                alert("Please upload a file");
                return false;
            }

            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if ($("#<%=ddl_type.ClientID%>").val() == 2) {
                var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (fileExtension != "mp3" && fileExtension != "mov" && fileExtension != "mvc" && fileExtension != "mp4") {
                    alert("Invalid file. Please select file of type mp3, mp4");
                    return false;
                }
            }
            else if ($("#<%=ddl_type.ClientID%>").val() == 1) {

                var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (fileExtension != "pdf" && fileExtension != "docx") {
                    alert("Invalid file. Please select file of type pdf, docx");
                    return false;
                }
            }
            else if ($("#<%=ddl_type.ClientID%>").val() == 3) {

                var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (fileExtension != "ppt") {
                    alert("Invalid file. Please select file of type ppt");
                    return false;
                }
            }
            return true;
        }

        function vali_type() {
            // uploadFile();
            debugger;
            var id_value = document.getElementById("<%=materialfile.ClientID%>").value;
            var imgsize = document.getElementById("<%=materialfile.ClientID%>");
            var size = parseFloat(imgsize.files[0].size / 1024).toFixed(2);
            if (size > 153600) {
                //    if (size > 10) {
                alert('Please enter FIle size less then 150 MB.')
                document.getElementById("<%=materialfile.ClientID%>").value = "";
                return false;
            }
            else {
                return true;
            }
        }

        function validateForm() {
            debugger;
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            if ($("#<%=txt_name.ClientID%>").val() == "")
                alert("Please enter study material name.");
            else if ($("#<%=ddl_type.ClientID%>").val() == "0")
                alert("Please select study material type");
            else if (($("#<%=ddl_type.ClientID%>").val() == "4" || $("#<%=ddl_type.ClientID%>").val() == "5") && $("#<%=txt_link.ClientID%>").val() == "")
                alert("Please enter insert link");
            else if (($("#<%=ddl_type.ClientID%>").val() == "1" || $("#<%=ddl_type.ClientID%>").val() == "2" || $("#<%=ddl_type.ClientID%>").val() == "3") && !validateUploadedFile($("#<%=materialfile.ClientID%>").val())) { }
            else if ($("#<%=txt_remark.ClientID%>").val() == "") alert("Please enter remark.");
            else if ($("#<%=txt_created_by.ClientID%>").val() == "")
                alert("Please enter created by.");
            else
                flag = true;

            return flag;

        }

        $(document).ready(function () {
            var modeID = $("#<%=ddl_type.ClientID%>").val();
            if (modeID == 1 || modeID == 2 || modeID == 3) {
                $("#<%=classuloadfile.ClientID%>").show();
                $("#<%=classwebpageURL.ClientID%>").hide();
            }
            else if (modeID == 4 || modeID == 5) {
                $("#<%=classwebpageURL.ClientID%>").show();
                $("#<%=classuloadfile.ClientID%>").hide();
            }
            else {
                $("#<%=classwebpageURL.ClientID%>").hide();
                $("#<%=classuloadfile.ClientID%>").hide();
            }

        });

        $("#<%=ddl_type.ClientID%>").change(function () {
            var modeID = $("#<%=ddl_type.ClientID%>").val();
            if (modeID == 1 || modeID == 2 || modeID == 3) {
                $("#<%=classuloadfile.ClientID%>").show();
                $("#<%=classwebpageURL.ClientID%>").hide();
            }
            else if (modeID == 4 || modeID == 5) {
                $("#<%=classwebpageURL.ClientID%>").show();
                $("#<%=classuloadfile.ClientID%>").hide();
            }
            else {
                $("#<%=classwebpageURL.ClientID%>").hide();
                $("#<%=classuloadfile.ClientID%>").hide();
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studymateriallist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createstudymaterial6').addClass('active');
        });
    </script>
</asp:Content>
