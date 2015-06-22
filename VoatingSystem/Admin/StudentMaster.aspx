<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="StudentMaster.aspx.cs" Inherits="VoatingSystem.Admin.StudentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="../dist/css/JSGridDemo.css" />--%>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600,400' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="../dist/css/jsgrid.css" />
    <link rel="stylesheet" type="text/css" href="../dist/css/theme.css" />

    <script src="../dist/js/jquery-1.8.3.js"></script>

    <script src="../dist/js/JSGrid/jsgrid.core.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.load-indicator.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.load-strategies.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.sort-strategies.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.text.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.number.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.select.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.checkbox.js"></script>
    <script src="../dist/js/JSGrid/jsgrid.field.control.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Student Master</h1>
    <div id="jsGrid"></div>
    <script>
        var $NoConflict = jQuery.noConflict();

        var Data = <%= JsonData.ToString()%>;
        $NoConflict(function () {

            $NoConflict("#jsGrid").jsGrid({
                height: "auto",
                width: "100%",
                filtering: true,
                editing: false,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "Do you really want to delete the client?",
                controller: {
                    loadData: function (filter) {
                        return $.grep(Data, function (student) {
                            return (!filter.Stud_Key || student.Stud_Key.toLowerCase().indexOf(filter.Stud_Key.toLowerCase()) > -1)
                                && (!filter.Stud_FName || student.Stud_FName.toLowerCase().indexOf(filter.Stud_FName.toLowerCase()) > -1)
                                && (!filter.Stud_MName || student.Stud_MName.toLowerCase().indexOf(filter.Stud_MName.toLowerCase()) > -1)
                                && (!filter.Stud_LName || student.Stud_LName.toLowerCase().indexOf(filter.Stud_LName.toLowerCase()) > -1)
                                && (!filter.Stud_GenderId || student.Stud_GenderId === filter.Stud_GenderId)
                                && (!filter.Stud_ClassSection || student.Stud_ClassSection.toLowerCase().indexOf(filter.Stud_ClassSection.toLowerCase()) > -1)
                        });
                    }
                },
                fields: [
                    { name: "Stud_Key", type: "text", width: 50, title: "Election ID" },
                    { name: "Stud_FName", type: "text", width: 90, title: "First Name" },
                    { name: "Stud_MName", type: "text", width: 90, title: "Middle Name"  },
                    { name: "Stud_LName", type: "text", width: 90, sorting: true , title: "Last Name" },
                    {
                        name: "Stud_GenderId",
                        type: "select",
                        items: [
                             { Name: "", Id: 0 },
                             { Name: "Boy", Id: 1 },
                             { Name: "Girl", Id: 2 }
                        ],
                            valueField: "Id",
                            textField: "Name",
                            title: "Gender",
                            width: 30,
                    },
                    { name: "Stud_ClassSection", type: "text", sorting: true, title: "Class Section"  },
                    { name: "Stud_Password", type: "text", sorting: false, title: "Password"  },
                    { type: "control", editButton: false, deleteButton: false  }
                ]
            });

        });
    </script>
</asp:Content>
