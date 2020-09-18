<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="col-lg container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="h2">WELCOME
            <asp:Label runat="server" ID="isfullservicethenlbl"></asp:Label></h1>

        <div class="row">
            <div class="col-lg-12">
                <div class="card">

                    <div id="defaultinstructions" runat="server" style="display: none">                        
                        <div class="card-body">
                            <h4> The World's first AI driven, turnkey student application & offer management solution, with integrated conversion optimization services</h4>
                            <h3>KEY FEATURES:</h3>
                        </div>
                        <div>
                            <ul>
                                <li>Private label application & offer management solution</li>
                                <br>
                                <li>Multilingual, fully customizable, flexible integration</li>
                                <br>
                                <li>Enhanced student experience and advocacy </li>
                                <br>
                                 <li>AI Driven - Smart forms, Real-time clarification & more</li>
                                <br>
                                <li>Criteria based course selection & recommendation</li>
                                <br>
                                <li>Integrated micro-conversion optimization module </li>
                                <br>
                                <li>Integrated offer management & acceptance module   </li>
                                <br>
                                <li>High quality student data & drill down data analysis   </li>
                                <br>
                                <li>Add-ons: GTE (AU only)/Scholarship/SOP/Fee pay  </li>
                                <br>
                                <li>Full suite document validation services*    </li>
                                <br>
                                <li>Worldwide toll-free Application Concierge*   </li>
                                <br>
                                <li>Full suite, Private label VISA and student services*</li>
                            </ul>   
                            <ul>
                                <li>
                                    <b>Enhance Student & Agent experience  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Generate Instant / one-touch offers </b>
                                </li>
                                <br>
                                <li>
                                    <b>Increase student conversion levels  </b>
                                </li>
                                <br>
                                <li>
                                    <b>Save costs and time. Consistent service </b>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="service_gte_instructions" runat="server" style="display: none">                        
                        <div class="card-body">
                            <h4>Industry's first and the World's leading Artificial Intelligence driven Genuine Student Training & Evaluation, Documents Verification and Student Visa Services</h4>
                            <h3>GTE FOR INSTITUTIONS:  </h3>                       
                            <ul>
                                <li>Reduce the time taken for Genuine Student (GS) & Genuine Temporary Entrant (GTE) assessments by 70%.</li><br>
                                <li>Save recruitment costs,</li><br>
                                <li>Reduce visa refusal rates and visa cancellations,</li><br>
                                <li>Grow share of genuine students and increase retention.</li><br>
                                <li>Help save time and costs for your agents,</li> <br>
                                <li>Increase student satisfaction and convert better</li>
                              </ul> 

                             <h3>GTE FOR AGENTS:  </h3>                       
                            <ul>
                                <li>Increase success rates of course and visa applications</li><br>
                                <li>Enhance student experience, grow trust and credibility,</li><br>
                                <li>Reduce turnaround times in getting offers</li><br>
                                <li>Leverage digitization to expand your market, reduce fixed costs, save time & focus on marketing,</li><br>
                                <li>Build new income stream & enhances your cash flows</li> <br>
                              </ul> 

                             <h3>GTE FOR STUDENTS: </h3>                       
                            <ul>
                                <li>Use GTE DIRECT to produce better quality course and visa applications, faster and with less effort</li><br>                                
                              </ul> 
                        </div>

                    </div>
                    <%--instruction for service = 2 exammodule--%>
                    <div id="service2_instructions" runat="server" style="display: none">                        
                        <div class="card-body">
                             <h4>Welcome to the World’s most versatile online testing and proctoring platform, which is the simplest to set up and use.</h4>
                            <h3>KEY FEATURES:</h3>
                        </div>
                        <div>
                            <ul>
                                <li>Go digital in 5 minutes: Simply scan and upload your existing exam paper, students can use an online live webpage editor and screen capture tools to complete the exam OR hand write their answers use an dynamic on screen QR code to scan and upload answers using their mobile phone. Teachers use Acrobat DC for checking answer sheets.</li><br>
                                <li>Modular solution: Create Assessment, Schedule Assessment, Assign Assessments, Checker Assignment, Results Publishing, available in modular format.</li><br>
                                <li>Versatile questions bank builder: Beyond the “Go Digital in 5 Minutes” tool, the system offers a versatile eQuestions bank builder allowing for handling of all types of objective and subjective questions.</li><br>
                                <li>Live remote proctoring: Remote live proctoring solution, allows Institutions to set up and assign their own proctors. 100% live recording of sessions with best in class security. </li><br>
                                <li>Integrated checking module: Independent checker assignment module, Checker friendly processes. Auto checking and marking for objective questions.</li><br>
                                <li>Integrated student results view: Automated notifications to students once examiner completes checking and marking. Online results and viewing of checker comments & answer sheets released online on scheduled time.</li><br>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {       
            var isfullservice = '<%=isfullservice%>';
            if (isfullservice == 0)
                $("#<%=service_gte_instructions.ClientID%>").show();
            else if (isfullservice == 2)
                $("#<%=service2_instructions.ClientID%>").show();
            else
                $("#<%=defaultinstructions.ClientID%>").show();
        });
    </script>
</asp:Content>
