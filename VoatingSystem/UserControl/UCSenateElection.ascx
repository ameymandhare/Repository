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
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:500,height:300,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
            
        </div>  
    </div>

<div>
    <h5>Head Girl</h5>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in HeadGirlList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:500,height:300,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
       </div>  
 </div>


<div>
    <h5>Games Captain</h5>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in GamesCaptainList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:500,height:300,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
            
        </div>  
 </div>


<div>
    <h5>Vice Games Captain</h5>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in ViceGamesCaptainList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=16',width:500,height:300,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
      </div>  
 </div>
