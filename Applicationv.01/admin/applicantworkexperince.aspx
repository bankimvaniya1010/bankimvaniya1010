<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantworkexperince.aspx.cs" Inherits="admin_applicantworkexperince" MasterPageFile="~/admin/admin.master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
             <%    for (int k= 0;k < CustomControls.Count; k++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[k].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[k].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[k].customfieldid.ToString();
        %>
            if ($('#<%=txtName%>').val() != "")
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>
            <% 
        for (int n = 0; n < EmployersDetail.Count; n++)
        {%>  
            if ($("#txtemployer<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemployer<%=n%>', 'btnemployer<%=n%>');
            if ($("#txtemployerwebsite<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemployerwebsite<%=n%>', 'btnemployerwebsite<%=n%>');
            if ($("#txtemployercity<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemployercity<%=n%>', 'btnemployercity<%=n%>');
            if ($("#txtemployer<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemployercountry<%=n%>', 'btnemployercountry<%=n%>');
            if ($("#txtposition<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtposition<%=n%>', 'btnposition<%=n%>');
            if ($("#txtstartdate<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtstartdate<%=n%>', 'btnstartdate<%=n%>');
            if ($("#txtenddate<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtenddate<%=n%>', 'btnenddate<%=n%>');
            if ($("#txtbriefDescription<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtbriefDescription<%=n%>', 'btnbriefDescription<%=n%>');
            if ($("#txtreportingmanger<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtreportingmanger<%=n%>', 'btnreportingmanger<%=n%>');
            if ($("#txtemploymentverification<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemploymentverification<%=n%>', 'btnemploymentverification<%=n%>');
            if ($("#txtrelationship<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtrelationship<%=n%>', 'btnrelationship<%=n%>');
            if ($("#txtemail<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtemail<%=n%>', 'btnemail<%=n%>');
            if ($("#txtlinkedin<%=n%>").val() != "")
                ManageRemarksIfNoCheked('txtlinkedin<%=n%>', 'btnbtnlinkedinemail<%=n%>');

            $("#btnemployer<%=n%>").click(function () {
                ManageRemarks('txtemployer<%=n%>', 'btnemployer<%=n%>');
            });
            $("#rblemployerNo<%=n%>").click(function () {
                ManageRemarks('txtemployer<%=n%>', 'btnemployer<%=n%>');
            });
            $("#btnemployerwebsite<%=n%>").click(function () {
                ManageRemarks('txtemployerwebsite<%=n%>', 'btnemployerwebsite<%=n%>');
            });
            $("#rblemployerwebsiteNo<%=n%>").click(function () {
                ManageRemarks('txtemployerwebsite<%=n%>', 'btnemployerwebsite<%=n%>');
            });

            $("#btnemployercity<%=n%>").click(function () {
                ManageRemarks('txtemployercity<%=n%>', 'btnemployercity<%=n%>');
            });
            $("#rblemployercityNo<%=n%>").click(function () {
                ManageRemarks('txtemployercity<%=n%>', 'btnemployercity<%=n%>');
            });
            $("#btnemployercountry<%=n%>").click(function () {
                ManageRemarks('txtemployercountry<%=n%>', 'btnemployercountry<%=n%>');
            });
            $("#rblemployercountryNo<%=n%>").click(function () {
                ManageRemarks('txtemployercountry<%=n%>', 'btnemployercountry<%=n%>');
            }); $("#btnposition<%=n%>").click(function () {
                ManageRemarks('txtposition<%=n%>', 'btnposition<%=n%>');
            });
            $("#rblpositionNo<%=n%>").click(function () {
                ManageRemarks('txtposition<%=n%>', 'btnposition<%=n%>');
            }); $("#btnstartdate<%=n%>").click(function () {
                ManageRemarks('txtstartdate<%=n%>', 'btnstartdate<%=n%>');
            });
            $("#rblstartdateNo<%=n%>").click(function () {
                ManageRemarks('txtstartdate<%=n%>', 'btnstartdate<%=n%>');
            });
            $("#btnenddate<%=n%>").click(function () {
                ManageRemarks('txtenddate<%=n%>', 'btnenddate<%=n%>');
            });
            $("#rblenddateNo<%=n%>").click(function () {
                ManageRemarks('txtenddate<%=n%>', 'btnenddate<%=n%>');
            });
            $("#btnbriefDescription<%=n%>").click(function () {
                ManageRemarks('txtbriefDescription<%=n%>', 'btnbriefDescription<%=n%>');
            });
            $("#rblbriefDescriptionNo<%=n%>").click(function () {
                ManageRemarks('txtbriefDescription<%=n%>', 'btnbriefDescription<%=n%>');
            });
            $("#btnreportingmanger<%=n%>").click(function () {
                ManageRemarks('txtreportingmanger<%=n%>', 'btnreportingmanger<%=n%>');
            });
            $("#rblreportingmangerNo<%=n%>").click(function () {
                ManageRemarks('txtreportingmanger<%=n%>', 'btnreportingmanger<%=n%>');
            });
            $("#btnemploymentverification<%=n%>").click(function () {
                ManageRemarks('txtemploymentverification<%=n%>', 'btnemploymentverification<%=n%>');
            });
            $("#rblemploymentverificationNo<%=n%>").click(function () {
                ManageRemarks('txtemploymentverification<%=n%>', 'btnemploymentverification<%=n%>');
            }); $("#btnrelationship<%=n%>").click(function () {
                ManageRemarks('txtrelationship<%=n%>', 'btnrelationship<%=n%>');
            });
            $("#rblrelationshipNo<%=n%>").click(function () {
                ManageRemarks('txtrelationship<%=n%>', 'btnrelationship<%=n%>');
            });
            $("#btnemail<%=n%>").click(function () {
                ManageRemarks('txtemail<%=n%>', 'btnemail<%=n%>');
            });
            $("#rblemailNo<%=n%>").click(function () {
                ManageRemarks('txtemail<%=n%>', 'btnemail<%=n%>');
            });
            $("#btnlinkedin<%=n%>").click(function () {
                ManageRemarks('txtlinkedin<%=n%>', 'btnlinkedin<%=n%>');
            });
            $("#rbllinkedinNo<%=n%>").click(function () {
                ManageRemarks('txtlinkedin<%=n%>', 'btnlinkedin<%=n%>');
            });

       <%   }


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
            ManageRemarksIfNoCheked('txtemployer<%=i%>','btnemployer<%=i%>');
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
            ManageRemarksIfNoCheked('txtemployerwebsite<%=i%>','btnemployerwebsite<%=i%>');
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
            ManageRemarksIfNoCheked('txtemployercity<%=i%>','btnemployercity<%=i%>');
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
            ManageRemarksIfNoCheked('txtemployercountry<%=i%>','btnemployercountry<%=i%>');
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
            ManageRemarksIfNoCheked('txtposition<%=i%>','btnposition<%=i%>');
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
            ManageRemarksIfNoCheked('txtstartdate<%=i%>','btnstartdate<%=i%>');
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
            ManageRemarksIfNoCheked('txtenddate<%=i%>','btnenddate<%=i%>');
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
            ManageRemarksIfNoCheked('txtbriefDescription<%=i%>','btnbriefDescription<%=i%>');
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
            ManageRemarksIfNoCheked('txtreportingmanger<%=i%>','btnreportingmanger<%=i%>');
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
            ManageRemarksIfNoCheked('txtemploymentverification<%=i%>','btnemploymentverification<%=i%>');
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
            ManageRemarksIfNoCheked('txtrelationship<%=i%>','btnrelationship<%=i%>');
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
            ManageRemarksIfNoCheked('txtemail<%=i%>','btnemail<%=i%>');
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
            ManageRemarksIfNoCheked('txtlinkedin<%=i%>','btnlinkedin<%=i%>');
                    <% }
        else
        { %>
            $('input:radio[name=linkedin<%=i%>]')[0].checked = true;
                  <%  }
                }

            }
        }
        %>


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
            function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        });


        function GetValue() {
           
            var inputactionValue = "";
            var inputValue = "";

         <% 
        for (int k = 0; k < EmployersDetail.Count; k++)
        { %>

            <%if (employer != "")
        {%>
            if ($('#rblemployerNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=employer + (k + 1)%>" + ":" + $("#txtemployer<%=k%>").val() + "~" + inputactionValue + "|";


               <%}
        if (employerwebsite != "")
        {%>if ($('#rblemployerwebsiteNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=employerwebsite+ (k + 1)%>" + ":" + $("#txtemployerwebsite<%=k%>").val() + "~" + inputactionValue + "|";

         <%   }
        if (employercity != "")
        {%>if ($('#rblemployercityNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=employercity+ (k + 1)%>" + ":" + $("#txtemployercity<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (employercountry != "")
        {%>if ($('#rblemployercountryNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=employercountry+ (k + 1)%>" + ":" + $("#txtemployercountry<%=k%>").val() + "~" + inputactionValue + "|";

            <%}%>
               <%else if (position != "")
        {%>if ($('#rblpositionNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=position+ (k + 1)%>" + ":" + $("#txtposition<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (startdate != "")
        {%>if ($('#rblstartdateNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=startdate+ (k + 1)%>" + ":" + $("#txtstartdate<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (enddate != "")
        {%>if ($('#rblenddateNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=enddate+ (k + 1)%>" + ":" + $("#txtenddate<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (BriefDescription != "")
        {%>if ($('#rblbriefDescriptionNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=BriefDescription+ (k + 1)%>" + ":" + $("#txtbriefDescription<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (reportingmanger != "")
        {%>if ($('#rblreportingmangerNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=reportingmanger+ (k + 1)%>" + ":" + $("#txtreportingmanger<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (employmentverification != "")
        {%>if ($('#rblemploymentverificationNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=employmentverification+ (k + 1)%>" + ":" + $("#txtemploymentverification<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (relationship != "")
        {%>if ($('#rblrelationshipNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=relationship+ (k + 1)%>" + ":" + $("#txtrelationship<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (email != "")
        {%>if ($('#rblemailNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=email+ (k + 1)%>" + ":" + $("#txtemail<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        if (linkedin != "")
        {%>if ($('#rbllinkedinNo<%=k%>').prop('checked') == true)
                inputactionValue = "0"
            else
                inputactionValue = "1"
            inputValue = inputValue + "<%=linkedin+ (k + 1)%>" + ":" + $("#txtlinkedin<%=k%>").val() + "~" + inputactionValue + "|";

            <%}
        }
        %>
            $("#<%=hdnValue.ClientID%>").val(inputValue);

        
        }


        function validateform()
        {  
        <% for (int k = 0; k < EmployersDetail.Count; k++)
           { %>
            var flag = false;
            if (!$("#employer").is(':hidden') && !($('#rblemployerNo<%=k%>').is(':checked') || $('#rblemployerYes<%=k%>').is(':checked')))
                alert("Please select option for Name of oraginzation Name of employemt history <%=k+1 %>");
            else if (!$("#employerwebsite").is(':hidden') && !($('#rblemployerwebsiteYes<%=k%>').is(':checked') || $('#rblemployerwebsiteNo<%=k%>').is(':checked')))
                alert("Please select option for Name of oraginzation Name of employemt history <%=k+1 %>");
            else if (!$("#employercity").is(':hidden') && !($('#rblemployercityYes<%=k%>').is(':checked') || $('#rblemployercityNo<%=k%>').is(':checked')))
                alert("Please select option for City of employemt history <%=k+1 %>");
            else if (!$("#employercountry").is(':hidden') && !($('#rblemployercountryYes<%=k%>').is(':checked') || $('#rblemployercountryNo<%=k%>').is(':checked')))
                alert("Please select option for Country of employemt history <%=k+1 %>");
            else if (!$("#position").is(':hidden') && !($('#rblpositionYes<%=k%>').is(':checked') || $('#rblpositionNo<%=k%>').is(':checked')))
                alert("Please select option for Position/Role of employemt history <%=k+1 %>");
            else if (!$("#startdate").is(':hidden') && !($('#rblstartdateYes<%=k%>').is(':checked') || $('#rblstartdateNo<%=k%>').is(':checked')))
                alert("Please select option for Start Date of employemt history <%=k+1 %>");
            else if (!$("#endate").is(':hidden') && !($('#rblenddateYes<%=k%>').is(':checked') || $('#rblenddateNo<%=k%>').is(':checked')))
                alert("Please select option for End Date of employemt history <%=k+1 %>");
            else if (!$("#briefDescription").is(':hidden') && !($('#rblbriefDescriptionYes<%=k%>').is(':checked') || $('#rblbriefDescriptionNo<%=k%>').is(':checked')))
                alert("Please select option for brief Description of employemt history <%=k+1 %>");
            else if (!$("#reportingmanger").is(':hidden') && !($('#rblreportingmangerYes<%=k%>').is(':checked') || $('#rblreportingmangerNo<%=k%>').is(':checked')))
                alert("Please select option for reporting manger of employemt history <%=k+1 %>");
            else if (!$("#employmentverification").is(':hidden') && !($('#rblemploymentverificationYes<%=k%>').is(':checked') || $('#rblemploymentverificationNo<%=k%>').is(':checked')))
                alert("Please select option for Name of contact person who can verify employement of employemt history <%=k+1 %>");
            else if (!$("#relationship").is(':hidden') && !($('#rblrelationshipYes<%=k%>').is(':checked') || $('#rblrelationshipNo<%=k%>').is(':checked')))
                alert("Please select option for relationship with the contact of employemt history <%=k+1 %>");
            else if (!$("#email").is(':hidden') && !($('#rblemailYes<%=k%>').is(':checked') || $('#rblemailNo<%=k%>').is(':checked')))
                alert("Please select option for email id of contact of employemt history <%=k+1 %>");
            else if (!$("#linkedin").is(':hidden') && !($('#rbllinkedinYes<%=k%>').is(':checked') || $('#rbllinkedinNo<%=k%>').is(':checked')))
                alert("Please select option for Linkedin profile of contact of employemt history <%=k+1 %>");
            else
                flag = true;
            if (flag == true)
                flag = customcontrolValidation();
           
        <% } %>
            GetValue();
            return flag;
        }
         function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            RadioButton rbDynamicsYes = (RadioButton)mainDiv.FindControl("rblYes" + CustomControls[k].customfieldid);
            RadioButton rbDynamicsNo = (RadioButton)mainDiv.FindControl("rblNo" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if (!($("#<%=rbDynamicsYes.ClientID%>").is(':checked') || $("#<%=rbDynamicsNo.ClientID%>").is(':checked'))) {
                alert("Please Select option for <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }
         $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#manageapplicantions_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#applicantlist').addClass('active');
	    });
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Work Experince</li>
        </ol>
        <h1 class="h2">Applicant Work Experince</h1>
        <asp:HiddenField ID="hdnValue" runat="server" />
        <div class="card">
            <% 
                for (int k = 0; k < EmployersDetail.Count; k++)
                {

            %>
            <div id="employment">
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                        <div class="form-row">
                            <label id="labelemployment" for="employment" class="col-md-3 col-form-label form-label"><b>Employment History:<%=k+1 %></b></label>

                        </div>
                    </div>
                </div>

                <div id="fieldContainer">
                    <div class="list-group-item" id="employer" style='<%= employer == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                            <div class="form-row">
                                <label id="labelemployer" for="employer" class="col-md-2 col-form-label form-label"><%=employer %> </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].organization %></span>
                                    </div>
                                     <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblemployerYes" + k %>" name="<%="employer" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployerNo" + k %>" name="<%="employer" + k %>" value="0">No
                                    </div>
                                    <span class="helpicon"><i id="<%="icemployer" + k %>" class="fa fa-info-circle" data-tipso="<%=employerToolTips %>" style='<%= employerToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemployer" + k %>" />
                                    <input id="<%="txtemployer" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employerwebsite" style='<%= employerwebsite == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                            <div class="form-row">
                                <label id="labelemployerwebsite" for="employerwebsite" class="col-md-2 col-form-label form-label"><%=employerwebsite %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">	
                                        <span><%=EmployersDetail[k].website %></span>
                                    </div>
                                     <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblemployerwebsiteYes" + k %>" name="<%="employerwebsite" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployerwebsiteNo" + k %>" name="<%="employerwebsite" + k %>" value="0">No
                                    </div>
                                    <span class="helpicon"><i id="<%="icemployerwebsite" + k %>" class="fa fa-info-circle" data-tipso="<%=employerwebsiteToolTips %>" style='<%= employerwebsiteToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemployerwebsite" + k %>" />
                                    <input id="<%="txtemployerwebsite" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercity" style='<%= employercity == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                            <div class="form-row">
                                <label id="labelemployercity" for="employercity" class="col-md-2 col-form-label form-label"><%=employercity %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">	
                                        <span><%=EmployersDetail[k].city %></span>
                                      </div>
                                      <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblemployercityYes" + k %>" name="<%="employercity" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployercityNo" + k %>" name="<%="employercity" + k %>" value="0">No
                                      </div>
                                      <span class="helpicon"><i id="<%="icemployercity" + k %>" class="fa fa-info-circle" data-tipso="<%=employercityToolTips %>" style='<%= employercityToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemployercity" + k %>" />
                                    <input id="<%="txtemployercity" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercountry" style='<%= employercountry == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercountry">
                            <div class="form-row">
                                <label id="labelemployercountry" for="employercountry" class="col-md-2 col-form-label form-label"><%=employercountry %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">	
                                        <span><%=EmployersDetail[k].country==null?"":objCom.GetCountryDiscription(Convert.ToInt32(EmployersDetail[k].country)) %></span>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblemployercountryYes" + k %>" name="<%="employercountry" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemployercountryNo" + k %>" name="<%="employercountry" + k %>" value="0">No
                                    </div>
                                    <span class="helpicon"><i id="<%="icemployercountry" + k %>" class="fa fa-info-circle" data-tipso="<%=employercountryToolTips %>" style='<%= employercountryToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemployercountry" + k %>" />
                                    <input id="<%="txtemployercountry" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="position" style='<%= position == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-position">
                            <div class="form-row">
                                <label id="labelposition" for="position" class="col-md-2 col-form-label form-label"><%=position %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].designation %></span>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblpositionYes" + k %>" name="<%="position" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblpositionNo" + k %>" name="<%="position" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icposition" + k %>" class="fa fa-info-circle" data-tipso="<%=positionToolTips %>" style='<%= positionToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnposition" + k %>" />
                                    <input id="<%="txtposition" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="startdate" style='<%= startdate == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                            <div class="form-row">
                                <label id="labelstartdate" for="startdate" class="col-md-2 col-form-label form-label"><%=startdate %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <span><%=Convert.ToDateTime(EmployersDetail[k].durationfrom).ToString("yyyy-MM-dd") %></span>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblstartdateYes" + k %>" name="<%="startdate" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblstartdateNo" + k %>" name="<%="startdate" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icstartdate" + k %>" class="fa fa-info-circle" data-tipso="<%=startdateToolTips %>" style='<%= startdateToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnstartdate" + k %>" />
                                    <input id="<%="txtstartdate" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="endate" style='<%= enddate == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                            <div class="form-row">
                                <label id="labelendate" for="endate" class="col-md-2 col-form-label form-label"><%=enddate %></label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <span><%=Convert.ToDateTime(EmployersDetail[k].durationto).ToString("yyyy-MM-dd") %></span>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <input type="radio" id="<%="rblenddateYes" + k %>" name="<%="enddate" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblenddateNo" + k %>" name="<%="endadte" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icenddate" + k %>" class="fa fa-info-circle" data-tipso="<%=enddateToolTips %>" style='<%= enddateToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnenddate" + k %>" />
                                    <input id="<%="txtenddate" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="briefDescription" style='<%= BriefDescription == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                            <div class="form-row">
                                <label id="labelbriefDescription" for="briefDescription" class="col-md-2 col-form-label form-label"><%=BriefDescription %></label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].briefdescription %></span>
                                       </div> 
                                    <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rblbriefDescriptionYes" + k %>" name="<%="briefDescription" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblbriefDescriptionNo" + k %>" name="<%="briefDescription" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icbriefDescription" + k %>" class="fa fa-info-circle" data-tipso="<%=BriefDescriptionToolTips %>" style='<%= BriefDescriptionToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnbriefDescription" + k %>" />
                                    <input id="<%="txtbriefDescription" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="reportingmanger" style='<%= reportingmanger == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                            <div class="form-row">
                                <label id="labelreportingmanger" for="reportingmanger" class="col-md-2 col-form-label form-label"><%=reportingmanger %></label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].nameofreportingmanger %></span>
                                      </div>
                                    <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rblreportingmangerYes" + k %>" name="<%="reportingmanger" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblreportingmangerNo" + k %>" name="<%="reportingmanger" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icreportingmanger" + k %>" class="fa fa-info-circle" data-tipso="<%=reportingmangerToolTips %>" style='<%= reportingmangerToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnreportingmanger" + k %>" />
                                    <input id="<%="txtreportingmanger" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employmentverification" style='<%= employmentverification == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                            <div class="form-row">
                                <label id="labelemploymentverification" for="employmentverification" class="col-md-2 col-form-label form-label"><%=employmentverification %> </label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].contactpersonwithdetails %></span>
                                      </div>
                                    <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rblemploymentverificationYes" + k %>" name="<%="employmentverification" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemploymentverificationNo" + k %>" name="<%="employmentverification" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icemploymentverification" + k %>" class="fa fa-info-circle" data-tipso="<%=employmentverificationToolTips %>" style='<%= employmentverificationToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemploymentverification" + k %>" />
                                    <input id="<%="txtemploymentverification" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="relationship" style='<%= relationship == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                            <div class="form-row">
                                <label id="labelrelationship" for="relationship" class="col-md-2 col-form-label form-label"><%=relationship %>   </label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].relationshipwithcontact==null?"":objCom.GetRealtionship(Convert.ToInt32(EmployersDetail[k].relationshipwithcontact))%></span>
                                      </div>
                                    <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rblrelationshipYes" + k %>" name="<%="relationship" + k %>" value="1">Yes
                                         <input type="radio" id="<%="rblrelationshipNo" + k %>" name="<%="relationship" + k %>" value="0">No
                                     </div>
                                        <span class="helpicon"><i id="<%="icrelationship" + k %>" class="fa fa-info-circle" data-tipso="<%=relationshipToolTips %>" style='<%= relationshipToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnrelationship" + k %>" />
                                    <input id="<%="txtrelationship" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="email" style='<%= email == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                            <div class="form-row">
                                <label id="labelemail" for="email" class="col-md-2 col-form-label form-label"><%=email %>  </label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].emailid %></span>
                                      </div>
                                    <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rblemailYes" + k %>" name="<%="email" + k %>" value="1">Yes
                                        <input type="radio" id="<%="rblemailNo" + k %>" name="<%="email" + k %>" value="0">No
                                    </div>
                                        <span class="helpicon"><i id="<%="icemail" + k %>" class="fa fa-info-circle" data-tipso="<%=emailToolTips %>" style='<%= emailToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnemail" + k %>" />
                                    <input id="<%="txtemail" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="linkedin" style='<%= linkedin == "" ? "display:none;": "display:block;"  %>'>
                        <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                            <div class="form-row">
                                <label id="labellinkedin" for="linkedin" class="col-md-2 col-form-label form-label"><%=linkedin %>  </label>
                                <div class="col-md-6">
                                     <div class="prdtl-ans">
                                        <span><%=EmployersDetail[k].linkedinidofcontact %></span>
                                      </div>
                                      <div class="prdtl-vrfy">
                                         <input type="radio" id="<%="rbllinkedinYes" + k %>" name="<%="linkedin" + k %>" value="1">Yes
                                         <input type="radio" id="<%="rbllinkedinNo" + k %>" name="<%="linkedin" + k %>" value="0">No
                                      </div>
                                          <span class="helpicon"><i id="<%="iclinkedin" + k %>" class="fa fa-info-circle" data-tipso="<%=linkedinToolTips %>" style='<%= linkedinToolTips == "" ? "display:none;": "display:block;"  %>'></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="<%="btnlinkedin" + k %>" />
                                    <input id="<%="txtlinkedin" + k %>" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
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
                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClientClick="return validateform()" CssClass="btn btn-success" OnClick="btnSave_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
