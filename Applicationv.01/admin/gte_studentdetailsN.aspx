<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_studentdetailsN.aspx.cs" Inherits="admin_gte_studentdetailsN" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Student details</li>
        </ol>             
        <asp:Button id="backNavLink" runat="server" class="btn btn-success mngbtn" Text="Back to Manage" onclick="backNavLink_Click"/>
        <div class="card">
            <div class="list-group list-group-fit">
                 <h5 class="form-control col-md-4 h5ctrl">Personal Details</h5>
                 <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label25" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">First Name</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblfirstname" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblfirstNameyes" GroupName="firstname" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblfirstNameNo" GroupName="firstname" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i23" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnFirstname" />
                                            <input id="txtfirstnameComment" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>  

<div class="list-group-item" id="middlename" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                        <div class="form-row">
                            <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Middle Name(s)</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblMiddleName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblMiddleNameYes" GroupName="MiddleName" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblMiddleNameNo" GroupName="MiddleName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnMiddleName" />
                                <input id="txtMiddleName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                 <div class="list-group-item" id="lastname" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                        <div class="form-row">
                            <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Family Name *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblLastNameYes" GroupName="LastName" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblLastNameNo" GroupName="LastName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnLastName" />
                                <input id="txtLastName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="list-group-item" id="dob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lbldob" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Birth </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtdob" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbldobYes" GroupName="dob" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rbldobNo" GroupName="dob" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="icdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btndob" />
                                            <input id="txtdobComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>                                                      
                 <div class="list-group-item" id="nationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label1" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Country of Citizenship </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblnationality" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblnationalityyYes" GroupName="nationality" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblnationalityyNo" GroupName="nationality" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i1" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btncountrycitizenship" />
                                            <input id="txtnationalityComment" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                 <div class="list-group-item" id="birthcountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label2" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Country of Birth  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtbirthcountry" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblbirthcountryYes" GroupName="birthcountry" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblbirthcountryNo" GroupName="birthcountry" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i2" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnbirthcountry" />
                                            <input id="txtbirthcountryComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                <%-- <div class="list-group-item" id="countryrsidence">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label3" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Current Country of Residence   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtcountryrsidence" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblcountryrsidenceYes" GroupName="countryrsidence" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblcountryrsidenceNo" GroupName="countryrsidence" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i3" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btncountryrsidence" />
                                            <input id="txtcountryrsidenceComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     --%>
                 <div class="list-group-item" id="maritalstatus">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label4" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Marital Status </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblmaritalstatus" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblmaritalstatusYes" GroupName="maritalstatus" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblmaritalstatusNo" GroupName="maritalstatus" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i4" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnmaritalstatus" />
                                            <input id="txtmaritalstatusComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>  
                  <div class="list-group-item" id="gender" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                        <div class="form-row">
                            <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblGenderYes" GroupName="Gender" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblGenderNo" GroupName="Gender" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnGender" />
                                <input id="txtGender" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <h5 class="form-control col-md-4 h5ctrl">Contact Details</h5>
                <div class="list-group-item" id="postal" runat="server">
                    <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                        <div class="form-row">
                            <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblPostalAddress" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblPostalAddressYes" GroupName="PostalAddress" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblPostalAddressNo" GroupName="PostalAddress" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnPostalAddress" />
                                <input id="txtPostalAddress" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="address" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-address">
                        <div class="form-row">
                            <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">Is your Postal Address same as your current residential address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblAddressYes" GroupName="Address" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblAddressNo" GroupName="Address" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnAddress" />
                                <input id="txtAddress" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>                       
                </div>               
                <div class="list-group-item" id="residential" runat="server" style="display: none">
                    <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                        <div class="form-row">
                            <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblResidential" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblResidentialYes" GroupName="Residential" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblResidentialNo" GroupName="Residential" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnResidential" />
                                <input id="txtResidential" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="email" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-email">
                        <div class="form-row">
                            <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblEmailYes" GroupName="Email" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblEmailNo" GroupName="Email" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnEmail" />
                                <input id="txtEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="mobile" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                        <div class="form-row">
                            <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblMobileYes" GroupName="Mobile" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rblMobileNo" GroupName="Mobile" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnMobile" />
                                <input id="txtMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <h5 class="form-control col-md-4 h5ctrl">Previous Study</h5>
                <div class="list-group-item" id="highestqualificationAchieved">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationAchieved" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> LEVEL OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txthighestqualificationAchieved" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="RadioButton1" GroupName="highestqualificationAchieved" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="RadioButton2" GroupName="highestqualificationAchieved" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i5" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationAchieved" />
                                            <input id="txthighestqualificationAchievedcomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>

                
                <div class="list-group-item" id="broadfieldDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label26" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> BROAD FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblbroadfield" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblbroadfieldYes" GroupName="broadfield" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblbroadfieldNO" GroupName="broadfield" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i24" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnbroadfield" />
                                            <input id="txtbroadfieldComment" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                
                <div class="list-group-item" id="narrowfieldDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label28" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> NARROW FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblnarrowfield" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblnarrowfieldYes" GroupName="narrowfield" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblnarrowfieldNo" GroupName="narrowfield" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i25" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnnarrowfield" />
                                            <input id="txtnarrowfieldComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                
                <div class="list-group-item" id="detailedfieldDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label30" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> DETAILED FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lbldetailedfield" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbldetailedfieldYes" GroupName="detailedfield" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rbldetailedfieldNo" GroupName="detailedfield" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i26" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btndetailedfield" />
                                            <input id="txtdetailedfieldComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                 <div class="list-group-item" id="highestqualificationdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label10" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> DATE OF COMPLETION OF HIGHEST ACADEMIC QUALIFICATION  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblhighestqualificationdate" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationdateYes" GroupName="highestqualificationdate" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblhighestqualificationdateNo" GroupName="highestqualificationdate" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i8" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationdate" />
                                            <input id="txthighestqualificationdateComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>  
                <div class="list-group-item" id="highestqualificationcountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label11" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> COUNTRY WHERE YOU STUDIED YOUR HIGHEST ACADEMIC QUALIFICATION </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblhighestqualificationcountry" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationcountryYes" GroupName="highestqualificationcountry" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblhighestqualificationcountryNo" GroupName="highestqualificationcountry" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i9" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationcountry" />
                                            <input id="txthighestqualificationcountryComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                <h5 class="form-control col-md-10 h5ctrl">Intended Future Study (For the course application that you are doing this GTE Direct Evaluation for)</h5>

                  <div class="list-group-item" id="highestqualificationyouwillcompleteDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label8" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> LEVEL OF THE HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblhighestqualificationyouwillcomplete" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationyouwillcompleteYes" GroupName="highestqualificationyouwillcomplete" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblhighestqualificationyouwillcompleteNo" GroupName="highestqualificationyouwillcomplete" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i7highestqualificationAchieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationyouwillcomplete" />
                                            <input id="txthighestqualificationyouwillcompleteComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>  
                <div class="list-group-item" id="broadfieldyouwillcompleteDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label6" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> BROAD FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblbroadfieldyouwillcomplete" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblbroadfieldyouwillcompleteYes" GroupName="broadfieldyouwillcomplete" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblbroadfieldyouwillcompleteNo" GroupName="broadfieldyouwillcomplete" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i27" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnbroadfieldyouwillcomplete" />
                                            <input id="txtbroadfieldyouwillcompletecomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                
                <div class="list-group-item" id="narrowfieldyouwillcompleteDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label29" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> NARROW FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblnarrowfieldyouwillcomplete" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblnarrowfieldyouwillcompleteYes" GroupName="narrowfieldyouwillcomplete" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblnarrowfieldyouwillcompleteNo" GroupName="narrowfieldyouwillcomplete" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i28" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnnarrowfieldyouwillcomplete" />
                                            <input id="txtnarrowfieldyouwillcompleteComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                
                <div class="list-group-item" id="detailedfieldyouwillcompleteDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label32" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> DETAILED FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lbldetailedfieldyouwillcomplete" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbldetailedfieldyouwillcompleteYes" GroupName="detailedfieldyouwillcomplete" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rbldetailedfieldyouwillcompleteNo" GroupName="detailedfieldyouwillcomplete" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i29" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btndetailedfieldyouwillcomplete" />
                                            <input id="txtdetailedfieldyouwillcompleteComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                <div class="list-group-item" id="dateyouintendtostartnextDiv" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highQualificationCompleteDate">
                        <div class="form-row">
                            <label id="lbl" runat="server" for="dateyouintendtostartnextDiv" class="col-md-3 col-form-label form-label">DATE YOU INTEND TO START YOUR NEXT STUDIES</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lbldateyouintendtostartnext" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rbldateyouintendtostartnextYes" GroupName="dateyouintendtostartnext" Text="Yes" runat="server"/>
                                    <asp:RadioButton ID="rbldateyouintendtostartnextNo" GroupName="dateyouintendtostartnext" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icdateyouintendtostartnext" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btndateyouintendtostartnext" />
                                <input id="txtdateyouintendtostartnextcomments" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                 <h5 class="form-control col-md-4 h5ctrl">Your Choice of Study Destination</h5>

                 <div class="list-group-item" id="universityname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label31" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">NAME OF UNIVERSITY YOU ARE APPLYING TO     </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="Label33" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="RadioButton3" GroupName="universityname" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="RadioButton4" GroupName="universityname" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i30" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnuniversityname" />
                                            <input id="Text1" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div> 
                 <div class="list-group-item" id="universityCountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label34" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Country where chosen Educational Institution is located     </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="Label35" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="RadioButton5" GroupName="universityCountry" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="RadioButton6" GroupName="universityCountry" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i31" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnuniversityCountry" />
                                            <input id="Text2" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="eduinstitutioncity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label36" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">CITY WHERE CHOSEN UNIVERSITY IS LOCATED   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="Label37" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="RadioButton7" GroupName="eduinstitutioncity" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="RadioButton8" GroupName="eduinstitutioncity" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i32" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btneduinstitutioncity" />
                                            <input id="Text3" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
               <h5 class="form-control col-md-4 h5ctrl">Full-time work experience</h5>

                <div class="list-group-item" id="workexperienceDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label38" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> NUMBER OF YEARS OF FULL-TIME WORK EXPERIENCE  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblworkexperience" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblworkexperienceYes" GroupName="workexperience" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblworkexperienceNo" GroupName="workexperience" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i33" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnworkexperience" />
                                            <input id="txtworkexperiencecomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                <div class="list-group-item" id="currentlyworkingDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label40" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> ARE YOU CURRENTLY WORKING IN A FULL-TIME JOB?</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblcurrentlyworking" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblcurrentlyworkingYes" GroupName="currentlyworking" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblcurrentlyworkingNo" GroupName="currentlyworking" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i34" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btncurrentlyworking" />
                                            <input id="txtcurrentlyworkingcomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                <div class="list-group-item" id="jobofferedDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label42" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  DO YOU HAVE A JOB OFFER OR GUARANTEED JOB TO RETURN TO AFTER YOU HAVE COMPLETED YOUR STUDIES?  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lbljoboffered" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbljobofferedYes" GroupName="joboffered" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rbljobofferedNo" GroupName="joboffered" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i35" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnjoboffered" />
                                            <input id="txtjobofferedcomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                <div class="list-group-item" id="applyingforpackageDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label39" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  ARE YOU APPLYING FOR A PACKAGE YES/NO  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblapplyingforpackage" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblapplyingforpackageYes" GroupName="applyingforpackage" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblapplyingforpackageNo" GroupName="applyingforpackage" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i36" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnapplyingforpackage" />
                                            <input id="txtapplyingforpackagecomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div> 
                <div class="list-group-item" id="whatpackageDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label43" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  WHAT PACKAGE ARE YOU APPLYING FOR</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblwhatpackage" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblwhatpackageYes" GroupName="whatpackage" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblwhatpackageNo" GroupName="whatpackage" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i37" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnwhatpackage" />
                                            <input id="txtwhatpackagecomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                <div class="list-group-item" id="profilephotoDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label41" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">PLEASE UPLOAD AN ELECTRONIC PHOTO FOR YOUR PROFILE PICTURE</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:HyperLink runat="server" ID="uploadedFile"/>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblprofilephotoYes" GroupName="profilephoto" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblprofilephotoNo" GroupName="profilephoto" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i38" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnprofilephoto" />
                                            <input id="txtprofilephotocomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                 <div class="list-group-item" id="passportnumberDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label44" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  PASSPORT NUMBER</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblpassportnumber" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblpassportnumberYes" GroupName="passportnumber" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblpassportnumberNo" GroupName="passportnumber" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i39" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnpassportnumber" />
                                            <input id="txtpassportnumbercomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                 <div class="list-group-item" id="passportdocDiv">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label46" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> PLEASE UPLOAD PASSPORT COPY</label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:HyperLink runat="server" ID="HyperLink1"/>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblpassportdocYes" GroupName="passportdoc" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblpassportdocNo" GroupName="passportdoc" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i40" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnpassportdoc" />
                                            <input id="txtpassportdoccomments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   

