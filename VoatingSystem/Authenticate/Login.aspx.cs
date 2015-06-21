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
                    if (student.Stud_HouseCode.ToString().Trim() == "AH")
                        Response.Redirect("~/Voting/AHouseNominees.aspx");
                    else if (student.Stud_HouseCode.ToString().Trim() == "VH")
                        Response.Redirect("~/Voting/VHouseNominees.aspx");
                    else if (student.Stud_HouseCode.ToString().Trim() == "PH")
                        Response.Redirect("~/Voting/PHouseNominees.aspx");
                }
            }
            catch (System.Threading.ThreadAbortException lException)
            {

                // do nothing

            }
            catch (Exception ex)
            {
                EWS.LogError(ex);
            }
        }
    }
}