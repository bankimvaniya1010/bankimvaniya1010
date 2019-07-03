<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantworkexperince.aspx.cs" Inherits="admin_supervisorapplicantworkexperince" MasterPageFile="~/admin/admin.master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="head">
    <title></title>
    <script>
          $(document).ready(function () {
                      
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

            $("#lblemployer<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == employerwebsite + (i + 1))
        {%>

            $("#lblemployerwebsite<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == employercity + (i + 1))
        {%>

            $("#lblemployercity<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == employercountry + (i + 1))
        {%>

            $("#lblemployercountry<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == position + (i + 1))
        {%>

            $("#lblposition<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == startdate + (i + 1))
        {%>

            $("#lblstartdate<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == enddate + (i + 1))
        {%>
            $("#lblendate<%=i%>").text('<%=AdminComments%>');
          <%   }

        else if (fieldName == BriefDescription + (i + 1))
        {%>

            $("#lblbriefDescription<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == reportingmanger + (i + 1))
        {%>

            $("#lblreportingmanger<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == employmentverification + (i + 1))
        {%>

            $("#lblemploymentverification<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == relationship + (i + 1))
        {%>

            $("#lblrelationship<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == email + (i + 1))
        {%>

            $("#lblemail<%=i%>").text('<%=AdminComments%>');
          <%   }
        else if (fieldName == linkedin + (i + 1))
        {%>

            $("#lbllinkedin<%=i%>").text('<%=AdminComments%>');
          <%   }
            }
        }
        %>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblemploye" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblemployerwebsite" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblemployercity" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblemployercountry" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblposition" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblstartdate" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblendate" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4"><span id="<%="lblbriefDescription" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4">
                                    <span id="<%="lblreportingmanger" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4">
                                     <span id="<%="lblemploymentverification" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4">
                                    <span id="<%="lblrelationship" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4">
                                    <span id="<%="lblemail" + k %>" ></span>
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
                                </div>
                                <div class="col-md-4">
                                    <span id="<%="lbllinkedin" + k %>" ></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %> <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction"> Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:button id="btnSave" runat="server" text="Save Changes"  cssclass="btn btn-success"  OnClick="btnSave_Click" />

                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</asp:Content>
