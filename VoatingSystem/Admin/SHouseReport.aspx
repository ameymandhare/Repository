<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="SHouseReport.aspx.cs" Inherits="VoatingSystem.Admin.SHouseReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600,400' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="../dist/css/jsgrid.css" />
    <link rel="stylesheet" type="text/css" href="../dist/css/theme.css" />

    <script src="../dist/js/jquery-1.8.3.js"></script>

    <script src="../dist/js/JSGrid/jsgrid.core.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.load-indicator.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.load-strategies.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.sort-strategies.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.text.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.number.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.select.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.checkbox.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.control.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var chart1 = new CanvasJS.Chart("chartContainer1",
            {

                animationEnabled: true,
                legend: {
                    verticalAlign: "center",
                    horizontalAlign: "right"
                },
                theme: "theme1",
                data: [
                {
                    type: "pie",
                    indexLabelFontFamily: "Garamond",
                    indexLabelFontSize: 14,
                    indexLabelFontWeight: "bold",
                    startAngle: 0,
                    indexLabelFontColor: "MistyRose",
                    indexLabelLineColor: "darkgrey",
                    indexLabelPlacement: "inside",
                    toolTipContent: "{name}: {y} votes",
                    showInLegend: true,
                    indexLabel: "#percent%",
                    dataPoints: [
                        <% foreach (VoatingSystem.Business.Entities.Nominees prefets in PreferList)
                           {%>
                        { y: <%=prefets.Nom_VoteCount%>, name: "<%=prefets.Nom_Name%>", legendMarkerType: "circle" },
                        <% }%>
                    ]
                }
                ]
            });
            var chart2 = new CanvasJS.Chart("chartContainer2",
           {

               animationEnabled: true,
               legend: {
                   verticalAlign: "center",
                   horizontalAlign: "right"
               },
               theme: "theme1",
               data: [
               {
                   type: "pie",
                   indexLabelFontFamily: "Garamond",
                   indexLabelFontSize: 14,
                   indexLabelFontWeight: "bold",
                   startAngle: 0,
                   indexLabelFontColor: "MistyRose",
                   indexLabelLineColor: "darkgrey",
                   indexLabelPlacement: "inside",
                   toolTipContent: "{name}: {y} votes",
                   showInLegend: true,
                   indexLabel: "#percent%",
                   dataPoints: [
                      <% foreach (VoatingSystem.Business.Entities.Nominees prefets in VicePreferList)
                         {%>
                        { y: <%=prefets.Nom_VoteCount%>, name: "<%=prefets.Nom_Name%>", legendMarkerType: "circle" },
                        <% }%>
                   ]
               }
               ]
           });
            var chart3 = new CanvasJS.Chart("chartContainer3",
           {

               animationEnabled: true,
               legend: {
                   verticalAlign: "center",
                   horizontalAlign: "right"
               },
               theme: "theme1",
               data: [
               {
                   type: "pie",
                   indexLabelFontFamily: "Garamond",
                   indexLabelFontSize: 14,
                   indexLabelFontWeight: "bold",
                   startAngle: 0,
                   indexLabelFontColor: "MistyRose",
                   indexLabelLineColor: "darkgrey",
                   indexLabelPlacement: "inside",
                   toolTipContent: "{name}: {y} votes",
                   showInLegend: true,
                   indexLabel: "#percent%",
                   dataPoints: [
                       <% foreach (VoatingSystem.Business.Entities.Nominees prefets in JuniorPreferList)
                          {%>
                        { y: <%=prefets.Nom_VoteCount%>, name: "<%=prefets.Nom_Name%>", legendMarkerType: "circle" },
                        <% }%>
                   ]
               }
               ]
           });
            chart1.render();
            chart2.render();
            chart3.render();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chart-title">Surya House Report</div>
    <div class="sub-chart-title">PREFECT</div>
    <div>
        <div class="stud-table">
            <table cellpadding="0" cellspacing="0" border-collapse="colapse">
                <tr>
                    <th>Profile Picture</th>
                    <th>Candidate Id</th>
                    <th>Student Name</th>
                    <th>Class Section</th>
                    <th>Vote Count</th>
                </tr>
                <% foreach (VoatingSystem.Business.Entities.Nominees prefets in PreferList)
                   {%>
                <tr>
                    <td>
                        <img class="profile-pic" src="<%=prefets.Nom_PhotoURL%>" width="50">
                    </td>
                    <td><%=prefets.Nom_Key%></td>
                    <td><%=prefets.Nom_Name%></td>
                    <td><%=prefets.Nom_ClassSection%></td>
                    <td><%=prefets.Nom_VoteCount%></td>
                </tr>
                <%    } %>
            </table>
        </div>

        <div id="chartContainer1" style="width: 350px; height: 300px;">
        </div>
    </div>
    <div class="sub-chart-title">VICE PREFECT</div>
    <div>
        <div class="stud-table">
            <table cellpadding="0" cellspacing="0" border-collapse="colapse">
                <tr>
                    <th>Profile Picture</th>
                    <th>Candidate Id</th>
                    <th>Student Name</th>
                    <th>Class Section</th>
                    <th>Vote Count</th>
                </tr>
                <% foreach (VoatingSystem.Business.Entities.Nominees prefets in VicePreferList)
                   {%>
                <tr>
                    <td>
                        <img class="profile-pic" src="<%=prefets.Nom_PhotoURL%>" width="50">
                    </td>
                    <td><%=prefets.Nom_Key%></td>
                    <td><%=prefets.Nom_Name%></td>
                    <td><%=prefets.Nom_ClassSection%></td>
                    <td><%=prefets.Nom_VoteCount%></td>
                </tr>
                <%    } %>
            </table>
        </div>
        <div id="chartContainer2" style="width: 350px; height: 300px;">
        </div>
    </div>
    <div class="sub-chart-title">JUNIOR PREFECT</div>
    <div>
        <div class="stud-table">
            <table cellpadding="0" cellspacing="0" border-collapse="colapse">
                <tr>
                    <th>Profile Picture</th>
                    <th>Candidate Id</th>
                    <th>Student Name</th>
                    <th>Class Section</th>
                    <th>Vote Count</th>
                </tr>
                <% foreach (VoatingSystem.Business.Entities.Nominees prefets in JuniorPreferList)
                   {%>
                <tr>
                    <td>
                        <img class="profile-pic" src="<%=prefets.Nom_PhotoURL%>" width="50">
                    </td>
                    <td><%=prefets.Nom_Key%></td>
                    <td><%=prefets.Nom_Name%></td>
                    <td><%=prefets.Nom_ClassSection%></td>
                    <td><%=prefets.Nom_VoteCount%></td>
                </tr>
                <%    } %>
            </table>
        </div>
        <div id="chartContainer3" style="width: 350px; height: 300px;;">
        </div>
    </div>
</asp:Content>