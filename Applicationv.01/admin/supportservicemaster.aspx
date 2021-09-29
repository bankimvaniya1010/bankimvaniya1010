<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supportservicemaster.aspx.cs" Inherits="admin_supportservicemaster" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
                <li class="breadcrumb-item active">Support Service Add/Edit</li>
        </ol>
        <h1 class="h2">Support Service Add/Edit</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active">

                    <div class="form-group row" runat="server" id="servicetype">
                        <label for="name" class="col-sm-3 col-form-label form-label">service type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" class="form-control" id="txtservicetype">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server" id="providername">
                        <label for="name" class="col-sm-3 col-form-label form-label">service Provider Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" class="form-control" id="txtprovidername">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server" id="providerphone">
                        <label for="name" class="col-sm-3 col-form-label form-label">service Provider Contact Number</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" class="form-control" id="txtprovidercontactnno">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server" id="provideremail">
                        <label for="name" class="col-sm-3 col-form-label form-label">service provider Email</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" runat="server" class="form-control" id="txtprovideremail">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server" id="description">
                        <label for="name" class="col-sm-3 col-form-label form-label">Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea runat="server" id="txtdescription" class="form-control edit-textarea"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="upload">
                        <label for="name" class="col-sm-3 col-form-label form-label">Upload Image</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                     <asp:Label ID="lblupload" runat="server" />
                                    <asp:FileUpload ID="FileUpload" runat="server" /> 
                                    <input type="hidden" id="hidDocumentPath" runat="server" />
                                    <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div> 
                    
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_saveData" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_saveData_Click" OnClientClick="return validateForm()"/>
                                   <div class="col-md-20">
                                         
                                   </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>
     <script>
    
         function validateForm()
         {
           var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
           var flag = false;
             if ($("#<%=txtservicetype.ClientID%>").val() == "")
                 alert("Please enter Service Type");
             else if ($("#<%=txtprovidername.ClientID%>").val() == "")
                 alert("Please enter Service Provider Name");
             else if ($("#<%=txtprovidercontactnno.ClientID%>").val() == "")
                 alert("Please enter Service Provider Contact Number");
             else if ($("#<%=txtprovideremail.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtprovideremail.ClientID%>").val())))
                 alert("Please enter valid Service provider Email-Id");
             else if ($("#<%=txtdescription.ClientID%>").val() == "")
                 alert("Please enter Description");
             else if (!validfileExtention()){ }               
             else
               flag = true;
           return flag;
         }

         function validfileExtention() {
           var filePath = $("#<%=FileUpload.ClientID%>").val();
           if (filePath == "") {
               filePath = $("#<%=hidDocumentPath.ClientID%>").val();;
           }
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           if (fileExtension != "png" && fileExtension != "jpg") {
               alert("Invalid File");
               return false;
           }
           return true;
        }
          
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#supportservicemaster').addClass('active');
        });
    </script>
  
        </div>
</asp:Content>

