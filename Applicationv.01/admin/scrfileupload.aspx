<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scrfileupload.aspx.cs" Inherits="admin_scrfileupload" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">SCR Files</li>
        </ol>
        <h1 class="h2">SCR Files</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">File Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <input id="name" type="text" runat="server" class="form-control" placeholder="File Name" value="">
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="avatar" class="col-sm-3 col-form-label form-label">File</label>
                        <div class="col-sm-9">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <div class="icon-block rounded">
                                        <i class="material-icons text-muted-light md-36">photo</i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <div class="custom-file" style="width: auto;">
                                        <asp:FileUpload ID="avatar" runat="server" CssClass="custom-file-input" />

                                        <label for="avatar" class="custom-file-label">Choose file</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_login" runat="server" Text="Save Video" CssClass="btnbtn-successk" OnClick="btnUpload_Click" />
                                    <asp:Label ID="lblMessgae" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>


            </div>
        </div>

    </div>
</asp:Content>

