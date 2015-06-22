<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="AHouseReport.aspx.cs" Inherits="VoatingSystem.Admin.AHouseReport" %>

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
            var chart = new CanvasJS.Chart("chartContainer",
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
                    toolTipContent: "{name}: {y}hrs",
                    showInLegend: true,
                    indexLabel: "#percent%",
                    dataPoints: [
                        { y: 52, name: "Time At Work", legendMarkerType: "triangle" },
                        { y: 44, name: "Time At Home", legendMarkerType: "square" },
                        { y: 12, name: "Time Spent Out", legendMarkerType: "circle" },
                        { y: 2, name: "Time Spent Out", legendMarkerType: "circle" }
                    ]
                }
                ]
            });
            chart.render();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chart-title">Agni House Report</div>
    <div class="stud-table">
        <div id="jsGrid"></div>
    <script>
        var $NoConflict = jQuery.noConflict();

        var Data = <%= JsonData.ToString()%>;
        $NoConflict(function () {

            $NoConflict("#jsGrid").jsGrid({
                height: "auto",
                width: "100%",
                filtering: true,
                editing: false,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "Do you really want to delete the client?",
                controller: {
                    loadData: function (filter) {
                        return $.grep(Data, function (student) {
                            return (!filter.Stud_Photo || student.Stud_Photo.toLowerCase().indexOf(filter.Stud_Photo.toLowerCase()) > -1)
                                && (!filter.Stud_Key || student.Stud_Key.toLowerCase().indexOf(filter.Stud_Key.toLowerCase()) > -1)
                                && (!filter.Stud_Name || student.Stud_Name.toLowerCase().indexOf(filter.Stud_Name.toLowerCase()) > -1)
                                && (!filter.Stud_ClassSection || student.Stud_ClassSection.toLowerCase().indexOf(filter.Stud_ClassSection.toLowerCase()) > -1)
                                && (!filter.Stud_VoteCount || student.Stud_VoteCount === filter.Stud_VoteCount)
                        });
                    }
                },
                fields: [
                    { name: "Stud_Photo", type: "text", width: 90, title: "Profile Picture"  },
                    { name: "Stud_Key", type: "text", width: 50, title: "Election ID" },
                    { name: "Stud_Name", type: "text", width: 90, title: "Student Name" },
                    { name: "Stud_ClassSection", type: "text", sorting: true, title: "Class Section"  },
                    { name: "Stud_VoteCount", type: "text", sorting: true, title: "Vote Count"  },
                    { type: "control", editButton: false, deleteButton: false  }
                ]
            });

        });
    </script>
        <%--<table cellpadding="0" cellspacing="0" border-collapse="colapse">
            <tr>
                <th>Profile Picture</th>
                <th>Username</th>
                <th>Student Name</th>
                <th>Class</th>
                <th>Vote Count</th>
            </tr>
            <tr>
                <td>
                    <img class="profile-pic" src="../dist/img/dT7eM7rac.png" width="50">
                </td>
                <td>renukap</td>
                <td>Renuks Padwal</td>
                <td>Ist</td>
                <td>20</td>
            </tr>
            <tr>
                <td>
                    <img class="profile-pic" src="../dist/img/boy.png" width="50">
                </td>
                <td>renukap</td>
                <td>Renuks Padwal</td>
                <td>Ist</td>
                <td>20</td>
            </tr>
            <tr>
                <td>
                    <img class="profile-pic" src="../dist/img/dT7eM7rac.png" width="50">
                </td>
                <td>renukap</td>
                <td>Renuks Padwal</td>
                <td>Ist</td>
                <td>20</td>
            </tr>
            <tr>
                <td>
                    <img class="profile-pic" src="../dist/img/boy.png" width="50">
                </td>
                <td>renukap</td>
                <td>Renuks Padwal</td>
                <td>Ist</td>
                <td>20</td>
            </tr>
        </table>--%>
    </div>       
    
    <div id="chartContainer" style="width: 300px; height:200px; margin-left: 60px;">
    
    </div>
</asp:Content>
