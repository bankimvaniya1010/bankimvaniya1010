<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitydetails.aspx.cs" Inherits="edituniversitydetails" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit Institution Details</li>
        </ol>

        <h1 class="h2">EDIT INSTITUTION DETAILS</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

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
                        <label for="hosturl" class="col-sm-3 col-form-label form-label">Host URL</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txthosturl" type="text" runat="server" class="form-control" placeholder="Host URL"/>
                                </div>
                            </div>
                        </div>
                    </div>
                       <div class="form-group row">
                        <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Partner Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:DropDownList id="ddlflag" name="gtesubscription" runat="server" class="form-control">
                                       <asp:ListItem value="0">Please Select</asp:ListItem>
                                        <asp:ListItem value="1">Institution</asp:ListItem>
                                        <asp:ListItem value="2">Agency</asp:ListItem>
                                        <asp:ListItem value="3">Govt.</asp:ListItem>
                                        <asp:ListItem value="4">Others</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Institution Affiliation</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAffiliation" type="text" runat="server" class="form-control" placeholder="Institution Affiliation" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="uniType" class="col-sm-3 col-form-label form-label">Institution Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniType" type="text" runat="server" class="form-control" placeholder="Institution Type" />
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
                        <label for="uniEmail" class="col-sm-3 col-form-label form-label">Institution Email ID</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtEmail" type="email" runat="server" class="form-control" placeholder="Institution Email ID" />
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="form-group row">
                        <label for="unichatId" class="col-sm-3 col-form-label form-label">Institution Chat ID</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtunichatId" type="text" runat="server" class="form-control" placeholder="Institution chat ID"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="uniWebsite" class="col-sm-3 col-form-label form-label">Institution Website</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniWebsite" type="text" runat="server" class="form-control" placeholder="Institution Website" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">Institution Contact Person</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniContactPerson" type="text" runat="server" class="form-control" placeholder="Institution Contact Person" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniMobile" class="col-sm-3 col-form-label form-label">Institution Mobile Number</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtMobile" type="text" runat="server" class="form-control" placeholder="Institution Mobile Number" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAddress" class="col-sm-3 col-form-label form-label">Institution Address</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUniAddress" type="text" runat="server" class="form-control" placeholder="Institution Address" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniCountry" class="col-sm-3 col-form-label form-label">Institution Country</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCountry" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniCity" class="col-sm-3 col-form-label form-label">Institution City</label>
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

                    <div class="form-group row">
                        <label for="uniAcceptedMaxAge" class="col-sm-3 col-form-label form-label">Institution Accepted Maximum age</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-3">
                                    <input id="txtUniAcceptedMaxAge" type="number" runat="server" class="form-control" placeholder="Maximum Age" />
                                </div>
                                <label class="col-form-label form-label">years</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniAcceptedMinAge" class="col-sm-3 col-form-label form-label">Institution Accepted Minimum age</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-3">
                                    <input id="txtUniAcceptedMinAge" type="number" runat="server" class="form-control" placeholder="Minimum Age" />
                                </div>
                                <span>
                                    <label class="col-form-label form-label">years</label></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Subscribe Gte Service</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:DropDownList id="subscription" name="gtesubscription" runat="server" class="form-control">
                                        <asp:ListItem value="" disabled="disabled">Please Select</asp:ListItem>
                                        <asp:ListItem value="0">GTE Service</asp:ListItem>
                                        <asp:ListItem value="1">Full Service</asp:ListItem>
                                        <asp:ListItem value="2">Examination Module</asp:ListItem>
                                    </asp:DropDownList>
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
                        <label for="logo" class="col-sm-3 col-form-label form-label">Logo</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:FileUpload ID="logo" runat="server" CssClass="custom-file-input" />

                                    <label for="logo" class="custom-file-label">Choose file</label>
                                    <img id="universityLogo" src="<%=imagepath %>" alt="logo" />
                                        
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
                                    <input type="text" runat="server" id="txtstripcolor" class="form-control"/>
                                    <input type="hidden" id="stripcolorInput" class="form-control"/>
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
                                     <input type="text" runat="server" id="txtverticalnavigationcolor" class="form-control"/>
                                    <input type="hidden" id="navigationcolorInput" class="form-control"/>
                                 </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Font Color </label>
                        <div class="col-sm-8">
                            <div class="row">
                                 <div class="col-md-4">
                                    <button class="jscolor{valueElement:'valueInput'} form-control" id="fontcolorbtn" runat="server" onblur="getFontColorcode()">Choose Color</button>                                    
                                </div>
                                <div class="col-md-4">
                                    <input type="text" runat="server" id="txtfontcolor" class="form-control"/>
                                    <input type="hidden" id="valueInput"/>
                                 </div>
                            </div>
                        </div>
                    </div>                  
                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Institution Instruction for Student Sop </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUniversitySop" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:300px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Institution Instruction for Scholarship and Funding </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUniversityScholarship" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:300px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Institution Instruction for fee payments </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUniversityFeePayment" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:300px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Acceptance Terms</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtAcceptanceTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Deferment Terms</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDefermentTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label">Rejection Terms </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtRejectionTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label">Withdrawal Terms</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtWithdrawnTerms" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Institution Instruction for managing application status</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUniversityApplication" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="form-group row">
                        <label for="fontcolor" class="col-sm-3 col-form-label form-label"> Institution Instruction for managing COE</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUniversityCOE" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label"> Institution Instruction for Support Services </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtsupportserviceInstructions" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label"> Institution Instruction for Visa View Status</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtvisainstruction" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label"> Institution google tag manager Code </label>
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
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Exanination Module Instruction </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <asp:TextBox ID="txtexamInstruction" class="form-control" TextMode="MultiLine" runat="server" Style="width:300px; height:140px" ></asp:TextBox>
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
                        <label for="uniType" class="col-sm-3 col-form-label form-label">Number of Applicant</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtapplicantno" type="text" runat="server" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                    </div>
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
                    url: "edituniversitydetails.aspx/GetCityDropdown",
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

            var universityImgLogo = $("#universityLogo").attr("src");
            var d = new Date();
            $("#universityLogo").attr("src", universityImgLogo + "?v=" + d.getTime());

        });

        function validateForm() {
            var txtUniName = $('#<%=txtUniName.ClientID%>').val();
            var institutionflag = $('#<%=ddlflag.ClientID%>').val();
            var txtUniAffiliation = $('#<%=txtUniAffiliation.ClientID%>').val();
            var txtUniType = $('#<%=txtUniType.ClientID%>').val();
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
            var txtUniAcceptedMaxAge = $('#<%=txtUniAcceptedMaxAge.ClientID%>').val();
            var txtUniAcceptedMinAge = $('#<%=txtUniAcceptedMinAge.ClientID%>').val();
            var subscriptionSelection = $('#<%=subscription.ClientID%>').val();
            var txtNotesDisclaimer = $('#<%=txtNotesDisclaimer.ClientID%>').val();
            var sopInstruction = $('#<%=txtUniversitySop.ClientID%>').val();
            var scholarshipInstruction = $('#<%=txtUniversityScholarship.ClientID%>').val();
            var applicationInstruction = $('#<%=txtUniversityApplication.ClientID%>').val();
            var feePaymentInstruction = $('#<%=txtUniversityFeePayment.ClientID%>').val();
            var coeInstruction = $('#<%=txtUniversityCOE.ClientID%>').val();
            var fontcolor = $('#<%=txtfontcolor.ClientID%>').val();
            var headercolor = $('#<%=txtstripcolor.ClientID%>').val();
            var verticalNavcolor = $('#<%=txtverticalnavigationcolor.ClientID%>').val();
            var gtmCode = $('#<%=txtgtmcode.ClientID%>').val();
            var proctoename1 = $('#<%=txtproctorname1.ClientID%>').val();
            var proctorno1 = $('#<%=txtproctorno1.ClientID%>').val();
            var proctoremail1 = $('#<%=txtproctoremail1.ClientID%>').val();
            var examInstruction = $('#<%=txtexamInstruction.ClientID%>').val();
            var notificationemail1 = $('#<%=txtnotification1.ClientID%>').val();
            var notificationemail2= $('#<%=txtnotification2.ClientID%>').val();
            var nofapplicant= $('#<%=txtapplicantno.ClientID%>').val();
            //regex
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
            var urlRegex = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
            var colorcodeRegex = /^#(?:[0-9a-fA-F]{3}){1,2}$/;
            var checOnlykNum = /^[0-9]*$/;

            if (txtUniName == '') {
                alert("Please enter Institution Name");
                return false;
            }
            else if (institutionflag == 0) {
                alert("Please select Partner Type");
                return false;
            }
            else if (txtUniAffiliation == '') {
                alert("Please enter Institution Affiliation");
                return false;
            }
            else if (txtUniType == '') {
                alert("Please enter Institution Type");
                return false;
            }
            else if (txtYearEstablish == '' || isNaN(parseInt(txtYearEstablish)) || parseInt(txtYearEstablish) >= new Date().getFullYear()) {
                alert("Please enter correct university establishment year");
                return false;
            }
            else if (txtUniSDescription == '') {
                alert("Please enter Institution  Short Description");
                return false;
            }
            else if (txtUniLDescription == '') {
                alert("Please enter Institution long description");
                return false;
            }
            else if (txtEmail == '' || !emailRegex.test(txtEmail)) {
                alert("Please enter Institution Email ID");
                return false;
            }
            else if (txtUniWebsite == '' || !urlRegex.test(txtUniWebsite)) {
                alert("Please enter university website");
                return false;
            }
            else if (txtUniContactPerson == '') {
                alert("Please enter Institution contact person");
                return false;
            }
            else if (txtMobile == '') {
                alert("Please enter valid university mobile number");
                return false;
            }                
            else if (txtchatid == '') {
                alert("Please enter university chat ID");
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
            else if (txtUniLatitude == '' || isNaN(txtUniLatitude) || isNaN(parseFloat(txtUniLatitude))) {
                alert("Please enter appropriate Institution Latitude format. eg. 34.5553");
                return false;
            }
            else if (txtUniLongitude == '' || isNaN(txtUniLongitude) || isNaN(parseFloat(txtUniLongitude))) {
                alert("Please enter appropriate Institution Longitude format. eg. 34.5553");
                return false;
            }
            else if (UniTimeZoneValue == 0 || isNaN(parseInt(UniTimeZoneValue))) {
                alert("Please select institution time zone");
                return false;
            }
            else if (txtUniAirport == '') {
                alert("Please enter airport name");
                return false;
            }
            else if (txtUniAirportDistance == '' || !airDistanceUnit || isNaN(parseFloat(txtUniAirportDistance))) {
                if (txtUniAirportDistance != '' && !airDistanceUnit)
                    alert("Please select distance unit");
                else
                    alert("Please enter nearest airport distance from university");
                return false;
            }
            else if (txtUniRailDistance == '' || !railDistanceUnit || isNaN(parseFloat(txtUniRailDistance))) {
                if (txtUniRailDistance != '' && !railDistanceUnit)
                    alert("Please select distance unit");
                else
                    alert("Please enter nearest railway station distance from university");
                return false;
            }
            else if (txtUniGettingAround == '') {
                alert("Please enter Institution Getting Around");
                return false;
            }
            else if (txtUniAcceptedMaxAge == '' || parseInt(txtUniAcceptedMaxAge) <= 0) {
                alert("Please enter valid university accepted maximum age");
                return false;
            }
            else if (txtUniAcceptedMinAge == '' || parseInt(txtUniAcceptedMinAge) <= 0) {
                alert("Please enter valid university accepted minimum age");
                return false;
            }
            else if (parseInt(txtUniAcceptedMinAge) > parseInt(txtUniAcceptedMaxAge)) {
                alert("Minimum age greater than maximum age. Please enter valid university accepted age range.");
                return false;
            }
            else if (isNaN(parseInt(subscriptionSelection))) {
                alert("Please select service subscription for university.");
                return false;
            }
            else if (txtNotesDisclaimer == '') {
                alert("Please enter Institution Notes and disclaimer");
                return false;
            }
            else if (sopInstruction == "") {
                alert("Please enter university sop instruction");
                return false;
            }
            else if (scholarshipInstruction == "") {
                alert("Please enter university scholarship instructions");
                return false;
            }
            else if (applicationInstruction == "") {
                alert("Please enter university application status instructions");
                return false;
            }
            else if (feePaymentInstruction == "") {
                alert("Please enter university fee payment instructions");
                return false;
            }
            else if (coeInstruction == "") {
                alert("Please enter university COE instructions");
                return false;
            }            
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
            else if (gtmCode == "") {
                alert("Please enter google tag manager code.");
                return false;
            }
            else if (proctoename1 == "") {
                alert("Please enter proctor 1 name.");
                return false;
            }
            else if (proctorno1 == "") {
                alert("Please enter Proctor 1 contact number.");
                return false;
            }
            else if (proctoremail1 == "") {
                alert("Please enter Proctor 1 email ID.");
                return false;
            }
            else if (examInstruction == "") {
                alert("Please enter assessment Instruction.");
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
            else if (nofapplicant == "" || !(checOnlykNum.test(nofapplicant))) {
                alert("Please enter valid applicant to be registered.");
                return false;
            }
            return true;
        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#institution_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
            $('#universitymaster').addClass('active');

            //hosturl textbox
            $("#<%=txthosturl.ClientID%>").attr("disabled", "disabled");
        });     
            
        function getFontColorcode() {            
                $("#<%=txtfontcolor.ClientID%>").val("");
                $("#<%=txtfontcolor.ClientID%>").val("#"+$("#valueInput").val());            
        }
        function getNavigationColorcode() {
                $("#<%=txtverticalnavigationcolor.ClientID%>").val("");
                $("#<%=txtverticalnavigationcolor.ClientID%>").val("#"+$("#navigationcolorInput").val());
        }
        function getstripcolorcode() {
                $("#<%=txtstripcolor.ClientID%>").val("");
                $("#<%=txtstripcolor.ClientID%>").val("#"+$("#stripcolorInput").val());
        }
    </script>
</asp:Content>
