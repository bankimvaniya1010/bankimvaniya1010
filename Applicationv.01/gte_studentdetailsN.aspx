<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_studentdetailsN.aspx.cs" Inherits="gte_studentdetailsN"  MasterPageFile="~/student.master"  EnableEventValidation="false"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Your Details</li>
        </ol>
        
    </div>
    
    <div class="page" style="margin-top:-47px;">
        <div class="container page__container">
            
            <div class="row">
                    <div class="card">
                        <div class="card-body list-group list-group-fit">                            
                            <p style="padding-left: 21px"><b> <span style="font-weight:600"> <%=firstname %></span>, please carefully complete this section. All fields are mandatory and need to be completed. You  will be required to upload your digital photograph (.jpg or .png formats) and a copy of your passport bio page (.pdf, .jpg, .png formats). In other words, only the passport page containing your photograph is needed.</b></p>
                        
                            <h5 class="form-control col-md-4 h5ctrl">Personal Details</h5>
                              <div class="list-group-item" id="firstname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">First Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtFirstName" runat="server" type="text" placeholder="Enter your legal first name" value="" class="form-control" required=""> <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="middlename">
                                <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                                    <div class="form-row">
                                        <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Middle Name(s)</label>
                                        <div class="col-md-6">
                                            <input id="txtMiddleName" runat="server" type="text" placeholder="Enter your legal middle name(s)" value="" class="form-control"> <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="lastname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Family Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtLastName" runat="server" type="text" class="form-control" placeholder="Enter your legal family name / surname" required="">
                                            <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="dob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lbldob" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Birth </label>
                                        <div class="col-md-6">
                                            <div runat="server" id="dobDiv">
                                           <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server">
                                                
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlMonth" CssClass="form-control" runat="server">
                                                
                                            </asp:DropDownList>                                            
                                            <asp:DropDownList ID="ddlDay" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="">Select Day</asp:ListItem>
                                            </asp:DropDownList>
                                                </div>
                                            <asp:HiddenField runat="server" ID="hidDOBDate"/>
                                            <asp:Label runat="server" CssClass="form-control" ID="lbltxtdob" Visible="false"></asp:Label>
                                            <%--<input id="txtdob" runat="server" type="text" class="form-control" placeholder="Date of Birth" data-toggle="flatpickr" value="">--%>
                                            <span class="helpicon"><i id="icdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                      
                            <div class="list-group-item" id="nationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-nationality">
                                    <div class="form-row">
                                        <label id="lblnationality" runat="server" for="nationality" class="col-md-3 col-form-label form-label">Country of Citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlnationality" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icnationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="countryofdob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                    <div class="form-row">
                                        <label id="lblcountryofdob" runat="server" for="countryofdob" class="col-md-3 col-form-label form-label">Country of Birth </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcountryofdob" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="iccountryofdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                             <div class="list-group-item" id="maritalstatus">
                                <div class="form-group m-0" role="group" aria-labelledby="label-maritalstatus">
                                    <div class="form-row">
                                        <label id="lblmaritalstatus" runat="server" for="maritalstatus" class="col-md-3 col-form-label form-label">Marital Status  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlmaritalstatus" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icmaritalstatus" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gender" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                                    <div class="form-row">
                                        <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList runat="server" ID="ddlgenderList" CssClass="form-control">
                                            </asp:DropDownList>
                                             <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <h5 class="form-control col-md-4 h5ctrl">Contact Details</h5>
                             <div class="list-group-item" id="countryresidence" style="display:none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryresidence">
                                    <div class="form-row">
                                        <label id="lblcountryresidence" runat="server" for="countryresidence" class="col-md-3 col-form-label form-label">Current Country of Residence  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcountryresidence" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="iccountryresidence" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="postal" runat="server">
                                <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                                    <div class="form-row">
                                        <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address</label>
                                        <div class="col-md-6">
                                            <input id="txtAddressLine1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control" maxlength="200"> <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input id="txtAddressLine2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control" maxlength="200">
                                            <input id="txtAddressLine3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control" maxlength="200">
                                            <input id="txtCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtPostal" runat="server" type="text" placeholder="Postal Code" value="" class="form-control">
                                            <asp:DropDownList ID="ddlpostalCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="address" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">IS YOUR POSTAL ADDRESS THE SAME AS YOUR CURRENT RESIDENTIAL ADDRESS?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAddressYes" runat="server" CssClass="form-control" GroupName="address" Text="Yes" />
                                            <asp:RadioButton ID="rblAddressNo" runat="server" CssClass="form-control" GroupName="address" Text="No" /><span class="helpicon"><i id="icAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="residential" runat="server">
                                <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                                    <div class="form-row">
                                        <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address</label>
                                        <div class="col-md-6">

                                            <input id="txtResidentialAddress1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control" maxlength="200"><span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input id="txtResidentialAddress2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control" maxlength="200">
                                            <input id="txtResidentialAddress3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control" maxlength="200">
                                            <input id="txtResidentialCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtResidentialState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtResidentialpostal" runat="server" type="text" placeholder="Postal code" value="" class="form-control">
                                            <asp:DropDownList ID="ddlResidentialCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="email" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" placeholder="email" value="" required="" class="form-control"><span class="helpicon"><i id="icEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="mobile" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-2" id="countrycodeDiv" runat="server">
                                            <asp:DropDownList runat="server" ID="ddlcountrycode" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <input id="txtMobile" runat="server" type="text" placeholder="Mobile/Cellular Number" value="" class="form-control" maxlength="10"><span class="helpicon"><i id="icMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <h5 class="form-control col-md-4 h5ctrl">Previous Study</h5>
