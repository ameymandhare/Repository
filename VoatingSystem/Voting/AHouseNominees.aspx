<%@ Page Title="" Language="C#" MasterPageFile="~/Voting/Voating.Master" AutoEventWireup="true" CodeBehind="AHouseNominees.aspx.cs" Inherits="VoatingSystem.Voting.AHouseNominees" %>
<%@ Register Src="~/UserControl/UCSenateElection.ascx" TagPrefix="uc1" TagName="UCSenateElection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../dist/js/tinybox.js" type="text/javascript"></script>
    <script src="../dist/js/jquery-1.8.3.js" type="text/javascript"></script>
    <link href="../dist/css/TinyBox.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Prithvi House Election</h3>
    </div>
    <div id="prefect-div">
    <h5>Prefect</h5>
    
    <table>
        <tr class="PrefectRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in PrefectList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>

<div id="vicePrefect-div">
    <h5>Vice Prefect</h5>
    
    <table>
        <tr class="VicePrefectRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in VicePrefectList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>

<div id="juniorPrefect-div">
    <h5>Junior Prefect</h5>
    
    <table>
        <tr class="GamesCapRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in JuniorPrefectList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>
    <div id="senate-div">
        <uc1:UCSenateElection runat="server" id="UCSenateElection" />
    </div>
</asp:Content>

