<%@ Page Title="" Language="C#" MasterPageFile="~/Voting/Voating.Master" AutoEventWireup="true" CodeBehind="AHouseNominees.aspx.cs" Inherits="VoatingSystem.Voting.AHouseNominees" %>
<%@ Register Src="~/UserControl/UCSenateElection.ascx" TagPrefix="uc1" TagName="UCSenateElection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../dist/js/tinybox.js" type="text/javascript"></script>
    <script src="../dist/js/jquery-1.8.3.js" type="text/javascript"></script>
    <link href="../dist/css/TinyBox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".senate-vote a").click(function () {
                $(this).fadeTo("fast", .5).removeAttr("href");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Prithvi House Election</h3>
    </div>
    <div id="prefectDiv" class="prefect-div">
    <h5>Prefect</h5>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in PrefectList)
               { %>
            <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#" onclick="javascript:TINY.box.show({url:'Voteted.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h&designationcode=<%=nom.Nom_DesignationCode.ToString() %>',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})"">Vote Me</a></div>
                <%--<div class="senate-vote">
                    <asp:Button ID="btnVote'"<%=nom.Nom_Key.ToString() %>"'" runat="server" Text="Vote Me" /></div>--%>
            </div>
            <% } %>
    </div>
</div>

<div id="vicePrefectDiv" class="prefect-div">
    <h5>Vice Prefect</h5>
    
   <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in VicePrefectList)
               { %>
           <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
    </div>
</div>

<div id="juniorPrefectDiv" class="prefect-div">
    <h5>Junior Prefect</h5>
    
    <div class="HeadBoyRow">
            <% foreach (VoatingSystem.Business.Entities.Nominees nom in JuniorPrefectList)
               { %>
           <div class="senate-con">
                <div class="senate-profile"><img src="<%= nom.Nom_PhotoURL.ToString()%>" width="150"/></div>
                <div class="senate-name"><%= nom.Nom_Name.ToString()%></div>
                <div class="senate-about" onclick="javascript:TINY.box.show({url:'NomineeDetails.aspx?id=<%=nom.Nom_Key.ToString()%>&electtype=h',post:'id=<%=nom.Nom_Key.ToString()%>',width:300,height:200,opacity:20,topsplit:2})">About Me</div>
                <div class="senate-vote"><a href="#">Vote Me</a></div>
            </div>
            <% } %>
            
       </div>
</div>

    <div id="senate-div">
        <uc1:UCSenateElection runat="server" id="UCSenateElection" />
    </div>
</asp:Content>