<%--                            <div class="list-group-item" id="highestqualificationfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationfield">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationfield" runat="server" for="highestqualificationfield" class="col-md-3 col-form-label form-label">FIELD OF STUDY OF HIGHEST QUALIFICATION</label>
                                        <div class="col-md-6">
                                             <asp:DropDownList ID="ddlhighestqualificationfield" CssClass="form-control" runat="server">
                                            </asp:DropDownList>                                            
                                            <span class="helpicon"><i id="ichighestqualificationfield" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                              <div class="list-group-item" id="highestqualificationAchieved" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationAchieved">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationAchieved" runat="server" for="highestqualificationAchieved" class="col-md-3 col-form-label form-label">Level of Highest Academic Qualification Completed </label>
                                        <div class="col-md-6">
                                           <asp:DropDownList ID="ddlhighestqualificationAchieved" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationAchieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="list-group-item" id="boradfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label2" runat="server" for="boradfield" class="col-md-3 col-form-label form-label">Broad Field of Education of Highest Academic Qualification Completed</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlboradfield" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="hidbroadfieldId"/>
                                            
                                            <span class="helpicon"><i id="i1" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="narrowfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label3" runat="server" for="narrowfield" class="col-md-3 col-form-label form-label">Narrow Field of Education of Highest Academic Qualification Completed </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlnarrowfield" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="hidnarrowfieldId"/>
                                            <span class="helpicon"><i id="i2" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="detailedfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label4" runat="server" for="detailedfield" class="col-md-3 col-form-label form-label">Detailed Field of Education of Highest Academic Qualification Completed</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddldetailedfield" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="hiddetailedfield"/>
                                            <span class="helpicon"><i id="i3" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="highestqualificationdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationdate">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationdate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">Date of completion of highest academic qualification</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlhighestqualificationmonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlhighestqualificationYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationdate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestqualificationcountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationcountry">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationcountry" runat="server" for="highestqualificationcountry" class="col-md-3 col-form-label form-label">Country where you studied your highest academic qualification</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlhighestqualificationcountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationcountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h5 class="form-control col-md-10 h5ctrl">Intended Future Study (For the course application that you are doing this GTE Direct Evaluation for)</h5>
                            <div class="list-group-item" id="highestqualificationyouwillComplete" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationyouwillComplete">
                                    <div class="form-row">
                                        <label id="Label7" runat="server" for="highestqualificationyouwillComplete" class="col-md-3 col-form-label form-label">Level of the highest academic qualification you will complete</label>
                                        <div class="col-md-6">
                                           <asp:DropDownList ID="ddlcourseapplied" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="i6" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="list-group-item" id="boradfieldyouwillComplete">
                                <div class="form-group m-0" role="group" aria-labelledby="label-boradfieldyouwillComplete">
                                    <div class="form-row">
                                        <label id="Label8" runat="server" for="boradfieldyouwillComplete" class="col-md-3 col-form-label form-label">Broad Field of Education of the highest academic qualification you will complete </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlboradfieldyouwillComplete" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="HidboradfieldyouwillComplete"/>
                                            
                                            <span class="helpicon"><i id="i7" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="narrowfieldyouwillcomplete">
                                <div class="form-group m-0" role="group" aria-labelledby="label-narrowfieldyouwillcomplete">
                                    <div class="form-row">
                                        <label id="Label9" runat="server" for="narrowfieldyouwillcomplete" class="col-md-3 col-form-label form-label">Narrow Field of Education of the last and highest academic qualification you will complete</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlnarrowfieldyouwillcomplete" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="Hidnarrowfieldyouwillcomplete"/>
                                            <span class="helpicon"><i id="i8" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="detailedfieldyowillcomplete">
                                <div class="form-group m-0" role="group" aria-labelledby="label-detailedfieldyowillcomplete">
                                    <div class="form-row">
                                        <label id="Label10" runat="server" for="detailedfieldyowillcomplete" class="col-md-3 col-form-label form-label">Detailed Field of Education of the last and highest academic qualification you will complete </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddldetailedfieldyowillcomplete" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField runat="server" ID="Hiddetailedfieldyowillcomplete"/>
                                            <span class="helpicon"><i id="i9" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="ISpackage">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ISpackage">
                                    <div class="form-row">
                                        <label id="lblISpackage" runat="server" for="ISpackage" class="col-md-3 col-form-label form-label"> Are you applying for a package YES/NO</label>
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                            <asp:RadioButton ID="rblpackageYes" runat="server" CssClass="form-control" GroupName="package" Text="Yes" />
                                            <asp:RadioButton ID="rblpackageNO" runat="server" CssClass="form-control" GroupName="package" Text="No" /><span class="helpicon"><i id="i13" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                            <span class="helpicon"><i id="i11" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            
                            <div class="list-group-item" id="whatispackage" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatispackage">
                                    <div class="form-row">
                                        <label id="lblwhatispackage" runat="server" for="whatispackage" class="col-md-3 col-form-label form-label"> What Package are you applying for</label>
                                        <div class="col-md-6">
                                            <input type="text" id="txtpackage" class="form-control" runat="server"/>
                                            <span class="helpicon"><i id="i12" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                           <div class="list-group-item" id="highestqualificationdateyouwillcomplete">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationdateyouwillcomplete">
                                    <div class="form-row">
                                        <label id="Label11" runat="server" for="highestqualificationdateyouwillcomplete" class="col-md-3 col-form-label form-label">Year and Month you intend to start your next studies</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementdateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCommencementdateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="i10" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <h5 class="form-control col-md-4 h5ctrl">Your Choice of Study Destination</h5>
                            <div class="list-group-item" id="universityname" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universityname">
                                    <div class="form-row">
                                        <label id="lbluniversityname" runat="server" for="universityname" class="col-md-3 col-form-label form-label">NAME OF Institution YOU ARE APPLYING TO  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddluniversityname" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icuniversityname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           <%-- <div class="list-group-item" id="universityCampus" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universitycampusname">
                                    <div class="form-row">
                                        <label id="lblCampusName" runat="server" for="universitycampusname" class="col-md-3 col-form-label form-label">Please select institution campus you are applying to  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlUniversityCampus" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="list-group-item" id="universityCountry" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universityCountry">
                                    <div class="form-row">
                                        <label id="lbluniversityCountry" runat="server" for="universityCountry" class="col-md-3 col-form-label form-label">Name of the country where you are applying to study  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddluniversityCountry" CssClass="form-control" runat="server">
                                                 <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HiduniversityCountry"/>
                                            <span class="helpicon"><i id="icuniversitycountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="list-group-item" id="eduinstitutioncity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-eduinstitutioncity">
                                    <div class="form-row">
                                        <label id="lbleduinstitutioncity" runat="server" for="eduinstitutioncity" class="col-md-3 col-form-label form-label">Name of the city where your educational institution/campus is located</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddleduinstitutioncity" runat="server" class="form-control">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>                                            
                                            <asp:HiddenField ID="hidCityField" runat="server" />
                                            <span class="helpicon"><i id="iceduinstitutioncity" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <h5 class="form-control col-md-4 h5ctrl">Full-time work experience</h5>
                             <div class="list-group-item" id="workexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="lblworkexperience" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Number of years of full-time work experience </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlworkexperience" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="workexperience2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="Label5" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Are you currently working in a full-time job?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcurrentlyworking" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="i4" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="workexperience1">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="Label6" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Do you have a job offer or guaranteed job to return to after you have completed your studies?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddljoboffered" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Please select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="i5" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                           

