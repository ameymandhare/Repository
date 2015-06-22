using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.Admin
{
    public partial class StudentMaster : System.Web.UI.Page
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
                    studEn.Stud_Key = dr["stud_key"].ToString();
                    studEn.Stud_FName = dr["stud_FirstName"].ToString();
                    studEn.Stud_MName = dr["stud_MiddleName"].ToString();
                    studEn.Stud_LName = dr["stud_LastName"].ToString();
                    studEn.Stud_ClassSection = dr["Csc_DisplayName"].ToString();
                    studEn.Stud_GenderId = Convert.ToInt32(dr["stud_GenderId"]);
                    studEn.Stud_Password = dr["stud_Password"].ToString();

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