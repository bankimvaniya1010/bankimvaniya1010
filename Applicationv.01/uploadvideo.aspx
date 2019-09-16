<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadvideo.aspx.cs" Inherits="uploadvideo" MasterPageFile="~/student.master" %>

<asp:content id="content2" runat="server" contentplaceholderid="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Upload Video

            </li>
        </ol>
        <h1 class="h2">Upload Video

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <ul class="nav nav-tabs nav-tabs-card">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">Upload Video</a>
                            </li>

                        </ul>
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
                                        <label for="avatar" class="col-sm-3 col-form-label form-label">Video</label>
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
                                                    <asp:Button ID="btn_login" runat="server" Text="Save Video" CssClass="btnbtn-successk" OnClick="btn_login_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Repeater ID="rptVideo" runat="server">
                                                        
                                                        <ItemTemplate>

                                                            <table class="table">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("videofilename") %>' Font-Bold="true" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnDownoad" CommandArgument='<%#Eval("videofilename") %>' runat="server" OnClick="Download">View Video</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>


                                                        </ItemTemplate>
                                                       
                                                    </asp:Repeater>
                                                  </div>
                    </div>
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
                        </div></div>
                </div></div></div>

    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#upload_document_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploadvideo').addClass('active');
        });
    </script>

</asp:content>