<%--
                        <div id="fieldcontainer" runat="server">
                            <div class="list-group-item" id="marriagedob" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-marriagedob">
                                    <div class="form-row">
                                        <label id="lblmarriagedob" runat="server" for="marriagedob" class="col-md-3 col-form-label form-label">Date of Marriage </label>
                                        <div class="col-md-6">
                                             <input id="txtmarriagedob" runat="server" type="text" class="form-control" placeholder="Marriage Date" data-toggle="flatpickr" value="">
                                            <span class="helpicon"><i id="icmarriagedob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="spousenationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-spousenationality">
                                    <div class="form-row">
                                        <label id="lblspousenationality" runat="server" for="spousenationality" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlspousenationality" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icspousenationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                            <h5 class="form-control col-md-4 h5ctrl">Profile Photo</h5>
                            <div class="list-group-item" id="profilepic">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label1" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Please upload an electronic photo for your profile picture</label>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblupload" runat="server" />
                                            <asp:FileUpload ID="fileUpload" runat="server"/> <%--<asp:Button runat="server" ID="testbtn" OnClick="testbtn_Click" Text="save" Visible="false"/>--%>
                                            <label runat="server" id="lbl"/>
                                            <input type="hidden" id="hidDocumentPath" runat="server" />
                                            <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                            <span class="helpicon"><i id="icprofilephoto" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            
                            <div class="list-group-item" id="passportno">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label15" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> passport number</label>
                                        <div class="col-md-6">
                                            <input type="text" runat="server" id="txtpassportno" class="form-control" placeholder="J12345678"/>
                                            <span class="helpicon"><i id="i14" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="passportcopt">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label12" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Please upload passport copy</label>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label13" runat="server" />
                                            <asp:FileUpload ID="FileUpload_passport" runat="server" /> 
                                            <label runat="server" id="Label14"/>
                                            <input type="hidden" id="hidPassportDocPath" runat="server" />
                                            <asp:HyperLink runat="server" ID="HyperLink1" Target="_blank"></asp:HyperLink>
                                            <span class="helpicon"><i id="i15" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                               <%--<h5 class="form-control col-md-4 h5ctrl">Agent</h5>--%>
                            <div class="list-group-item" id="agent" runat="server" visible="false">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                                    <div class="form-row">
                                        <label id="labelagent" runat="server" for="agent" class="col-md-3 col-form-label form-label">Are you using the services of an education agent?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAgentYes" runat="server" CssClass="form-control" GroupName="agent" Text="Yes" />
                                            <asp:RadioButton ID="rblAgentNo" runat="server" CssClass="form-control" GroupName="agent" Text="No" /><span class="helpicon"><i id="icAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agentList" runat="server" visible="false">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                                    <div class="form-row">
                                        <label id="labelagentList" runat="server" for="agentList" class="col-md-3 col-form-label form-label">Agent Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAgent" runat="server" CssClass="form-control"></asp:DropDownList><span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="addnewagent" runat="server" visible="false">
                                <div class="form-group m-0" role="group" aria-labelledby="label-addnewagent">
                                    <div class="form-row">
                                        <label id="labeladdnewagent" runat="server" for="addnewagent" class="col-md-3 col-form-label form-label">IF YOU WERE UNABLE TO FIND YOUR AGENT’S NAME IN THE LIST, SIMPLY ENTER THEIR EMAIL ID HERE AND WE WOULD SEND THEM A LINK TO REGISTER.</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtAgentname" runat="server" CssClass="form-control"></asp:TextBox><span class="helpicon"><i id="icNewAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            &nbsp;
                                              <div class="col-md-6">
                                                  <asp:Button ID="btnNewAgent" runat="server" Text="Ask to Register" CssClass="btn btn-success" OnClientClick="return registeragentBysentEmail();"/>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                           
                            <div runat="server" id="extraDiv" style="display:none;">
                                 <h5 class="form-control col-md-4 h5ctrl">Extra Remaining</h5>
                             <div class="list-group-item" id="highestqualification" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualification">
                                    <div class="form-row">
                                        <label id="lblhighestqualification" runat="server" for="highestqualification" class="col-md-3 col-form-label form-label">Name of Highest Qualification Completed  </label>
                                        <div class="col-md-6">
                                            <input id="txthighestqualification" runat="server" type="text" class="form-control" placeholder="Name of Highest Qualification Completed" />
                                            <span class="helpicon"><i id="ichighestqualification" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             
                             <div class="list-group-item" id="typeofworkexperience" style="display:none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-typeofworkexperience">
                                    <div class="form-row">
                                        <label id="lbltypeofworkexperience" runat="server" for="typeofworkexperience" class="col-md-3 col-form-label form-label">TYPE OF WORK EXPERIENCE. </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddltypeofworkexperience" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="hidddltypeofworkexperience"/>
                                            <span class="helpicon"><i id="i1ctypeofworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="fieldofstudy">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fieldofstudy">
                                    <div class="form-row">
                                        <label id="lblfieldofstudy" runat="server" for="fieldofstudey" class="col-md-3 col-form-label form-label">FIELD OF STUDY YOU ARE APPLYING TO </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlfieldofstudy" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icfieldofstudy" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="nameofcourse">
                                <div class="form-group m-0" role="group" aria-labelledby="label-nameofcourse">
                                    <div class="form-row">
                                        <label id="lblnameofcourse" runat="server" for="nameofcourse" class="col-md-3 col-form-label form-label">Name of Course you are applying for (First Choice)</label>
                                        <div class="col-md-6">
                                            <input id="txtnameofcourse" runat="server" type="text" class="form-control" placeholder="Name Of Course">
                                           <%-- <asp:DropDownList runat="server" ID="ddlnameofcourse" CssClass="form-control">
                                                <asp:ListItem Value="">Please select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidnameofcourse" runat="server"/>--%>
                                            <span class="helpicon"><i id="icnameofcourse" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="list-group-item" id="annualfee">
                                <div class="form-group m-0" role="group" aria-labelledby="label-annualfee">
                                    <div class="form-row">
                                        <label id="lblannualfee" runat="server" for="annualfee" class="col-md-3 col-form-label form-label">ESTIMATED ANNUAL TUITION FEE AND LIVING COSTS </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlannualfee" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icannualfee" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         
                           </div>


                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="btgteapplicantdetail" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gteapplicantdetail">
                                    <div class="form-row">                                       
                                        
                                        <asp:Button ID="btngteapplicantdetail" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btngteapplicantdetail_Click" style="margin-right: 271px;" />                                        
                                       
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
               <%-- <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                </div>--%>
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
    <script>
        function registeragentBysentEmail() {
            if ($("#<%=txtAgentname.ClientID%>").val() != "") {
                var email = $("#<%=txtAgentname.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetailsN.aspx/sendemailtoAgent",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'email': '" + email + "'}",
                    success: function (result) {
                        if (result) {                            
                            alert("Request send to mention email id of agent");
                        }
                    }
                });
                return false;

            }
            else {
                alert("Please enter email id of agent to ask them to register");
                return false;
            }
        }
        $('#ContentPlaceHolder1_txtdob').flatpickr({       
            dateFormat: 'Y-m-d', defaultDate: "", altInput: true, altFormat: 'd/m/Y',maxDate:"today"
        });
              
        $('#ContentPlaceHolder1_txtmarriagedob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtcommencementdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

         function getAge(DOB) {
            var today = new Date();
            var birthDate = new Date(DOB);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age = age - 1;
            }

            return age;
        }

         function isValidUniversityAcceptAgeRange() {
            var dob = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var age = getAge(dob);
            var maxAge = <%=GlobalVariables.universityMaxAge%>;
            var minAge = <%=GlobalVariables.universityMinAge%>;

            if (age < minAge || age > maxAge) {
                alert("Age should be between " + minAge + " & " + maxAge + " years");
                return false;
            }
            return true;
        }

        function isValidateHighestQualificationDate() {
            var DOB =$("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var birthDate = new Date(DOB);
            
            var birthdateYear = birthDate.getFullYear();
            var birthdateMonth = birthDate.getMonth();
            var birthdateDay = birthDate.getDate();

            var HighestQualificationMonth = $("#<%=ddlhighestqualificationmonth.ClientID%>").val();
            var HighestQualificationYear = $("#<%=ddlhighestqualificationYear.ClientID%>").val();
            
            if (HighestQualificationYear == "0") {
                alert("Please select year of completion of highest academic qualification");
                return false;
            }
            else if (HighestQualificationMonth == "0") {
                alert("Please select Month of completion of highest academic qualification");
                return false;
            }
            else if (HighestQualificationYear < birthdateYear) {
                alert("Please select valid year of completion of highest academic qualification");
                return false;
            }
            return true;
        }
        function validateForm() {
            var flag = false;
            var checOnlykNum = /^[0-9]*$/;
            var regexPassporrt = "^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$";//new RegExp("^[A-Z][0-9]{8}$");
            if ($("#<%=txtFirstName.ClientID%>").val() == "")
                alert("Please enter first name");
            <%--else if ($("#<%=txtMiddleName.ClientID%>").val() == "")
                alert("Please enter middle name");--%>
            else if ($("#<%=txtLastName.ClientID%>").val() == "")
                alert("Please enter family name");

            else if (($("#ContentPlaceHolder1_lbltxtdob").text() == "") && (($("#<%=ddlDay.ClientID%>").val() == "0") || ($("#<%=ddlMonth.ClientID%>").val() == "0") || ($("#<%=ddlYear.ClientID%>").val() == "0") || ($("#<%=hidDOBDate.ClientID%>").val() == "")))
                alert("Please Select valid date of birth");
            else if (!isValidUniversityAcceptAgeRange()) { }

            
            else if ($("#<%=ddlnationality.ClientID%>").val() == "0")
                alert("Please select country of citizenship");
            else if ($("#<%=ddlcountryofdob.ClientID%>").val() == "0")
                alert("Please select country Of date Of birth");
            else if ($("#<%=ddlmaritalstatus.ClientID%>").val() == "0")
                alert("Please select marital status");
            else if ($("#<%=ddlgenderList.ClientID%>").val() == "0")
                alert("Please select gender");
            else if ($("#<%=txtAddressLine1.ClientID%>").val() == "")
                alert("Please enter first postal address line");
            <%--else if ($("#<%=txtAddressLine2.ClientID%>").val() == "")
                alert("Please enter second postal address line");
            else if ($("#<%=txtAddressLine3.ClientID%>").val() == "")
                alert("Please enter third postal address line");--%>
            else if ($("#<%=txtCity.ClientID%>").val() == "")
                alert("Please enter postal city");
            <%--else if ($("#<%=txtState.ClientID%>").val() == "")
                alert("Please enter postal state");
            else if (($("#<%=txtPostal.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtPostal.ClientID%>").val()))))
                alert("Please enter valid postal postal code");--%>
            else if ($("#<%=ddlpostalCountry.ClientID%>").val() == "0")
                alert("Please select valid postal country");

            else if (!($("#<%=rblAddressYes.ClientID%>").is(':checked') || $("#<%=rblAddressNo.ClientID%>").is(':checked')))
                 alert("Please Select Option to record is your postal and residentail address is same");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress1.ClientID%>").val() == ""))
                alert("Please enter first residential address line");
            <%--else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress2.ClientID%>").val() == ""))
                alert("Please enter second residential address line");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress3.ClientID%>").val() == ""))
                alert("Please enter third residential address line");--%>
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialCity.ClientID%>").val() == ""))
                alert("Please enter residential city");
           <%-- else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialState.ClientID%>").val() == ""))
                alert("Please enter residential state");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && !$("#<%=residential.ClientID%>").is(':hidden') && ($("#<%=txtResidentialpostal.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtResidentialpostal.ClientID%>").val()))))            
                alert("Please enter valid residential postal code");--%>
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=ddlResidentialCountry.ClientID%>").val() == "0"))
                alert("Please enter residential Country");   
                
           <%-- else if ($("#<%=txtEmail.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtEmail.ClientID%>").val())))
                alert("Please enter Valid e-mail address");--%>
            else if ($("#<%=ddlcountrycode.ClientID%>").val() == "0")
                alert("Please select country code for mobile number");
            else if ($("#<%=txtMobile.ClientID%>").val() == "")
                alert("Please enter mobile number");
            else if (!(checOnlykNum.test($("#<%=txtMobile.ClientID%>").val())))
                alert("Please enter valid mobile number");
            
            <%--else if ($("#<%=ddlhighestqualificationfield.ClientID%>").val() == "0")
                alert("Please select field of study of highest qualification");--%>
            else if ($("#<%=ddlhighestqualificationAchieved.ClientID%>").val() == "0")
                alert("Please select level of the highest academic qualification you will complete as part of this course");
            else if ($("#<%=ddlboradfield.ClientID%>").val() == "0")
                alert("Please select broad field of education of highest academic qualification completed");
            else if ($("#<%=ddlnarrowfield.ClientID%>").val() == "0")
                alert("Please select narrow field of education of highest academic qualification completed");
            else if ($("#<%=ddldetailedfield.ClientID%>").val() == "0")
                alert("Please select detailed field of education of highest academic qualification completed");

            else if (!isValidateHighestQualificationDate()) { }

            <%--else if ($("#<%=ddlhighestqualificationmonth.ClientID%>").val() == "0" && $("#<%=ddlhighestqualificationYear.ClientID%>").val() == "0")
                alert("Please select date of completion of highest academic qualification ");--%>
            else if ( $("#<%=ddlhighestqualificationcountry.ClientID%>").val() == "0")
                alert("Please select country where you studied your highest academic qualification");
            else if ($("#<%=ddlcourseapplied.ClientID%>").val() == "0")
                alert("Please select level of the highest academic qualification you will complete as part of this course application ");
            else if ($("#<%=ddlboradfieldyouwillComplete.ClientID%>").val() == "0")
                alert("Please select broad field of education of the highest academic qualification you will complete as part of this course application");
            else if ($("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").val() == "0")
                alert("Please select narrow field of education of the last and highest academic qualification you will complete as part of this course application");
            else if ($("#<%=ddldetailedfieldyowillcomplete.ClientID%>").val() == "0")
                alert("Please select detailed field of education of the last and highest academic qualification you will complete as part of this course application");
            else if ($("#<%=ddlCommencementdateYear.ClientID%>").val() == "0" && $("#<%=ddlCommencementdateMonth.ClientID%>").val() == "0")
                alert("Please select date you intent to start your next studies");
            else if ($("#<%=ddluniversityname.ClientID%>").val() == "0")
                alert("Please select name of university apply for ");
            else if ($("#<%=ddluniversityCountry.ClientID%>").val() == "0" && isNaN(parseInt($('#ContentPlaceHolder1_HiduniversityCountry').val())))
                alert("Please select name of country of educational institution");
            else if ($("#<%=ddleduinstitutioncity.ClientID%>").val() == "0" && isNaN(parseInt($('#ContentPlaceHolder1_hidCityField').val())))
                alert("Please select name of city of educational institution");
            else if ($("#<%=ddlworkexperience.ClientID%>").val() == "0")
                alert("Please select work experience ");
            else if ($("#<%=ddlcurrentlyworking.ClientID%>").val() == "0")
                alert("Please select potion for are you currently working in full time job ");
            else if ($("#<%=ddljoboffered.ClientID%>").val() == "0")
                alert("Please select option for do you have a job offer or guaranteed job to return to after you have completed your studies?");
            else if ($("#<%=fileUpload.ClientID%>").val() == "" && $("#<%=hidDocumentPath.ClientID%>").val() == "")
                alert("Please upload profile picture");
            else if (!validfileExtention($("#<%=fileUpload.ClientID%>").val(), $("#<%=hidDocumentPath.ClientID%>").val()))
                alert("Please upload valid file format");
            else if (!checkFileSize())
                alert("photo size should be less than 16MB");
            else if ($("#<%=txtpassportno.ClientID%>").val() == "" || !(regexPassporrt.test($("#<%=txtPostal.ClientID%>").val())))
                alert("Please enter valid passport number");
            else if ($("#<%=FileUpload_passport.ClientID%>").val() == "" && $("#<%=hidPassportDocPath.ClientID%>").val() == "")
                alert("Please upload passport document");
            else if (!validfileExtention($("#<%=FileUpload_passport.ClientID%>").val(), $("#<%=hidPassportDocPath.ClientID%>").val()))
                alert("Please upload valid file format");
            else if (!checkpassportFileSize())
                alert("passport document size should be less than 16MB");

