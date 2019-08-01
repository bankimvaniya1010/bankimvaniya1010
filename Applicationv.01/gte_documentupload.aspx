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
                                <div class="form-group row" id="passportid" style="display:none" runat="server">  
                                    <label for="passportid" id="lblpassportid" runat="server">Certified Copy of Passport (Bio Pages)</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lbluploadpassportid" runat="server" />
                                                <asp:FileUpload ID="passportidupload" runat="server" />  
                                                <input type="hidden" id="hidpassportDocumentPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="passportuploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                 
                                <div class="form-group row" id="acadamicdoc" style="display:none" runat="server">
                                    <label for="acadamicdoc" id="lblacadamicdoc" runat="server">Academic Documents – Certificates and Transcripts (certified and translated into English)</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lbluploadacadamicdoc" runat="server" />
                                                <asp:FileUpload ID="acadamicdocupload" runat="server" /> 
                                                <input type="hidden" id="hidacadamicDocumentPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="acadamicuploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                <div class="form-group row" id="experiencedocument" style="display:none" runat="server">
                                    <label for="experiencedocument" id="lblexperiencedocument" runat="server">Relevant professional experience, if any (CV, employment references or equivalent )</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:label id="lbluploadexperiencedocument" runat="server" />
                                                <asp:fileupload id="experiencedocumentupload" runat="server" />    
                                                 <input type="hidden" id="hidExperiencedocPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="experienceuploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group row" id="evidenceofenglishlanguage" style="display:none" runat="server">
                                    <label for="evidenceofenglishlang" id="lblevidenceofenglishlang" runat="server">Evidence of English Language (IELTS, PTE, TOEFL or equivalent)</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lbluploadevidenceofenglishlang" runat="server" />
                                                <asp:FileUpload ID="evidenceofenglishlangupload" runat="server" />                                                
                                                <input type="hidden" id="hidevidencedocPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="evdidenceUploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row" id="parentapproval" style="display:none" runat="server">
                                    <label for="parentapproval" id="lblparentapproval" runat="server">Parent / Guardian approval</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lbluploadparentapproval" runat="server" />
                                                <asp:FileUpload ID="parentapprovalupload" runat="server" />                                                
                                                <input type="hidden" id="hidparentapprovalpath" runat="server" />
                                                <asp:HyperLink runat="server" ID="parentapprovaluploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
       
        function validateUploadedFile() {

            if (!$("#<%=passportid.ClientID%>").is(':hidden') && !validfileExtention($("#<%=passportidupload.ClientID%>").val(), $("#<%=hidpassportDocumentPath.ClientID%>").val())) {
                alert("Please  Upload valid Certified Copy of Passport ");
                return false;
            }


            if (!$("#<%=acadamicdoc.ClientID%>").is(':hidden') && !validfileExtention($("#<%=acadamicdocupload.ClientID%>").val(), $("#<%=hidacadamicDocumentPath.ClientID%>").val())) {
                alert("please upload valid Academic Documents");
                return false;
            }


            if (!$("#<%=experiencedocument.ClientID%>").is(':hidden') && !validfileExtention($("#<%=experiencedocumentupload.ClientID%>").val(), $("#<%=hidExperiencedocPath.ClientID%>").val())) {
                alert("please upload valid Relevant professional experience");
                return false;
            }


            if (!$("#<%=evidenceofenglishlanguage.ClientID%>").is(':hidden') && !validfileExtention($("#<%=evidenceofenglishlangupload.ClientID%>").val(), $("#<%=hidevidencedocPath.ClientID%>").val())) {
                alert("please upload valid Evidence of English Language");
                return false;
            }
            

            if (!$("#<%=parentapproval.ClientID%>").is(':hidden') && !validfileExtention($("#<%=parentapprovalupload.ClientID%>").val(), $("#<%=hidparentapprovalpath.ClientID%>").val())) {
                alert("please upload valid Evidence of English Language");
                return false;
            }          

            return true;

        }
        function validfileExtention(filepath , hidDocumentPath) {
            if (filepath == "")
            {
               filepath = hidDocumentPath;
            }
            if (filepath == "")
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



