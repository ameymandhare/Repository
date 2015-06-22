using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.Admin
{
    public partial class AHouseReport : System.Web.UI.Page
    {
        private string jsonData;

        public string JsonData
        {
            get
            {
                DataTable dt = new DataTable();
                Authentication auth = new Authentication();
                dt = auth.GetAllStudent();
                StudentEntity studEn;
                List<StudentEntity> toEncode = new List<StudentEntity>();
                foreach (DataRow dr in dt.Rows)
                {
                    studEn = new StudentEntity();
                    studEn.Stud_Photo = dr["stud_Photo"].ToString();
                    studEn.Stud_Key = dr["stud_key"].ToString();
                    studEn.Stud_Name = dr["stud_FirstName"].ToString() + dr["stud_LastName"].ToString();
                    studEn.Stud_ClassSection = dr["Csc_DisplayName"].ToString();
                    studEn.Stud_VoteCount = Convert.ToInt32(dr["stud_VoteCount"]);

                    //repeat for all neaded colums
                    toEncode.Add(studEn);
                }
                string test = Json.Encode(toEncode);

                return test;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}