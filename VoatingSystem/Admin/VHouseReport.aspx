<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="VHouseReport.aspx.cs" Inherits="VoatingSystem.Admin.VHouseReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chart-title">Varun House Report</div>
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
                    <img class="profile-pic" src="../dist/img/dT7eM7rac.png" width="50">
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
                    <img class="profile-pic" src="../dist/img/dT7eM7rac.png" width="50">
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
