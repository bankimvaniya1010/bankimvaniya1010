<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoupload.aspx.cs" Inherits="admin_videoupload" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
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
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click"  OnClientClick="return validateForm()" />                           
                                                               
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

                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />

                                </Columns>

                            </asp:GridView>
                        </div>

                    </div>
                    </div>
           </div>
        </div>
  
   <script>
       function validateUploadedFile() {
           var filePath = $("#<%=FileUpload.ClientID%>").val();
          
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           
           if (fileExtension != "mp4" && fileExtension != "3gp" && fileExtension != "mp3" && fileExtension != "ogv") {
               alert("Invalid File");
               return false;
           }
           return true;
       }
       function validateForm() {
           
           var flag = false;
           if ($("#<%=txtsectinname.ClientID%>").val() == "")
               alert("Please enter section name");
           else if (!validateUploadedFile()) { }
           else
               flag = true;
           return flag;
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


