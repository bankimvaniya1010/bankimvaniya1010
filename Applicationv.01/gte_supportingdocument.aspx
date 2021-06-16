<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_supportingdocument.aspx.cs" Inherits="gte_supportingdocument" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb" style="margin-bottom:0rem">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active" style="margin-bottom:0rem">DOCUMENTS UPLOAD

            </li>
        </ol>
        <h1 class="h2">UPLOAD YOUR DOCUMENT(S)
        </h1>
    </div>
    <div class="page" style="padding-top:0rem">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        
                        <div class="card-body">
                            <asp:Panel ID="pnl" runat="server">
                                <label style="font-size:smaller">*The file formats you can upload are - jpeg, jpg, png, pdf</label>
                                <div class="tab-pane active" id="first">


                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Identity</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question1">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_1" Value="183" />
                                                        <label id="Label1" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Copy of the bio page of my passport</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="lblupload" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question183" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question183" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question183" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question2">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_2" Value="184" />
                                                        <label id="Label2" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Certified copy of my birth certificate</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label3" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question184" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question184" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question184" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question3">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_3" Value="185" />
                                                        <label id="Label5" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Copy of my Drivers Licence</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label6" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question185" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question185" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question185" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question4">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_4" Value="186" />
                                                        <label id="Label8" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Copy of my National Identity Card</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label9" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question186" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question186" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question186" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 304px;">
                                        <div id="progress1" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btn_identity" runat="server" Text="Upload Identity Documents" CssClass="btn btn-success" OnClientClick="return validateIdentityDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Previous Study and Gaps</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question5">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_5" Value="188" />
                                                        <label id="Label11" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Copies of my Education Certificate(s) (Degree, Diploma etc.)</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label12" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question188" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question188" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question188" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question6">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_6" Value="189" />
                                                        <label id="Label14" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Certified copies of my academic transcripts from previous studies</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label15" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question189" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question189" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question189" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question7">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_7" Value="190" />
                                                        <label id="Label17" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">The most recent copy of my curriculum vitae or resume</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label18" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question190" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question190" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question190" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; margin-left: 304px;" id="progress2Div" runat="server">
                                        <div id="progress2" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                         <asp:Button ID="btnpreviousdoc" runat="server" Text="Upload Previous Study Documents" CssClass="btn btn-success" OnClientClick="return validatePreviousstudyDocument()" />

                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="EmploymentandValueofthecoursetomyfuture" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Employment and Value of the course to my future</b>:</h5>
                                        <ul>
                                            <li>
                                                <div runat="server" id="question8">
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_8" Value="193" />
                                                            <label id="Label20" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Proof of Current Employment </label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label21" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question193" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question193" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question193" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </li>
                                            <li>
                                                <div runat="server" id="question9">
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_9" Value="194" />
                                                            <label id="Label23" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Proof of Future Employment or Employment Opportunities</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label24" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question194" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question194" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question194" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </li>
                                        </ul>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 100px;">
                                        <div id="progress4" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnEmploymentDoc" runat="server" Text="Upload Employment Documents" CssClass="btn btn-success" OnClientClick="return validateEmploymentDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Ties to & Situations in Home Country or Country of Residence</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question10">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_10" Value="196" />
                                                        <label id="Label26" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Evidence that my spouse/parents/sponsor are willing to support me and they have an annual income of at least AUD 73,000  </label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label27" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question196" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question196" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question196" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question11">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_11" Value="197" />
                                                        <label id="Label29" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Bank statement with sufficient funds to cover my travel costs and 12 months of living and tuition fees for me and any accompanying family members and school costs for any school aged dependants</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label30" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question197" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question197" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question197" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>

                                        <li>
                                            <div runat="server" id="question12">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_12" Value="198" />
                                                        <label id="Label32" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Evidence of ownership of assets in home country or country of residence</label>
                                                        <div class="col-md-5">
                                                            <asp:Label ID="Label33" runat="server" />
                                                            <asp:FileUpload ID="FileUpload_question198" runat="server" />
                                                            <asp:HiddenField ID="HidDocPath_question198" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question198" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 304px;">
                                        <div id="progress3" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btntiesresidence" runat="server" Text="Upload Residence Documents" CssClass="btn btn-success" OnClientClick="return validatetiesresidenceDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="PotentialSituation" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Potential Situation in <%=Country_I_am_applying_to_Study %></b>:</h5>

                                        <div runat="server" id="question13">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_13" Value="200" />
                                                            <label id="Label35" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">A certified copy of my marriage certificate</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label36" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question200" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question200" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question200" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question14">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_14" Value="201" />
                                                            <label id="Label38" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Evidence of my relationship with my de facto partner</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label39" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question201" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question201" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question201" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question15">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_15" Value="202" />
                                                            <label id="Label41" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Certified copies of the birth certificates of my children</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label42" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question202" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question202" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question202" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question16">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_16" Value="203" />
                                                            <label id="Label44" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Proof of address of parents who reside in Australia</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label45" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question203" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question203" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question203" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 100px;">
                                        <div id="progress5" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnPotential" runat="server" Text="Upload Potential Documents" CssClass="btn btn-success" OnClientClick="return validatePotentialDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div id="ImmigrationHistory" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Immigration History</b>:</h5>

                                        <div runat="server" id="question17">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_17" Value="205" />
                                                            <label id="Label47" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Evidence of the current visa I have for <%=Country_I_am_applying_to_Study %></label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label48" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question205" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question205" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question205" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question18">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_18" Value="206" />
                                                            <label id="Label50" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Details of Immigration History</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label51" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question206" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question206" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question206" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 100px;">
                                        <div id="progress6" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnImmigration" runat="server" Text="Upload Immigration Documents" CssClass="btn btn-success" OnClientClick="return validateImmigrationDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div id="visarequirements" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Knowledge of student visa requirements and conditions for <%=Country_I_am_applying_to_Study %></b>:</h5>

                                        <div runat="server" id="question19">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_19" Value="208" />
                                                            <label id="Label53" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label">Copy of the independently verified GTE Certification Test Certificate</label>
                                                            <div class="col-md-5">
                                                                <asp:Label ID="Label54" runat="server" />
                                                                <asp:FileUpload ID="FileUpload_question208" runat="server" />
                                                                <asp:HiddenField ID="HidDocPath_question208" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question208" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>

                                    <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 100px;">
                                        <div id="progress" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;">
                                            <div class="status" style="margin-left: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnvisaDocument" runat="server" Text="Upload visa Documents" CssClass="btn btn-success" OnClientClick="return validatevisaDocument()" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
            </div>
            <div id="page-nav" class="col-lg-auto page-nav">

                <div class="container page__container">
                    <div class="footer">
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script>      
       
        function showprogressbar(progressbarID, btn ,formData) {

            $("#"+btn).attr("disabled", "true");
            $("#" + progressbarID + "").removeClass("hide");
            //$("#" + progressbarDiv + "").removeAttr("style");
            var progressEle = $("#"+progressbarID+"");
            progressEle.css("background-color", "red");

            //var formData = new FormData();
            //var data = $("#ContentPlaceHolder1_avatar")[0].files[0];

            //formData.append("files", data);

            var dummyProgress = 1;
            var intervalId = -1;
            var req = new XMLHttpRequest();

            req.upload.addEventListener("progress", function (event) {

                var percent = (event.loaded / event.total) * 90;
                var progress = Math.round((event.loaded / event.total) * 90);
                console.log("progress:" + progress);
                if (progress < 90) {
                    $(".status").html(progress + "%");
                    progressEle.width(progress + "%");
                }
                else {
                    progress = progress + dummyProgress;
                    if (progress <= 99) {
                        $(".status").html(progress + "%");
                        progressEle.width(progress + "%");
                    }
                    if (intervalId == -1) {
                        intervalId = setInterval(function () {
                            progress = progress + dummyProgress;
                            dummyProgress++;
                            if (progress <= 99) {
                                $(".status").html(progress + "%");
                                progressEle.width(progress + "%");
                            }
                            else
                                clearInterval(intervalId);
                        }, 2500);
                    }
                }
            });
            req.onreadystatechange = function () {
                     var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                if (req.status && req.status == 200 && (req.readyState == 4)) {
                    $("#"+btn).removeAttr("disabled");
                        alert("Upload successfully.");
                        location.replace(hostName + "gte_supportingdocument.aspx");
                    }
                }

                req.open("POST", 'gte_supportingdocument.aspx/uploadVideo', true);
                req.send(formData);
        }
        function checkFileSize(filename) {
            var fileSize = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 100);
        }
        function validfileExtention(filepath, msg, hiddenpath) {
            if (filepath == "")
                filepath = hiddenpath;
             if (filepath == "") {
                 alert("Please select "+msg);
                 return false;
             }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
             if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf") {
                 alert("Upload valid file. format should be .jpg,.png,.pdf");
                 return false;
             }             
             else
                return true;
        }
        function validateImmigrationDocument() {
             var flag = false;

            if (!$("#<%=question17.ClientID%>").is(':hidden') && $("#<%=FileUpload_question205.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question205.ClientID%>").val(), "Evidence of the current visa I have for", $("#<%=HidDocPath_question205.ClientID%>").val())) { }
            else if (!$("#<%=question18.ClientID%>").is(':hidden')&& $("#<%=FileUpload_question206.ClientID%>").val() != "" &&!validfileExtention($("#<%=FileUpload_question206.ClientID%>").val(), "Details of Immigration History",$("#<%=HidDocPath_question206.ClientID%>").val())) { }           
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 205; i <= 206; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress6", "ContentPlaceHolder1_btnImmigration" ,formData)
            }
            return false; 
        }

        function validatePotentialDocument() {
            var flag = false;

            if (!$("#<%=question13.ClientID%>").is(':hidden') && $("#<%=FileUpload_question200.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question200.ClientID%>").val(), "A certified copy of my marriage certificate",$("#<%=HidDocPath_question200.ClientID%>").val())) { }
            else if (!$("#<%=question14.ClientID%>").is(':hidden')&& $("#<%=FileUpload_question201.ClientID%>").val()!="" && !validfileExtention($("#<%=FileUpload_question201.ClientID%>").val(), "Evidence of my relationship with my de facto partner",$("#<%=HidDocPath_question201.ClientID%>").val())) { }
            else if (!$("#<%=question15.ClientID%>").is(':hidden')&&$("#<%=FileUpload_question202.ClientID%>").val()!="" && !validfileExtention($("#<%=FileUpload_question202.ClientID%>").val(), "Certified copies of the birth certificates of my children",$("#<%=HidDocPath_question202.ClientID%>").val())) { }
            else if (!$("#<%=question16.ClientID%>").is(':hidden') && $("#<%=FileUpload_question203.ClientID%>").val()!=""  && !validfileExtention($("#<%=FileUpload_question203.ClientID%>").val(), "Proof of address of parents who reside in Australia",$("#<%=HidDocPath_question203.ClientID%>").val())) { }
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 200; i <= 203; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress5", "ContentPlaceHolder1_btnPotential" ,formData)
            }
            return false; }

        function validatevisaDocument() { var flag = false;

            if (!$("#<%=question19.ClientID%>").is(':hidden')&& $("#<%=FileUpload_question208.ClientID%>").val()!=""  && !validfileExtention($("#<%=FileUpload_question208.ClientID%>").val(), "Copy of the independently verified GTE Certification Test Certificate",$("#<%=HidDocPath_question208.ClientID%>").val())) { }
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 208; i <= 208; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress", "ContentPlaceHolder1_btnvisaDocument" ,formData)
            }
            return false;}

        function validateIdentityDocument() {
            var flag = false;

            if ($("#<%=FileUpload_question183.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question183.ClientID%>").val(), "copy of the bio page of my passport",$("#<%=HidDocPath_question183.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question184.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question184.ClientID%>").val(), "certified copy of my birth certificate",$("#<%=HidDocPath_question184.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question185.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question185.ClientID%>").val(), "copy of my Drivers Licence",$("#<%=HidDocPath_question185.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question186.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question186.ClientID%>").val(), "copy of my National Identity Card",$("#<%=HidDocPath_question186.ClientID%>").val())) { }
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 183; i <= 186; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress1", "ContentPlaceHolder1_btn_identity" ,formData)
            }
            return false;
        }
        function validatePreviousstudyDocument() {
            var flag = false;

            if ($("#<%=FileUpload_question188.ClientID%>").val()!="" && !validfileExtention($("#<%=FileUpload_question188.ClientID%>").val(), "Copies of my Education Certificate(s) (Degree, Diploma etc.)",$("#<%=HidDocPath_question188.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question189.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question189.ClientID%>").val(), "Certified copies of my academic transcripts from previous studies",$("#<%=HidDocPath_question189.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question190.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question190.ClientID%>").val(), "The most recent copy of my curriculum vitae or résumé",$("#<%=HidDocPath_question190.ClientID%>").val())) { }
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 188; i <= 190; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress2", "ContentPlaceHolder1_btnpreviousdoc" ,formData)
            }
            return false;
        }
        function validateEmploymentDocument()  {
            var flag = false;

            if (!$("#<%=question8.ClientID%>").is(':hidden') && $("#<%=FileUpload_question193.ClientID%>").val()!= "" && !validfileExtention($("#<%=FileUpload_question193.ClientID%>").val(), "Proof of Current Employment ",$("#<%=HidDocPath_question193.ClientID%>").val())) { }
            else if (!$("#<%=question9.ClientID%>").is(':hidden') && $("#<%=FileUpload_question194.ClientID%>").val()!= "" &&!validfileExtention($("#<%=FileUpload_question194.ClientID%>").val(), "Proof of Future Employment or Employment Opportunities",$("#<%=HidDocPath_question194.ClientID%>").val())) { }            
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 193; i <= 194; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress4", "ContentPlaceHolder1_btnEmploymentDoc" ,formData)
            }
            return false;
        }
        function validatetiesresidenceDocument() {
         var flag = false;

            if ($("#<%=FileUpload_question196.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question196.ClientID%>").val(), "Evidence that my spouse/parents/sponsor are willing to support me and they have an annual income of at least AUD 73,000 ",$("#<%=HidDocPath_question196.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question197.ClientID%>").val()!= "" && !validfileExtention($("#<%=FileUpload_question197.ClientID%>").val(), "Bank statement with sufficient funds to cover my travel costs and 12 months of living and tuition fees for me and any accompanying family members and school costs for any school aged dependants",$("#<%=HidDocPath_question197.ClientID%>").val())) { }
            else if ($("#<%=FileUpload_question198.ClientID%>").val() != "" && !validfileExtention($("#<%=FileUpload_question198.ClientID%>").val(), "Evidence of ownership of assets in home country or country of residence",$("#<%=HidDocPath_question198.ClientID%>").val())) { }
            else
                flag = true;
            if (flag == true) {
                var formData = new FormData(); 
                var data;
                for (var i = 196; i <= 198; i++)
                {
                    if ($("#ContentPlaceHolder1_FileUpload_question" + i).val() != "") {
                        data = $("#ContentPlaceHolder1_FileUpload_question" + i)[0].files[0];
                        formData.append("doc_id", i);
                        formData.append("files", data);
                    }
                }               

                showprogressbar("progress3", "ContentPlaceHolder1_btntiesresidence" ,formData)
            }
            return false;}

        
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#DocumentsUpload').addClass('active');
        });
    </script>
</asp:Content>
