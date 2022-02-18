using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace PS_CaneMonitor
{
    public class GsysSQL
    {
        //Execute Data
        public static DataTable fncGetQueryData(string lvSQL,DataTable dt)
        {
            string query = lvSQL;
            DataTable DTReturn = new DataTable();
            SqlDataAdapter DA = new SqlDataAdapter(query, System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            DA.Fill(DTReturn);

            return DTReturn;
        }

        public static string fncExecuteQueryData(string lvSQL)
        {
            string lvReturn = "";
            try
            {
                string query = lvSQL;
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                con.Open();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();

                con.Close();
                con.Dispose();

                lvReturn = "Success";
                return lvReturn;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public static string fncG12()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20211216' OR Q_WeightFinish = '1') and Q_CloseStatus = '' and  Q_Year ='' ";
            //lvSQL += "AND Q_WeightIN > 0 AND Q_WeightOUT > 0 ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG13()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate >= '20191130' And Q_WeightOUTDate = '' and Q_WeightFinish = '' and Q_CloseStatus = '' and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG14()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') and Q_CloseStatus = '' And Q_CaneType in ('1','17','3','7','5','15','11','13') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG15()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') and Q_CloseStatus = '' And Q_CaneType in ('14','12','16','6','8','4','18','2')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG21()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate != '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_Rail = 'A' and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG22()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate != '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_Rail = 'B'and  Q_Year =''  ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close()  ;
            con.Close();
            
            return lvReturn;
        }

        public static string fncF1()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CaneType not in ('5','11','6','12') and  Q_Year =''"; //,'บรรทุก',' '
            lvSQL += "And Q_CarType in ('สิบล้อ','พ่วง') and Q_CaneType in ('1','17','3','7')";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncF2()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('เทนเลอร์')  And Q_CaneType not in ('5','11','6','12') and  Q_Year =''";
            lvSQL += " And Q_CarType in ('เทนเลอร์') and Q_CaneType in ('1','17','3','7') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncF3()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('สาวแต๋น') And Q_CaneType not in ('5','11','6','12') and  Q_Year =''";
            lvSQL += "And Q_CarType in ('สาวแต๋น') And Q_CaneType  in ('1','17','3','7') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG24()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CaneType not in ('5','11','6','12') and  Q_Year =''"; //,'บรรทุก',' '
            lvSQL += " And Q_CarType in ('สิบล้อ','พ่วง') and Q_CaneType in ('2','18','4','8')";

           cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG25()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CaneType in ('5','11','6','12') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG26()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('เทนเลอร์')  And Q_CaneType not in ('5','11','6','12') and  Q_Year =''";
            lvSQL += " And Q_CarType in ('เทนเลอร์') and Q_CaneType in ('2','18','4','8') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG27()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('สาวแต๋น') And Q_CaneType not in ('5','11','6','12') and  Q_Year =''";
            lvSQL += "And Q_CarType in ('สาวแต๋น') And Q_CaneType  in ('2','18','4','8') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc29()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''";
            lvSQL += "And Q_CarType in ('สิบล้อ','พ่วง') And Q_CaneType in ('5','11','6','12') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc31()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = ''and  Q_Year ='' ";
            lvSQL += "And Q_CarType in ('เทนเลอร์') And Q_CaneType in ('5','11','6','12') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc32()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' ";
            lvSQL += "And Q_CarType in ('สาวแต๋น') And Q_CaneType in ('5','11','6','12') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG31()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary HD ";
            //ใหม่
            //lvSQL += "Where 1=1 AND Q_Status = 'Active' AND Q_CloseStatus = '' AND Q_Rail = 'A' AND Q_Year = '' ";
            //lvSQL += "AND Q_WeightIN > 0 ";
            //lvSQL += "AND Q_WeightOut > 0 ";

            //เก่า
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' or Q_WeightFinish = '1') and Q_CloseStatus = '' and Q_Rail = 'A' and  Q_Year ='' ";
            //lvSQL += "and (select Q_CloseStatus from Queue_Diary DT where DT.Q_No = FLOOR(HD.Q_No)) = '' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,##0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG32()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary HD ";
            ////ใหม่
            //lvSQL += "Where 1=1 AND Q_Status = 'Active' AND Q_CloseStatus = '' AND Q_Rail = 'B' AND Q_Year = '' ";
            //lvSQL += "AND Q_WeightIN > 0 ";
            //lvSQL += "AND Q_WeightOut > 0 ";

            //เก่า
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' or Q_WeightFinish = '1') and Q_CloseStatus = '' and Q_Rail = 'B' and  Q_Year =''";
            //lvSQL += "and (select Q_CloseStatus from Queue_Diary DT where DT.Q_No = FLOOR(HD.Q_No)) = '' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,##0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc33()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('11') And Q_CloseStatus = '' and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc39()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('11') And Q_CloseStatus = ''and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG34()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//Count(Q_No) as CCount, 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' and Q_CloseStatus = '' and Q_Rail = 'A' and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG35()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//Count(Q_No) as CCount , 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' and Q_CloseStatus = '' and Q_Rail = 'B' and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG41()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' and  Q_Year =''";//and Q_CloseStatus = '1'

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG44()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            GVar.gvSumAmount = "";
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') and  Q_Year ='' ";//and Q_CloseStatus = '1'

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG42()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion
            
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('1','17','3','7','5','15','11','13') and  Q_Year =''";// ---   And Q_CaneType in ('14','12','16','6','8','4','18','2')

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG43()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion
            
            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('14','12','16','6','8','4','18','2')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG51()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('11')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG54()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('11') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG52()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('12')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG55()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('12') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG61()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' And (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('5') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG64()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//,  Count(Q_No) as CCount
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' And Q_WeightOUTDate >= '20191130' And Q_CaneType in ('5')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG62()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('6') and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG654()//ไฟ
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And  Q_CaneType in ('12','6','2','18','4','8','6','14') and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG656()//สด
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And  Q_CaneType in ('1','17','3','7','5','15','11','13') and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncG65()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('6')and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        
        public static string fnc34()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('12')  And Q_CloseStatus = '' and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc40()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('12')  And Q_CloseStatus = '' and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc36()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' And (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('5') And Q_CloseStatus = ''and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc37()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";//, Sum(Q_WeightIN - Q_WeightOUT) as CSum
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('6')  And Q_CloseStatus = '' and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                    //lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.000");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc42()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//,  Count(Q_No) as CCount 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' And (Q_WeightOUTDate >= '20191130' OR Q_WeightFinish = '1') And Q_CaneType in ('5')  And Q_CloseStatus = '' and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fnc43()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Sum(Q_WeightIN - Q_WeightOUT) as CSum ";//, Count(Q_No) as CCount 
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightOUTDate >= '20191130' And Q_CaneType in ('6')  And Q_CloseStatus = ''and  Q_Year ='' ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###");
                    lvReturn = (Gstr.fncToDouble(dr["CSum"].ToString()) / 1000).ToString("#,##0.00");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncNew1()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CaneType not in ('5','11','6','12') and  Q_Year =''"; 
            lvSQL += " And Q_CarType like '%6 ล้อ%' and Q_CaneType in ('2','18','4','8')";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncNew2()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CaneType not in ('5','11','6','12') and  Q_Year =''"; //,'บรรทุก',' '
            lvSQL += "And Q_CarType like '%6 ล้อ%' and Q_CaneType in ('1','17','3','7')";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncNew3()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''";
            lvSQL += "And Q_CarType like '%6 ล้อ%' And Q_CaneType in ('5','11','6','12') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCane(string lvRail, string lvDateS, string lvDateE)
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCar = "";
            GVar.gvSumCane = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Rail = '"+ lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) >= CONVERT(datetime, '"+ lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) <= CONVERT(datetime, '" + lvDateE + "' + ' ' + '15:00:59', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    GVar.gvCountCar = dr["CCount"].ToString();
                    GVar.gvSumCane = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCaneAS(string lvRail, string lvDateS, string lvDateE) //สด เลือกวันถัน เริ่ม - จบ
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCarSA = "";
            GVar.gvSumCaneSA = "";
            GVar.gvCountCarSB = "";
            GVar.gvSumCaneSB = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_CaneType in ('1','17','3','7','5','15','11','13') and Q_Rail = '" + lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) >= CONVERT(datetime, '" + lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) <= CONVERT(datetime, '" + lvDateE + "' + ' ' + '15:00:59', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (lvRail == "A")
                    {
                        GVar.gvCountCarSA = dr["CCount"].ToString();
                        GVar.gvSumCaneSA = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }
                  else  if (lvRail == "B")
                    {
                        GVar.gvCountCarSB = dr["CCount"].ToString();
                        GVar.gvSumCaneSB = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }

                    lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCaneAF(string lvRail, string lvDateS, string lvDateE) //ไฟไหม้ เลือกวันถัน เริ่ม - จบ
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCarFA = "";
            GVar.gvSumCaneFA = "";
            GVar.gvCountCarFB = "";
            GVar.gvSumCaneFB = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_CaneType in ('12','6','2','18','4','8','6','14') and Q_Rail = '" + lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) >= CONVERT(datetime, '" + lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) <= CONVERT(datetime, '" + lvDateE + "' + ' ' + '15:00:59', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (lvRail == "A")
                    {
                        GVar.gvCountCarFA = dr["CCount"].ToString();
                        GVar.gvSumCaneFA = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }
                    else if (lvRail == "B")
                    {
                        GVar.gvCountCarFB = dr["CCount"].ToString();
                        GVar.gvSumCaneFB = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }


                    lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCaneBeforeSA(string lvRail, string lvDateS)//สด A
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCarSA = "";
            GVar.gvSumCaneSA = "";
            GVar.gvCountCarSB = "";
            GVar.gvSumCaneSB = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_CaneType in ('1','17','3','7','5','15','11','13') and Q_Rail = '" + lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) < CONVERT(datetime, '" + lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (lvRail == "A")
                    {
                        GVar.gvCountCarSA = dr["CCount"].ToString();
                        GVar.gvSumCaneSA = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");

                    }
                    else if (lvRail == "B")
                    {
                        GVar.gvCountCarSB = dr["CCount"].ToString();
                        GVar.gvSumCaneSB = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }

                    lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCaneBeforeFA(string lvRail, string lvDateS)//ไฟไฟม้ A
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCarFA = "";
            GVar.gvSumCaneFA = "";
            GVar.gvCountCarFB = "";
            GVar.gvSumCaneFB = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_CaneType in ('12','6','2','18','4','8','6','14') and Q_Rail = '" + lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) < CONVERT(datetime, '" + lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (lvRail == "A")
                    {
                        GVar.gvCountCarFA = dr["CCount"].ToString();
                        GVar.gvSumCaneFA = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");

                    }
                    else if (lvRail == "B")
                    {
                        GVar.gvCountCarFB = dr["CCount"].ToString();
                        GVar.gvSumCaneFB = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    }

                        lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncGetCountCarAndCaneBefore(string lvRail, string lvDateS)
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";
            GVar.gvCountCar = "";
            GVar.gvSumCane = "";

            cmd.Connection = con;
            con.Open();
            lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Rail = '" + lvRail + "' And ";
            lvSQL += "CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) < CONVERT(datetime, '" + lvDateS + "' + ' ' + '15:01:00', 103) And ";
            lvSQL += "Q_WeightIN > 0 And Q_WeightOUT > 0 and Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    GVar.gvCountCar = dr["CCount"].ToString();
                    GVar.gvSumCane = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,###0.00");
                    lvReturn = "Success";
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static void fncGetDataCane(string lvRail, string lvCaneType, string lvDateS, string lvDateE, string lvTimeS, string lvTimeE, string lvCloseStatus)
        {
            GVar.gvDataCount = "0";
            GVar.gvDataSum = "0";

            try
            {
                #region ONLINE
                #region //Connect Database 
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                #endregion

                string lvSQL = "select count(Q_No) as CCount , sum(Q_WeightIN-Q_WeightOut) as CTotal ";
                lvSQL += "from Queue_Diary ";
                lvSQL += "where Q_CaneType in ('" + lvCaneType + "') ";
                if (lvRail != "") lvSQL += "And Q_Rail = '" + lvRail + "' ";
                lvSQL += "And CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) >= CONVERT(datetime, '" + lvDateS + "' + ' ' + '" + lvTimeS + "', 103) ";
                lvSQL += "And CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) <= CONVERT(datetime, '" + lvDateE + "' + ' ' + '" + lvTimeE + "', 103) ";

                //lvSQL += "And Q_CloseStatus = '"+ lvCloseStatus + "'";
                lvSQL += "And Q_WeightIN > 0 And Q_WeightOUT > 0 ";

                cmd.Connection = con;
                con.Open();
                cmd.CommandText = lvSQL;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        GVar.gvDataCount = dr["CCount"].ToString();
                        //GVar.gvDataSum = dr["CTotal"].ToString(); // กก
                        GVar.gvDataSum = (Gstr.fncToDouble(dr["CTotal"].ToString()) / 1000).ToString("#,##0.00"); //ตัน
                    }
                }
                else
                {
                    GVar.gvDataCount = "0";
                    GVar.gvDataSum = "0";
                }

                dr.Close();
                con.Close();
                #endregion
            }
            catch
            {
                GVar.gvDataCount = "0";
                GVar.gvDataSum = "0";
            }
        }

        public static int fncGetCarCountByDate(string lvDate, string lvTime, string lvStatus)
        {
            try
            {
                #region ONLINE
                #region //Connect Database 
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                #endregion

                int lvReturn = 0;

                string lvSQL = "select Count(Q_PK) as CCount ";
                lvSQL += "from Queue_Diary ";

                if (lvStatus == "Q")
                    lvSQL += "where CONVERT(datetime, Q_Date + ' ' + Q_Time, 103) <= '"+ lvDate + " "+ lvTime + "' ";
                else
                    lvSQL += "where CONVERT(datetime, Q_WeightOUTDate + ' ' + Q_WeightOUTTime, 103) <= '" + lvDate + " " + lvTime + "' ";
                
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = lvSQL;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lvReturn = Gstr.fncToInt(dr["CCount"].ToString());
                    }
                }
                else
                {
                    return lvReturn;
                }

                dr.Close();
                con.Close();

                return lvReturn;
                #endregion
            }
            catch
            {
                return 0;
            }
        }

        public static string fncGetCarCarnumDate(string lvDate, string lvTime )
        {
            
            
                #region ONLINE
                #region //Connect Database 
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                #endregion

                string lvReturn = "";

                string lvSQL = "SELECT C_Carnum FROM Queue_Carnum ";              
                lvSQL += "WHERE C_DateFinish='"+ lvDate + "' ";
                lvSQL += "AND C_Time ='"+ lvTime + "' ";

                cmd.Connection = con;
                con.Open();
                cmd.CommandText = lvSQL;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lvReturn = Gstr.fncToInt(dr["C_Carnum"].ToString()).ToString();
                    }
                }
                else
                {
                    return lvReturn;
                }

                dr.Close();
                con.Close();

                return lvReturn;
                #endregion
            
           
        }

        //Function Check
        public static string fncCheckLogin(string lvUser, string lvPass)
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion  

            string lvReturn = "";

            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "SELECT * FROM SysUser WHERE us_UserID = '" + lvUser + "' AND us_Password = '" + lvPass + "' And us_Active = '1' ";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = dr["us_UserID"].ToString();
                    //GVar.gvFirstUrl = dr["us_URL"].ToString();
                    //GVar.gvKet = dr["us_Ket"].ToString();
                    //GVar.gvUserType = dr["us_Type"].ToString();
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        public static string fncCheckOnlineStatus(string lvUser)
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion  

            string lvReturn = "";

            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "SELECT * FROM SysLoginTable WHERE L_UserName = '" + lvUser + "' ";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = dr["L_UserName"].ToString();
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }

        //Log
        public static string fncKeepLogData(string lvUser, string lvDisplay, string lvActivity)
        {
            string lvReturn = "";
            try
            {
                string lvDate = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss");

                string lvSQL = "insert into Log_History (Log_UserID, Log_Display, Log_Activity, Log_DateTime) ";
                lvSQL += "Values ('" + lvUser + "', '" + lvDisplay + "', '" + lvActivity + "', '" + lvDate + "')";

                string query = lvSQL;
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PS_LogConnection"].ToString());
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                con.Open();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();

                lvReturn = "Success";
                return lvReturn;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        public static string Firecane()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''"; //,'บรรทุก',' '
            lvSQL += "  and Q_CaneType in ('2','18','4','8')";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        public static string Freshcane()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''"; //,'บรรทุก',' '
            lvSQL += " and Q_CaneType in ('1','17','3','7')";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        public static string CaneBox()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''";
            lvSQL += " And Q_CaneType in ('5','11','6','12') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        public static string Caneclean()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' and  Q_Year =''";
            lvSQL += " And Q_CaneType in ('17','18') ";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        public static string CaneCAR()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;
            con.Open();

            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('สาวแต๋น')  and  Q_Year =''";
           
            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
        public static string CanTrailer()
        {
            #region //Connect Database 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PSConnection"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            #endregion

            string lvReturn = "";
            string lvSQL = "";

            cmd.Connection = con;

            con.Open();
            lvSQL = "select Count(Q_No) as CCount ";
            lvSQL += "from Queue_Diary ";
            lvSQL += "where Q_Status = 'Active' and Q_WeightINDate = '' and Q_WeightOUTDate = '' and Q_CloseStatus = '' And Q_WeightFinish = '' And Q_CarType in ('เทนเลอร์')  and  Q_Year =''";

            cmd.CommandText = lvSQL;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lvReturn = Gstr.fncToInt(dr["CCount"].ToString()).ToString("#,###0");
                }
            }
            dr.Close();
            con.Close();

            return lvReturn;
        }
      
    }
}