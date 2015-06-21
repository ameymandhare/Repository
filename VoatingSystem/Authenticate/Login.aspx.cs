using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Common;
using VoatingSystem.Business.Entities;


namespace VoatingSystem.Authenticate
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_LogIn_Click(object sender, EventArgs e)
        {
            try
            {
                Authentication auth = new Authentication();
                StudentEntity student = auth.CheckStudentExist(username.Text.ToString().ToLower(), password.Text.ToString().ToLower());

                if (student != null)
                {
                    Session["LoggedInUser"] = student;
                    Response.Redirect("~/Voting/StudentElection.aspx");
                }
            }
            catch (Exception ex)
            {
                EWS.LogError(ex);
            }
        }
    }
}