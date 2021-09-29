<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_studentdetailsaspx.aspx.cs" Inherits="admin_gte_studentdetailsaspx" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">GTE Student details</li>
        </ol>
        <h1 class="h2">GTE Student details</h1>
        <div class="card">
            <div class="list-group list-group-fit">
                 <h5>Personal Particulars</h5>                            
                 <div class="list-group-item" id="dob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lbldob" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Birth </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtdob" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbldobYes" GroupName="Linkedin" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbldobNo" GroupName="Linkedin" Text="No" runat="server" />
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
                                                <asp:RadioButton ID="rblnationalityyYes" GroupName="nationality" Text="Yes" runat="server" Checked="true"/>
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
                                                <asp:RadioButton ID="rblbirthcountryYes" GroupName="birthcountry" Text="Yes" runat="server" Checked="true"/>
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
                 <div class="list-group-item" id="countryrsidence">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label3" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Current Country of Residence   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtcountryrsidence" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblcountryrsidenceYes" GroupName="countryrsidence" Text="Yes" runat="server" Checked="true"/>
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
                            </div>     
                 <div class="list-group-item" id="maritalstatus">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label4" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Marital Status </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="lblmaritalstatus" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblmaritalstatusYes" GroupName="maritalstatus" Text="Yes" runat="server" Checked="true"/>
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
                 <div id="fieldcontainer" runat="server" style="display:none">
                    <div class="list-group-item" id="marriagedate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label5" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Date of Marriage </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtmarriagedate" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblmarriagedateYes" GroupName="marriagedate" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblmarriagedateNo" GroupName="marriagedate" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i5" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnmarriagedate" />
                                            <input id="txtmarriagedateComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                      <div class="list-group-item" id="spousenationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label6" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Nationality of Spouse </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtspousenationality" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblspousenationalityYes" GroupName="spousenationality" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblspousenationalityNo" GroupName="spousenationality" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i6spousenationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnspousenationality" />
                                            <input id="txtspousenationalityComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                     </div>

                  <h5>Prior Qualifications</h5>

                 <div class="list-group-item" id="highestqualification">
                        <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                            <div class="form-row">
                                <label id="Label7" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Name of Highest Qualification Completed </label>
                                <div class="col-md-6">
                                        <div class="prdtl-ans">
                                        <asp:Label ID="txthighestqualification" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblhighestqualificationYes" GroupName="highestqualification" Text="Yes" runat="server" Checked="true"/>
                                        <asp:RadioButton ID="rblhighestqualificationNo" GroupName="highestqualification" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="i6" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnhighestqualification" />
                                    <input id="txthighestqualificationComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                </div>
                            </div>
                        </div>
                    </div>
                 <div class="list-group-item" id="highestqualificationAchieved">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label8" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> LEVEL OF HIGHEST QUALIFICATION ACHIEVED  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txthighestqualificationAchieved" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationAchievedYes" GroupName="highestqualificationAchieved" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblhighestqualificationAchievedNo" GroupName="highestqualificationAchieved" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i7highestqualificationAchieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationAchieved" />
                                            <input id="txthighestqualificationAchievedComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>  
                 <div class="list-group-item" id="highestqualificationfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label9" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  FIELD OF STUDY OF HIGHEST QUALIFICATION </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txthighestqualificationfield" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationfieldYes" GroupName="highestqualificationfield" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblhighestqualificationfieldNo" GroupName="highestqualificationfield" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i7" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnhighestqualificationfield" />
                                            <input id="txthighestqualificationfieldComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="highestqualificationdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label10" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> YEAR & MONTH THE HIGHEST QUALIFICATION WAS COMPLETED  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txthighestqualificationdate" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationdateYes" GroupName="highestqualificationdate" Text="Yes" runat="server" Checked="true"/>
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
                                        <label id="Label11" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> country of highest Qualification   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txthighestqualificationcountry" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblhighestqualificationcountryYes" GroupName="highestqualificationcountry" Text="Yes" runat="server" Checked="true"/>
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
                 <div class="list-group-item" id="workexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label12" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  WORK EXPERIENCE (NUMBER OF YEARS)  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtworkexperience" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblworkexperienceYes" GroupName="workexperience" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblworkexperienceNo" GroupName="workexperience" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i10" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnworkexperience" />
                                            <input id="txtworkexperienceComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="typeofworkexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label13" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> TYPE OF WORK EXPERIENCE.   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txttypeofworkexperience" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbltypeofworkexperienceYes" GroupName="typeofworkexperience" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbltypeofworkexperienceNo" GroupName="typeofworkexperience" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i11" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btntypeofworkexperience" />
                                            <input id="txttypeofworkexperienceComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                
                <h5>Course You Are Applying For</h5>

                 <div class="list-group-item" id="universityname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label14" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">NAME OF UNIVERSITY YOU ARE APPLYING TO     </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtuniversityname" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbluniversitynameYes" GroupName="universityname" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbluniversitynameNo" GroupName="universityname" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i12" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnuniversityname" />
                                            <input id="txtuniversitynameComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div> 
                 <div class="list-group-item" id="universityCountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label15" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Country where chosen Educational Institution is located     </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtuniversityCountry" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbluniversityCountryYes" GroupName="universityCountry" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbluniversityCountryNo" GroupName="universityCountry" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i13" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnuniversityCountry" />
                                            <input id="txtuniversityCountryComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="eduinstitutioncity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label16" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">CITY WHERE CHOSEN UNIVERSITY IS LOCATED   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txteduinstitutioncity" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbleduinstitutioncityYes" GroupName="eduinstitutioncity" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbleduinstitutioncityNo" GroupName="eduinstitutioncity" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i14" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btneduinstitutioncity" />
                                            <input id="txteduinstitutioncityComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                 <div class="list-group-item" id="courseapplied">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label17" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Level of Course you are applying for </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtcourseapplied" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblcourseappliedYes" GroupName="courseapplied" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblcourseappliedNo" GroupName="courseapplied" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i15" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btncourseapplied" />
                                            <input id="txtcourseappliedComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                 <div class="list-group-item" id="fieldofstudy">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label18" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> FIELD OF STUDY YOU ARE APPLYING TO   </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtfieldofstudy" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblfieldofstudyYes" GroupName="fieldofstudy" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblfieldofstudyNo" GroupName="fieldofstudy" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i16" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnfieldofstudy" />
                                            <input id="txtfieldofstudyComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="nameofcourse">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label19" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Name of Course you are applying for (First Choice)  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtnameofcourse" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblnameofcourseYes" GroupName="nameofcourse" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblnameofcourseNo" GroupName="nameofcourse" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i17" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnnameofcourse" />
                                            <input id="txtnameofcourseComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>     
                 <div class="list-group-item" id="commencementdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label20" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  Date of course commencement  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtcommencementdate" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblcommencementdateYes" GroupName="commencementdate" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblcommencementdateNo" GroupName="commencementdate" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i18" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btncommencementdate" />
                                            <input id="txtcommencementdateComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                 <div class="list-group-item" id="annualfee">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label21" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">  ESTIMATED ANNUAL TUITION FEE AND LIVING COSTS  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtannualfee" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblannualfeeYes" GroupName="annualfee" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rblannualfeeNo" GroupName="annualfee" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i19" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnannualfee" />
                                            <input id="txtannualfeeComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>   
                 <div class="list-group-item" id="agent">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label22" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> Are you reffered by Agent  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtagent" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rblagentYes" GroupName="agent" Text="Yes" runat="server" Checked="true"/>
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
                                                <asp:RadioButton ID="rblagentListYes" GroupName="agentList" Text="Yes" runat="server" Checked="true"/>
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
                 <div class="list-group-item" id="addnewagent" style="display:none" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label24" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label"> If didn't find agent name in the list then add his email ID to sent registeration link  </label>
                                        <div class="col-md-6">
                                             <div class="prdtl-ans">
                                                <asp:Label ID="txtaddnewagent" runat="server"></asp:Label>
                                            </div>
                                            <div class="prdtl-vrfy">
                                                <asp:RadioButton ID="rbladdnewagentYes" GroupName="addnewagent" Text="Yes" runat="server" Checked="true"/>
                                                <asp:RadioButton ID="rbladdnewagentNo" GroupName="addnewagent" Text="No" runat="server" />
                                            </div>
                                            <span class="helpicon"><i id="i22" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="button" value="Add Remarks" id="btnaddnewagent" />
                                            <input id="txtaddnewagentComments" runat="server" type="text" class="form-control" placeholder="Admin Comments" style="display: none">
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
    <script type="text/javascript">        
        $(document).ready(function () {
          
            if ($("#<%=txtdobComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtdobComments.ClientID%>', 'btndob');
             if ($("#<%=txtnationalityComment.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
              if ($("#<%=txtbirthcountryComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
              if ($("#<%=txtcountryrsidenceComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtcountryrsidenceComments.ClientID%>', 'btncountryrsidence');
              if ($("#<%=txtmaritalstatusComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
              if ($("#<%=txtmarriagedateComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtmarriagedateComments.ClientID%>', 'btnmarriagedate');
             if ($("#<%=txtspousenationalityComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtspousenationalityComments.ClientID%>', 'btnspousenationality');
             if ($("#<%=txthighestqualificationComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationComments.ClientID%>', 'btnhighestqualification');
              if ($("#<%=txthighestqualificationAchievedComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationAchievedComments.ClientID%>', 'btnhighestqualificationAchieved');
             if ($("#<%=txthighestqualificationfieldComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationfieldComments.ClientID%>', 'btnhighestqualificationfield');
            if ($("#<%=txthighestqualificationdateComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
             if ($("#<%=txthighestqualificationcountryComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
             if ($("#<%=txtworkexperienceComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtworkexperienceComments.ClientID%>', 'btnworkexperience');            
              if ($("#<%=txttypeofworkexperienceComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txttypeofworkexperienceComments.ClientID%>', 'btntypeofworkexperience');            
              if ($("#<%=txtuniversitynameComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtuniversitynameComments.ClientID%>', 'btnuniversityname');
              if ($("#<%=txtuniversityCountryComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtuniversityCountryComments.ClientID%>', 'btnuniversityCountry');
             if ($("#<%=txteduinstitutioncityComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txteduinstitutioncityComments.ClientID%>', 'btneduinstitutioncity');
              if ($("#<%=txtcourseappliedComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtcourseappliedComments.ClientID%>', 'btncourseapplied');
             if ($("#<%=txtfieldofstudyComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtfieldofstudyComments.ClientID%>', 'btnfieldofstudy');
             if ($("#<%=txtnameofcourseComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtnameofcourseComments.ClientID%>', 'btnnameofcourse');
             if ($("#<%=txtcommencementdateComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtcommencementdateComments.ClientID%>', 'btncommencementdate');
            if ($("#<%=txtannualfeeComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtannualfeeComments.ClientID%>', 'btnannualfee');
            if ($("#<%=txtagentComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtagentComments.ClientID%>', 'btnagent');
            if ($("#<%=txtagentListComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtagentListComments.ClientID%>', 'btnagentList');
            if ($("#<%=txtaddnewagentComments.ClientID%>").val() != "")
                manageremarksifnocheked('<%=txtaddnewagentComments.ClientID%>', 'btnaddnewagent');

             
           $("#<%=rbldobNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdobComments.ClientID%>', 'btndob');
            });
           $("#<%=rblnationalityyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            });
            $("#<%=rblbirthcountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            });
          $("#<%=rblcountryrsidenceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtcountryrsidenceComments.ClientID%>', 'btncountryrsidence');
            });
           $("#<%=rblmaritalstatusNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            });
            $("#<%=rblmarriagedateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtmarriagedateComments.ClientID%>', 'btnmarriagedate');
            });
             $("#<%=rblspousenationalityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtspousenationalityComments.ClientID%>', 'btnspousenationality');
            });
              $("#<%=rblhighestqualificationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationComments.ClientID%>', 'btnhighestqualification');
            });
            $("#<%=rblhighestqualificationAchievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationAchievedComments.ClientID%>', 'btnhighestqualificationAchieved');
            });
            $("#<%=rblhighestqualificationfieldNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationfieldComments.ClientID%>', 'btnhighestqualificationfield');
            });
            $("#<%=rblhighestqualificationdateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            });
             $("#<%=rblhighestqualificationcountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            });
           $("#<%=rblworkexperienceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtworkexperienceComments.ClientID%>', 'btnworkexperience');     
            });      
           $("#<%=rbltypeofworkexperienceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttypeofworkexperienceComments.ClientID%>', 'btntypeofworkexperience');  
            });          
           $("#<%=rbluniversitynameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtuniversitynameComments.ClientID%>', 'btnuniversityname');
            });
            $("#<%=rbluniversityCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtuniversityCountryComments.ClientID%>', 'btnuniversityCountry');
            });
          $("#<%=rbleduinstitutioncityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txteduinstitutioncityComments.ClientID%>', 'btneduinstitutioncity');
            });
           $("#<%=rblcourseappliedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtcourseappliedComments.ClientID%>', 'btncourseapplied');
            });
          $("#<%=rblfieldofstudyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtfieldofstudyComments.ClientID%>', 'btnfieldofstudy');
            });
           $("#<%=rblnameofcourseNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtnameofcourseComments.ClientID%>', 'btnnameofcourse');
            });
          $("#<%=rblcommencementdateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtcommencementdateComments.ClientID%>', 'btncommencementdate');
            });
          $("#<%=rblannualfeeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtannualfeeComments.ClientID%>', 'btnannualfee');
            });
           $("#<%=rblagentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtagentComments.ClientID%>', 'btnagent');
            });
           $("#<%=rblagentListNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtagentListComments.ClientID%>', 'btnagentList');
            });
            $("#<%=rbladdnewagentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtaddnewagentComments.ClientID%>', 'btnaddnewagent');
             });




            if ($('#<%=rbldobNo.ClientID%>').prop('checked') == true)
                manageremarksifnocheked('<%=txtdobComments.ClientID%>', 'btndob');
            if ($('#<%=rblnationalityyNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
             if ($('#<%=rblbirthcountryNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
             if ($('#<%=rblcountryrsidenceNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtcountryrsidenceComments.ClientID%>', 'btncountryrsidence');
             if ($('#<%=rblmaritalstatusNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
             if ($('#<%=rblmarriagedateNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtmarriagedateComments.ClientID%>', 'btnmarriagedate');
             if ($('#<%=rblspousenationalityNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtspousenationalityComments.ClientID%>', 'btnspousenationality');
             if ($('#<%=rblhighestqualificationNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationComments.ClientID%>', 'btnhighestqualification');
             if ($('#<%=rblhighestqualificationAchievedNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationAchievedComments.ClientID%>', 'btnhighestqualificationAchieved');
             if ($('#<%=rblhighestqualificationfieldNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationfieldComments.ClientID%>', 'btnhighestqualificationfield');
             if ($('#<%=rblhighestqualificationdateNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
             if ($('#<%=rblhighestqualificationcountryNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
             if ($('#<%=rblworkexperienceNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtworkexperienceComments.ClientID%>', 'btnworkexperience');           
             if ($('#<%=rbltypeofworkexperienceNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txttypeofworkexperienceComments.ClientID%>', 'btntypeofworkexperience');            
             if ($('#<%=rbluniversitynameNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtuniversitynameComments.ClientID%>', 'btnuniversityname');
             if ($('#<%=rbluniversityCountryNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtuniversityCountryComments.ClientID%>', 'btnuniversityCountry');
             if ($('#<%=rbleduinstitutioncityNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txteduinstitutioncityComments.ClientID%>', 'btneduinstitutioncity');
             if ($('#<%=rblcourseappliedNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtcourseappliedComments.ClientID%>', 'btncourseapplied');
             if ($('#<%=rblfieldofstudyNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtfieldofstudyComments.ClientID%>', 'btnfieldofstudy');
             if ($('#<%=rblnameofcourseNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtnameofcourseComments.ClientID%>', 'btnnameofcourse');
             if ($('#<%=rblcommencementdateNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtcommencementdateComments.ClientID%>', 'btncommencementdate');
            if ($('#<%=rblannualfeeNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtannualfeeComments.ClientID%>', 'btnannualfee');
            if ($('#<%=rblagentNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtagentComments.ClientID%>', 'btnagent');
            if ($('#<%=rblagentListNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtagentListComments.ClientID%>', 'btnagentList');
            if ($('#<%=rbladdnewagentNo.ClientID  %>').prop('checked') == true)
                manageremarksifnocheked('<%=txtaddnewagentComments.ClientID%>', 'btnaddnewagent');

            
            $("#btndob").click(function () {
                ManageRemarks('<%=txtdobComments.ClientID%>', 'btndob');
            });
            $("#btncountrycitizenship").click(function () {
                ManageRemarks('<%=txtnationalityComment.ClientID%>', 'btncountrycitizenship');
            });
            $("#btnbirthcountry").click(function () {
                ManageRemarks('<%=txtbirthcountryComments.ClientID%>', 'btnbirthcountry');
            });
             $("#btncountryrsidence").click(function () {
                ManageRemarks('<%=txtcountryrsidenceComments.ClientID%>', 'btncountryrsidence');
            });
             $("#btnmaritalstatus").click(function () {
                ManageRemarks('<%=txtmaritalstatusComments.ClientID%>', 'btnmaritalstatus');
            });
              $("#btnmarriagedate").click(function () {
                ManageRemarks('<%=txtmarriagedateComments.ClientID%>', 'btnmarriagedate');
            });
              $("#btnspousenationality").click(function () {
                ManageRemarks('<%=txtspousenationalityComments.ClientID%>', 'btnspousenationality');
            });
              $("#btnhighestqualification").click(function () {
                ManageRemarks('<%=txthighestqualificationComments.ClientID%>', 'btnhighestqualification');
            });
               $("#btnhighestqualificationAchieved").click(function () {
                ManageRemarks('<%=txthighestqualificationAchievedComments.ClientID%>', 'btnhighestqualificationAchieved');
            });
             $("#btnhighestqualificationfield").click(function () {
                ManageRemarks('<%=txthighestqualificationfieldComments.ClientID%>', 'btnhighestqualificationfield');
            });
             $("#btnhighestqualificationdate").click(function () {
                ManageRemarks('<%=txthighestqualificationdateComments.ClientID%>', 'btnhighestqualificationdate');
            });
              $("#btnhighestqualificationcountry").click(function () {
                ManageRemarks('<%=txthighestqualificationcountryComments.ClientID%>', 'btnhighestqualificationcountry');
            });
             $("#btnworkexperience").click(function () {
                ManageRemarks('<%=txtworkexperienceComments.ClientID%>', 'btnworkexperience');     
            });      
             $("#btntypeofworkexperience").click(function () {
                ManageRemarks('<%=txttypeofworkexperienceComments.ClientID%>', 'btntypeofworkexperience');  
            });          
              $("#btnuniversityname").click(function () {
                ManageRemarks('<%=txtuniversitynameComments.ClientID%>', 'btnuniversityname');
            });
             $("#btnuniversityCountry").click(function () {
                ManageRemarks('<%=txtuniversityCountryComments.ClientID%>', 'btnuniversityCountry');
            });
            $("#btneduinstitutioncity").click(function () {
                ManageRemarks('<%=txteduinstitutioncityComments.ClientID%>', 'btneduinstitutioncity');
            });
           $("#btncourseapplied").click(function () {
                ManageRemarks('<%=txtcourseappliedComments.ClientID%>', 'btncourseapplied');
            });
             $("#btnfieldofstudy").click(function () {
                ManageRemarks('<%=txtfieldofstudyComments.ClientID%>', 'btnfieldofstudy');
            });
              $("#btnnameofcourse").click(function () {
                ManageRemarks('<%=txtnameofcourseComments.ClientID%>', 'btnnameofcourse');
            });
             $("#btncommencementdate").click(function () {
                ManageRemarks('<%=txtcommencementdateComments.ClientID%>', 'btncommencementdate');
            });
             $("#btnannualfee").click(function () {
                ManageRemarks('<%=txtannualfeeComments.ClientID%>', 'btnannualfee');
            });
             $("#btnagent").click(function () {
                ManageRemarks('<%=txtagentComments.ClientID%>', 'btnagent');
            });
             $("#btnagentList").click(function () {
                ManageRemarks('<%=txtagentListComments.ClientID%>', 'btnagentList');
            });
             $("#btnaddnewagent").click(function () {
                ManageRemarks('<%=txtaddnewagentComments.ClientID%>', 'btnaddnewagent');
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

