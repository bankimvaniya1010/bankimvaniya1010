<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantworkexperince.aspx.cs" Inherits="admin_supervisorapplicantworkexperince" MasterPageFile="~/admin/admin.master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });


       <%  
        for (int k = 0; k < Comments.Count; k++)
        {
            string fieldName = Comments[k].fieldname;
            string AdminComments = Comments[k].comments;
            int Adminaction = Convert.ToInt32(Comments[k].adminaction);
            int EmployerCount = EmployersDetail.Count;
            for (int i = 0; i < EmployerCount; i++)
            {
                if (fieldName == employer + (i + 1))
                {%>

            $("#txtemployer<%=i%>").val('<%=AdminComments%>');
                 <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=employer<%=i%>]')[1].checked = true;

                 <% }
        else
        { %>
            $('input:radio[name=employer<%=i%>]')[0].checked = true;
                      <%  }
        }
        else if (fieldName == employerwebsite + (i + 1))
        {%>

            $("#txtemployerwebsite<%=i%>").val('<%=AdminComments%>');
                            <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=employerwebsite<%=i%>]')[1].checked = true;

                                <% }
        else
        { %>
            $('input:radio[name=employerwebsite<%=i%>]')[0].checked = true;
                                  <%  }
        }

        else if (fieldName == employercity + (i + 1))
        {%>
            $("#txtemployercity<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=employerwebsite<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=employercity<%=i%>]')[0].checked = true;
                      <%  }
        }

        else if (fieldName == employercountry + (i + 1))
        {%>


            $("#txtemployercountry<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=employercountry<%=i%>]')[1].checked = true;

                        <% }
        else
        { %>
            $('input:radio[name=employercountry<%=i%>]')[0].checked = true;
                      <%  }
        }

        else if (fieldName == position + (i + 1))
        {%>


            $("#txtposition<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=position<%=i%>]')[1].checked = true;

                        <% }
        else
        { %>
            $('input:radio[name=position<%=i%>]')[0].checked = true;
                      <%  }
        }

        else if (fieldName == startdate + (i + 1))
        {%>


            $("#txtstartdate<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=startdate<%=i%>]')[1].checked = true;

                        <% }
        else
        { %>
            $('input:radio[name=startdate<%=i%>]')[0].checked = true;
                      <%  }
        }

        else if (fieldName == enddate + (i + 1))
        {%>


            $("#txtenddate<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=enddate<%=i%>]')[1].checked = true;

                        <% }
        else
        { %>
            $('input:radio[name=enddate<%=i%>]')[0].checked = true;
                      <%  }
        }


        else if (fieldName == BriefDescription + (i + 1))
        {%>

            $("#txtbriefDescription<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=briefDescription<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=briefDescription<%=i%>]')[0].checked = true;
                  <%  }
        }

        else if (fieldName == reportingmanger + (i + 1))
        {%>


            $("#txtreportingmanger<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=reportingmanger%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=reportingmanger<%=i%>]')[0].checked = true;
                  <%  }
        }

        else if (fieldName == employmentverification + (i + 1))
        {%>


            $("#txtemploymentverification<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=employmentverification<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=employmentverification<%=i%>]')[0].checked = true;
                  <%  }
        }

        else if (fieldName == relationship + (i + 1))
        {%>


            $("#txtrelationship<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=relationship<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=relationship<%=i%>]')[0].checked = true;
                  <%  }
        }

        else if (fieldName == email + (i + 1))
        {%>  

            $("#txtemail<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=email<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=email<%=i%>]')[0].checked = true;
                  <%  }
        }

        else if (fieldName == linkedin + (i + 1))
        {%>
            $("#txtlinkedin<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
        {%>
            $('input:radio[name=linkedin<%=i%>]')[1].checked = true;

                    <% }
        else
        { %>
            $('input:radio[name=linkedin<%=i%>]')[0].checked = true;
                  <%  }
                }

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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblemployerYes" + k %>" name="<%="employer" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployerNo" + k %>" name="<%="employer" + k %>" value="0">No<span id="<%="lblemploye" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblemployerwebsiteYes" + k %>" name="<%="employerwebsite" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployerwebsiteNo" + k %>" name="<%="employerwebsite" + k %>" value="0">No<span id="<%="lblemployerwebsite" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblemployercityYes" + k %>" name="<%="employercity" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployercityNo" + k %>" name="<%="employercity" + k %>" value="0">No<span id="<%="lblemployercity" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblemployercountryYes" + k %>" name="<%="employercountry" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployercountryNo" + k %>" name="<%="employercountry" + k %>" value="0">No<span id="<%="lblemployercountry" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblpositionYes" + k %>" name="<%="position" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblpositionNo" + k %>" name="<%="position" + k %>" value="0">No<span id="<%="lblposition" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblstartdateYes" + k %>" name="<%="startdate" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblstartdateNo" + k %>" name="<%="startdate" + k %>" value="0">No<span id="<%="lblstartdate" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblenddateYes" + k %>" name="<%="enddate" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblenddateNo" + k %>" name="<%="endadte" + k %>" value="0">No<span id="<%="lblendate" + k %>"></span>
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
                                <div class="col-md-4">
                                    <input type="radio" id="<%="rblbriefDescriptionYes" + k %>" name="<%="briefDescription" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblbriefDescriptionNo" + k %>" name="<%="briefDescription" + k %>" value="0">No<span id="<%="lblbriefDescription" + k %>"></span>
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
                                    <input type="radio" id="<%="rblreportingmangerYes" + k %>" name="<%="reportingmanger" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblreportingmangerNo" + k %>" name="<%="reportingmanger" + k %>" value="0">No
                                    <span id="<%="lblreportingmanger" + k %>"></span>
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
                                    <input type="radio" id="<%="rblemploymentverificationYes" + k %>" name="<%="employmentverification" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemploymentverificationNo" + k %>" name="<%="employmentverification" + k %>" value="0">No
 
                                     <span id="<%="lblemploymentverification" + k %>"></span>
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
                                    <input type="radio" id="<%="rblrelationshipYes" + k %>" name="<%="relationship" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblrelationshipNo" + k %>" name="<%="relationship" + k %>" value="0">No
                                    <span id="<%="lblrelationship" + k %>"></span>
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
                                    <input type="radio" id="<%="rblemailYes" + k %>" name="<%="email" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemailNo" + k %>" name="<%="email" + k %>" value="0">No
                                    <span id="<%="lblemail" + k %>"></span>
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
                                    <input type="radio" id="<%="rbllinkedinYes" + k %>" name="<%="linkedin" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rbllinkedinNo" + k %>" name="<%="linkedin" + k %>" value="0">No
                                    <span id="<%="lbllinkedin" + k %>"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                Approved
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

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />

                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</asp:Content>
