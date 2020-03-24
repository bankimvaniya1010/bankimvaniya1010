<%@ Page Language="C#" AutoEventWireup="true" CodeFile="educationalinstitutionmaster_addedit.aspx.cs" Inherits="admin_educationalinstitutionmaster_addedit" MasterPageFile="~/admin/admin.master" EnableEventValidation="false" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Educational Institution Master</li>
        </ol>
        <h1 class="h2">Educational Institution Master </h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Country</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcountry" runat="server" CssClass="form-control">                                       
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="Videourl">
                        <label for="name" class="col-sm-3 col-form-label form-label">city</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlcity" runat="server" CssClass="form-control">                                       
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="hidCityField" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>                    
                    
                    
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click" />
                                   <div class="col-md-20">
                                         <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                   </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>
  </div>
   <script>
      
      <%-- function validateForm() {
           var urlValue = $("#<%=txtVideourl.ClientID%>").val();
           var validateurl = urlValue.includes("=");
           var flag = false;
           if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please Select University");
           else if ($("#<%=ddlType.ClientID%>").val() == "0")
               alert("Please Select File Type");
           else if ($("#<%=ddlType.ClientID%>").val() == "video" && $("#<%=txtVideourl.ClientID%>").val() == "" || validateurl)
               alert("Please Enter Valid video Url");
           else if ($("#<%=ddlType.ClientID%>").val() != "video" && !validateUploadedFile()) { }
           else if ($("#<%=txtDescription.ClientID%>").val() == "")
               alert("Please Enter Title");
           else
               flag = true;
           return flag;
       }--%>
       $("#<%=ddlcountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "educationalinstitutionmaster_addedit.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlcountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlcity.ClientID%>").length >= 1) {
                                $("#<%=ddlcity.ClientID%>").empty();
                                $("#<%=ddlcity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlcity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });

            });

            $("#<%=ddlcity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddlcity.ClientID%>").val());
            });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#educationalinstitutionmaster').addClass('active');
        });
    </script>
        
</asp:Content>



