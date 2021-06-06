<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitydetails_editN.aspx.cs" Inherits="admin_universitydetails_editN" MasterPageFile="~/admin/admin.master" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        /* Tabs*/
section {
    padding: 60px 0;
}

section .section-title {
    text-align: center;
    color: transparent;
    margin-bottom: 50px;
    text-transform: uppercase;
}
#tabs{
	background: transparent;
    color: #000;
}
#tabs h6.section-title{
    color: #eee;
}

#tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #f3f3f3;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 4px solid !important;
    font-size: 20px;
    font-weight: bold;
}
#tabs .nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #201d1d;
    font-size: 20px;
}
    </style>
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit Institution</li>
        </ol>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                   

<!-- Tabs -->
                    <section id="tabs" style="margin-top: -65px;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ">
                                    <nav>
                                        <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">BASIC</a>
                                            <a class="nav-item nav-link" id="nav-stat-tab" data-toggle="tab" href="#nav-stat" role="tab" aria-controls="nav-stat" aria-selected="false">OVERVIEW</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">COURSES</a>
                                           <a class="nav-item nav-link" id="nav-adminssion-tab" data-toggle="tab" href="#nav-adminssion" role="tab" aria-controls="nav-adminssion" aria-selected="false">ADMISSIONS</a>
                                            <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">DEADLINES</a>
                                            <a class="nav-item nav-link" id="nav-five-tab" data-toggle="tab" href="#nav-five" role="tab" aria-controls="nav-five" aria-selected="false">POLICIES</a>
                                            <a class="nav-item nav-link" id="nav-six-tab" data-toggle="tab" href="#nav-six" role="tab" aria-controls="nav-six" aria-selected="false">LOCATION</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="Divtab1" runat="server">
                                                <div class="form-group row">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Partner Type</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                 <asp:DropDownList ID="ddlflag" name="gtesubscription" runat="server" class="form-control">
                                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Institution</asp:ListItem>
                                                                    <asp:ListItem Value="2">Agency</asp:ListItem>
                                                                    <asp:ListItem Value="3">Govt</asp:ListItem>
                                                                    <asp:ListItem Value="4">Others</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniName" class="col-sm-3 col-form-label form-label">Code / Reg No Type</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlcodetype" class="form-control"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniName" class="col-sm-3 col-form-label form-label">Code / Reg No</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtcoderegNo" type="text" runat="server" class="form-control" placeholder="Code / Reg No" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniName" class="col-sm-3 col-form-label form-label">Institution Name</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniName" type="text" runat="server" class="form-control" placeholder="Institution Name" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniName" class="col-sm-3 col-form-label form-label">Institution Legal Name</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtinstitutionlegalname" type="text" runat="server" class="form-control" placeholder="Institution Legal Name" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">Main Contact Person</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniContactPerson" type="text" runat="server" class="form-control" placeholder="Main Contact Person" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">Main Contact Position</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniContactPersonPosition" type="text" runat="server" class="form-control" placeholder="Main Contact Position" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniEmail" class="col-sm-3 col-form-label form-label">Registered Email ID</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtEmail" type="email" runat="server" class="form-control" placeholder="Registered Email ID" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniMobile" class="col-sm-3 col-form-label form-label">Registered Mobile Number</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtMobile" type="text" runat="server" class="form-control" placeholder="Registered Mobile Number" maxlength="10" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAddress" class="col-sm-3 col-form-label form-label">Primary Address</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniAddress" type="text" runat="server" class="form-control" placeholder="Primary Address" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniCountry" class="col-sm-3 col-form-label form-label">Primary Country</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlCountry" name="ddlCountry" runat="server" class="form-control"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniCity" class="col-sm-3 col-form-label form-label">Primary City </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <select id="ddlCity" name="ddlCity" runat="server" class="form-control">
                                                                    <option value="" selected="selected" disabled="disabled">Please Select City</option>
                                                                </select>
                                                                <asp:HiddenField ID="hidCityField" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Primary State</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtPrimaryState" type="text" runat="server" class="form-control" placeholder="Primary State" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Primary Zip Code </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtprimaryzipcode" type="text" runat="server" class="form-control" placeholder="Primary Zip Code" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniWebsite" class="col-sm-3 col-form-label form-label">Website</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniWebsite" type="text" runat="server" class="form-control" placeholder="Website" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Service Subscription </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="subscription" name="gtesubscription" runat="server" class="form-control">
                                                                    <asp:ListItem Value="">Please Select</asp:ListItem>
                                                                    <asp:ListItem Value="0">GTE Service</asp:ListItem>
                                                                    <asp:ListItem Value="3">GTE(Certification)</asp:ListItem>
                                                                    <asp:ListItem Value="4">GTE(Evalution)</asp:ListItem>
                                                                    <asp:ListItem Value="1">Full Service</asp:ListItem>
                                                                    <asp:ListItem Value="2">Examination module</asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row" runat="server" id="Divgteservice">
                                                    <label class="col-sm-3 col-form-label form-label">Select GTE</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="ddlGTEService" name="gte" runat="server" class="form-control">
                                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">GTE Service</asp:ListItem>
                                                                    <asp:ListItem Value="2">GTE(Certification)</asp:ListItem>
                                                                    <asp:ListItem Value="3">GTE(Evalution)</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Total Subscribed Users </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtapplicantno" type="text" runat="server" class="form-control" placeholder="Total Subscribed Users" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Notification Email 1 </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtnotification1" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Notification Email 2  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtnotification2" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAcceptedMaxAge" class="col-sm-3 col-form-label form-label">Institution Accepted Maximum age</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <asp:DropDownList runat="server" ID="ddlage" class="form-control"></asp:DropDownList>
                                                            </div>
                                                            <span>
                                                                <label class="col-form-label form-label">in years</label></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniAcceptedMinAge" class="col-sm-3 col-form-label form-label">Institution Accepted Minimum age</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <asp:DropDownList runat="server" ID="ddlage1" class="form-control"></asp:DropDownList>
                                                                <%--<input id="txtUniAcceptedMinAge" type="number" runat="server" class="form-control" placeholder="Minimum Age" />--%>
                                                            </div>
                                                            <span>
                                                                <label class="col-form-label form-label">in years</label></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <h5>White Labeling</h5>
                                                <div class="form-group row">
                                                    <label for="hosturl" class="col-sm-3 col-form-label form-label">Hosting URL</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txthosturl" type="text" runat="server" class="form-control" placeholder="Hosting URL" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="logo" class="col-sm-3 col-form-label form-label">Logo</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload runat="server" ID="logo" /><br/>
                                                                
                                                               
                                                                <img id="universityLogo" src="<%=imagepath %>" alt="logo" />
                                                                <asp:HiddenField runat="server" ID="hidLogo" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="stripcolor" class="col-sm-3 col-form-label form-label">Header strip Color </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <button class="jscolor{valueElement:'stripcolorInput'} form-control" onblur="getstripcolorcode()">Choose Color</button>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" runat="server" id="headerstripcolor" class="form-control" />
                                                                <input type="hidden" id="stripcolorInput" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="verticalnavigationcolor" class="col-sm-3 col-form-label form-label">Color Of vertical navigation </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <button class="jscolor{valueElement:'navigationcolorInput'} form-control" onblur="getNavigationColorcode()">Choose Color</button>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" runat="server" id="verticalnavigationcolor" class="form-control" />
                                                                <input type="hidden" id="navigationcolorInput" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Font Color </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <button class="jscolor{valueElement:'valueInput'} form-control" id="fontcolorbtn" runat="server" onblur="getFontColorcode()">Choose Color</button>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" runat="server" id="fontcolor" class="form-control" />
                                                                <input type="hidden" id="valueInput" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" style="display: block;">
                                            <div id="Divtab2" runat="server" style="display: none;">
                                                <h5>PHOTOS & VIDEO</h5>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Main Photos</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload runat="server" ID="FileUpload_mainphotos" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Main Videos</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload runat="server" ID="FileUpload_mainVideos" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Downloads Library</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload runat="server" ID="FileUpload2" />
                                                                <input id="Text3" type="text" runat="server" class="form-control" />
                                                            </div>
                                                            <div>
                                                                <asp:Button runat="server" ID="Button2" Text="Upload" OnClientClick="ValidateAndUploadFileLibrary" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                                <h5>DOWNLOADS</h5>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Downloads Library</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload runat="server" ID="file_downloadlibrary" />
                                                                <input id="txtlibrarydescription" type="text" runat="server" class="form-control" />
                                                            </div>
                                                            <div>
                                                                <asp:Button runat="server" ID="btnuploadlibrary" Text="Upload" OnClientClick="ValidateAndUploadFileLibrary  " />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-stat" role="tabpanel" aria-labelledby="nav-stat-tab">
                                            <div id="Divtab3" runat="server">
                                                <%--<h5>OVERVIEW</h5>--%>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Institution Affiliation</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlAffiliation" CssClass="form-control">
                                                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                                                    <asp:ListItem Value="1">Public</asp:ListItem>
                                                                    <asp:ListItem Value="2">Private</asp:ListItem>
                                                                    <asp:ListItem Value="3">PROPRIETARY (FOR PROFIT)</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<input id="txtUniAffiliation" type="text" runat="server" class="form-control" placeholder="Institution Affiliation" />--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Size</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlsize" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Setting </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlsetting" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Religious Affiliation </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlReligiousAffiliation" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Single-Gender or Co-ed </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlSingleGender_Co_ed" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Type </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddltype" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniYearEstablish" class="col-sm-3 col-form-label form-label">Institution Year Established</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtYearEstablish" type="text" runat="server" maxlength="4" class="form-control" placeholder="Institution Year Established" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniSDescription" class="col-sm-3 col-form-label form-label">Institution Short Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniSDescription" type="text" runat="server" class="form-control" placeholder="Institution Short Description" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Institution Long Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniLDescription" type="text" runat="server" class="form-control" placeholder="Institution Long Description" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">No of Campuses</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtnoofcampus" type="text" runat="server" class="form-control" placeholder="No of Campuses" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                            <div runat="server" id="courseDiv" style="display: block;">
                                                <h5>COURSES </h5>
                                                <div id="new">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label form-label">Broad Fields of Study Offered : </label>

                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <asp:CheckBoxList runat="server" ID="CheckBoxList1" RepeatColumns="2" Font-Size="Small" RepeatDirection="Vertical">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-9 col-form-label form-label">Narrow Fields of Study Offered : </label>

                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <asp:CheckBoxList runat="server" ID="CheckBoxList2" RepeatColumns="2" Font-Size="Small" CssClass="myCheckboxCss" RepeatDirection="Vertical" disabled>
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-9 col-form-label form-label">detailed Fields of Study Offered : </label>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <asp:CheckBoxList runat="server" ID="CheckBoxList3" RepeatColumns="3" Font-Size="Small" RepeatDirection="Vertical" disabled>
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Courses Description </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBox1" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                              
                                                <h5>STUDENT STATS</h5>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Total Enrolled Students</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtTotalEnrolledStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Doctoral Students</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtDoctoralStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Graduate Students</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtGraduateStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Under Graduate Students</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtUnderGraduateStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Certificate / Diploma Students</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtCertificate_DiplomaStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Non-award Students </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtNon_awardStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">School Education Students </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtSchoolEducationStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">No of Academic Staff</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtNoofAcademicStaff" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Staff to Student Ratio</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtStafftoStudentRatio" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Female % on Campus </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtFemaleonCampus" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Average Age </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtAverageAge" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">% of Domestic Students </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtofDomesticStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">% In State Students </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtInStateStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">% of International Students </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtofInternationalStudents" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">No of Nationalities </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtNoofNationalities" MaxLength="5" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-adminssion" role="tabpanel" aria-labelledby="nav-adminssion-tab">
                                                <h5>ADMISSIONS</h5>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Admissions Description </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAdmissionsDescrip" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Special Instructions for International Students  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstrucForInternationalStud" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Applied   </label>
                                                    <div class="col-sm-8">
                                                         <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtApplied_male" class="form-control" runat="server"></asp:TextBox><label>MALE</label>
                                                            </div>
                                                             <div class="col-md-4">
                                                          <asp:TextBox ID="txtApplied_female" class="form-control" runat="server"></asp:TextBox><label>FEMALE</label>
                                                                 </div>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Accepted   </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtAccepted_male" class="form-control" runat="server"></asp:TextBox><label>MALE</label>
                                                            </div>
                                                             <div class="col-md-4">
                                                          <asp:TextBox ID="txtAccepted_female" class="form-control" runat="server"></asp:TextBox><label>FEMALE</label>
                                                                 </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Declined   </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtDeclined_male" class="form-control" runat="server"></asp:TextBox><label>MALE</label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtDeclined_female" class="form-control" runat="server"></asp:TextBox><label>FEMALE</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Acceptance Rate    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAcceptanceRate" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Selectivity   </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlSelectivity" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Freshman Admitted    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtFreshman_male" class="form-control" runat="server"></asp:TextBox><label>MALE</label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtFreshman_female" class="form-control" runat="server"></asp:TextBox><label>FEMALE</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">International    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInternational" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Domestic    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtDomestic" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Tests Required    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="testList" RepeatColumns="2"></asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Interview Required</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlinterviewRequired" class="form-control">
                                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Application Fee</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlApplicantfee" class="form-control">
                                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            <h5>Admission Factors </h5>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Essay</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlessay" class="form-control">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Recommendations</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlRecommendations" class="form-control">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Secondary school record</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlSecondaryschoolrecord" class="form-control">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Standardized test scores</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlStandardizedtestscores" class="form-control">
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Alumni/ae relationship</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlAlumni_aerelationship" class="form-control">
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Extracurricular activities</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlExtracurricularactivities" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Particular talent/ability</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlParticulartalent_ability" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Volunteer Work</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlVolunteerWork" class="form-control">
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Work Experience</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlWorkExperience" class="form-control">
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Character/ personal qualities</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlCharacter_personalqualities" class="form-control">
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Class rank</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlClassrank" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Geographical residence</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlGeographicalresidence" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Minority affiliation</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlMinorityaffiliation" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">State residency</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlStateresidency" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Interview</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlInterview" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Religious affiliation/commitment</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlReligiousaffiliationcommitment" class="form-control">
                                                               
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label form-label">Genuine Student Assessment </label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:DropDownList runat="server" ID="ddlGenuineStudentAssessment" class="form-control">
                                                              
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                            <div id="Divtab4" runat="server" style="display: block;">
                                                <h5>DEADLINES </h5>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Important Dates </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlimpDates" class="form-control"></asp:DropDownList><br/>
                                                                <asp:TextBox ID="ttimpdatesDescription" class="form-control" runat="server" style="width: 541px; height: 90px"></asp:TextBox>
                                                                <%--<input type="text" runat="server" id="txtimpdate" class="form-control" />--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h5>FEE & FUNDING </h5>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Avg Tuition Fee </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAvgTuitionFee" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Avg Financial Aid Package  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAvgFinancialAidPackage" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">% Financial need met </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtFinancialneedMet" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">For Domestic Students  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:CheckBoxList runat="server" ID="chkdomesticstudent" >
                                                                    <asp:ListItem Value="1">JobTrainer</asp:ListItem>
                                                                    <asp:ListItem Value="2">Subsidized Training</asp:ListItem>
                                                                    <asp:ListItem Value="3">VET Student Loans (VSL)</asp:ListItem>
                                                                    <asp:ListItem Value="4">Traineeship & Apprenticeships</asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">For International Students  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:CheckBox runat="server" ID="chkstudecarescholarship_" Text="StudeCARE Scholarships"/>
                                                                <asp:Label runat="server" ID="lbl" Text="Get upto 75% of your first year's Tuition Fee " />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <h5>ACCREDITION & RANKINGS</h5>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Accreditation </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="AccreditationName" CssClass="form-control" runat="server"/><br/>
                                                                <asp:TextBox ID="txtAccreditation" class="form-control" TextMode="MultiLine" runat="server" Style="width: 541px; height: 90px"></asp:TextBox><br/>
                                                                <asp:FileUpload ID="AccreditationFile" runat="server"/>
                                                                 <asp:HyperLink runat="server" ID="accreditationLink" Target="_blank"></asp:HyperLink>
                                                                <asp:HiddenField runat="server" ID="Hid_accreditation"/>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Times Higher Education Ranking </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlTimesHigherEducationRanking_year" CssClass="form-control" /><br />
                                                                <asp:TextBox ID="txtTimesHigherEducationRanking" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label form-label">QS World University Ranking </label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:DropDownList runat="server" ID="ddlQSWorldUniversityRanking_year" CssClass="form-control" /><br />
                                                                    <asp:TextBox ID="txtQSWorldUniversityRanking" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label form-label">Academic Ranking of World Universities </label>
                                                            <div class="col-sm-8">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <asp:DropDownList runat="server" ID="ddlAcademicRankingofWorldUniversities_year" CssClass="form-control" /><br />
                                                                        <asp:TextBox ID="txtAcademicRankingofWorldUniversities" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Rankings  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRankings_name" CssClass="form-control" runat="server" /><br />
                                                                <asp:DropDownList runat="server" ID="ddlRankingsyear" CssClass="form-control" /><br />
                                                                <asp:TextBox ID="txtRankings_description" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox><br />
                                                                <asp:FileUpload ID="Rankings_FileUpload" runat="server" />
                                                                <asp:HyperLink runat="server" Target="_blank" ID="RankingsLink"/>
                                                                <asp:HiddenField runat="server" ID="HidRankings" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Awards  </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtawardsname" CssClass="form-control" runat="server" /><br />
                                                                <asp:DropDownList runat="server" ID="ddlawardsYear" CssClass="form-control" /><br />
                                                                <asp:TextBox ID="txtawards" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox><br />
                                                                <asp:FileUpload ID="awards_FileUpload" runat="server" />
                                                                <asp:HyperLink runat="server" Target="_blank" ID="awardsLink"/>
                                                                <asp:HiddenField runat="server" ID="Hidawards" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label form-label">Subject Rankings</label>
                                                            <div class="col-sm-8">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtSubjectRankingsName"/><br />
                                                                        <asp:DropDownList runat="server" ID="ddlSubjectRankings" CssClass="form-control"/><br />
                                                                        <asp:TextBox ID="txtSubjectRankings" class="form-control" TextMode="MultiLine" runat="server" Style="width: 300px; height: 140px"></asp:TextBox>
                                                                        <asp:FileUpload runat="server" ID="SubjectRankingsFile"/>
                                                                        <asp:HyperLink runat="server" Target="_blank" ID="SubjectRankingsFileLink"/>
                                                                        <asp:HiddenField runat="server" ID="HidSubjectRankingsFile"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-five" role="tabpanel" aria-labelledby="nav-five-tab">
                                            <div id="Divtab5" runat="server">
                                                <%--   <h5>POLICIES </h5>--%>

                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Exanination Module Instruction </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtexamInstruction" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniNotesDisclaimer" class="col-sm-3 col-form-label form-label">Notes and Disclaimer for university</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <textarea id="txtNotesDisclaimer" runat="server" class="form-control" placeholder="Notes and Disclaimer"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Institution Instruction for Student Sop </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtUniversitySop" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 300px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Institution Instruction for Scholarship and Funding </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtUniversityScholarship" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 300px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Institution Instruction for fee payments </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtUniversityFeePayment" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 300px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Acceptance Terms</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAcceptanceTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Deferment Terms</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtDefermentTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Rejection Terms </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRejectionTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Withdrawal Terms</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtWithdrawnTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Institution Instruction for managing application status</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtUniversityApplication" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="fontcolor" class="col-sm-3 col-form-label form-label">Institution Instruction for managing COE</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtUniversityCOE" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Institution Instruction for Support Services </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtsupportserviceInstructions" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Institution Instruction for Visa View Status</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtvisainstruction" class="form-control" TextMode="MultiLine" runat="server" Style="width: 600px; height: 140px"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-six" role="tabpanel" aria-labelledby="nav-six-tab">
                                            <div>
                                                <div class="form-group row">
                                                    <label for="uniLatitude" class="col-sm-3 col-form-label form-label">Location Latitude</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniLatitude" type="text" runat="server" class="form-control" placeholder="Location Latitude" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniLongitude" class="col-sm-3 col-form-label form-label">Location Longitude</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniLongitude" type="text" runat="server" class="form-control" placeholder="Location Longitude" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniTimeZone" class="col-sm-3 col-form-label form-label">Location Time Zone</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlTimeZone" name="ddlTimeZone" runat="server" class="form-control"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniAirport" class="col-sm-3 col-form-label form-label">Closest Airport to Institution</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniAirport" type="text" runat="server" class="form-control" placeholder="Closest Airport to Institution" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniAirportDistance" class="col-sm-3 col-form-label form-label">Distance from closest airport</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniAirportDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest airport" />
                                                            </div>
                                                            <select id="airDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                                                <option value="" disabled="disabled">Please Select Unit</option>
                                                                <option value="KM">KM</option>
                                                                <option value="Miles">Miles</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniRailDistance" class="col-sm-3 col-form-label form-label">Distance from closest Railway Station</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniRailDistance" type="text" runat="server" class="form-control" placeholder="Distance from closest Railway Station" />
                                                            </div>
                                                            <select id="railDistanceUnit" name="distanceUnit" runat="server" class="form-control col-md-4">
                                                                <option value="" disabled="disabled">Please Select Unit</option>
                                                                <option value="KM">KM</option>
                                                                <option value="Miles">Miles</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniGettingAround" class="col-sm-3 col-form-label form-label">Getting Around</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtUniGettingAround" type="text" runat="server" class="form-control" placeholder="Getting Around" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h5>Others</h5>
                                                <div class="form-group row">
                                                    <label for="unichatId" class="col-sm-3 col-form-label form-label">Institution Chat ID</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input id="txtunichatId" type="text" runat="server" class="form-control" placeholder="Institution chat ID" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">Institution google tag manager Code </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtgtmcode" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">1 Proctor Name</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtproctorname1" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">1 Proctor Contact Number </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtproctorno1" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label form-label">1 Proctor Email </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtproctoremail1" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
