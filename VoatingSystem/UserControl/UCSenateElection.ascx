<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCSenateElection.ascx.cs" Inherits="VoatingSystem.UserControl.UCSenateElection" %>

<script src="../dist/js/tinybox.js" type="text/javascript"></script>
<script src="../dist/js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="../dist/css/TinyBox.css" rel="stylesheet" type="text/css" />

<div>
    <div class="chart-title">School Senate Election</div>
</div>

<div class="prefect-div">
    <div class="sub-chart-title">HEAD BOY</div>
    
    
        <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in HeadBoyList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="headBoySenate-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.HB %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
            
        </div>  
    </div>

<div class="prefect-div">
   <div class="sub-chart-title">HEAD GIRL</div>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in HeadGirlList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="headGirlSenate-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.HG %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
       </div>  
 </div>


<div class="prefect-div">
    <div class="sub-chart-title">Games Captain</div>
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in GamesCaptainList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="gameCaptainSenate-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.GC %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
            
        </div>  
 </div>


<div class="prefect-div">
    <div class="sub-chart-title">Vice Games Captain</div>
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in ViceGamesCaptainList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s',post:'id=16',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="viceGameCaptainSenate-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=s&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.VGC %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
      </div>  
 </div>
