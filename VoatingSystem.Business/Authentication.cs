using System;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using VoatingSystem.Business.Constants;
using VoatingSystem.Business.Entities;
using VoatingSystem.Core.DataAccess;

namespace VoatingSystem.Business
{
    public class Authentication
    {

        public DataTable GetAllStudent()
        {
            DataTable mytable = null;
            String key = "AllStudentData";
            if (HttpContext.Current.Cache[key] == null)
            {
                using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetAllStudents))
                {
                    if (dr.HasRows)
                    {
                        mytable = new DataTable();
                        mytable.Load(dr);
                    }
                }

                if (mytable != null && mytable.Rows.Count > 0)
                {
                    HttpContext.Current.Cache.Insert(key, mytable, null, DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                }
            }
            else
            {
                mytable = (DataTable)HttpContext.Current.Cache[key];
            }
            return mytable;
        }

        public Nominees GetStudentByElectionId(string ElectionId)
        {
            DataTable mytable = null;
            String key = "AllStudentData";
            if (HttpContext.Current.Cache[key] == null)
            {
                using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetAllStudents))
                {
                    if (dr.HasRows)
                    {
                        mytable = new DataTable();
                        mytable.Load(dr);
                    }
                }

                if (mytable != null && mytable.Rows.Count > 0)
                {
                    HttpContext.Current.Cache.Insert(key, mytable, null, DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                }
            }
            else
            {
                mytable = (DataTable)HttpContext.Current.Cache[key];
            }

            Nominees studNom = null;

            foreach (DataRow dr in mytable.Rows)
            {
                if (dr["StudentID"].ToString().ToLower() == ElectionId.ToLower())
                {
                    studNom = new Nominees();
                    studNom.Nom_Id = Convert.ToInt32(dr["NomineeId"]);
                    studNom.Nom_Key = dr["StudentID"].ToString();
                    studNom.Nom_Name = dr["StudentName"].ToString();
                    studNom.Nom_DesignationId = Convert.ToInt32(dr["DesignationID"]);
                    studNom.Nom_DesignationKey = dr["DesignationText"].ToString();
                    studNom.Nom_ClassSection = dr["ClassSection"].ToString();
                    studNom.Nom_PhotoURL = dr["PhotoURL"].ToString();
                    studNom.Nom_AboutNominee = dr["AboutMe"].ToString();
                    
                    break;
                }
            }

            return studNom;
        }

        public StudentEntity CheckStudentExist(string UserName, string Password)
        {
            try
            {
                SqlDataReader dr = null;

                dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPVerifyUser, UserName, Password);

                if (!dr.HasRows)
                {
                    return null;
                }
                else
                {
                    StudentEntity studentSession = null;

                    using (dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetUserSession, UserName, "c"))
                    {
                        if (dr.HasRows)
                        {
                            studentSession = new StudentEntity();

                            while (dr.Read())
                            {
                                studentSession.Stud_Id = dr.GetInt32(0);
                                studentSession.Stud_Key = dr.GetString(1);
                                studentSession.Stud_FName = dr.GetString(2);
                                studentSession.Stud_MName = dr.GetString(3);
                                studentSession.Stud_LName = dr.GetString(4);
                                studentSession.Stud_DoB = dr.GetDateTime(5);
                                studentSession.Stud_GenderId = dr.GetInt32(6);
                                studentSession.Stud_Gender = dr.GetString(7);
                                studentSession.Stud_GenderCode = dr.GetString(8);
                                studentSession.Stud_ClassSectionId = dr.GetInt32(9);
                                studentSession.Stud_ClassId = dr.GetInt32(10);
                                studentSession.Stud_Class = dr.GetString(11);
                                studentSession.Stud_SectionId = dr.GetInt32(12);
                                studentSession.Stud_Section = dr.GetString(13);
                                studentSession.Stud_ClassSection = dr.GetString(14);
                                studentSession.Stud_HouseId = dr.GetInt32(15);
                                studentSession.Stud_HouseName = dr.GetString(16);
                                studentSession.Stud_UserType = dr.GetString(17);
                                studentSession.Stud_HouseCode = dr.GetString(18);
                                studentSession.Stud_Photo = dr.GetInt32(6) == 1 ? "../dist/img/boy.png" : "../dist/img/dT7eM7rac.png";// string.Empty;// dr.GetString(19);
                                break;
                            }
                        }
                    }

                    return studentSession;
                }
            }
            catch (Exception ex)
            {
                SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Error, ex.ToString());
                return null;
            }
        }

        public bool UpdateResetPassword(string UserName, string Password, DateTime DoB)
        {
            bool IsResetUpdate = false;

            try
            {
                if (SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPUpdateUserPassword, UserName, DoB, Password) > 0)
                {
                    IsResetUpdate = true;
                }

                return IsResetUpdate;
            }
            catch (Exception ex)
            {
                SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Error, ex.ToString());
                return IsResetUpdate;
            }
        }
    }
}
