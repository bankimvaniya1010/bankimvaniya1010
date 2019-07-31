<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_videoquestion.aspx.cs" Inherits="gte_videoquestion" MasterPageFile="~/student.master"%>


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

                    <div class="card" style="width: 650px;">
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
                                      <asp:FileUpload ID="FileUpload" runat="server" /> 
                                       <%-- <input type="file" onchange="setFileInfo()" runat="server" name="FileUpload" id="FileUpload"/>--%>
                                        <asp:Label ID="lblupload" runat="server" />
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
         var myVideos = [];
        window.URL = window.URL || window.webkitURL;
        //document.getElementById('ContentPlaceHolder1_FileUpload').onchange = setFileInfo;

        //function setFileInfo() {
        //    alert("hello");
        //var files = this.files;
        //myVideos = files[0];
        //console.log('myVideos: '+myVideos['File']);
        //var video = document.createElement('video');
        //video.preload = 'metadata';

        //video.onloadedmetadata = function() {
        //window.URL.revokeObjectURL(video.src);
        //myVideos.duration = video.duration;
        //    myVideos.size = myVideos.size / (1024 * 1024);
        //    console.log(myVideos);
        //}

        //video.src = URL.createObjectURL(files[0]);;
        //}
        function validateUploadedFile() {
            var flag = false;
            var filePath = $("#<%=FileUpload.ClientID%>").val();
            if (filePath == "") 
               alert("Please Select a video ");                          
            //else if (myVideos.size < 20 || myVideos.duration < 75 )
            //    alert("Please upload a Video less than 20mb And 75Sec");
            else
                flag = true;
             return flag;
        }    
      
        $(document).ready(function () {

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

