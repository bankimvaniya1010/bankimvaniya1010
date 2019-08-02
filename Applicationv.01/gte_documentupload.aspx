<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_documentupload.aspx.cs" Inherits="gte_documentupload" MasterPageFile="~/student.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Upload Document</li>
        </ol>
        <h1 class="h2">Upload Document </h1>
    </div>

    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <ul class="nav nav-tabs nav-tabs-card">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">Upload Document</a>
                            </li>
                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">       
                                <div id="mainDiv" runat="server"></div>
                                 <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
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
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>                     
        </div>
    </div>
    <script>
      
        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {            
            FileUpload fileUploadDynamic = (FileUpload)mainDiv.FindControl("file" + CustomControls[k].customfieldid);
            HyperLink hyperLinkDynamic = (HyperLink)mainDiv.FindControl("hyperlink" + CustomControls[k].customfieldid);
            var fileDescription = CustomControls[k].labeldescription.ToLower();
                %>

            if (!validfileExtention($("#<%=fileUploadDynamic.ClientID%>").val() , $("#<%=hyperLinkDynamic.ClientID%>").attr("href"))) {
                alert("Please Select Valid <%= fileDescription%>" + "\n");
                return false;
            }
            else
                flag = true;
             <% }%> 
            return flag;
        }

        function validateUploadedFile() {
            var flag = false;
            var fieldscount = '<%=fields.Count%>';
            if (fieldscount == '0')
                flag = true;
             <% for (int j = 0; j < fields.Count; j++)
        {           
            FileUpload fileUploadDynamic = (FileUpload)mainDiv.FindControl("filenonstatic" + fields[j].fieldid);
            HyperLink hyperlinkDynamic = (HyperLink)mainDiv.FindControl("hyperlinknonstatic" + fields[j].fieldid);
            var fileDescription = fields[j].primaryfiledname.ToLower();
                %>

             if (!validfileExtention($("#<%=fileUploadDynamic.ClientID%>").val(), $("#<%=hyperlinkDynamic.ClientID%>").attr("href")))
            {
                alert("Please select valid <%= fileDescription%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
            
             <% }%> 
            if (flag)
                flag = customcontrolValidation();
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
                if (fileExtension != "pdf" && fileExtension != "jpg")                    
                    return false;                                   
            }
            return true;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtedocmentupload').addClass('active');
        });
    </script>
</asp:Content>



