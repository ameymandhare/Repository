<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NomineeDetails.aspx.cs" Inherits="VoatingSystem.Voting.NomineeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:100%">
            <table style="width:100%">
                <tr>
                    <td>
                        <img src="<%= Nominee.Nom_PhotoURL.ToString()%>" width="150"/><%--<%= Nominee.Nom_PhotoURL %>--%>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>Student Id: </td>
                                <td><%= Nominee.Nom_Key %></td>
                            </tr>
                            <tr>
                                <td>Name: </td>
                                <td><%= Nominee.Nom_Name %></td>
                            </tr>
                            <tr>
                                <td>Class Section: </td>
                                <td><%= Nominee.Nom_ClassSection %></td>
                            </tr>
                            <tr>
                                <td>Designation:</td>
                                <td><%= Nominee.Nom_DesignationKey %></td>
                            </tr>
                            <tr>
                                <td>About Me: </td>
                                <td><%= Nominee.Nom_AboutNominee %></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
