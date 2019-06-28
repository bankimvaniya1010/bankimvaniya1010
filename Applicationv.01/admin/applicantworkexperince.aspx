<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantworkexperince.aspx.cs" Inherits="admin_applicantworkexperince" MasterPageFile="~/admin/admin.master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
            SetValue();
        });

        function SetValue() {
             <% 
        for (int k = 0; k < Comments.Count; k++)
        {
            string fieldName = Comments[k].fieldname;
            string AdminComments = Comments[k].comments;
            int EmployerCount = EmployersDetail.Count;
            for (int i = 0; i < EmployerCount; i++)
            {
            %>
           <% if (fieldName == employer + (i + 1))
        {%>

            $("#txtemployer<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == employerwebsite + (i + 1))
        {%>

            $("#txtemployerwebsite<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == employercity + (i + 1))
        {%>

            $("#txtemployercity<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == employercountry + (i + 1))
        {%>

            $("#txtemployercountry<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == position + (i + 1))
        {%>

            $("#txtposition<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == startdate + (i + 1))
        {%>

            $("#txtstartdate<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == enddate + (i + 1))
        {%>
            $("#txtendate<%=i%>").val('<%=AdminComments%>');
          <%   }

        else if (fieldName == BriefDescription + (i + 1))
        {%>

            $("#txtbriefDescription<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == reportingmanger + (i + 1))
        {%>

            $("#txtreportingmanger<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == employmentverification + (i + 1))
        {%>

            $("#txtemploymentverification<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == relationship + (i + 1))
        {%>

            $("#txtrelationship<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == email + (i + 1))
        {%>

            $("#txtemail<%=i%>").val('<%=AdminComments%>');
          <%   }
        else if (fieldName == linkedin + (i + 1))
        {%>

            $("#txtlinkedin<%=i%>").val('<%=AdminComments%>');
          <%   }
            }
        }
        %>
        }
        function GetValue() {

            var inputValue = "";
         <% 
        for (int k = 0; k < EmployersDetail.Count; k++)
        { %>

            <%if (employer != "")
        {%>
            inputValue = inputValue + "<%=employer + (k + 1)%>" + ":" + $("#txtemployer<%=k%>").val() + "|";


               <%}
        else if (employerwebsite != "")
        {%>
            inputValue = inputValue + "<%=employerwebsite+ (k + 1)%>" + ":" + $("#txtemployerwebsite<%=k%>").val() + "|";

         <%   }
        else if (employercity != "")
        {%>
            inputValue = inputValue + "<%=employercity+ (k + 1)%>" + ":" + $("#txtemployercity<%=k%>").val() + "|";

            <%}
        else if (employercountry != "")
        {%>
            inputValue = inputValue + "<%=employercountry+ (k + 1)%>" + ":" + $("#txtemployercountry<%=k%>").val() + "|";

            <%}%>
               <%else if (position != "")
        {%>
            inputValue = inputValue + "<%=position+ (k + 1)%>" + ":" + $("#txtposition<%=k%>").val() + "|";

            <%}
        else if (startdate != "")
        {%>
            inputValue = inputValue + "<%=startdate+ (k + 1)%>" + ":" + $("#txtstartdate<%=k%>").val() + "|";

            <%}
        else if (enddate != "")
        {%>
            inputValue = inputValue + "<%=enddate+ (k + 1)%>" + ":" + $("#txtendate<%=k%>").val() + "|";

            <%}
        else if (BriefDescription != "")
        {%>
            inputValue = inputValue + "<%=BriefDescription+ (k + 1)%>" + ":" + $("#txtbriefDescription<%=k%>").val() + "|";

            <%}
        else if (reportingmanger != "")
        {%>
            inputValue = inputValue + "<%=reportingmanger+ (k + 1)%>" + ":" + $("#txtreportingmanger<%=k%>").val() + "|";

            <%}
        else if (employmentverification != "")
        {%>
            inputValue = inputValue + "<%=employmentverification+ (k + 1)%>" + ":" + $("#txtemploymentverification<%=k%>").val() + "|";

            <%}
        else if (relationship != "")
        {%>
            inputValue = inputValue + "<%=relationship+ (k + 1)%>" + ":" + $("#txtrelationship<%=k%>").val() + "|";

            <%}
        else if (email != "")
        {%>
            inputValue = inputValue + "<%=email+ (k + 1)%>" + ":" + $("#txtemail<%=k%>").val() + "|";

            <%}
        else if (linkedin != "")
        {%>
            inputValue = inputValue + "<%=linkedin+ (k + 1)%>" + ":" + $("#txtlinkedin<%=k%>").val() + "|";

            <%}
        }
        %>
            $("#<%=hdnValue.ClientID%>").val(inputValue);

        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Work Experince</li>
        </ol>
        <h1 class="h2">Applicant Work Experince</h1>
        <asp:hiddenfield id="hdnValue" runat="server" />
        <div class="card">
            <% 
                for (int k = 0; k < EmployersDetail.Count; k++)
                {

            %>
            <div id="employment">
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                        <div class="form-row">
                            <label id="labelemployment" for="employment" class="col-md-3 col-form-label form-label">Employment History:<%=k+1 %></label>

                        </div>
                    </div>
                </div>

                <div id="fieldContainer">
                    <div class="list-group-item" id="employer" style='<%= employer == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                            <div class="form-row">
                                <label id="labelemployer" for="employer" class="col-md-3 col-form-label form-label"><%=employer %> </label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].organization %></span>
                                    <span class="helpicon"><i id="<%="icemployer" + k %>" class="fa fa-question-circle" data-tipso="<%=employerToolTips %>" style='<%= employerToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemployer" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employerwebsite" style='<%= employerwebsite == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                            <div class="form-row">
                                <label id="labelemployerwebsite" for="employerwebsite" class="col-md-3 col-form-label form-label"><%=employerwebsite %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].website %></span>
                                    <span class="helpicon"><i id="<%="icemployerwebsite" + k %>" class="fa fa-question-circle" data-tipso="<%=employerwebsiteToolTips %>" style='<%= employerwebsiteToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemployerwebsite" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercity" style='<%= employercity == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                            <div class="form-row">
                                <label id="labelemployercity" for="employercity" class="col-md-3 col-form-label form-label"><%=employercity %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].city %></span>
                                    <span class="helpicon"><i id="<%="icemployercity" + k %>" class="fa fa-question-circle" data-tipso="<%=employercityToolTips %>" style='<%= employercityToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemployercity" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercountry" style='<%= employercountry == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercountry">
                            <div class="form-row">
                                <label id="labelemployercountry" for="employercountry" class="col-md-3 col-form-label form-label"><%=employercountry %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].country==null?"":objCom.GetCountryDiscription(Convert.ToInt32(EmployersDetail[k].country)) %></span>
                                    <span class="helpicon"><i id="<%="icemployercountry" + k %>" class="fa fa-question-circle" data-tipso="<%=employercountryToolTips %>" style='<%= employercountryToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemployercountry" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="position" style='<%= position == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-position">
                            <div class="form-row">
                                <label id="labelposition" for="position" class="col-md-3 col-form-label form-label"><%=position %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].designation %></span>
                                    <span class="helpicon"><i id="<%="icposition" + k %>" class="fa fa-question-circle" data-tipso="<%=positionToolTips %>" style='<%= positionToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtposition" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="startdate" style='<%= startdate == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                            <div class="form-row">
                                <label id="labelstartdate" for="startdate" class="col-md-3 col-form-label form-label"><%=startdate %></label>
                                <div class="col-md-4">
                                    <span><%=Convert.ToDateTime(EmployersDetail[k].durationfrom).ToString("yyyy-MM-dd") %></span>
                                    <span class="helpicon"><i id="<%="icstartdate" + k %>" class="fa fa-question-circle" data-tipso="<%=startdateToolTips %>" style='<%= startdateToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtstartdate" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="endate" style='<%= enddate == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                            <div class="form-row">
                                <label id="labelendate" for="endate" class="col-md-3 col-form-label form-label"><%=enddate %></label>
                                <div class="col-md-4">
                                    <span><%=Convert.ToDateTime(EmployersDetail[k].durationto).ToString("yyyy-MM-dd") %></span>
                                    <span class="helpicon"><i id="<%="icenddate" + k %>" class="fa fa-question-circle" data-tipso="<%=enddateToolTips %>" style='<%= enddateToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtendate" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="briefDescription" style='<%= BriefDescription == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                            <div class="form-row">
                                <label id="labelbriefDescription" for="briefDescription" class="col-md-3 col-form-label form-label"><%=BriefDescription %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].briefdescription %></span>
                                    <span class="helpicon"><i id="<%="icbriefDescription" + k %>" class="fa fa-question-circle" data-tipso="<%=BriefDescriptionToolTips %>" style='<%= BriefDescriptionToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtbriefDescription" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="reportingmanger" style='<%= reportingmanger == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                            <div class="form-row">
                                <label id="labelreportingmanger" for="reportingmanger" class="col-md-3 col-form-label form-label"><%=reportingmanger %></label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].nameofreportingmanger %></span>
                                    <span class="helpicon"><i id="<%="icreportingmanger" + k %>" class="fa fa-question-circle" data-tipso="<%=reportingmangerToolTips %>" style='<%= reportingmangerToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtreportingmanger" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employmentverification" style='<%= employmentverification == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                            <div class="form-row">
                                <label id="labelemploymentverification" for="employmentverification" class="col-md-3 col-form-label form-label"><%=employmentverification %> </label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].contactpersonwithdetails %></span>
                                    <span class="helpicon"><i id="<%="icemploymentverification" + k %>" class="fa fa-question-circle" data-tipso="<%=employmentverificationToolTips %>" style='<%= employmentverificationToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemploymentverification" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="relationship" style='<%= relationship == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                            <div class="form-row">
                                <label id="labelrelationship" for="relationship" class="col-md-3 col-form-label form-label"><%=relationship %>   </label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].relationshipwithcontact==null?"":objCom.GetRealtionship(Convert.ToInt32(EmployersDetail[k].relationshipwithcontact))%></span>
                                    <span class="helpicon"><i id="<%="icrelationship" + k %>" class="fa fa-question-circle" data-tipso="<%=relationshipToolTips %>" style='<%= relationshipToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtrelationship" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="email" style='<%= email == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                            <div class="form-row">
                                <label id="labelemail" for="email" class="col-md-3 col-form-label form-label"><%=email %>  </label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].emailid %></span>
                                    <span class="helpicon"><i id="<%="icemail" + k %>" class="fa fa-question-circle" data-tipso="<%=emailToolTips %>" style='<%= emailToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtemail" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="linkedin" style='<%= linkedin == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                            <div class="form-row">
                                <label id="labellinkedin" for="linkedin" class="col-md-3 col-form-label form-label"><%=linkedin %>  </label>
                                <div class="col-md-4">
                                    <span><%=EmployersDetail[k].linkedinidofcontact %></span>
                                    <span class="helpicon"><i id="<%="iclinkedin" + k %>" class="fa fa-question-circle" data-tipso="<%=linkedinToolTips %>" style='<%= linkedinToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="<%="txtlinkedin" + k %>" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:button id="btnSave" runat="server" text="Save Changes" onclientclick="GetValue();" cssclass="btn btn-success" onclick="btnSave_Click" />

                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</asp:Content>