<!-- ./Tabs -->
               
                   
                         <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%=ddlCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "createuniversity.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCity.ClientID%>").length >= 1) {
                                $("#<%=ddlCity.ClientID%>").empty();
                                $("#<%=ddlCity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });

            });

            $("#<%=ddlCity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddlCity.ClientID%>").val());
            });

        });

        function validateForm() {

            var txtUniName = $('#<%=txtUniName.ClientID%>').val();
            var institutionflag = $('#<%=ddlflag.ClientID%>').val();
            var hostUrl = $('#<%=txthosturl.ClientID%>').val();
            var txtUniAffiliation = $('#<%=ddlAffiliation.ClientID%>').val();
            var txtUniType = $('#<%=ddltype.ClientID%>').val();
            var txtUniGettingAround = $('#<%=txtUniGettingAround.ClientID%>').val();
            var txtUniRailDistance = $('#<%=txtUniRailDistance.ClientID%>').val();
            var txtUniAirportDistance = $('#<%=txtUniAirportDistance.ClientID%>').val();
            var UniTimeZoneValue = $('#<%=ddlTimeZone.ClientID%>').val();
            var txtUniLongitude = $('#<%=txtUniLongitude.ClientID%>').val();
            var txtUniLatitude = $('#<%=txtUniLatitude.ClientID%>').val();
            var countryValue = $('#<%=ddlCountry.ClientID%>').val();
            var cityValue = $('#<%=hidCityField.ClientID%>').val();
            var txtUniAddress = $('#<%=txtUniAddress.ClientID%>').val();
            var txtYearEstablish = $('#<%=txtYearEstablish.ClientID%>').val();
            var txtEmail = $('#<%=txtEmail.ClientID%>').val();
            var txtUniLDescription = $('#<%=txtUniLDescription.ClientID%>').val();
            var txtUniSDescription = $('#<%=txtUniSDescription.ClientID%>').val();
            var txtUniWebsite = $('#<%=txtUniWebsite.ClientID%>').val();
            var txtUniContactPerson = $('#<%=txtUniContactPerson.ClientID%>').val();
            var txtMobile = $('#<%=txtMobile.ClientID%>').val();
            var txtchatid = $('#<%=txtunichatId.ClientID%>').val();
            var txtUniAirport = $('#<%=txtUniAirport.ClientID%>').val();
            var railDistanceUnit = $('#<%=railDistanceUnit.ClientID%>').val();
            var airDistanceUnit = $('#<%=airDistanceUnit.ClientID%>').val();
            var txtUniAcceptedMaxAge = $('#<%=ddlage.ClientID%>').val();
            var txtUniAcceptedMinAge = $('#<%=ddlage1.ClientID%>').val();
            var subscriptionSelection = $('#<%=subscription.ClientID%>').val();
            var GTEService = $('#<%=ddlGTEService.ClientID%>').val();
            var txtNotesDisclaimer = $('#<%=txtNotesDisclaimer.ClientID%>').val();
            var fllogo = $('#<%=logo.ClientID%>').val();
            var sopInstruction = $('#<%=txtUniversitySop.ClientID%>').val();
            var scholarshipInstruction = $('#<%=txtUniversityScholarship.ClientID%>').val();
            var applicationInstruction = $('#<%=txtUniversityApplication.ClientID%>').val();
            var feePaymentInstruction = $('#<%=txtUniversityFeePayment.ClientID%>').val();
            var coeInstruction = $('#<%=txtUniversityCOE.ClientID%>').val();
            var fontcolor = $('#<%=fontcolor.ClientID%>').val();
            var headercolor = $('#<%=headerstripcolor.ClientID%>').val();
            var verticalNavcolor = $('#<%=verticalnavigationcolor.ClientID%>').val();
            var gtmCode = $('#<%=txtgtmcode.ClientID%>').val();
            var proctoename1 = $('#<%=txtproctorname1.ClientID%>').val();
            var proctorno1 = $('#<%=txtproctorno1.ClientID%>').val();
            var proctoremail1 = $('#<%=txtproctoremail1.ClientID%>').val();
            var examInstruction = $('#<%=txtexamInstruction.ClientID%>').val();
            var notificationemail1 = $('#<%=txtnotification1.ClientID%>').val();
            var notificationemail2 = $('#<%=txtnotification2.ClientID%>').val();
            var nofapplicant = $('#<%=txtapplicantno.ClientID%>').val();

            //regex
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
            var urlRegex = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
            var colorcodeRegex = /^#(?:[0-9a-fA-F]{3}){1,2}$/;
            var checOnlykNum = /^[0-9]*$/;
            
            //BASIC
            if ($('#<%=ddlflag.ClientID%>').val() == 0) {
                alert("Please select partner type");
                return false;
            }
            else if ($('#<%=ddlcodetype.ClientID%>').val() == 0) {
                alert("Please select code/Reg no type");
                return false;
            }
            else if ($('#<%=txtcoderegNo.ClientID%>').val() == "") {
                alert("Please enter cricos code");
                return false;
            }
            else if (txtUniName == '') {
                alert("Please enter Institution Name");
                return false;
            }
            else if ($('#<%=txtinstitutionlegalname.ClientID%>').val() == "") {
                alert("Please enter institution legal name");
                return false;
            }
            else if (txtUniContactPerson == '') {
                alert("Please enter Institution contact person");
                return false;
            }
            else if ($('#<%=txtUniContactPersonPosition.ClientID%>').val() == "") {
                alert("Please enter Institution contact person position");
                return false;
            }
            else if (txtEmail == '' || !emailRegex.test(txtEmail)) {
                alert("Please enter Institution Email ID");
                return false;
            }
            else if (txtMobile == '') {
                alert("Please enter valid university mobile number");
                return false;
            }

            else if (txtUniAddress == '') {
                alert("Please enter Institution Address");
                return false;
            }
            else if (countryValue == 0 || isNaN(parseInt(countryValue))) {
                alert("Please select Institution Country");
                return false;
            }
            else if (cityValue == 0 || isNaN(parseInt(cityValue))) {
                alert("Please select Institution City");
                return false;
            }
            else if ($('#<%=txtPrimaryState.ClientID%>').val() == "") {
                alert("Please enter primary state");
                return false;
            }
            else if ($('#<%=txtprimaryzipcode.ClientID%>').val() == "") {
                alert("Please enter primary zip code");
                return false;
            }
            else if (txtUniWebsite == '' || !urlRegex.test(txtUniWebsite)) {
                alert("Please enter university website");
                return false;
            }
            else if (isNaN(parseInt(subscriptionSelection))) {
                alert("Please select service subscription for university.");
                return false;
            }
            else if (subscriptionSelection == 1 && isNaN(parseInt(GTEService))) {
                alert("Please select GTE service subscription for university.");
                return false;
            }
            else if (nofapplicant == "" || !(checOnlykNum.test(nofapplicant))) {
                alert("Please enter valid applicant to be registered.");
                return false;
            }
            else if (notificationemail1 == "" || !emailRegex.test(notificationemail1)) {
                alert("Please enter email 1 for notification.");
                return false;
            }
            else if (notificationemail2 == "" || !emailRegex.test(notificationemail2)) {
                alert("Please enter email 2 for notification.");
                return false;
            }
            else if (txtUniAcceptedMaxAge == 0 || parseInt(txtUniAcceptedMaxAge) <= 0) {
                alert("Please enter valid university accepted maximum age");
                return false;
            }
            else if (txtUniAcceptedMinAge == 0 || parseInt(txtUniAcceptedMinAge) <= 0) {
                alert("Please enter valid university accepted minimum age");
                return false;
            }
            else if (parseInt(txtUniAcceptedMinAge) > parseInt(txtUniAcceptedMaxAge)) {
                alert("Minimum age greater than maximum age. Please enter valid university accepted age range.");
                return false;
            }
            else if (hostUrl == '' || (hostUrl).match(/:\/\/(www[0-9]?\.)?(.[^/:]+)/i)) {
                alert("Please enter valid Host Url");
                return false;
            }
            else if (validfileExtention($("#<%=logo.ClientID%>").val(), $("#<%=hidLogo.ClientID%>").val())) { }
            else if (headercolor == '' || !colorcodeRegex.test(headercolor)) {
                alert("Please enter Valid header strip Color.");
                return false;
            }
            else if (verticalNavcolor == '' || !colorcodeRegex.test(verticalNavcolor)) {
                alert("Please enter Valid vertical navigation color.");
                return false;
            }
            else if (fontcolor == '' || !colorcodeRegex.test(fontcolor)) {
                alert("Please enter Valid Font Color.");
                return false;
            }



            //else if (institutionflag == 0) {
            //    alert("Please select Partner Type");
            //    return false;
            //}
            //else if (txtUniAffiliation == 0) {
            //    alert("Please enter Institution Affiliation");
            //    return false;
            //}
            //else if (txtUniType == 0) {
            //    alert("Please enter Institution Type");
            //    return false;
            //}
            //else if (txtYearEstablish == '' || isNaN(parseInt(txtYearEstablish)) || parseInt(txtYearEstablish) >= new Date().getFullYear()) {
            //    alert("Please enter correct university establishment year");
            //    return false;
            //}
            //else if (txtUniSDescription == '') {
            //    alert("Please enter Institution  Short Description");
            //    return false;
            //}
            //else if (txtUniLDescription == '') {
            //    alert("Please enter Institution long description");
            //    return false;
            //}
            //else if (txtchatid == '') {
            //    alert("Please enter university chat ID");
            //    return false;
            //}
           
            //else if (txtUniLatitude == '' || isNaN(txtUniLatitude) || isNaN(parseFloat(txtUniLatitude))) {
            //    alert("Please enter appropriate Institution Latitude format. eg. 34.5553");
            //    return false;
            //}
            //else if (txtUniLongitude == '' || isNaN(txtUniLongitude) || isNaN(parseFloat(txtUniLongitude))) {
            //    alert("Please enter appropriate Institution Longitude format. eg. 34.5553");
            //    return false;
            //}
            //else if (UniTimeZoneValue == 0 || isNaN(parseInt(UniTimeZoneValue))) {
            //    alert("Please select university time zone");
            //    return false;
            //}
            //else if (txtUniAirport == '') {
            //    alert("Please enter airport name");
            //    return false;
            //}
            //else if (txtUniAirportDistance == '' || !airDistanceUnit || isNaN(parseFloat(txtUniAirportDistance))) {
            //    if (txtUniAirportDistance != '' && !airDistanceUnit)
            //        alert("Please select distance unit");
            //    else
            //        alert("Please enter nearest airport distance from university");
            //    return false;
            //}
            //else if (txtUniRailDistance == '' || !railDistanceUnit || isNaN(parseFloat(txtUniRailDistance))) {
            //    if (txtUniRailDistance != '' && !railDistanceUnit)
            //        alert("Please select distance unit");
            //    else
            //        alert("Please enter nearest railway station distance from university");
            //    return false;
            //}
            //else if (txtUniGettingAround == '') {
            //    alert("Please enter Institution Getting Around");
            //    return false;
            //}
          
            //else if (txtNotesDisclaimer == '') {
            //    alert("Please enter Institution Notes and disclaimer");
            //    return false;
            //}
            
            //else if (sopInstruction == "") {
            //    alert("Please enter university sop instruction");
            //    return false;
            //}
            //else if (scholarshipInstruction == "") {
            //    alert("Please enter university scholarship instructions");
            //    return false;
            //}
            //else if (applicationInstruction == "") {
            //    alert("Please enter university application status instructions");
            //    return false;
            //}
            //else if (feePaymentInstruction == "") {
            //    alert("Please enter university fee payment instructions");
            //    return false;
            //}
            //else if (coeInstruction == "") {
            //    alert("Please enter university COE instructions");
            //    return false;
            //}
            
            //else if (gtmCode == "") {
            //    alert("Please enter google tag manager code.");
            //    return false;
            //}
            //else if (proctoename1 == "") {
            //    alert("Please enter proctor 1 name.");
            //    return false;
            //}
            //else if (proctorno1 == "") {
            //    alert("Please enter Proctor 1 contact number.");
            //    return false;
            //}
            //else if (proctoremail1 == "") {
            //    alert("Please enter Proctor 1 email ID.");
            //    return false;
            //}
            //else if (examInstruction == "") {
            //    alert("Please enter assessment Instruction.");
            //    return false;
            //}
            return true;

        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#institution_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#universitymaster').addClass('active');

            $("#<%=txthosturl.ClientID%>").attr("disabled", "disabled");
          <%--  $("#<%=txtcoderegNo.ClientID%>").attr("disabled", "disabled");--%>
            
        });

        function getFontColorcode() {
            $("#<%=fontcolor.ClientID%>").val("");
            $("#<%=fontcolor.ClientID%>").val("#" + $("#valueInput").val());
        }
        function getNavigationColorcode() {
            $("#<%=verticalnavigationcolor.ClientID%>").val("");
            $("#<%=verticalnavigationcolor.ClientID%>").val("#" + $("#navigationcolorInput").val());
        }
        function getstripcolorcode() {
            $("#<%=headerstripcolor.ClientID%>").val("");
            $("#<%=headerstripcolor.ClientID%>").val("#" + $("#stripcolorInput").val());
        }
        $("#<%=Divgteservice.ClientID%>").hide();
        $("#<%=subscription.ClientID%>").change(function () {
            var serviceID = $("#<%=subscription.ClientID%>").val();
            if (serviceID == 1)
                $("#<%=Divgteservice.ClientID%>").show();
            else
                $("#<%=Divgteservice.ClientID%>").hide();
        });
        function validfileExtention(filepath , hidDocumentPath) {
            if (filepath == "")
            {
               filepath = hidDocumentPath;
            }
            if (filepath == "") {
                alert("Please select valid file for logo.");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (filepath != "")
            {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Please select valid file for logo.");
                    return false;
                }
            }
            return true;
        }

       
        $(document).ready(function () {
            for (var i = 0; i < 71; i++)
                $("#ContentPlaceHolder1_CheckBoxList2_" + i + "").prop("disabled", "disabled");

            for (var i = 0; i < 356; i++)
                $("#ContentPlaceHolder1_CheckBoxList3_" + i + "").prop("disabled", "disabled");

            $("#<%=CheckBoxList1.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
                var BroadID = $(this).val();

                if ($(this).is(':checked')) {
                    bydefaultcheck(BroadID, true)
                }
                else {
                    bydefaultcheck(BroadID, false)
                }
            });
             $("#<%=CheckBoxList2.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
                var narrowID = $(this).val();

                 if ($(this).is(':checked')) {
                     byDeafultCheckDetailed(narrowID, true)
                }
                else {
                    byDeafultCheckDetailed(narrowID, false)
                }
            });
            //
        });
        function bydefaultcheck(broadID, Ischeck) {
             $.ajax({
                type: "POST",
                url: "universitydetails_editN.aspx/GetNarrow",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                 data: "{'broadID': '" + broadID + "'}",
                success: function (response) {
                   if (response.d) {
                        var result = JSON.parse(response.d);
                       
                       for (var i = 0; i < result.length; i++) {
                           if (Ischeck == true) {
                               $("#ContentPlaceHolder1_CheckBoxList2_" + result[i].id + "").prop("checked", true);
                               $("#ContentPlaceHolder1_CheckBoxList2_" + result[i].id + "").prop("disabled","disabled");
                               byDeafultCheckDetailed(result[i].id, true);
                           }
                           else {
                               $("#ContentPlaceHolder1_CheckBoxList2_" + result[i].id + "").prop("checked", false);
                               $("#ContentPlaceHolder1_CheckBoxList2_" + result[i].id + "").removeAttr("disabled");
                               byDeafultCheckDetailed(result[i].id, false);
                           }
                       }
                    }
                }
            });
        }

        function byDeafultCheckDetailed(narrowID, Ischeck) {
             $.ajax({
                type: "POST",
                url: "universitydetails_editN.aspx/GetDetailed",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                 data: "{'narrowID': '" + narrowID + "'}",
                success: function (response) {
                   if (response.d) {
                        var result = JSON.parse(response.d);
                       
                       for (var i = 0; i < result.length; i++) {
                           if (Ischeck == true) {
                               $("#ContentPlaceHolder1_CheckBoxList3_" + result[i].id + "").prop("checked", true);
                               $("#ContentPlaceHolder1_CheckBoxList3_" + result[i].id + "").removeAttr("disabled");
                           }
                           else {
                               $("#ContentPlaceHolder1_CheckBoxList3_" + result[i].id + "").prop("checked", false);
                               $("#ContentPlaceHolder1_CheckBoxList3_" + result[i].id + "").prop("disabled","disabled");
                           }
                       }
                    }
                }
            });
        }

    </script>
</asp:Content>
