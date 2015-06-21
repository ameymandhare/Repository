<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestLogin.aspx.cs" Inherits="VoatingSystem.Voting.TestLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>YO YO...</h1>
        <% VoatingSystem.Business.Entities.StudentEntity a = (VoatingSystem.Business.Entities.StudentEntity)Session["LoggedInUser"];
           Response.Write(a.Stud_FName.ToString());%>
    </div>
    </form>
</body>
</html>