<%--            else if (!($("#<%=rblAgentYes.ClientID%>").is(':checked') || $("#<%=rblAgentNo.ClientID%>").is(':checked')))
                alert("Please select option to record reffrerd by agent");
            else if ($("#<%=rblAgentYes.ClientID%>").is(':checked') && ($("#<%=ddlAgent.ClientID%>").val() == "0"))
                alert("Please select valid agent details");--%>
           <%-- else if ($("#<%=txtmarriagedob.ClientID%>").val() == "" && $("#<%=ddlmaritalstatus.ClientID%> option:selected").text() == "Married")
                alert("Please select date of marriage");
            else if ($("#<%=ddlspousenationality.ClientID%>").val() == "0" && $("#<%=ddlmaritalstatus.ClientID%> option:selected").text() == "Married")
                alert("Please select spouse nationality of birth"); --%>                                   
            <%--else if ($("#<%=txthighestqualification.ClientID%>").val() == "")
                alert("Please enter highest education name");
           
            else  if ($("#<%=ddlfieldofstudy.ClientID%>").val() == "0")
                alert("Please select field of study applying to");
            <%--else  if ($("#<%=ddlUniversityCampus.ClientID%>").val() == "0")
                alert("Please select institution campus you are applying to");--%>
           <%-- else if ($("#<%=txtnameofcourse.ClientID%>").val() == "")
                alert("Please enter name of course you are applying for");
            else if ($("#<%=ddlcountryresidence.ClientID%>").val() == "0")
                alert("Please select current country of residence ");
            else if ($("#<%=ddlannualfee.ClientID%>").val() == "0")
                alert("Please select my annual tuition fee and living costs is expected to be ");--%>

            else
                flag = true;
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
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension !="jpeg")                    
                    return false;                                   
            }
            return true;
        }
        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_fileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 16);
        }
        function checkpassportFileSize() {
            var fileSize = $("#ContentPlaceHolder1_FileUpload_passport")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 16);
        }

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$agent']").click(function () {
                if ($("#<%=rblAgentYes.ClientID%>").is(":checked")) {
                   $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                }
                else if ($("#<%=rblAgentNo.ClientID%>").is(":checked")) {
                    $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide();
                }
            });
        });

          $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$package']").click(function () {
                if ($("#<%=rblpackageYes.ClientID%>").is(":checked")) 
                   $("#<%=whatispackage.ClientID%>").show(); 
                else if($("#<%=rblpackageNO.ClientID%>").is(":checked"))
                    $("#<%=whatispackage.ClientID%>").hide(); 
            });
        });

        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            <%-- var input = document.querySelector("#<%=txtMobile.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });--%>
              //$('.sidebar-menu-item').removeClass('open');
            //$('#gteevalution_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtestudentdetail').addClass('active');

            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_new_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#pgae0').addClass('active');


            if ($("#<%=rblAddressYes.ClientID%>").is(':checked'))
                $("#<%=residential.ClientID%>").hide();
            else
                $("#<%=residential.ClientID%>").show();  

            if ($("#<%=rblAgentYes.ClientID%>").is(':checked')) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
            } else if ($("#<%=rblAgentNo.ClientID%>").is(":checked")) {  $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }

            
            if ($("#<%=rblpackageYes.ClientID%>").is(":checked"))
                $("#<%=whatispackage.ClientID%>").show();
            else if($("#<%=rblpackageNO.ClientID%>").is(":checked"))
                $("#<%=whatispackage.ClientID%>").hide();
            else
                $("#<%=whatispackage.ClientID%>").hide(); 

           <%-- var maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
            $("#<%=ddlmaritalstatus.ClientID%>").change(function () {
                maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
                if (maritalStatus == "Married")
                    $("#<%=fieldcontainer.ClientID%>").show();
                else {
                    $("#<%=fieldcontainer.ClientID%>").hide();                   
                }
            });--%>

            <%--$("#<%=ddluniversityname.ClientID%>").change(function () {
                var universityID = $("#<%=ddluniversityname.ClientID%>").val()
                if (universityID > 0) {
                    $.ajax({
                        type: "GET",
                        url: "gte_studentdetailsN.aspx/GetUniversityCities",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: { universityId: universityID },
                        success: function (response) {
                            if (response.d) {
                                var result = JSON.parse(response.d);
                                if ($("#<%=ddleduinstitutioncity.ClientID%>").length >= 1) {
                                    $("#<%=ddleduinstitutioncity.ClientID%>").empty();
                                    $("#<%=ddleduinstitutioncity.ClientID%>").append($('<option selected="selected></option>').val("0").html("Please Select City"));
                                }
                                for (var i = 0; i < result.length; i++)
                                    $("#<%=ddleduinstitutioncity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].cityName));
                            }
                        }
                    });
                }
            });
            
            $("#<%=ddleduinstitutioncity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddleduinstitutioncity.ClientID%>").val());
            });--%>

          <%--  if (maritalStatus == "Married") 
                $("#<%=fieldcontainer.ClientID%>").show();
            else
                $("#<%=fieldcontainer.ClientID%>").hide();--%>
                      
        });
        
       var workstatus = $("#<%=ddlworkexperience.ClientID%> option:selected").text();
            $("#<%=ddlworkexperience.ClientID%>").change(function () {
            workstatus = $("#<%=ddlworkexperience.ClientID%> option:selected").text();
                if (workstatus == "None") {
                    $("#<%=ddltypeofworkexperience.ClientID%>").empty();
                    $("#<%=ddltypeofworkexperience.ClientID%>").append($('<option selected="selected"></option>').val(1).html("Not Applicable"));                    
                }
                else if(workstatus != "None" && workstatus != "Please Select")
                {
                        $.ajax({
                        type: "GET",
                        url: "gte_studentdetailsN.aspx/GetWorkTypeDropdown",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) 
                            {
                                if (response.d) 
                                {
                                    var result = JSON.parse(response.d);                            
                                    if ($("#<%=ddltypeofworkexperience.ClientID%>").length >= 1) {
                                        $("#<%=ddltypeofworkexperience.ClientID%>").empty();
                                        $("#<%=ddltypeofworkexperience.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                                    }
                                    for (var i = 0; i < result.length; i++) {
                                        $("#<%=ddltypeofworkexperience.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                                    }
                                }
                            }
                        });
                }
        });            
      $("#<%=ddltypeofworkexperience.ClientID%>").change(function () {
            $("#<%=hidddltypeofworkexperience.ClientID%>").val($("#<%=ddltypeofworkexperience.ClientID%>").val());
        });
       <%-- $("#<%=ddlcourseapplied.ClientID%>").change(function () {
            if ($("#<%=ddlfieldofstudy.ClientID%>").val() != "" && $("#<%=ddlUniversityCampus.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetailsN.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                });
            }
        });--%>
       <%-- $("#<%=ddlfieldofstudy.ClientID%>").change(function () {
            if ($("#<%=ddlcourseapplied.ClientID%>").val() != "0" && $("#<%=ddlUniversityCampus.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetailsN.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                });
            }
        });--%>

        <%--$("#<%=universityCampus.ClientID%>").change(function () {
            if ($("#<%=ddlfieldofstudy.ClientID%>").val() != "" && $("#<%=ddlcourseapplied.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetailsN.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                        }
                    }
                });
            }
        });

        $("#<%=ddlnameofcourse.ClientID%>").change(function () {
            $("#<%=hidnameofcourse.ClientID%>").val($("#<%=ddlnameofcourse.ClientID%>").val());
        });--%>

        //comm date
        <%-- $("#<%=ddlnameofcourse.ClientID%>").change(function () {
            $("#<%=hidnameofcourse.ClientID%>").val($("#<%=ddlnameofcourse.ClientID%>").val());

            if ($("#<%=hidnameofcourse.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlnameofcourse.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetailsN.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate.ClientID%>").empty();
                                $("#<%=ddlCommencementdate.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate.ClientID%>").change(function () {
            $("#<%=hidCommencementDate.ClientID%>").val($("#<%=ddlCommencementdate.ClientID%>").val());
        });--%>
        $("#<%=ddluniversityCountry.ClientID%>").change(function () {
            var countryid = $("#<%=ddluniversityCountry.ClientID%>").val();
            var universityid = 0;
            if (<%= isunigrouped%> == 1)                 
                    universityid = $("#<%=ddluniversityname.ClientID%>").val();
            else
                universityid = '<%= Utility.GetUniversityId()%>';
            if (universityid != 0) {
                $.ajax({
                    type: "GET",
                    url: "gte_studentdetailsN.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: countryid, universityid: universityid },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddleduinstitutioncity.ClientID%>").length >= 1) {
                                $("#<%=ddleduinstitutioncity.ClientID%>").empty();
                                $("#<%=ddleduinstitutioncity.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddleduinstitutioncity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });
            }
            else {
                $("#<%=ddleduinstitutioncity.ClientID%>").empty();
                $("#<%=ddleduinstitutioncity.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
            }

            });

            $("#<%=ddleduinstitutioncity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddleduinstitutioncity.ClientID%>").val());
        });

        $("#<%=ddluniversityname.ClientID%>").change(function () {
            var universityid = $("#<%=ddluniversityname.ClientID%>").val();
            if (universityid != 0) {
                $.ajax({
                    type: "GET",
                    url: "gte_studentdetailsN.aspx/GetEducationCountry",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { universityid: universityid },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddluniversityCountry.ClientID%>").length >= 1) {
                                $("#<%=ddluniversityCountry.ClientID%>").empty();
                                $("#<%=ddluniversityCountry.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddluniversityCountry.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
            }
              else {
                $("#<%=ddluniversityCountry.ClientID%>").empty();
                $("#<%=ddluniversityCountry.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
            }

           
            });

            $("#<%=ddluniversityCountry.ClientID%>").change(function () {
                $("#<%=HiduniversityCountry.ClientID%>").val($("#<%=ddluniversityCountry.ClientID%>").val());
        });
        
        


        $("#<%=ddlboradfield.ClientID%>").change(function () {
                var broadfieldID = $("#<%=ddlboradfield.ClientID%>").val()
            if (broadfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "gte_studentdetailsN.aspx/GetNarrowFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { broadfieldID: broadfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnarrowfield.ClientID%>").length >= 1) {
                                $("#<%=ddlnarrowfield.ClientID%>").empty();
                                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnarrowfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlnarrowfield.ClientID%>").empty();
                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
            });
            
            $("#<%=ddlnarrowfield.ClientID%>").change(function () {
                $("#<%=hidnarrowfieldId.ClientID%>").val($("#<%=ddlnarrowfield.ClientID%>").val());
        });
        ////
         $("#<%=ddlnarrowfield.ClientID%>").change(function () {
                var narrowfieldID = $("#<%=ddlnarrowfield.ClientID%>").val()
             if (narrowfieldID > 0) {
                 $.ajax({
                     type: "GET",
                     url: "gte_studentdetailsN.aspx/GetDetailedFields",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: { narrowfieldID: narrowfieldID },
                     success: function (response) {
                         if (response.d) {
                             var result = JSON.parse(response.d);
                             if ($("#<%=ddldetailedfield.ClientID%>").length >= 1) {
                                 $("#<%=ddldetailedfield.ClientID%>").empty();
                                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddldetailedfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddldetailedfield.ClientID%>").empty();
                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
             }
            });
            
            $("#<%=ddldetailedfield.ClientID%>").change(function () {
                $("#<%=hiddetailedfield.ClientID%>").val($("#<%=ddldetailedfield.ClientID%>").val());
        });

        $("#<%=ddlhighestqualificationAchieved.ClientID%>").change(function () {
                var studeylevelID = $("#<%=ddlhighestqualificationAchieved.ClientID%>").val()
             if (studeylevelID > 0) {
                 $.ajax({
                     type: "GET",
                     url: "gte_studentdetailsN.aspx/GetBroadFields",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: {studeylevelID : studeylevelID },
                     success: function (response) {
                         if (response.d) {
                             var result = JSON.parse(response.d);
                             if ($("#<%=ddlboradfield.ClientID%>").length >= 1) {
                                 $("#<%=ddlboradfield.ClientID%>").empty();
                                 $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddlboradfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddlboradfield.ClientID%>").empty();
                 $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
             }
            });
            
            $("#<%=ddlboradfield.ClientID%>").change(function () {
                $("#<%=hidbroadfieldId.ClientID%>").val($("#<%=ddlboradfield.ClientID%>").val());
        });
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

         $("#<%=ddlboradfieldyouwillComplete.ClientID%>").change(function () {
                var broadfieldID = $("#<%=ddlboradfieldyouwillComplete.ClientID%>").val()
            if (broadfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "gte_studentdetailsN.aspx/GetNarrowFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { broadfieldID: broadfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").length >= 1) {
                                $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").empty();
                                $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").empty();
                $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
            });
            
            $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").change(function () {
                $("#<%=Hidnarrowfieldyouwillcomplete.ClientID%>").val($("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").val());
        });
        $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").change(function () {
                var narrowfieldID = $("#<%=ddlnarrowfieldyouwillcomplete.ClientID%>").val()
             if (narrowfieldID > 0) {
                 $.ajax({
                     type: "GET",
                     url: "gte_studentdetailsN.aspx/GetDetailedFields",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: { narrowfieldID: narrowfieldID },
                     success: function (response) {
                         if (response.d) {
                             var result = JSON.parse(response.d);
                             if ($("#<%=ddldetailedfieldyowillcomplete.ClientID%>").length >= 1) {
                                 $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").empty();
                                 $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").empty();
                 $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
             }
            });
            
            $("#<%=ddldetailedfieldyowillcomplete.ClientID%>").change(function () {
                $("#<%=Hiddetailedfieldyowillcomplete.ClientID%>").val($("#<%=ddldetailedfieldyowillcomplete.ClientID%>").val());
        });
         $("#<%=ddlcourseapplied.ClientID%>").change(function () {
                var studeylevelID = $("#<%=ddlcourseapplied.ClientID%>").val()
             if (studeylevelID > 0) {
                 $.ajax({
                     type: "GET",
                     url: "gte_studentdetailsN.aspx/GetBroadFields",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: {studeylevelID : studeylevelID },
                     success: function (response) {
                         if (response.d) {
                             var result = JSON.parse(response.d);
                             if ($("#<%=ddlboradfieldyouwillComplete.ClientID%>").length >= 1) {
                                 $("#<%=ddlboradfieldyouwillComplete.ClientID%>").empty();
                                 $("#<%=ddlboradfieldyouwillComplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddlboradfieldyouwillComplete.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddlboradfieldyouwillComplete.ClientID%>").empty();
                 $("#<%=ddlboradfieldyouwillComplete.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
             }
            });
            
            $("#<%=ddlboradfieldyouwillComplete.ClientID%>").change(function () {
                $("#<%=HidboradfieldyouwillComplete.ClientID%>").val($("#<%=ddlboradfieldyouwillComplete.ClientID%>").val());
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$address']").click(function () {
                if ($("#<%=rblAddressYes.ClientID%>").is(":checked")) {

                    $("#<%=residential.ClientID%>").hide();
                } else {
                    $("#<%=residential.ClientID%>").show();
                        }
                    });
        });
        
          function getDaysInMonth(month, year)
          {  
                 return new Date(year, month, 0).getDate();
          };
          //DOB
         $("#<%=ddlMonth.ClientID%>").change(function() {         
            $("#<%=ddlDay.ClientID%>").empty();
            var daysInSelectedMonth = getDaysInMonth($("#<%=ddlMonth.ClientID%>").val(), $("#<%=ddlYear.ClientID%>").val());             
            $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
            for (var i = 1; i <= daysInSelectedMonth; i++) {    
                $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", i).text(i));
            }
            
          });
          $("#<%=ddlDay.ClientID%>").change(function () {
                $("#<%=hidDOBDate.ClientID%>").val($("#<%=ddlDay.ClientID%>").val());
            });

            function getAge(DOB) {
            var today = new Date();
            var birthDate = new Date(DOB);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age = age - 1;
            }

            return age;
        }

        function isValidUniversityAcceptAgeRange() {
            var dob = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var age = getAge(dob);
            var maxAge = <%=GlobalVariables.universityMaxAge%>;
            var minAge = <%=GlobalVariables.universityMinAge%>;

            if (age < minAge || age > maxAge) {
                alert("Age should be between " + minAge + " & " + maxAge + " years");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>