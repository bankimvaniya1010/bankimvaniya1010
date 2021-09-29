<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoupload.aspx.cs" Inherits="admin_videoupload" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
                <li class="breadcrumb-item active">Videos</li>
        </ol>
        <h1 class="h2">Videos </h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Section Tag Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                      <input id="txtsectinname" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="uploadtype">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select File Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddltype" CssClass="form-control">
                                        <asp:ListItem Value="0" Selected="True">Please select </asp:ListItem>
                                        <asp:ListItem Value="1">Video </asp:ListItem>
                                        <asp:ListItem Value="2">PDF</asp:ListItem>
                                        <asp:ListItem Value="3">PPT</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="upload">
                        <label for="name" class="col-sm-3 col-form-label form-label">Upload File</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                     <asp:Label ID="lblupload" runat="server" />
                                    <asp:FileUpload ID="FileUpload" runat="server" /> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="media-left col-md-12">
                        <div style="position: relative; width: 202px; background: transparent; margin-bottom: 15px; height: 25px; margin-left: 24%;">
                            <div id="progress" class="hide" style="background: blue; height: 25px; width: 0; color: #fff;">
                                <div class="status" style="margin-left: 10px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClientClick="return validateForm()" />                           
                                                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="tab-content card-body">
                        <div class="tab-pane active" id="second">
                            <asp:GridView ID="grid" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                                DataKeyNames="videoID"
                                AllowPaging="True"
                                CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                                PageSize="25"
                                OnDataBound="grid_DataBound"  OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound" OnRowDeleted="grid_RowDeleted" OnRowDeleting="grid_RowDeleting" OnPageIndexChanging="grid_PageIndexChanging">


                                <Columns>

                                    <asp:BoundField DataField="videoID" HeaderText="ID" InsertVisible="False"
                                        ReadOnly="True" SortExpression="id" />


                                    <asp:TemplateField HeaderText="Section Name">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("sectioname") %>' id="sectionname"> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="File">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload_extra" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <a runat="server" href='<%# Bind("videopath") %>' target="_blank" id="videourl">View </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True"/>

                                </Columns>

                            </asp:GridView>
                        </div>

                    </div>
                    </div>
           </div>
        </div>
  
   <script>
       function validateUploadedFile(type) {
           var filePath = $("#<%=FileUpload.ClientID%>").val();
          
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           
           if (type == 1 && fileExtension != "mp4" && fileExtension != "3gp" && fileExtension != "mp3" && fileExtension != "ogv" && fileExtension !="wmv" && fileExtension !="mov") {
               alert("Invalid File");
               return false;
           }
           if (type == 2 && fileExtension != "pdf") {
               alert("Invalid File");
               return false;
           }
           if (type == 3 && fileExtension != "pptx" && fileExtension != "ppt") {
               alert("Invalid File");
               return false;
           }
           return true;
       }
       function validateForm() {
           
           var flag = false;
           if ($("#<%=txtsectinname.ClientID%>").val() == "")
               alert("Please enter section name");
           else if ($("#<%=ddltype.ClientID%>").val() == "0")
               alert("Please select file type");
           else if (!validateUploadedFile($("#<%=ddltype.ClientID%>").val())) { }
           else
               flag = true;
           if (flag) {
                $("#ContentPlaceHolder1_btn_submit").attr("disabled", "true")
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "blue");

                var formData = new FormData();
                var data = $("#ContentPlaceHolder1_FileUpload")[0].files[0];
               formData.append("doc_name", $("#<%=txtsectinname.ClientID%>").val());
               formData.append("doc_type", $("#<%=ddltype.ClientID%>").val());
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
                        $("#ContentPlaceHolder1_btn_submit").removeAttr("disabled");
                        alert("Uploaded successfully");
                        location.replace(hostName + "admin/videoupload.aspx");
                    }
                }

                req.open("POST", 'videoupload.aspx/uploadVideo', true);
                req.send(formData);
            }
            return false;
        }

       
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#videolist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploadvideo').addClass('active');
        });
    </script>
         </div>
</asp:Content>


