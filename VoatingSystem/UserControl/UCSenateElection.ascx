<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCSenateElection.ascx.cs" Inherits="VoatingSystem.UserControl.UCSenateElection" %>

<script src="../dist/js/tinybox.js" type="text/javascript"></script>
<script src="../dist/js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="../dist/css/TinyBox.css" rel="stylesheet" type="text/css" />

<div>
    <h3>School Senate Election</h3>
</div>

<div>
    <h5>Head Boy</h5>
    
    
        <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in HeadBoyList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><%= nom.Nom_PhotoURL.ToString()%></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote">Vote Button</div>
            </div>
            <% } %>
            
        </div>  
</div>

<div>
    <h5>Head Girl</h5>
    
    <table>
        <tr class="HeadGirlRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in HeadGirlList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>

<div>
    <h5>Games Captain</h5>
    
    <table>
        <tr class="GamesCapRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in GamesCaptainList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>

<div>
    <h5>Vice Games Captain</h5>
    
    <table>
        <tr class="GamesViceCapRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in ViceGamesCaptainList)
               { %>
            <td>
                <div><%= nom.Nom_PhotoURL.ToString()%></div>
                <div><%= nom.Nom_Name.ToString()%></div>
                <div onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>',post:'id=16',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div>Vote Button</div>
            </td>
            <% } %>
            
        </tr>
    </table>
</div>
