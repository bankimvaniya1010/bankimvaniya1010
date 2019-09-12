<%@ Page Language="C#" AutoEventWireup="true" CodeFile="australiavisadetail.aspx.cs" Inherits="australiavisadetail" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visa Detail

            </li>
        </ol>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">
                    <div class="">

                       <div class="list-group list-group-fit">


	

	   <section class="" id="partA">
		<div class="card">
          <div class="card-body">
			<div class="row" id="noOfPeople" runat="server">
				<div class="col-12">
					<label class="contrl-lbl" runat="server" id="lblnoOfPeople"><b class="ques-lbl">1)</b>How many people are included in this application?</label>
					<input type="text" id="txtnoOfPeople" runat="server" name="" class="form-control">
				</div>
				<div class="col-12">
					<label class="contrl-lbl"><b class="ques-lbl">2)</b>Are you applying?</label>
					<div>
						<div class="form-check">
						<asp:RadioButton ID="rbasStudent" CssClass="form-control" runat="server" GroupName="type" Text="For Youreself as A student   " />
                        <asp:RadioButton ID="rbasFamily" CssClass="form-control" runat="server" GroupName="type" Text="For Yourself and Family" />
                        <asp:RadioButton ID="rbasFamilyUnit" CssClass="form-control" runat="server" GroupName="type" Text="As a member of a student family unit" />
	                    </div>
						
					</div>
				</div>
			</div>
			<div class="row">
                <div class="col-12">
				<div class="frm-lblttl">Your personal details</div>
			
                    <div id="name" runat="server">
					<div class="contrl-lbl"><b class="ques-lbl">3)</b>Your full name in English</div>
					<div class="form-group">
						<label id="lblfamilyname" runat="server">Family name </label>
						<input type="text" runat="server" id="txtfamilyname" name="" class="form-control" >
					</div>
					<div class="form-group">
						<label id="lblgivenname" runat="server">Given names</label>
						<input type="text" runat="server" id="txtgivenName" name="" class="form-control"> 
					</div>
                    </div>
                    <div id="ownLanguageName" runat="server">
					<div class="form-group">
						<label id="lblownLanguageName" runat="server"><b class="ques-lbl">4)</b>Name in your own language or script <span class="italic">(if applicable)</span></label>
						<input type="text" runat="server" id ="txtownLanguageName" name="" class="form-control"> 
					</div>
                   </div>
               <%--5--%>
					<div class="form-group" runat="server" id="knownbyanothername">
						<label><b class="ques-lbl">5)</b>Have you been known by any other names?<span class="italic">(including name at birth, previous married names, aliases)</span></label>
						<div class="form-check-inline">
						  	<label class="form-check-label">
						   		<input type="radio" class="form-check-input" value="" runat="server" name="othrname" id="rbanothernameNo">No
						 	</label>
						</div> 
						<div class="form-check-inline">
						  	<label class="form-check-label">
						   		<input type="radio" class="form-check-input" value="" runat="server" name="othrname" id="rbanothernameYes">Yes
						 	</label>
						 	<div id="anothernamesbloack" runat="server" ><br>
								<div class="form-group">
									<label>Family name </label>
									<input type="text" runat="server" name="" class="form-control" id="txtanotherfamilyname">
								</div>
								<div class="form-group">
									<label>Given names</label>
									<input type="text" runat="server" name="" class="form-control" id="txtanothergivenname"> 
								</div>
							</div>
						</div> 								
					</div>
            <%--6--%>
					    <div class="form-group" id="gender">
							<label><b class="ques-lbl">6)</b>Sex</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="rbMale" class="form-check-input" name="gender">Male
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="rbFemale" class="form-check-input" name="gender">Female
							  </label>
							</div>
						</div>
						<div class="form-group" id="dob">
							<label id="lbldob"><b class="ques-lbl">7)</b>Date of birth</label>
							<input id="txtdob" runat="server" type="text" class="form-control" placeholder="Birth Date" data-toggle="flatpickr" value="">
						</div>
                        
                        <div id="placeOfBirth">
						<div class="contrl-lbl"><b class="ques-lbl">8)</b>Place of birth</div>
						<div class="form-group">							
							<label id="lblcity">Town/city</label>
							<input type="text" runat="server" id="txtcity" name="" class="form-control">
						</div>
						<div class="form-group">
							<label id="lblcountry">Country</label>
							<asp:DropDownList ID="ddlcountryofBirth" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
						</div>
                        </div>
						<div class="form-group" id="maritalstatus">
						  <label><b class="ques-lbl">9)</b>Marital status</label>
						  <div class="mart-stustwrp">
							
							<div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbMarried" runat="server" class="form-check-input" name="maritalstatus">Married                                   
							  </label>
							</div>
                             <div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbSeperated" runat="server" class="form-check-input" name="maritalstatus">Seperated
							  </label>
							</div>
                             <div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbWidowed" runat="server" class="form-check-input" name="maritalstatus">Widowed
							  </label>
							</div>
                             <div class="form-check-inline">
							  <label class="form-check-label">
							        <input type="radio" id="rbEngaged" runat="server" class="form-check-input" name="maritalstatus">Engaged
							  </label>
							</div>
                             <div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbDivorced" runat="server" class="form-check-input" name="maritalstatus">Divorced
							  </label>
							</div>
                               <div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbNeverMarried" runat="server" class="form-check-input" name="maritalstatus">Never Married
							  </label>
							</div>
                               <div class="form-check-inline">
							  <label class="form-check-label">
							       <input type="radio" id="rbDeFacto" runat="server" class="form-check-input" name="maritalstatus">De Facto
							  </label>
							</div>

						</div>
					    </div>
					<div class="form-group" id="citizenshipcountry" runat="server">
						<label id="lblcitizenshipcountry"><b class="ques-lbl"> 10)</b>Your present country of citizenship</label>
						<asp:DropDownList ID="ddlcitizenshipcountry" CssClass="form-control" runat="server">    </asp:DropDownList>
					</div>
					<div class="form-group" id="anothercitizenship" runat="server">
						<label id="lblanothercitizenship"><b class="ques-lbl">11)</b>Do you hold any other citizenship?</label>
						<div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="rbanothercitizenNo" class="form-check-input" name="citizenship">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="rbanothercitizenYes" class="form-check-input" name="citizenship">Yes
							  </label>
							</div>
							<div id="ddanothercitizenship"><br>
								<div class="form-group">
									<label>Which countries?</label>
									 <asp:DropDownList ID="ddlanothercitizenshipcountry" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="havepassport" runat="server">
						<label><b class="ques-lbl">12)</b>Do you have a passport?</label>
						<div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" id="rbPassportNo" runat="server" class="form-check-input" name="passport">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" id="rbPassportYes" runat="server" class="form-check-input" name="passport">Yes
							  </label>
							</div>
							<div id="passportControls" runat="server"><br>
								<div class="form-group" id="passportno" runat="server">
									<label>Passport number</label>
									<input type="text" name="" id="txtpassportno" runat="server" class="form-control">
								</div>
								<div class="form-group" id="countryIssue" runat="server" >
									<label>Country of passport</label>
									<asp:DropDownList ID="ddlcountryofissue" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
								</div>
								<div class="form-group" id="dateofissue" runat="server">
									<label>Date of issue</label>
									<input id="txtdateofissue" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
								</div>
								<div class="form-group" id="expirydate" runat="server">
									<label>Date of expiry</label>
									<input id="txtexpirydate" runat="server" type="text" class="form-control" placeholder="Expiry Date" data-toggle="flatpickr" value="">
								</div>
								<div class="form-group" id="placeofissue" runat="server">
									<label>Issuing authority/Place of issue as shown in your passport</label>
									<input type="text" class="form-control" runat="server" id="txtplaceofissue1"/>
								</div>
							</div>
						</div>
					</div>
                    <%--13--%>
					<div class="form-group" id="applicableidentificationno" runat="server">
						<label><b class="ques-lbl">13)</b>Where applicable, give your identification number</label>
						<input type="text" id="txtapplicableidentificationno" name="" runat="server" class="form-control">
					</div>
                    <%--14--%>
                    <div id="anotherIdentityNo" runat="server">
					<label><b class="ques-lbl">14)</b>If you have any other identity numbers required by your government, give details:</label>
					<div class="form-group">
						<label>Type of number</label>
						<input type="text" id="anotherIdentitytype1" name="" class="form-control" runat="server">
					</div>
					<div class="form-group">
						<label>Your number</label>
						<input type="text" name="" class="form-control" id="anotherIdentityNo1" runat="server">
					</div>
					<div class="form-group">
						<label>Type of number</label>
						<input type="text" id="anotherIdentitytype2" name="" class="form-control" runat="server">
					</div>
					<div class="form-group">
						<label>Your number</label>
						<input type="text" name="" class="form-control" id="anotherIdentityNo2" runat="server">
					</div>
                    </div>
                    <%--15--%>
                    <div class="form-group" id="residencecountry">
						  <label><b class="ques-lbl">15)</b>Your COuntry Of usual residence</label>
						  <div class="mart-stustwrp">							
							<div class="form-check-inline">
							  <label class="form-check-label">
							   <asp:DropDownList ID="ddlresidencecountry" CssClass="form-control" runat="server"> </asp:DropDownList>   
							  </label>
							</div>	
						</div>
					</div>
                    <%--16--%>
                     <div class="form-group" id="residenceaddress" runat="server">
						  <label><b class="ques-lbl">16)</b>Your residential address in your Home country
                              Note:A post office box address is not applicable as residential address .Failure to give your residential address  will result
                              in your application being invalid.
						  </label>
						  <div class="mart-stustwrp">							
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input id="txtAddressLine1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control"> 
                                <input id="txtAddressLine2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                <input id="txtPostal" runat="server" type="text" placeholder="Postal" value="" class="form-control">
							  </label>
							</div>	
						</div>
					</div>
                    <%--17--%>
                    <div id="telephonenumberOutsideaustralia" runat="server">
                         <label><b class="ques-lbl">17)</b>Your Telephone Number outside Australia</label>
						 <div class="form-group">
						    <label>Office Hourse</label>
						    <input type="text" name="" id="officehrContactNo" class="form-control" runat="server">
					    </div>
                        <div class="form-group">
						    <label>After Hourse</label>
						    <input type="text" name="" class="form-control" runat="server" id="afterhrContactNo">
					    </div>
					</div>
                    <%--18--%>
                    <div class="form-group" id="australiaresidentialadd" runat="server">
						  <label><b class="ques-lbl">18)</b>Your residential address in Australia(if known)
						  </label>
						  <div class="mart-stustwrp">							
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input id="australiaresidentialaddline1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control"> 
                                <input id="australiaresidentialaddline2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                <input id="australiaresidentialpostalcode" runat="server" type="text" placeholder="Postal" value="" class="form-control">
							  </label>
							</div>	
						</div>
					</div>
                    <%--19--%>
                    <div id="telephonenumberInsideaustralia" runat="server">
                         <label><b class="ques-lbl">19)</b>Your Telephone Number outside Australia (if known)</label>
						 <div class="form-group">
						    <label>Office Hourse</label>
						    <input type="text" name="" id="officehrContactNoInAustralia" class="form-control" runat="server">
					    </div>
                        <div class="form-group">
						    <label>After Hourse</label>
						    <input type="text" name="" class="form-control" runat="server" id="afterhrContactNoInAustralia">
					    </div>
					</div>
                    <%--20--%>
                      <div class="form-group" id="correspondenceaddress" runat="server">
						  <label><b class="ques-lbl">20)</b>(Address of Correspondence
						  </label>
						  <div class="mart-stustwrp">							
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input id="correspondenceaddressLine1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control"> 
                                <input id="correspondenceaddressLine2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                <input id="correspondenceaddresspostalcode" runat="server" type="text" placeholder="Postal" value="" class="form-control">
							  </label>
							</div>	
						</div>
					</div>

                    <%--21--%>
                    <div class="form-group" id="agreetocommunicate" runat="server">
						<label ><b class="ques-lbl">21)</b>Do you Agree to the department communicating with you by fax ,e-mail or other electronic means?</label>
						<div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="agreetocommunicateNo" class="form-check-input" name="agreetocommunicate">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" runat="server" id="agreetocommunicateYes" class="form-check-input" name="agreetocommunicate">Yes
							  </label>
							</div>
							<div id="faxnumber" runat="server"><br>
								<div class="form-group">
									<label>Fax Number</label>
								    <input type="text" id="faxno" runat="server"  name="" class="form-control" >
								</div>
							</div>
                            <div id="emailadd" runat="server"><br>
								<div class="form-group">
									<label>E-mail address</label>
								    <input type="text" id="emailaddress" runat="server"  name="" class="form-control" >
								</div>
							</div>
                            <label>If this visa application is refuse ,you will be notified by  mail.</label>
						</div>
					</div>
 <!-- ques 22 start -->
					<div class="frm-lblttl"><b class="ques-lbl">22)</b>About your family</div>
					<div>
						<div class="comm-txt">Give details of all members of your family unit whether or not they intend to accompany you to Australia.</div>
						<div class="comm-txt italic">Members of the family unit are your spouse (including a de facto spouse) and any unmarried dependent children of you or your spouse who have not yet turned 18 years of age.</div>
						<hr>
						<div id="family0">
							<div class="form-group">
								<label>Family name</label>
								<input type="text" name="" class="form-control" runat="server" id="txtaboutfamilyname">
							</div>
							<div class="form-group">
								<label>Given names</label>
								<input type="text" name="" class="form-control" runat="server" id="txtanoutfamilyGivenname1">
								
							</div>
							<div class="form-group">
								<label>Relationship to you</label>
								<input type="text" name="" class="form-control" runat="server" id="txtrelationship">
							</div>
							<div class="form-group">
								<label>Citizenship(s)</label>
								<input type="text" name="" class="form-control" runat="server" id="txtcitizen">
							</div>
							<div class="form-group">
								<label>Date of birth</label>
								<input id="txtfamilymemberdob" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
							</div>
							<div class="form-group">
								<label>Is this person included in this application? </label>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport" runat="server" id="familyhavepassportNo">No
								  </label>
								</div>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport" runat="server" id="familyhavepassportYes">Yes
								  </label>
								</div>
								<div id="familypassportcontrols" runat="server">
									<div class="comm-txt">Details from passport </div>
									<div class="form-group" runat="server">
										<label>Passport number</label>
										<input type="text" name="" class="form-control" runat="server" id="txtfamilypassportno">
									</div>
									<div class="form-group" runat="server">
										<label>Country of passport</label>
                                        <asp:DropDownList runat="server" ID="ddlfamilypassportcountry"> 
                                        </asp:DropDownList>
									</div>
									<div class="form-group" runat="server">
										<label>Date of issue</label>
										<input id="txtfamilypassportdoi" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group" runat="server">
										<label>Date of expiry</label>
										<input id="txtfamilypassportdoe" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group" runat="server">
										<label>Issuing authority/Place of issue as shown in passport</label>
										<textarea class="form-control" rows="3" runat="server" id="txtfamilypassportplaceofissue"></textarea>
									</div>
									<div class="form-group" runat="server">
										<label>Does this person intend to study in Australia for more than 3 months?</label>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="studyinaustralia" runat="server" id="studyinaustraliaNo">No
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="studyinaustralia" runat="server" id="studyinaustraliaYes">Yes
										  </label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div>
							<div class="form-group">
								<label>Family name</label>
								<input type="text" name="" class="form-control" runat="server" id="txtaboutfamilyname1">
							</div>
							<div class="form-group">
								<label>Given names</label>
								<input type="text" name="" class="form-control" runat="server" id="txtanoutfamilyGivenname11">
								<input type="text" name="" class="form-control" runat="server" id="txtanoutfamilyGivenname12">
							</div>
							<div class="form-group">
								<label>Relationship to you</label>
								<input type="text" name="" class="form-control" runat="server" id="txtrelationship1">
							</div>
							<div class="form-group">
								<label>Citizenship(s)</label>
								<input type="text" name="" class="form-control" runat="server" id="txtcitizen1">
							</div>
							<div class="form-group">
								<label>Date of birth</label>
								<input id="txtfamilymemberdob1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
							</div>
							<div class="form-group">
								<label>Is this person included in this application? </label>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport1" runat="server" id="familyhavepassportNo1">No
								  </label>
								</div>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport1" runat="server" id="familyhavepassportYes1">Yes
								  </label>
								</div>
								<div id="passportControl1" runat="server">
									<div class="comm-txt">Details from passport </div>
									<div class="form-group">
										<label>Passport number</label>
										<input type="text" name="" class="form-control" runat="server" id="txtfamilypassportno1">
									</div>
									<div class="form-group">
										<label>Country of passport</label>
										<asp:DropDownList class="form-control" runat="server" ID="ddlfamilypassportcountry1">
											
										</asp:DropDownList>
									</div>
									<div class="form-group">
										<label>Date of issue</label>
										<input id="txtfamilypassportdoi1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group">
										<label>Date of expiry</label>
										<input id="txtfamilypassportdoe1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group">
										<label>Issuing authority/Place of issue as shown in passport</label>
										<textarea class="form-control" rows="3" runat="server" id="txtfamilypassportplaceofissue1"></textarea>
									</div>
									<div class="form-group">
										<label>Does this person intend to study in Australia for more than 3 months?</label>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="month3" runat="server" id="studyinaustralia1No">No
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="month3" runat="server" id="studyinaustralia1Yes">Yes
										  </label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div>
							<div class="form-group">
								<label>Family name</label>
								<input type="text" name="" class="form-control" runat="server" id="txtaboutfamilyname2">
							</div>
							<div class="form-group">
								<label>Given names</label>
								<input type="text" name="" class="form-control" runat="server" id="txtanoutfamilyGivenname21">
								<input type="text" name="" class="form-control" runat="server" id="txtanoutfamilyGivenname22">
							</div>
							<div class="form-group">
								<label>Relationship to you</label>
								<input type="text" name="" class="form-control" runat="server" id="txtrelationship2">
							</div>
							<div class="form-group">
								<label>Citizenship(s)</label>
								<input type="text" name="" class="form-control" runat="server" id="txtcitizen2">
							</div>
							<div class="form-group">
								<label>Date of birth</label>
								<input id="txtfamilymemberdob2" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
							</div>
							<div class="form-group">
								<label>Is this person included in this application? </label>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport2" runat="server" id="familyhavepassportNo2">No
								  </label>
								</div>
								<div class="form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="familypassport2" runat="server" id="familyhavepassportYes2">Yes
								  </label>
								</div>
								<div id="passportControl2" runat="server">
									<div class="comm-txt">Details from passport </div>
									<div class="form-group">
										<label>Passport number</label>
										<input type="text" name="" class="form-control" runat="server"  id="txtfamilypassportno2">
									</div>
									<div class="form-group">
										<label>Country of passport</label>
										<asp:DropDownList runat="server" ID="ddlfamilypassportcountry2"> 
                                        </asp:DropDownList>
									</div>
									<div class="form-group">
										<label>Date of issue</label>
										<input id="txtfamilypassportdoi2" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group">
										<label>Date of expiry</label>
										<input id="txtfamilypassportdoe2" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
									</div>
									<div class="form-group">
										<label>Issuing authority/Place of issue as shown in passport</label>
										<textarea class="form-control" rows="3" runat="server" id="txtfamilypassportplaceofissue2"></textarea>
									</div>
									<div class="form-group">
										<label>Does this person intend to study in Australia for more than 3 months?</label>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="month3" runat="server"  id="studyinaustraliaNo2">No
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="month3" runat="server"  id="studyinaustraliaYes2">Yes
										  </label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ques 22 end -->
					<!-- ques 23 start -->
					<div class="frm-lblttl"><b class="ques-lbl">23)</b>Dependants under 18 years of age</div>
					<div>
						<div class="form-group">
							<label>Have any school age dependants (that is, those who have turned 5 but who have not yet turned 18 years of age) included in this application been enrolled in a school in Australia?</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="agedependt" runat="server" id="enrolledonscoolNO">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="agedependt" runat="server" id="enrolledonscoolYes">yes
							  </label>
							</div>
							<div>
								<div class="comm-txt">You must provide evidence (eg. enrolment advice, offer letter)</div>
							</div>
						</div>
					</div>
					<!-- ques 23 end -->
					<!-- ques 24 end -->
					<div>
						<div class="form-group">
							<label><b class="ques-lbl">24)</b>Do you have the sole legal right to determine where any dependants under 18 years of age who are included in this application will live or to remove each such dependant from their country of usual residence?</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="solelegal" runat="server" id="solelegalrightsNo">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="solelegal" runat="server" id="solelegalrightsYes">yes
							  </label>
							</div>
							<div id="gotoquestion" runat="server">
								<div class="comm-txt">Go to Question 25</div>
							</div>
							<div id="showdetails" runat="server">
								<div class="comm-txt">Give details of ALL other people not included in this application who have custody, access or guardianship rights in relation to the dependant(s).</div>
								<div class="comm-txt italic">Attach a statutory declaration from each of these people giving permission for the dependant to accompany you to Australia.</div>
								<hr>
								<div>
									<div class="form-group">
										<label>Family name </label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardiansfamilyname">
									</div>
									<div class="form-group">
										<label>Given names</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardiansgivenname">
									</div>
									<div class="form-group">
										<label>Residential address</label>
										<textarea class="form-control" rows="3" runat="server" id="txtguardiansresidentialaddress"></textarea>
									</div>
									<div class="form-group">
										<label>Postal code</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardianspostalcode">
									</div>
									<div class="form-group">
										<label>Telephone</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardianscontactno">
									</div>
									<div class="form-group">
										<label>Relationship to dependant</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardiansrelationship">
									</div>
									<div class="form-group">
										<label>Nature of legal right</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardianslegalrights">
									</div>
									<div class="form-group">
										<label>Statutory declaration attached?</label>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="statutory" runat="server" id="rbguardiansdeclarationNo">No
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="statutory" runat="server" id="rbguardiansdeclarationYes">Yes
										  </label>
										</div>
									</div>
								</div>
								<hr>
								<div>
									<div class="form-group">
										<label>Family name </label>
										<input type="text" name="" class="form-control" runat="server"  id="txtguardiansfamilyname1">
									</div>
									<div class="form-group">
										<label>Given names</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardiansgivenname1"> 
									</div>
									<div class="form-group">
										<label>Residential address</label>
										<textarea class="form-control" rows="3" runat="server"  id="txtguardiansresidentialaddress1"></textarea>
									</div>
									<div class="form-group">
										<label>Postal code</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardianspostalcode1">
									</div>
									<div class="form-group">
										<label>Telephone</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardianscontactno1">
									</div>
									<div class="form-group">
										<label>Relationship to dependant</label>
										<input type="text" name="" class="form-control" runat="server" id="txtguardiansrelationship1">
									</div>
									<div class="form-group">
										<label>Nature of legal right</label>
										<input type="text" name="" class="form-control" runat="server"  id="txtguardianslegalrights1">
									</div>
									<div class="form-group">
										<label>Statutory declaration attached?</label>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="statutory1" runat="server" id="rbguardiansdeclarationNo1">No
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="statutory1" runat="server" id="rbguardiansdeclarationYes1">Yes
										  </label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ques 24 end -->
					<!-- ques 25 start -->
					<div>
						<label><b class="ques-lbl">25)</b> Are any of your dependants who are under 18 years of age, and who are included in this application, the subject of a court order giving you:			<ul>
							<li>the sole legal right to determine where they will live; or</li>
							<li>the right to remove them from their country of usual residence?</li>
						</ul>				
						</label>
						<div class="form-group" runat="server">
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="court-order" runat="server" id="subjectofcourtorderNo">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="court-order" runat="server" id="subjectofcourtorderYes">Yes
							  </label>
							</div>
							<div class="collpse-div">
								<div class="comm-txt">Attach a certified copy of the court order(s)</div>
								<div class="comm-txt"><b>Warning</b> — In general, a person can only hold one visa at a time. If you are granted a visa while you already have another, the first visa will cease automatically when the new visa is granted.</div>
							</div>
						</div>
					</div>
					<!-- ques 25 end -->
					<!-- ques 26 start -->
					<div>
						<div class="form-group" runat="server">
							<label><b class="ques-lbl">26)</b> Have you or any other person included in this application previously applied for any type of Australian visa?</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="previouslyappliedvisaNo">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="previouslyappliedvisaYes">Yes
							  </label>
							</div>
						</div>
						<div class="form-group" runat="server">
							<label>Do you currently hold a visa?</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="currentlyholdvisaNo">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="currentlyholdvisaYes">Yes
							  </label>
							</div>
						</div>
						<div class="form-group" runat="server">
							<label>Are you currently awaiting a decision on another visa application?</label>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="awaitingforvisaNo">No
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="visa" runat="server" id="awaitingforvisaYes">Yes
							  </label>
							</div>
						</div>
						<div id="visaControls" runat="server">
							<div>
								<div class="form-group">
									<label>Name</label>
									<input type="text" name="" class="form-control" runat="server" id="visaname">
								</div>
								<div class="form-group">
									<label>Type of visa </label>
									<input type="text" name="" class="form-control" runat="server" id="typeofvisa">
								</div>
								<div class="form-group">
									<label>Place of issue</label>
									<input type="text" name="" class="form-control" runat="server" id="placeofvisa">
								</div>
								<div class="form-group">
									<label>Date of issue</label>
									<input id="visadateofissue" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
								</div>
								<div class="form-group">
									<label>Application</label>
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="refused" runat="server" id="refusevisa">Refused 
									  </label>
									</div>
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="refused" runat="server" id="grantedvisa">Granted 
									  </label>
									</div>
									<div id="visasubcontrol" runat="server">
										<div class="form-group">
											<label>Visa label number</label>
											<input type="text" name="" class="form-control" runat="server" id="visalabelno">
										</div>
										<div class="form-group">
											<label>If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of visa grant).</label>
											<input type="text" name="" class="form-control" runat="server" id="visagrantedNo">
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div>
								<div class="form-group">
									<label>Name</label>
									<input type="text" name="" class="form-control" runat="server" id="visaname1">
								</div>
								<div class="form-group">
									<label>Type of visa </label>
									<input type="text" name="" class="form-control" runat="server" id="typeofvisa1">
								</div>
								<div class="form-group">
									<label>Place of issue</label>
									<input type="text" name="" class="form-control" runat="server" id="placeofvisa1">
								</div>
								<div class="form-group">
									<label>Date of issue</label>
									<input id="visadateofissue1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
								</div>
								<div class="form-group">
									<label>Application</label>
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="refused1" runat="server"  id="refusevisa1">Refused 
									  </label>
									</div>
									<div class="form-check-inline">
									  <label class="form-check-label"></label>
									    <input type="radio" class="form-check-input" name="refused1" runat="server" id="grantedvisa1"/>Granted

				                    </div>
                                    <div id="visasubcontrol11" runat="server">
										<div class="form-group">
											<label>Visa label number</label>
											<input type="text" name="" class="form-control" runat="server" id="visalabelno1">
										</div>
										<div class="form-group">
											<label>If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of visa grant).</label>
											<input type="text" name="" class="form-control" runat="server" id="visagrantedNo1">
										</div>
									</div>
			                </div>
		                </div>
                        </div>
                     </div>
                <!-- ques 27 start -->
					<div>
						<div class="form-group" id="applyingfortype" runat="server">
							<label><b class="ques-lbl">27)</b> If you are applying:</label>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="case" runat="server" id="memberofFamily">as a member of the family unit of a student
							  </label>
							</div>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="case" runat="server" id="othercases">Oin all other cases
							  </label>
							</div>
						</div>
					</div>
					<!-- ques 27 end -->
                </div>
                </div>
             </div>
        </div>

         </section>
                                       
       

        <%--Button--%>
	        <div class="list-group-item">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">                                          
                        <asp:Button ID="btnvisadetails" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btnvisadetails_Click" OnClientClick="return validateForm()" />
                        <div class="col-md-6">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>                                               
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
  </div>
   <div class="col-md-4">
         <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                                    <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
            </div>       
	  
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>      
    </div>
 <script>

    $('#ContentPlaceHolder1_txtdateofissue').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtexpirydate').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtdob').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
     $('#ContentPlaceHolder1_txtfamilymemberdob').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtfamilypassportdoi').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtfamilypassportdoe').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_txtfamilymemberdob1').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtfamilypassportdoi1').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
    });
    $('#ContentPlaceHolder1_txtfamilypassportdoe1').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_txtfamilymemberdob2').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_txtfamilypassportdoi2').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_txtfamilypassportdoe2').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_visadateofissue').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
     $('#ContentPlaceHolder1_visadateofissue1').flatpickr({
        dateFormat: 'Y-m-d', defaultDate: ""
     });
    

   $(document).ready(function () {
         //passportcontrol
        if ($("#<%=rbPassportYes.ClientID%>").is(":checked")) 
            $("#<%=passportControls.ClientID%>").show();                
        else 
             $("#<%=passportControls.ClientID%>").hide(); 
         //citizencountry
        if ($("#<%=rbanothercitizenYes.ClientID%>").is(":checked")) 
            $("#<%=ddlanothercitizenshipcountry.ClientID%>").show();                
        else 
           $("#<%=ddlanothercitizenshipcountry.ClientID%>").hide();
       //agreetocommunicate
       if ($("#<%=agreetocommunicateYes.ClientID%>").is(":checked")) {
            $("#<%=faxnumber.ClientID%>").show();
            $("#<%=emailadd.ClientID%>").show();
       }
       else {
            $("#<%=faxnumber.ClientID%>").hide();
            $("#<%=emailadd.ClientID%>").hide();
       }   
       //Q5
        if ($("#<%=rbanothernameYes.ClientID%>").is(":checked")) 
            $("#<%=anothernamesbloack.ClientID%>").show();
        else 
           $("#<%=anothernamesbloack.ClientID%>").hide();
      //Q22
        if ($("#<%=familyhavepassportYes.ClientID%>").is(":checked")) 
            $("#<%=familypassportcontrols.ClientID%>").show();
        else 
           $("#<%=familypassportcontrols.ClientID%>").hide();
       //
       if ($("#<%=familyhavepassportYes1.ClientID%>").is(":checked")) 
            $("#<%=passportControl1.ClientID%>").show();
       else 
           $("#<%=passportControl1.ClientID%>").hide();
       //
         if ($("#<%=familyhavepassportYes2.ClientID%>").is(":checked")) 
            $("#<%=passportControl2.ClientID%>").show();
         else 
            $("#<%=passportControl2.ClientID%>").hide();
       //Q26
        if ($("#<%=previouslyappliedvisaYes.ClientID%>").is(":checked") || $("#<%=currentlyholdvisaYes.ClientID%>").is(":checked") || $("#<%=awaitingforvisaYes.ClientID%>").is(":checked")) 
            $("#<%=visaControls.ClientID%>").show();
        else 
           $("#<%=visaControls.ClientID%>").hide();

        if ($("#<%=grantedvisa.ClientID%>").is(":checked")) 
            $("#<%=visasubcontrol.ClientID%>").show();
        else 
           $("#<%=visasubcontrol.ClientID%>").hide();

        if ($("#<%=grantedvisa1.ClientID%>").is(":checked")) 
            $("#<%=visasubcontrol11.ClientID%>").show();
        else 
            $("#<%=visasubcontrol11.ClientID%>").hide();
       //24
       if ($("#<%=solelegalrightsYes.ClientID%>").is(":checked")) 
            $("#<%=gotoquestion.ClientID%>").show();
       else 
           $("#<%=gotoquestion.ClientID%>").hide(); 

       if ($("#<%=solelegalrightsNo.ClientID%>").is(":checked")) 
            $("#<%=showdetails.ClientID%>").show();
       else 
            $("#<%=showdetails.ClientID%>").hide();  
     });


     
      $(function () {
        $("input[name='ctl00$ContentPlaceHolder1$passport']").click(function () {
            if ($("#<%=rbPassportYes.ClientID%>").is(":checked")) 
                $("#<%=passportControls.ClientID%>").show();                
            else 
                $("#<%=passportControls.ClientID%>").hide(); 
        });
      });

     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$citizenship']").click(function () {
             if ($("#<%=rbanothercitizenYes.ClientID%>").is(":checked"))
                 $("#<%=ddlanothercitizenshipcountry.ClientID%>").show();
             else
                 $("#<%=ddlanothercitizenshipcountry.ClientID%>").hide();
         });
     });
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$agreetocommunicate']").click(function () {
             if ($("#<%=agreetocommunicateYes.ClientID%>").is(":checked")) {
                 $("#<%=faxnumber.ClientID%>").show();
                 $("#<%=emailadd.ClientID%>").show();
             }
             else {
                 $("#<%=faxnumber.ClientID%>").hide();
                 $("#<%=emailadd.ClientID%>").hide();
             }                 
         });
     }); 

      $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$othrname']").click(function () {
             if ($("#<%=rbanothernameYes.ClientID%>").is(":checked")) 
                 $("#<%=anothernamesbloack.ClientID%>").show();
             else 
                 $("#<%=anothernamesbloack.ClientID%>").hide();
         });
     });
  //22
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$familypassport']").click(function () {
             if ($("#<%=familyhavepassportYes.ClientID%>").is(":checked")) 
                 $("#<%=familypassportcontrols.ClientID%>").show();
             else 
                 $("#<%=familypassportcontrols.ClientID%>").hide();
         });
     });
      $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$familypassport1']").click(function () {
             if ($("#<%=familyhavepassportYes1.ClientID%>").is(":checked")) 
                 $("#<%=passportControl1.ClientID%>").show();
             else 
                 $("#<%=passportControl1.ClientID%>").hide();
         });
     });
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$familypassport2']").click(function () {
             if ($("#<%=familyhavepassportYes2.ClientID%>").is(":checked"))
                 $("#<%=passportControl2.ClientID%>").show();
             else
                 $("#<%=passportControl2.ClientID%>").hide();
         });
     });
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$visa']").click(function () {
             if ($("#<%=previouslyappliedvisaYes.ClientID%>").is(":checked") || $("#<%=currentlyholdvisaYes.ClientID%>").is(":checked") || $("#<%=awaitingforvisaYes.ClientID%>").is(":checked")) 
                 $("#<%=visaControls.ClientID%>").show();
             else 
                 $("#<%=visaControls.ClientID%>").hide();
         });
     });
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$refused']").click(function () {
             if ($("#<%=grantedvisa.ClientID%>").is(":checked")) 
                 $("#<%=visasubcontrol.ClientID%>").show();
             else 
                 $("#<%=visasubcontrol.ClientID%>").hide();
         });
     }); 
     
     $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$refused1']").click(function () {
             if ($("#<%=grantedvisa1.ClientID%>").is(":checked")) 
                 $("#<%=visasubcontrol11.ClientID%>").show();
             else 
                 $("#<%=visasubcontrol11.ClientID%>").hide();
         });
     });
   //24  
      $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$solelegal']").click(function () {             
            if ($("#<%=solelegalrightsYes.ClientID%>").is(":checked")) 
                $("#<%=gotoquestion.ClientID%>").show();
            else 
                $("#<%=gotoquestion.ClientID%>").hide();       
         });
     });
      $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$solelegal']").click(function () {             
            if ($("#<%=solelegalrightsNo.ClientID%>").is(":checked")) 
                $("#<%=showdetails.ClientID%>").show();
            else 
                $("#<%=showdetails.ClientID%>").hide();       
         });
     });
     function validateForm()
     {
        var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
        var flag = false;
        if ($("#<%=txtnoOfPeople.ClientID%>").val() == "")
            alert("Please Enter People included in application");
        else if (!($("#<%=rbasStudent.ClientID%>").is(':checked') || $("#<%=rbasFamily.ClientID%>").is(':checked') || $("#<%=rbasFamilyUnit.ClientID%>").is(':checked')))
            alert("Please Select You Are applying for");

        //3 
        else if ($("#<%=txtfamilyname.ClientID%>").val() == "")
            alert("Please enter family name");
        else if ($("#<%=txtgivenName.ClientID%>").val() == "")
            alert("Please Enter given name");
       //5 to 13
        else if (!($("#<%=rbanothernameNo.ClientID%>").is(':checked') || $("#<%=rbanothernameYes.ClientID%>").is(':checked')))
            alert("Please select Have you been known by any other names");
        else if ($("#<%=rbanothernameYes.ClientID%>").is(':checked') && $("#<%=txtanotherfamilyname.ClientID%>").val() == "")
            alert("Please enter family name of field 5");
        else if ($("#<%=rbanothernameYes.ClientID%>").is(':checked') && $("#<%=txtanothergivenname.ClientID%>").val() == "")
            alert("Please enter given name of field 5");
        else if (!($("#<%=rbMale.ClientID%>").is(':checked') || $("#<%=rbFemale.ClientID%>").is(':checked')))
            alert("Please Select Gender");
        else if ($("#<%=txtdob.ClientID%>").val() == "")
            alert("Please select Date Of Birth ");
        else if ($("#<%=txtcity.ClientID%>").val() == "")
            alert("Please enter city ");
        else if ($("#<%=ddlcountryofBirth.ClientID%>").val() == "0")
            alert("Please select country of Birth");
        else if (!($("#<%=rbMarried.ClientID%>").is(':checked') || $("#<%=rbSeperated.ClientID%>").is(':checked') || $("#<%=rbWidowed.ClientID%>").is(':checked') || $("#<%=rbEngaged.ClientID%>").is(':checked') ||$("#<%=rbDivorced.ClientID%>").is(':checked') ||$("#<%=rbNeverMarried.ClientID%>").is(':checked') ||$("#<%=rbDeFacto.ClientID%>").is(':checked')))
            alert("Please select Maritial status");
        else if ($("#<%=ddlcitizenshipcountry.ClientID%>").val() == "0")
            alert("Please select country of citizenship");
        else if (!($("#<%=rbanothercitizenNo.ClientID%>").is(':checked') || $("#<%=rbanothercitizenYes.ClientID%>").is(':checked')))
            alert("Please select do you hold any other citizenship");
        else if ($("#<%=rbanothercitizenYes.ClientID%>").is(':checked') && $("#<%=ddlanothercitizenshipcountry.ClientID%>").val() == "0")
            alert("Please select other citizenship country");
        else if (!($("#<%=rbPassportYes.ClientID%>").is(':checked') || $("#<%=rbPassportNo.ClientID%>").is(':checked')))
            alert("Please select do you have passsport");
        else if ($("#<%=rbPassportYes.ClientID%>").is(':checked') && $("#<%=txtpassportno.ClientID%>").val() == "")
            alert("Please enter passport Number");
        else if ($("#<%=rbPassportYes.ClientID%>").is(':checked') && $("#<%=ddlcountryofissue.ClientID%>").val() == "0")
            alert("Please elect country of passport");
        else if ($("#<%=rbPassportYes.ClientID%>").is(':checked') && $("#<%=txtdateofissue.ClientID%>").val() == "")
            alert("Please select date of issue");
        else if ($("#<%=rbPassportYes.ClientID%>").is(':checked') && $("#<%=txtexpirydate.ClientID%>").val() == "")
            alert("Please Select Expiry Date");
        else if ($("#<%=rbPassportYes.ClientID%>").is(':checked') && $("#<%=txtplaceofissue1.ClientID%>").val() == "")
            alert("Please enter place of issue");
            //14 -17 18,19(if known so no validation)
        else if ($("#<%=txtapplicableidentificationno.ClientID%>").val() == "")
            alert("Please enter Where applicable, give your identification number of filed 14");
        else if ($("#<%=anotherIdentitytype1.ClientID%>").val() == "")
            alert("Please If you have any other type numbers required by your government ");
        else if ($("#<%=anotherIdentityNo1.ClientID%>").val() == "")
            alert("Please enter If you have any other identity numbers required by your government");              
        else if ($("#<%=ddlresidencecountry.ClientID%>").val() == "0")
            alert("Pleas select country of usual residence of field 15");        
        else if ($("#<%=txtAddressLine1.ClientID%>").val() == "" && $("#<%=txtAddressLine2.ClientID%>").val() == "" && $("#<%=txtPostal.ClientID%>").val() == "")
            alert("Please enter Your residential address Line1 in your Home country");
        else if ($("#<%=txtAddressLine2.ClientID%>").val() == "")
            alert("Please enter Your residential address Line2 in your Home country");
        else if ($("#<%=txtPostal.ClientID%>").val() == "")
            alert("Please enter Your residential Postal code in your Home country");
        else if ($("#<%=officehrContactNo.ClientID%>").val() == "")
            alert("Please enter telephone number of office hourse");
        else if ($("#<%=afterhrContactNo.ClientID%>").val() == "")
            alert("Please enter telephone number  after hourse");
            //20
        else if ($("#<%=correspondenceaddressLine1.ClientID%>").val() == "")
            alert("Please enter valid address Line1 of corressponence of field 20");
        else if ($("#<%=correspondenceaddressLine2.ClientID%>").val() == "")
            alert("Please enter valid address Line2 of corressponence of field 20");
        else if ($("#<%=correspondenceaddresspostalcode.ClientID%>").val() == "")
            alert("Please enter valid address of corressponence postal code of field 20");
            //21
        else if (!($("#<%=agreetocommunicateNo.ClientID%>").is(':checked') || $("#<%=agreetocommunicateYes.ClientID%>").is(':checked')))
            alert("Please select Do you Agree to the department communicating with you by fax ,e-mail or other electronic means? of field 21");
        else if ($("#<%=agreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=faxno.ClientID%>").val() == "")
            alert("Please enter Fax number of field 21");
        else if (($("#<%=agreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=emailaddress.ClientID%>").val() == "") || !(emailRegex.test($("#<%=emailaddress.ClientID%>").val())))
            alert("Please enter valid E-mail Address of field 21");
        //22 validation
        else if ($("#<%=txtaboutfamilyname.ClientID%>").val() == "")
            alert("Please enter First name of field 22");
        else if ($("#<%=txtanoutfamilyGivenname1.ClientID%>").val() == "")
            alert("Please enter given name of field 22");
        else if ($("#<%=txtrelationship.ClientID%>").val() == "")
            alert("Please enter relationship of field 22");
        else if ($("#<%=txtcitizen.ClientID%>").val() == "")
            alert("Please enter citizenship of field 22");
        else if ($("#<%=txtfamilymemberdob.ClientID%>").val() == "")
            alert("Please enter date of birth of field 22");
        else if (!($("#<%=familyhavepassportNo.ClientID%>").is(':checked') || $("#<%=familyhavepassportYes.ClientID%>").is(':checked')))
            alert("Please select is this persone included in this application of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && $("#<%=txtfamilypassportno.ClientID%>").val() == "")
            alert("please enter passport number of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && $("#<%=ddlfamilypassportcountry.ClientID%>").val() == "0")
            alert("please select country of passport issue  of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && $("#<%=txtfamilypassportdoi.ClientID%>").val() == "")
            alert("please enter passport date of issue of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && $("#<%=txtfamilypassportdoe.ClientID%>").val() == "")
            alert("please enter passport date of expiry of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && $("#<%=txtfamilypassportplaceofissue.ClientID%>").val() == "")
            alert("please enter passport place of issue of field 22");
        else if ($("#<%=familyhavepassportYes.ClientID%>").is(':checked') && !($("#<%=studyinaustraliaNo.ClientID%>").is(':checked') || $("#<%=studyinaustraliaYes.ClientID%>").is(':checked')))
            alert("Please select Does this person intend to study in Australia for more than 3 months of field 22");
        //23 
        else if (!($("#<%=enrolledonscoolNO.ClientID%>").is(':checked') || $("#<%=enrolledonscoolYes.ClientID%>").is(':checked')))
            alert("Please select Have any school age dependants (that is, those who have turned 5 but who have not yet turned 18 years of age) included in this application been enrolled in a school in Australia of field 23");
       //24validation  25          
        else if (!($("#<%=solelegalrightsNo.ClientID%>").is(':checked') || $("#<%=solelegalrightsYes.ClientID%>").is(':checked')))
            alert("Please select Do you have the sole legal right to determine where any dependants under 18 years of age who are included in this application will live or to remove each such dependant from their country of usual residence of field 24");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardiansfamilyname.ClientID%>").val() == "")
            alert("Please enter Family name of field 24");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardiansgivenname.ClientID%>").val() == "")
            alert("Please enter given name of field 24");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardiansresidentialaddress.ClientID%>").val() == "")
            alert("Please enter address of field 24");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardianspostalcode.ClientID%>").val() == "")
            alert("Please enter postal code number of field 24");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardianscontactno.ClientID%>").val() == "")
            alert("Please enter contact number of field 24 ");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardiansrelationship.ClientID%>").val() == "")
            alert("Please enter relationship to dependant");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtguardianslegalrights.ClientID%>").val() == "")
            alert("Please enter Nature of legal rights");
        else if ($("#<%=solelegalrightsNo.ClientID%>").is(':checked') && (!($("#<%=rbguardiansdeclarationNo.ClientID%>").is(':checked') || $("#<%=rbguardiansdeclarationYes.ClientID%>").is(':checked'))))
            alert("Please select statutory declartion attached ");        
        else if (!($("#<%=subjectofcourtorderNo.ClientID%>").is(':checked') || $("#<%=subjectofcourtorderYes.ClientID%>").is(':checked')))
            alert("Please select Are any of your dependants who are under 18 years of age, and who are included in this application of field 25");
            //26validation 27
        else if (!($("#<%=previouslyappliedvisaNo.ClientID%>").is(':checked') || $("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaNo.ClientID%>").is(':checked') || $("#<%=awaitingforvisaNo.ClientID%>").is(':checked') || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')))
            alert("Please select Australian visa status of field 26");      
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=visaname.ClientID%>").val() == "")
                alert("Please enter name as on visa of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=typeofvisa.ClientID%>").val() == "")
            alert("Please enter type of visa of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=placeofvisa.ClientID%>").val() == "")
            alert("Please enter visa place of issue of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=visadateofissue.ClientID%>").val() == "")
            alert("Please enter visa Date of Issue of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && !($("#<%=refusevisa.ClientID%>").is(':checked') || $("#<%=grantedvisa.ClientID%>").is(':checked')))
            alert("Please select Application refuse or granted of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=grantedvisa.ClientID%>").is(':checked') && $("#<%=visalabelno.ClientID%>").val() == "")
            alert("Please enter visa label no of field 26");
        else if ((($("#<%=previouslyappliedvisaYes.ClientID%>").is(':checked') || $("#<%=currentlyholdvisaYes.ClientID%>").is(':checked')) || $("#<%=awaitingforvisaYes.ClientID%>").is(':checked')) && $("#<%=grantedvisa.ClientID%>").is(':checked') && $("#<%=visagrantedNo.ClientID%>").val() == "")
            alert("Please enter visa granter 16 digit number of field 26");
                    
        else if (!($("#<%=memberofFamily.ClientID%>").is(':checked') || $("#<%=othercases.ClientID%>").is(':checked')))
            alert("Please select option of field 27 ");       
        else
            flag = true;
        return flag;
     }
      $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#visaapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantvisa').addClass('active');
        });
 </script>
</asp:Content>
