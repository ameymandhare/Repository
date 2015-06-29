<%@ Page Title="" Language="C#" MasterPageFile="~/Voting/Voating.Master" AutoEventWireup="true" CodeBehind="VHouseNominees.aspx.cs" Inherits="VoatingSystem.Voting.VHouseNominees" %>
<%@ Register Src="~/UserControl/UCSenateElection.ascx" TagPrefix="uc1" TagName="UCSenateElection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../dist/js/tinybox.js" type="text/javascript"></script>
    <script src="../dist/js/jquery-1.8.3.js" type="text/javascript"></script>
    <link href="../dist/css/TinyBox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            //FOR HOUSE
            var prfect = '<%= VotetedStatus.Vst_IVFPrfect %>'.toLowerCase();
            var vicePrefect = '<%= VotetedStatus.Vst_IVFVicePrefect %>'.toLowerCase();
            var juniorPrefect = '<%= VotetedStatus.Vst_IVFJuniorPrefet %>'.toLowerCase();
            var headBoySenate = '<%= VotetedStatus.Vst_IVFHeadBoy %>'.toLowerCase();
            var headGirlSenate = '<%= VotetedStatus.Vst_IVFHeadGirl %>'.toLowerCase();
            var gameCaptainSenate = '<%= VotetedStatus.Vst_IVFGamesCap %>'.toLowerCase();
            var viceGameCaptainSenate = '<%= VotetedStatus.Vst_IVFGamesViceCap %>'.toLowerCase();

            if (prfect === 'true') {
                $("#prefect-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            if (vicePrefect === 'true') {
                $("#vicePrefect-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            if (juniorPrefect === 'true') {
                $("#juniorPrefect-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            //FOR SENET
            if (headBoySenate === 'true') {
                $("#headBoySenate-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            if (headGirlSenate === 'true') {
                $("#headGirlSenate-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            if (gameCaptainSenate === 'true') {
                $("#gameCaptainSenate-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
            if (viceGameCaptainSenate === 'true') {
                $("#viceGameCaptainSenate-vote a").each(function (index) {
                    this.style.display = 'none';
                });
            }
        });
    </script>

    <script type="text/javascript">
        function closeJS() {
            location.reload(true);
        };
    </script>

</asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="chart-title">Varun House Election</div>
    </div>
    <div id="prefectDiv" class="prefect-div">
    <div class="sub-chart-title">PREFECT</div>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in PrefectList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="prefect-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.PR %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
                <%--<div class="senate-vote">
                    <asp:Button ID="btnVote'"<%=nom.Nom_Key.ToString() %>"'" runat="server" Text="VOTE" /></div>--%>
            </div>
            <% } %>
    </div>
</div>

    <div id="vicePrefectDiv" class="prefect-div">
    <div class="sub-chart-title">VICE PREFECT</div>
    
   <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in VicePrefectList)
               { %>
           <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="vicePrefect-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.VP %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
    </div>
</div>

    <div id="juniorPrefectDiv" class="prefect-div">
   <div class="sub-chart-title">JUNIOR PREFECT</div>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in JuniorPrefectList)
               { %>
           <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:450,height:250,opacity:20,topsplit:2})">About Me</div>
                <div id="juniorPrefect-vote" class="senate-vote"><a href="javascript:void(0);" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h&columnname=<%=VoatingSystem.Business.Constants.ProcedureConstant.JP %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2,closejs:function(){closeJS()}})"">VOTE</a></div>
            </div>
            <% } %>
            
       </div>
</div>
    
    <div id="senate-div">
        <uc1:UCSenateElection runat="server" id="UCSenateElection" />
    </div>
</asp:Content>