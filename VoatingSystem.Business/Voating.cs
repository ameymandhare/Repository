using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using VoatingSystem.Business.Constants;
using VoatingSystem.Core.DataAccess;

namespace VoatingSystem.Business
{
    public class Voating
    {
        public DataTable GetHouseNominations(int houseId)
        {
            DataTable mytable = null;
            String key = "AllNominiseStudentData";
            if (HttpContext.Current.Cache[key] == null)
            {
                using (SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, ProcedureConstant.SPGetHouseNominationsNameByHouseId))
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
    }
}
