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
    public class Nomination
    {
        public DataTable GetAllSenateNominees()
        {
            DataTable mytable = null;
            String key = "AllSenateNominees";
            //if (HttpContext.Current.Cache[key] == null)
            //{
                using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetAllSenateNominees))
                {
                    if (dr.HasRows)
                    {
                        mytable = new DataTable();
                        mytable.Load(dr);
                    }
                }

                //if (mytable != null && mytable.Rows.Count > 0)
                //{
                //    HttpContext.Current.Cache.Insert(key, mytable, null, DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                //}
            //}
            //else
            //{
            //    mytable = (DataTable)HttpContext.Current.Cache[key];
            //}
            return mytable;
        }

        public Nominees GetSenateNomineesById(string studId)
        {
            DataTable mytable = null;
            String key = "AllSenateNominees";
            if (HttpContext.Current.Cache[key] == null)
            {
                using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetAllSenateNominees))
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
                if (dr["StudentID"].ToString().ToLower() == studId.ToLower())
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

        public DataTable GetHouseNominations(int houseId)
        {
            DataTable mytable = null;
            String key = "AllHouseNominees";
            //if (HttpContext.Current.Cache[key] == null)
            //{
            using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetHouseNominationsNameByHouseId, houseId))
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
            //}
            //else
            //{
            //    mytable = (DataTable)HttpContext.Current.Cache[key];
            //}
            return mytable;
        }

        public Nominees GetHouseNominationsById(string studId)
        {
            DataTable mytable = null;
            String key = "AllHouseNominees";
            //if (HttpContext.Current.Cache[key] == null)
            //{
            using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetHouseNominationsNameByHouseId, 0))
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
            //}
            //else
            //{
            //    mytable = (DataTable)HttpContext.Current.Cache[key];
            //}
            Nominees studNom = null;

            foreach (DataRow dr in mytable.Rows)
            {
                if (dr["StudentID"].ToString().ToLower() == studId.ToLower())
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

        public bool UpdateCandidateVote(VotetedStudents votetedStudents, string ColumnName)
        {
            return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPUpdateCandidateVote,
                                      votetedStudents.Vst_StudentKey.ToString(),
                                      votetedStudents.Nomiees.Nom_Key,
                                      votetedStudents.Nomiees.Nom_ElectYype,
                                      ColumnName) > 0);
        }

        public VotetedStudents GetVotetedStudentsStatus(string studId)
        {
            VotetedStudents votetedStudents = null;
            using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetVoteStatus, studId))
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        votetedStudents = new VotetedStudents();
                        votetedStudents.Vst_StudentKey = dr["Vst_StudentKey"].ToString();
                        votetedStudents.Vst_IVFPrfect = Convert.ToBoolean(dr["Vst_IVFPrfect"]);
                        votetedStudents.Vst_IVFVicePrefect = Convert.ToBoolean(dr["Vst_IVFVicePrefect"]);
                        votetedStudents.Vst_IVFJuniorPrefet = Convert.ToBoolean(dr["Vst_IVFJuniorPrefet"]);
                        votetedStudents.Vst_IVFHeadBoy = Convert.ToBoolean(dr["Vst_IVFHeadBoy"]);
                        votetedStudents.Vst_IVFHeadGirl = Convert.ToBoolean(dr["Vst_IVFHeadGirl"]);
                        votetedStudents.Vst_IVFGamesCap = Convert.ToBoolean(dr["Vst_IVFGamesCap"]);
                        votetedStudents.Vst_IVFGamesViceCap = Convert.ToBoolean(dr["Vst_IVFViceGamesCap"]);
                    }
                }
            }
            return votetedStudents;
        }
    }
}
