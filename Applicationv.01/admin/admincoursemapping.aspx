<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admincoursemapping.aspx.cs" Inherits="admin_coursemapping" MasterPageFile="~/admin/admin.master" %>

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

        #tabs {
            background: transparent;
            color: #000;
        }

            #tabs h6.section-title {
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
            <li class="breadcrumb-item active">Course Master</li>
        </ol>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">



                    <!-- Tabs -->
                    <section id="tabs" style="margin-top: -65px;">
                        <div class="container">
                            <div class="row" id="divselecttype">
                                <asp:RadioButtonList ID="rblselecttype" CssClass="seletvale" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Online" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Short" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Institution" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Class" Value="4"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="row">
                                <div class="col-md-12 " id="divAllTab" style="display: none">
                                    <nav>
                                        <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-BASIC" role="tab" aria-controls="nav-home" aria-selected="true">BASIC</a>
                                            <a class="nav-item nav-link" id="nav-stat-tab" data-toggle="tab" href="#nav-CATEGORISATION" role="tab" aria-controls="nav-stat" aria-selected="false">CATEGORISATION</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-DESCRIPTION" role="tab" aria-controls="nav-contact" aria-selected="false">DESCRIPTION</a>
                                            <a class="nav-item nav-link" id="nav-adminssion-tab" data-toggle="tab" href="#nav-FEEANDDATES" role="tab" aria-controls="nav-adminssion" aria-selected="false">FEE & DATES</a>
                                            <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-FUNDING" role="tab" aria-controls="nav-about" aria-selected="false">FUNDING</a>
                                            <a class="nav-item nav-link" id="nav-five-tab" data-toggle="tab" href="#nav-INSTRUCTOR" role="tab" aria-controls="nav-five" aria-selected="false">INSTRUCTOR(S)</a>
                                            <a class="nav-item nav-link" id="nav-six-tab" data-toggle="tab" href="#nav-POLICIES" role="tab" aria-controls="nav-six" aria-selected="false">POLICIES</a>
                                            <a class="nav-item nav-link" id="nav-six-tab" data-toggle="tab" href="#nav-PROMOTION" role="tab" aria-controls="nav-six" aria-selected="false">PROMOTION</a>
                                            <a class="nav-item nav-link" id="nav-six-tab" data-toggle="tab" href="#nav-REQUIREMENT" role="tab" aria-controls="nav-six" aria-selected="false">REQUIREMENT(S)</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-BASIC" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="Divtab1">
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Course Type</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlCourseType" name="gtesubscription" runat="server" class="form-control ddlCourseType">
                                                                    <asp:ListItem Selected="True" Value="0" Text="Select"></asp:ListItem>
                                                                    <asp:ListItem Text="Online" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Short" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Institution" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="Class" Value="4"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution" style="display: none">
                                                        <label for="uniName" class="col-sm-3 col-form-label form-label">Source</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:DropDownList runat="server" ID="ddlSource" AppendDataBoundItems="true" class="form-control">
                                                                        <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniName" class="col-sm-3 col-form-label form-label">Partner Course</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtPartnerCourseID" type="text" runat="server" class="form-control" placeholder="Partner Course" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniName" class="col-sm-3 col-form-label form-label">Course Name</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtCourseName" type="text" runat="server" class="form-control" placeholder="Course Name" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniName" class="col-sm-3 col-form-label form-label">Provided By (Institution Name)</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:DropDownList ID="ddlProvidedByInstitutionName" type="text" runat="server" AppendDataBoundItems="true" class="form-control" placeholder="Course Name">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniName" class="col-sm-3 col-form-label form-label">Short Description</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtShortDescription" MaxLength="250" type="text" runat="server" class="form-control" placeholder="Short Description" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">Active Status</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:RadioButtonList ID="rblActiveStatus" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="No">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniContactPerson" class="col-sm-3 col-form-label form-label">Instruction(s)</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtInstruction" type="text" runat="server" class="form-control" placeholder="Instruction(s)" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                        <label for="uniEmail" class="col-sm-3 col-form-label form-label">Instruction(s) File</label>
                                                        <div class="col-sm-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtInstructionFile" runat="server" class="form-control" placeholder="Instruction" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-CATEGORISATION" role="tabpanel" aria-labelledby="nav-stat-tab">
                                            <div id="Divtab2" runat="server">
                                                <div class="form-group row ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Mode</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlModel" CssClass="form-control" AppendDataBoundItems="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Type</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control" AppendDataBoundItems="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Broad Field of Study </label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" RepeatColumns="2" Font-Size="Small" name="chkBroadFieldofStudy" ID="chkBroadFieldofStudy">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Narrow Field of Study</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList ID="chkNarrowFieldofStudy" RepeatColumns="2" Font-Size="Small" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Detailed Field of Study</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkDetailedFieldofStudy" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniType" class="col-sm-3 col-form-label form-label">Major Discipline</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkMajorDiscipline" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniYearEstablish" class="col-sm-3 col-form-label form-label">Level of Study</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkLevelofStudy" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniSDescription" class="col-sm-3 col-form-label form-label">Skills</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkSkills" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Abilities</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkAbilities" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Work Activities</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkWorkActivities" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Major Field of Careers</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkMajorFieldofCareers" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Minor Field of Careers</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkMinorFieldofCareers" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Broad Field of Careers</label>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:CheckBoxList runat="server" ID="chkBroadFieldofCareers" RepeatColumns="2" Font-Size="Small">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none">
                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Grade</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtGrade" type="text" runat="server" class="form-control" placeholder="Grade" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none">
                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Group</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtGroup" type="text" runat="server" class="form-control" placeholder="Group" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none">
                                                    <label for="uniLDescription" class="col-sm-3 col-form-label form-label">Subject</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtSubject" type="text" runat="server" class="form-control" placeholder="Subject" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-DESCRIPTION" role="tabpanel" aria-labelledby="nav-contact-tab">
                                            <div id="Divtab3" runat="server">
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Course Image</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpCourseImage" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Course Audio/Video</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpCourseAudioVideo" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Course Brochure</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpCourseBrochure" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Link to Web Page URL</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtLinktoWebPageURL" class="form-control"  placeholder="Link to Web Page URL"  runat="server" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Number of Students who have taken this Course</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlNumberofStudentsTakenCourse" AppendDataBoundItems="true" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Language(s) this Course is available in</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlLanguageCourseAvailableIn" AppendDataBoundItems="true" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Who is this Course suitable for?
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:CheckBoxList runat="server" ID="chkCourseSuitablefor">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Learning Objectives

                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtLearningObjectives" CssClass="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Main Features
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtMainFeatures" CssClass="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Course Content
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtCourseContent" CssClass="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Long Description
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" TextMode="MultiLine" MaxLength="250" ID="txtLongDescription" CssClass="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Duration    
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">

                                                                <div class="dropdown-lst">
                                                                    <label class="d-lbl">YEARS</label>
                                                                    <asp:DropDownList runat="server" ID="ddlyear" class="form-control">
                                                                        <asp:ListItem Selected="True" Text="Select"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="dropdown-lst">
                                                                    <label class="d-lbl">MONTH</label>
                                                                    <asp:DropDownList runat="server" ID="ddlmonths" AppendDataBoundItems="true" class="form-control">
                                                                        <asp:ListItem Selected="True" Text="Select"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="dropdown-lst">
                                                                    <label class="d-lbl">DAYS</label>
                                                                    <asp:DropDownList runat="server" ID="ddldays" AppendDataBoundItems="true" class="form-control">
                                                                        <asp:ListItem Selected="True" Text="Select"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="dropdown-lst">
                                                                    <label class="d-lbl">HOURS</label>
                                                                    <asp:DropDownList runat="server" ID="ddlhours" AppendDataBoundItems="true" class="form-control">
                                                                        <asp:ListItem Selected="True" Text="Select"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row ShortCourse Institution Class" style="display: none">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Locations(s) / Campus(es) / Branch(es)
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:CheckBoxList runat="server" RepeatColumns="2" Font-Size="Small" ID="chkLocationsCampusBranch">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Average Number of Participants / Class Size
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtAverageNumberParticipantsClassSize" CssClass="form-control Number">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row ShortCourse Institution Class">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Domestic / International / Both
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlDomesticInternationalBoth" AppendDataBoundItems="true" CssClass="form-control">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Housing Available

                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList runat="server" ID="rblHousingAvailable" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Institution Type
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlInstitutionType" AppendDataBoundItems="true" CssClass="form-control">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Institution Setting
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlInstitutionSetting" AppendDataBoundItems="true" CssClass="form-control">

                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Institution Size
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" ID="ddlInstitutionSize" AppendDataBoundItems="true" CssClass="form-control">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Acceptance Rate
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox runat="server" ID="txtAcceptanceRate" CssClass="form-control Number">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Disability Services Available
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList runat="server" ID="rblDisabilityServicesAvailable" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Self-paced
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList runat="server" ID="rblSelfPaced" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Course Outcome(s)
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtCourseOutcome" runat="server" TextMode="MultiLine" MaxLength="250" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Certification Earned
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList runat="server" ID="rblCertificationEarned" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Related pathway courses
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRelatedPathwayCourses" TextMode="MultiLine" runat="server" MaxLength="250" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-FEEANDDATES" role="tabpanel" aria-labelledby="nav-adminssion-tab">
                                            <div id="Divtab4">
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Fee</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtFee" runat="server" class="form-control Number" placeholder="Fee" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Application/Enrollment Fee
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtFeePaymentMode" runat="server" class="form-control Number" placeholder="Application/Enrollment Fee" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Fee Payment Mode(s)
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:CheckBoxList ID="chkFeePaymentMode" class="chkFeePaymentMode" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Funding Available
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblFundingAvailable" runat="server">
                                                                    <asp:ListItem Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="Yes"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Start Date(s) / Intake Date(s)
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtStartDateIntakeDate" type="Date" runat="server" class="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Application Deadline(s)
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtApplicationDeadline" type="Date" runat="server" class="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" id="timezone" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Time Zone
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <select id="dropdownTimeZone" name="timezone" class="form-control">
                                                                    <option value="">Please select</option>
                                                                </select>
                                                                <asp:HiddenField runat="server" ID="hidTimeZone" />
                                                                <%--<asp:DropDownList ID="ddlTimeZone" runat="server" AppendDataBoundItems="true" class="form-control">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Recurrence

                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRecurrence" runat="server" class="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Class Start Time
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtClassStartTime" type="time" runat="server" class="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Class End Time
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtClassEndTime" type="time" runat="server" class="form-control">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">
                                                        Currency
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlCurrency" runat="server" AppendDataBoundItems="true" class="form-control">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-FUNDING" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="Divtab5">
                                                <div class="form-group row online Institution Class" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Eligible for Govt Subsidy</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblEligibleforGovtSubsidy" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Description of Govt Subsidy</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtDescriptionofGovtSubsidy" TextMode="MultiLine" class="form-control" runat="server">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Eligible for Scholarship(s)</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblEligibleforScholarship" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row online Institution" style="display: none;">
                                                    <label for="uniAffiliation" class="col-sm-3 col-form-label form-label">Scholarship(s) Available</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlScholarshipAvailable" AppendDataBoundItems="true" class="form-control" runat="server">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="tab-pane fade" id="nav-INSTRUCTOR" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="Divtab6">
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 1 Image / Programme Director Image</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpInstructorDirectorImage1" CssClass="imgvaid" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 1 Name / Programme Director Name</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorName1" MaxLength="80" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 1 Description / Programme Director Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorDescription1" MaxLength="150" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 2 Image</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpInstructorDirectorImage2" CssClass="imgvaid" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 2 Name</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorName2" MaxLength="80" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 2 Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorDescription2" MaxLength="150" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 3 Image </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpInstructorDirectorImage3" CssClass="imgvaid" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 3 Name </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorName3" MaxLength="80" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 3 Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorDescription3" MaxLength="150" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 4 Image </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpInstructorDirectorImage4" CssClass="imgvaid" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 4 Name </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorName4" MaxLength="80" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 4 Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorDescription4" MaxLength="150" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 5 Image </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="fpInstructorDirectorImage5" CssClass="imgvaid" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 5 Name </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorName5" MaxLength="80" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Instructor 5 Description</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtInstructorDirectorDescription5" MaxLength="150" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-POLICIES" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="DivTab7">
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Deferral Policy</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtDeferralPolicy" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">
                                                        Offer Acceptance / Rejection Policy
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtOfferAcceptanceRejectionPolicy" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse  Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Cancellation Policy</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtCancellationPolicy" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">

                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Refund Policy</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRefundPolicy" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-PROMOTION" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="DivTab8">
                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Promotion Tag #1</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtPromotionTag1" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Promotion Tag #2</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtPromotionTag2" TextMode="MultiLine" MaxLength="250" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-REQUIREMENT" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div id="DivTab9">
                                                <div class="form-group row online ShortCourse Institution Class" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Requirements</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtRequirements" TextMode="MultiLine" MaxLength="500" class="form-control" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row Institution " style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Level of study to be completed</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlLevelStudyCompleted" AppendDataBoundItems="true" class="form-control" runat="server">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution " style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Select base qualification country</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlSelectBaseQualificationCountry" class="form-control" AppendDataBoundItems="true" runat="server">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Select qualification level</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:DropDownList ID="ddlSelectQualificationLevel" class="form-control" AppendDataBoundItems="true" runat="server">
                                                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Subject qualification </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblSubjectQualification" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">subject & grade</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtSubjectAndGrade" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Add more subjects & grades </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtMoreSubjectsAndGrades" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">English language competency </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblEnglishLanguageCompetency" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Acceptable english qualifications </label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtAcceptableEnglishQualifications" class="form-control" runat="server">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">English language competency level</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtEnglishLanguageCompetencyLevel" class="form-control" runat="server">
                                                                </asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Graduate admission test</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblGraduateAdmissionTest" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Graduate admissions tests required & min grades</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtSelectGraduateAdmissionsTestsMinGrades" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Is an interview</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:RadioButtonList ID="rblIsInterview" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group row  Institution" style="display: none;">
                                                    <label for="uniSubscribeGte" class="col-sm-3 col-form-label form-label">Details of interview, if answer above is yes</label>
                                                    <div class="col-sm-8">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="txtDetailsOfInterview" runat="server" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group row btnsave" style="display: none;">
                                <div class="col-sm-8 offset-sm-3">
                                    <div class="media align-items-center">
                                        <div class="media-left">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm();" />
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- ./Tabs -->




                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <script type="text/javascript">
        init();
        function validateUploadedimg(filepath) {
            if (filepath == "") {
                alert("Please upload a file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "jpeg" && fileExtension != "png") {
                alert("Invalid file. Please select file of type jpg, jpeg,png");
                return false;
            }

            return true;
        }
        function validateUploadedimg2(filepath) {
            if (filepath != "") {
                var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (fileExtension != "jpg" && fileExtension != "jpeg" && fileExtension != "png") {
                    alert("Invalid file. Please select file of type jpg, jpeg,png");
                    return false;
                }
            }

            return true;
        }
        function validateUploadedAudioVideo(filepath) {
            if (filepath != "") {
                var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (fileExtension != "MP3" && fileExtension != "MP4" && fileExtension != "FAC") {
                    alert("Invalid file. Please select file of type MP3, MP4,FAC");
                    return false;
                }
            }

            return true;
        }
        function validateForm() {
            debugger;
            var flag = false;
            if (($('#<%=ddlCourseType.ClientID %> option:selected').val() == 0)) {
                alert("Please select CourseType");
            }
            else if (($('#<%=ddlSource.ClientID %> option:selected').val() == 0) && $('#<%=ddlCourseType.ClientID %> option:selected').val() != 4) {
                alert("Please select Source");
            }
            else if (($('#<%=txtPartnerCourseID.ClientID %>').val() == '')) {
                alert("Please Enter Partner Course");
            }

            else if (($('#<%=txtCourseName.ClientID %>').val() == '')) {
                alert("Please enter Partner Course Name");
            }

            else if (($('#<%=ddlProvidedByInstitutionName.ClientID %> option:selected').val() == 0)) {
                alert("Please select Institution Name");
            }
            else if ($('#ContentPlaceHolder1_rblActiveStatus_1:checked').val() == undefined && $('#ContentPlaceHolder1_rblActiveStatus_0:checked').val() == undefined) {
                alert("Please select Active / Not Active Status");
            }
            else if (($('#<%=ddlLanguageCourseAvailableIn.ClientID %> option:selected').val() == 0)) {
                alert("Please select Language(s) this Course is available in");
            }
            else if (($('#<%=ddlModel.ClientID %> option:selected').val() == 0) && ($('#<%=ddlCourseType.ClientID %> option:selected').val() != 1)) {
                alert("Please select Mode");
            }
            else if (($('#<%=ddlType.ClientID %> option:selected').val() == 0) && $('#<%=ddlCourseType.ClientID %> option:selected').val() != 1) {
                alert("Please select Type");
            }
            else if (!validateCheckBoxList("#<%=chkBroadFieldofStudy.ClientID%>")) {
                alert("Please Select Broad Field of Study");
            }
            else if (!validateCheckBoxList("#<%=chkNarrowFieldofStudy.ClientID%>")) {
                alert("Please Select Narrow Field of Study");
            }
            else if (!validateCheckBoxList("#<%=chkDetailedFieldofStudy.ClientID%>")) {
                alert("Please Select Detailed Field of Study");
            }
            else if (($('#<%=txtGrade.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Grade");
            }
            else if (($('#<%=txtGroup.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Group");
            }
            else if (($('#<%=txtSubject.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Subject");
            }

            else if ($("#<%=fpCourseImage.ClientID%>").val() != "" && !validateUploadedimg($("#<%=fpCourseImage.ClientID%>").val())) { }
            else if (!validateUploadedimg2($("#<%=fpCourseBrochure.ClientID%>").val())) {
            }

            else if (!validateUploadedimg2($("#<%=fpInstructorDirectorImage1.ClientID%>").val())) {
            }
            else if (!validateUploadedimg2($("#<%=fpInstructorDirectorImage2.ClientID%>").val())) {
            }
            else if (!validateUploadedimg2($("#<%=fpInstructorDirectorImage3.ClientID%>").val())) {
            }
            else if (!validateUploadedimg2($("#<%=fpInstructorDirectorImage4.ClientID%>").val())) {
            }
            else if (!validateUploadedimg2($("#<%=fpInstructorDirectorImage5.ClientID%>").val())) {
            }
            else if (!validateUploadedAudioVideo($("#<%=fpCourseAudioVideo.ClientID%>").val())) {
            }

            else if (($('#<%=ddlyear.ClientID %> option:selected').text() == 'Select')) {
                alert("Please select Year");
            }
            else if (($('#<%=ddlmonths.ClientID %> option:selected').text() == 'Select')) {
                alert("Please select months");
            }
            else if (($('#<%=ddldays.ClientID %> option:selected').text() == 'Select')) {
                alert("Please select days");
            }
            else if (($('#<%=ddlhours.ClientID %> option:selected').text() == 'Select')) {
                alert("Please select hours");
            }
            else if (($('#<%=txtFee.ClientID %>') == '')) {
                alert("Please Enter Fee");
            }
            else if ((!validateCheckBoxList("#<%=chkFeePaymentMode.ClientID%>")) && ($('#<%=ddlCourseType.ClientID %> option:selected').val() != 1)) {
                alert("Please Select Fee Payment Mode");
            }

          <%--  else if (($('#<%=ddlDomesticInternationalBoth.ClientID %> option:selected').val() == 0) && $('#<%=ddlCourseType.ClientID %> option:selected').val() != 1) {
                alert("Please select Domestic / International / Both");
            }--%>
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblFundingAvailable']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please select Funding Available");
            }
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblHousingAvailable']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please select Housing Available");
            }
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblDisabilityServicesAvailable']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please select Disability Services Available");
            }

            else if ($("input[name='ctl00$ContentPlaceHolder1$rblSelfPaced']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 1) {
                alert("Please select Self Paced");
            }
            else if (($('#<%=txtStartDateIntakeDate.ClientID %>').val() == '')) {
                alert("Please Select Start Date IntakeDate");
            }
            else if (($('#<%=txtApplicationDeadline.ClientID %>').val() == '')) {
                alert("Please Enter Application Deadline");
            }
            else if (($('#<%=txtDeferralPolicy.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please Enter Deferral Policy");
            }
            else if (($('#<%=txtOfferAcceptanceRejectionPolicy.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please Enter Offer Acceptance / Rejection Policy");
            }
            else if (($('#<%=txtCancellationPolicy.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() != 3) {
                alert("Please Enter Cancellation Policy");
            }
            else if (($('#<%=txtRefundPolicy.ClientID %>').val() == '')) {
                alert("Please Enter Cancellation Policy");
            }
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblCertificationEarned']:checked").val() == undefined) {
                alert("Please select Certification Earned");
            }


            else if (!validateCheckBoxList("#<%=chkMajorDiscipline.ClientID%>"))  {
                alert("Please Select Major Discipline");
            }
            else if (!validateCheckBoxList("#<%=chkLevelofStudy.ClientID%>")) {
                alert("Please Select Level of Study");
            }
            else if (!validateCheckBoxList("#<%=chkSkills.ClientID%>")) {
                alert("Please Select Skills");
            }
            else if (!validateCheckBoxList("#<%=chkAbilities.ClientID%>"))  {
                alert("Please Select Abilities");
            }
            else if (!validateCheckBoxList("#<%=chkWorkActivities.ClientID%>"))  {
                alert("Please Select Work Activities");
            }
            else if (!validateCheckBoxList("#<%=chkMajorFieldofCareers.ClientID%>"))  {
                alert("Please Select Major Field of Careers");
            }
            else if (!validateCheckBoxList("#<%=chkMinorFieldofCareers.ClientID%>")) {
                alert("Please Select Minor Field of Careers");
            }
            else if (!validateCheckBoxList("#<%=chkBroadFieldofCareers.ClientID%>"))  {
                alert("Please Select Broad Field of Careers");
            }
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblEligibleforGovtSubsidy']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() != 2) {
                alert("Please select Eligible for Govt Subsidy");
            }
            else if (($('#<%=txtRequirements.ClientID %>').val() == '')) {
                alert("Please Enter Requirement(s)");
            }
            else if ($("input[name='ctl00$ContentPlaceHolder1$rblIsInterview']:checked").val() == undefined && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 3) {
                alert("Please select Is an interview required");
            }


            else if (($('#<%=txtRecurrence.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Recurrence");
            }
            else if (($('#<%=txtClassStartTime.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Class Start Time");
            }
            else if (($('#<%=txtClassEndTime.ClientID %>').val() == '') && $('#<%=ddlCourseType.ClientID %> option:selected').val() == 4) {
                alert("Please Enter Class End Time");
            }

           <%-- else if ($('#<%=ddlCurrency.ClientID %> option:selected').val() == 0) {
                alert("Please Select Currency");
            }--%>
            else
                flag = true;

            return flag;
        }

        function validateCheckBoxList(id) {
            var isAnyCheckBoxChecked = false;
            var dy_name = id + " input[type='checkbox']";
            $(dy_name).each(function (i, item) {
                if ($(item).is(':checked')) {
                    isAnyCheckBoxChecked = true;
                    return true;
                }
            });

            return isAnyCheckBoxChecked;
        }
        function loadTimeZoneList() {
            let select = $("#dropdownTimeZone");
            $(select).empty();
            select.append(
                $('<option></option>').val("").html("Please Select")
            );
            let timeZones = moment.tz.names();
            timeZones.forEach((timeZone) => {
                select.append(
                    $('<option></option>').val(timeZone).html(`${timeZone} (GMT${moment.tz(timeZone).format('Z')})`)
                );
            });
            
        }
        function init() {
            loadTimeZoneList();
        }

        function bydefaultcheck(broadID, Ischeck) {
            $.ajax({
                type: "POST",
                url: "admincoursemapping.aspx/GetNarrow",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'broadID': '" + broadID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                        for (var i = 0; i < result.length; i++) {
                            for (var y = 0; y < 71; y++) {
                                if ($("#ContentPlaceHolder1_chkNarrowFieldofStudy_" + y + "").val() == result[i].id) {
                                    if (Ischeck == true) {
                                        $("#ContentPlaceHolder1_chkNarrowFieldofStudy_" + y + "").prop("checked", true);
                                        $("#ContentPlaceHolder1_chkNarrowFieldofStudy_" + y + "").removeAttr("disabled");
                                        byDeafultCheckDetailed(result[i].id, true);
                                    }
                                    else {
                                        $("#ContentPlaceHolder1_chkNarrowFieldofStudy_" + y + "").prop("checked", false);
                                        $("#ContentPlaceHolder1_chkNarrowFieldofStudy_" + y + "").prop("disabled", "disabled");
                                        byDeafultCheckDetailed(result[i].id, false);
                                    }
                                }
                            }
                        }
                    }
                }
            });
        }
        function byDeafultCheckDetailed(narrowID, Ischeck) {
            $.ajax({
                type: "POST",
                url: "admincoursemapping.aspx/GetDetailed",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'narrowID': '" + narrowID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                        for (var i = 0; i < result.length; i++) {
                            for (var y = 0; y < 356; y++) {
                                if ($("#ContentPlaceHolder1_chkDetailedFieldofStudy_" + y + "").val() == result[i].id) {
                                    if (Ischeck == true) {
                                        $("#ContentPlaceHolder1_chkDetailedFieldofStudy_" + y + "").prop("checked", true);
                                        $("#ContentPlaceHolder1_chkDetailedFieldofStudy_" + y + "").removeAttr("disabled");
                                    }
                                    else {
                                        $("#ContentPlaceHolder1_chkDetailedFieldofStudy_" + y + "").prop("checked", false);
                                        $("#ContentPlaceHolder1_chkDetailedFieldofStudy_" + y + "").prop("disabled", "disabled");
                                    }
                                }
                            }
                        }

                    }
                }
            });
        }

        //$('#ContentPlaceHolder1_txtStartDateIntakeDate').datepicker({ minDate: new Date(), dateFormat: 'yy-mm-dd' });

        $(document).ready(function () {




            $(".Number").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $("#<%=chkBroadFieldofStudy.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
                var BroadID = $(this).val();

                if ($(this).is(':checked')) {
                    bydefaultcheck(BroadID, true);
                }
                else {
                    bydefaultcheck(BroadID, false);
                }
            });
            $("#<%=chkNarrowFieldofStudy.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
                var narrowID = $(this).val();

                if ($(this).is(':checked')) {
                    byDeafultCheckDetailed(narrowID, true);
                }
                else {
                    byDeafultCheckDetailed(narrowID, false);
                }
            });

            // $('#ContentPlaceHolder1_txtClassStartTime').datepicker({ minDate: new Date(), dateFormat: 'yy-mm-dd' });
            $(".seletvale").change(function (e) {
                debugger;
                var rblSelectedValue = $(".seletvale input:checked").val();
                if (rblSelectedValue == undefined) {
                    $("#divAllTab").css('display', 'none');
                }
                else {
                    $("#divselecttype").css('display', 'none');
                    $(".form-group").css('display', 'none');
                    $(".btnsave").css('display', 'block');
                    $("#divAllTab").css('display', 'block');
                    if (rblSelectedValue == "1") {
                        $(".online").css('display', 'block');
                    }
                    if (rblSelectedValue == "2") {

                        $(".ShortCourse").css('display', 'block');
                    }
                    if (rblSelectedValue == "3") {
                        $(".Institution").css('display', 'block');
                    }
                    if (rblSelectedValue == "4") {
                        $(".Class").css('display', 'block');
                    }
                    $('.ddlCourseType').val(rblSelectedValue);
                   // $('#<%=ddlCourseType.ClientID %>').val() = rblSelectedValue;
                }
            });
            $("#<%=ddlCourseType.ClientID%>").change(function (e) {
                $(".form-group").css('display', 'none');
                $(".btnsave").css('display', 'block');

                if ($('#<%=ddlCourseType.ClientID %> option:selected').val() == "1") {
                    $(".online").css('display', 'block');
                }
                else if ($('#<%=ddlCourseType.ClientID %> option:selected').val() == "2") {
                    $(".ShortCourse").css('display', 'block');
                }
                else if ($('#<%=ddlCourseType.ClientID %> option:selected').val() == "3") {
                    $(".Institution").css('display', 'block');
                }
                else if ($('#<%=ddlCourseType.ClientID %> option:selected').val() == "4") {
                    $(".Class").css('display', 'block');
                }
            });
        });



    </script>
</asp:Content>