<h5 class="form-control col-md-4 h5ctrl">Agent</h5>
                
                 <div class="list-group-item" id="agent">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label22" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">ARE YOU USING THE SERVICES OF AN EDUCATION AGENT?  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtagent" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblagentYes" GroupName="agent" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblagentNo" GroupName="agent" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i20" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnagent" />
                                            <input id="txtagentComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="agentList" style="display:none" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label23" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Agent Name </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtagentList" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblagentListYes" GroupName="agentList" Text="Yes" runat="server"/>
                                                <asp:RadioButton ID="rblagentListNo" GroupName="agentList" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i21" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnagentList" />
                                            <input id="txtagentListComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
               
                 <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validateform()"/>
                            <div class="col-md-6">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

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
          
            if ($("#<%=txtfirstnameComment.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtfirstnameComment.ClientID%>', 'btnFirstname');
            if ($("#<%=txtMiddleName.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            if ($("#<%=txtLastName.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtLastName.ClientID%>', 'btnLastName');
            if ($("#<%=txtdobComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtdobComments.ClientID%>', 'btndob');
            if ($("#<%=txtnationalityComment.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            if ($("#<%=txtbirthcountryComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            if ($("#<%=txtmaritalstatusComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            if ($("#<%=txtGender.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtGender.ClientID%>', 'btnGender');
            if ($("#<%=txtPostalAddress.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            if ($("#<%=txtAddress.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtAddress.ClientID%>', 'btnAddress');
            if ($("#<%=txtResidential.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtResidential.ClientID%>', 'btnResidential');
            if ($("#<%=txtEmail.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtEmail.ClientID%>', 'btnEmail');
            if ($("#<%=txtMobile.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtMobile.ClientID%>', 'btnMobile');
            if ($("#<%=txthighestqualificationAchievedcomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationAchievedcomments.ClientID%>', 'btnhighestqualificationAchieved');
            if ($("#<%=txtbroadfieldComment.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtbroadfieldComment.ClientID%>', 'btnbroadfield');
            if ($("#<%=txtnarrowfieldComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtnarrowfieldComments.ClientID%>', 'btnnarrowfield');
            if ($("#<%=txtdetailedfieldComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtdetailedfieldComments.ClientID%>', 'btndetailedfield');
            if ($("#<%=txthighestqualificationdateComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            if ($("#<%=txthighestqualificationcountryComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            if ($("#<%=txthighestqualificationyouwillcompleteComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationyouwillcompleteComments.ClientID%>', 'btnhighestqualificationyouwillcomplete');
            if ($("#<%=txtbroadfieldyouwillcompletecomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtbroadfieldyouwillcompletecomments.ClientID%>', 'btnbroadfieldyouwillcomplete');
            if ($("#<%=txtnarrowfieldyouwillcompleteComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtnarrowfieldyouwillcompleteComments.ClientID%>', 'btnnarrowfieldyouwillcomplete');
            if ($("#<%=txtdetailedfieldyouwillcompleteComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtdetailedfieldyouwillcompleteComments.ClientID%>', 'btndetailedfieldyouwillcomplete');
            if ($("#<%=txtdateyouintendtostartnextcomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtdateyouintendtostartnextcomments.ClientID%>', 'btndateyouintendtostartnext');
            if ($("#<%=Text1.ClientID%>").val() != "")
                manageremarksifnocheked('<%=Text1.ClientID%>', 'btnuniversityname');
            if ($("#<%=Text2.ClientID%>").val() != "")
                manageremarksifnocheked('<%=Text2.ClientID%>', 'btnuniversityCountry');
            if ($("#<%=Text3.ClientID%>").val() != "")
                manageremarksifnocheked('<%=Text3.ClientID%>', 'btneduinstitutioncity');
            if ($("#<%=txtworkexperiencecomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtworkexperiencecomments.ClientID%>', 'btnworkexperience');
            if ($("#<%=txtcurrentlyworkingcomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtcurrentlyworkingcomments.ClientID%>', 'btncurrentlyworking');
            if ($("#<%=txtjobofferedcomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtjobofferedcomments.ClientID%>', 'btnjoboffered');
            if ($("#<%=txtapplyingforpackagecomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtapplyingforpackagecomments.ClientID%>', 'btnapplyingforpackage');
            if ($("#<%=txtwhatpackagecomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtwhatpackagecomments.ClientID%>', 'btnwhatpackage');
            if ($("#<%=txtprofilephotocomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtprofilephotocomments.ClientID%>', 'btnprofilephoto');
            if ($("#<%=txtpassportnumbercomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtpassportnumbercomments.ClientID%>', 'btnpassportnumber');
            if ($("#<%=txtpassportdoccomments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtpassportdoccomments.ClientID%>', 'btnpassportdoc');
            if ($("#<%=txtagentComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtagentComments.ClientID%>', 'btnagent');
            if ($("#<%=txtagentListComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtagentListComments.ClientID%>', 'btnagentList');  

             
            $("#<%=rblfirstNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtfirstnameComment.ClientID%>', 'btnFirstname');
            });
            $("#<%=rblMiddleNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            });
            $("#<%=rblLastNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtLastName.ClientID%>', 'btnLastName');
            });
            $("#<%=rbldobNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdobComments.ClientID%>', 'btndob');
            });
            $("#<%=rblnationalityyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            });
            $("#<%=rblbirthcountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            });
            $("#<%=rblmaritalstatusNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            });
            $("#<%=rblGenderNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtGender.ClientID%>', 'btnGender');
            });
            $("#<%=rblPostalAddressNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            });
            $("#<%=rblAddressNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtAddress.ClientID%>', 'btnAddress');
            });
            $("#<%=rblResidentialNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtResidential.ClientID%>', 'btnResidential');
            });
            $("#<%=rblEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtEmail.ClientID%>', 'btnEmail');
            });
            $("#<%=rblMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMobile.ClientID%>', 'btnMobile');
            });
            $("#<%=RadioButton2.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationAchievedcomments.ClientID%>', 'btnhighestqualificationAchieved');
            });
            $("#<%=rblbroadfieldNO.ClientID%>").click(function () {
                ManageRemarks('<%=txtbroadfieldComment.ClientID%>', 'btnbroadfield');
            });

            $("#<%=rblnarrowfieldNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtnarrowfieldComments.ClientID%>', 'btnnarrowfield');
            });
            $("#<%=rbldetailedfieldNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdetailedfieldComments.ClientID%>', 'btndetailedfield');
            });
            $("#<%=rblhighestqualificationdateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            });
            $("#<%=rblhighestqualificationcountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            });
            $("#<%=rblhighestqualificationyouwillcompleteNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationyouwillcompleteComments.ClientID%>', 'btnhighestqualificationyouwillcomplete');
            });
            $("#<%=rblbroadfieldyouwillcompleteNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtbroadfieldyouwillcompletecomments.ClientID%>', 'btnbroadfieldyouwillcomplete');
            });
            $("#<%=rblnarrowfieldyouwillcompleteNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtnarrowfieldyouwillcompleteComments.ClientID%>', 'btnnarrowfieldyouwillcomplete');
            });
            $("#<%=rbldetailedfieldyouwillcompleteNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdetailedfieldyouwillcompleteComments.ClientID%>', 'btndetailedfieldyouwillcomplete');
            });
            $("#<%=rbldateyouintendtostartnextNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdateyouintendtostartnextcomments.ClientID%>', 'btndateyouintendtostartnext');
            });
            $("#<%=RadioButton4.ClientID%>").click(function () {
                ManageRemarks('<%=Text1.ClientID%>', 'btnuniversityname');
            });
            $("#<%=RadioButton6.ClientID%>").click(function () {
                ManageRemarks('<%=Text2.ClientID%>', 'btnuniversityCountry');
            });
            $("#<%=RadioButton8.ClientID%>").click(function () {
                ManageRemarks('<%=Text3.ClientID%>', 'btneduinstitutioncity');
            });
            $("#<%=rblworkexperienceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtworkexperiencecomments.ClientID%>', 'btnworkexperience');
            });
            $("#<%=rblcurrentlyworkingNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtcurrentlyworkingcomments.ClientID%>', 'btncurrentlyworking');
            });
            $("#<%=rbljobofferedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtjobofferedcomments.ClientID%>', 'btnjoboffered');
            });
            $("#<%=rblapplyingforpackageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtapplyingforpackagecomments.ClientID%>', 'btnapplyingforpackage');
            });
            $("#<%=rblwhatpackageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtwhatpackagecomments.ClientID%>', 'btnwhatpackage');
            });
            $("#<%=rblprofilephotoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtprofilephotocomments.ClientID%>', 'btnprofilephoto');
            });
            $("#<%=rblpassportnumberNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpassportnumbercomments.ClientID%>', 'btnpassportnumber');
            });
            $("#<%=rblpassportdocNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpassportdoccomments.ClientID%>', 'btnpassportdoc');
            });
            $("#<%=rblagentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtagentComments.ClientID%>', 'btnagent');
            });
            $("#<%=rblagentListNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtagentListComments.ClientID%>', 'btnagentList');
             });
            
            if ($('#<%=rblfirstNameNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtfirstnameComment.ClientID%>', 'btnFirstname');
            if ($('#<%=rblMiddleNameNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            if ($('#<%=rblLastNameNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtLastName.ClientID%>', 'btnLastName');
            if ($('#<%=rbldobNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtdobComments.ClientID%>', 'btndob');
            if ($('#<%=rblnationalityyNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            if ($('#<%=rblbirthcountryNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            if ($('#<%=rblmaritalstatusNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            if ($('#<%=rblGenderNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtGender.ClientID%>', 'btnGender');
            if ($('#<%=rblPostalAddressNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            if ($('#<%=rblAddressNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtAddress.ClientID%>', 'btnAddress');
            if ($('#<%=rblResidentialNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtResidential.ClientID%>', 'btnResidential');
            if ($('#<%=rblEmailNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtEmail.ClientID%>', 'btnEmail');
            if ($('#<%=rblMobileNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtMobile.ClientID%>', 'btnMobile');
            if ($('#<%=RadioButton2.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationAchievedcomments.ClientID%>', 'btnhighestqualificationAchieved');
            if ($('#<%=rblbroadfieldNO.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtbroadfieldComment.ClientID%>', 'btnbroadfield');
            if ($('#<%=rblnarrowfieldNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtnarrowfieldComments.ClientID%>', 'btnnarrowfield');
            if ($('#<%=rbldetailedfieldNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtdetailedfieldComments.ClientID%>', 'btndetailedfield');
            if ($('#<%=rblhighestqualificationdateNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            if ($('#<%=rblhighestqualificationcountryNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            if ($('#<%=rblhighestqualificationyouwillcompleteNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationyouwillcompleteComments.ClientID%>', 'btnhighestqualificationyouwillcomplete');
            if ($('#<%=rblbroadfieldyouwillcompleteNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtbroadfieldyouwillcompletecomments.ClientID%>', 'btnbroadfieldyouwillcomplete');
            if ($('#<%=rblnarrowfieldyouwillcompleteNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtnarrowfieldyouwillcompleteComments.ClientID%>', 'btnnarrowfieldyouwillcomplete');
            if ($('#<%=rbldetailedfieldyouwillcompleteNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtdetailedfieldyouwillcompleteComments.ClientID%>', 'btndetailedfieldyouwillcomplete');
            if ($('#<%=rbldateyouintendtostartnextNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtdateyouintendtostartnextcomments.ClientID%>', 'btndateyouintendtostartnext');
            if ($('#<%=RadioButton4.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=Text1.ClientID%>', 'btnuniversityname');
            if ($('#<%=RadioButton6.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=Text2.ClientID%>', 'btnuniversityCountry');
            if ($('#<%=RadioButton8.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=Text3.ClientID%>', 'btneduinstitutioncity');
            if ($('#<%=rblworkexperienceNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtworkexperiencecomments.ClientID%>', 'btnworkexperience');
            if ($('#<%=rblcurrentlyworkingNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtcurrentlyworkingcomments.ClientID%>', 'btncurrentlyworking');
            if ($('#<%=rbljobofferedNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtjobofferedcomments.ClientID%>', 'btnjoboffered');
            if ($('#<%=rblapplyingforpackageNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtapplyingforpackagecomments.ClientID%>', 'btnapplyingforpackage');
            if ($('#<%=rblwhatpackageNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtwhatpackagecomments.ClientID%>', 'btnwhatpackage');
            if ($('#<%=rblprofilephotoNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtprofilephotocomments.ClientID%>', 'btnprofilephoto');
            if ($('#<%=rblpassportnumberNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtpassportnumbercomments.ClientID%>', 'btnpassportnumber');
            if ($('#<%=rblpassportdocNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtpassportdoccomments.ClientID%>', 'btnpassportdoc');
            if ($('#<%=rblagentNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtagentComments.ClientID%>', 'btnagent');
            if ($('#<%=rblagentListNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtagentListComments.ClientID%>', 'btnagentList');  


            $("#btnFirstname").click(function () {
                ManageRemarks('<%=txtfirstnameComment.ClientID%>', 'btnFirstname');
            });
            $("#btnMiddleName").click(function () {
                ManageRemarks('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            });
            $("#btnLastName").click(function () {
                ManageRemarks('<%=txtLastName.ClientID%>', 'btnLastName');
            });
            $("#btndob").click(function () {
                ManageRemarks('<%=txtdobComments.ClientID%>', 'btndob');
            });
            $("#btncountrycitizenship").click(function () {
                ManageRemarks('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            });
            $("#btnbirthcountry").click(function () {
                ManageRemarks('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            });
            $("#btnmaritalstatus").click(function () {
                ManageRemarks('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            });
            $("#btnGender").click(function () {
                ManageRemarks('<%=txtGender.ClientID%>', 'btnGender');
            });
            $("#btnPostalAddress").click(function () {
                ManageRemarks('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            });
            $("#btnAddress").click(function () {
                ManageRemarks('<%=txtAddress.ClientID%>', 'btnAddress');
            });
            $("#btnResidential").click(function () {
                ManageRemarks('<%=txtResidential.ClientID%>', 'btnResidential');
            });
            $("#btnEmail").click(function () {
                ManageRemarks('<%=txtEmail.ClientID%>', 'btnEmail');
            });
            $("#btnMobile").click(function () {
                ManageRemarks('<%=txtMobile.ClientID%>', 'btnMobile');
            });
            $("#btnhighestqualificationAchieved").click(function () {
                ManageRemarks('<%=txthighestqualificationAchievedcomments.ClientID%>', 'btnhighestqualificationAchieved');
            });
            $("#btnbroadfield").click(function () {
                ManageRemarks('<%=txtbroadfieldComment.ClientID%>', 'btnbroadfield');
            });
            $("#btnnarrowfield").click(function () {
                ManageRemarks('<%=txtnarrowfieldComments.ClientID%>', 'btnnarrowfield');
            });
            $("#btndetailedfield").click(function () {
                ManageRemarks('<%=txtdetailedfieldComments.ClientID%>', 'btndetailedfield');
            });
            $("#btnhighestqualificationdate").click(function () {
                ManageRemarks('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            });
            $("#btnhighestqualificationcountry").click(function () {
                ManageRemarks('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            });
            $("#btnhighestqualificationyouwillcomplete").click(function () {
                ManageRemarks('<%=txthighestqualificationyouwillcompleteComments.ClientID%>', 'btnhighestqualificationyouwillcomplete');
            });
            $("#btnbroadfieldyouwillcomplete").click(function () {
                ManageRemarks('<%=txtbroadfieldyouwillcompletecomments.ClientID%>', 'btnbroadfieldyouwillcomplete');
            });
            $("#btnnarrowfieldyouwillcomplete").click(function () {
                ManageRemarks('<%=txtnarrowfieldyouwillcompleteComments.ClientID%>', 'btnnarrowfieldyouwillcomplete');
            });
            $("#btndetailedfieldyouwillcomplete").click(function () {
                ManageRemarks('<%=txtdetailedfieldyouwillcompleteComments.ClientID%>', 'btndetailedfieldyouwillcomplete');
            });
            $("#btndateyouintendtostartnext").click(function () {
                ManageRemarks('<%=txtdateyouintendtostartnextcomments.ClientID%>', 'btndateyouintendtostartnext');
            });
            $("#btnuniversityname").click(function () {
                ManageRemarks('<%=Text1.ClientID%>', 'btnuniversityname');
            });
            $("#btnuniversityCountry").click(function () {
                ManageRemarks('<%=Text2.ClientID%>', 'btnuniversityCountry');
            });
            $("#btneduinstitutioncity").click(function () {
                ManageRemarks('<%=Text3.ClientID%>', 'btneduinstitutioncity');
            });
            $("#btnworkexperience").click(function () {
                ManageRemarks('<%=txtworkexperiencecomments.ClientID%>', 'btnworkexperience');
            });
            $("#btncurrentlyworking").click(function () {
                ManageRemarks('<%=txtcurrentlyworkingcomments.ClientID%>', 'btncurrentlyworking');
            });
            $("#btnjoboffered").click(function () {
                ManageRemarks('<%=txtjobofferedcomments.ClientID%>', 'btnjoboffered');
            });
            $("#btnapplyingforpackage").click(function () {
                ManageRemarks('<%=txtapplyingforpackagecomments.ClientID%>', 'btnapplyingforpackage');
            });
            $("#btnwhatpackage").click(function () {
                ManageRemarks('<%=txtwhatpackagecomments.ClientID%>', 'btnwhatpackage');
            });
            $("#btnprofilephoto").click(function () {
                ManageRemarks('<%=txtprofilephotocomments.ClientID%>', 'btnprofilephoto');
            });
            $("#btnpassportnumber").click(function () {
                ManageRemarks('<%=txtpassportnumbercomments.ClientID%>', 'btnpassportnumber');
            });
            $("#btnpassportdoc").click(function () {
                ManageRemarks('<%=txtpassportdoccomments.ClientID%>', 'btnpassportdoc');
            });
            $("#btnagent").click(function () {
                ManageRemarks('<%=txtagentComments.ClientID%>', 'btnagent');
            });
            $("#btnagentList").click(function () {
                ManageRemarks('<%=txtagentListComments.ClientID%>', 'btnagentList');
            });

            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }
            function manageremarksifnocheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        });
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#manageapplicantions_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#applicantlist').addClass('active');
	    });
    </script>
</asp:Content>
