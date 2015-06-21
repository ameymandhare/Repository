<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="SenateElectionReport.aspx.cs" Inherits="VoatingSystem.Admin.SenateElectionReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="../dist/js/Chart.min.js"></script>
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chart-title">Senate Election Report</div>
    <div class="stud-table">
        
        <table cellpadding="0" cellspacing="0" border-collapse="colapse">
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
        </table>
    </div>       
    
    <div id="chartContainer" style="width: 300px; height:200px; margin-left: 60px;">
    
    </div>

</asp:Content>
