using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_CaneMonitor
{
    public partial class frmCaneDiary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //บังคับให้ Login Web กรณีใช้งานจากภายนอก//
                FncCheckLoginWeb();

                if (txtDateS.Text == "" || txtDateE.Text == "")
                {
                    DateTime DTS = DateTime.Parse(DateTime.Now.ToString("16/12/2564") + " 00:00:00");
                    //string lvDateNow = Gstr.fncChangeSDate2(Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy")));
                    DateTime lvDateNow = DateTime.Parse(Gstr.fncChangeSDate(DateTime.Now.ToString("yyyyMMdd")));
                    //DTS = DTS.AddDays(-18);
                    //txtDateS.Text = DTS.ToString("dd/MM/yyyy");
                    txtDateS.Text = DTS.ToString("dd/MM/yyyy");
                    //DTS = DateTime.Now.AddDays(-1);
                    txtDateE.Text = lvDateNow.ToString("dd/MM/yyyy");

                    txtDateS0.Text = DTS.ToString("dd/MM/yyyy");
                    //DTS = DateTime.Now.AddDays(-1);
                    txtDateE0.Text = lvDateNow.ToString("dd/MM/yyyy");
                    txtDate1.Text = lvDateNow.ToString("dd/MM/yyyy");
                }
            }
            else
            {
                //Update Clear ข้อมูลการ Login ถ้าไม่มีการใช้งาน 1 วัน.
                FncClearLogin();
            }
          
        }

        private void FncCheckLoginWeb()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;

            string lvCookieUser = "";
            string lvOnline = "";

            //ถ้าขึ้นต้นด้วยไอพี ไม่ต้อง Login
            if (url.Contains("10.104.1.9") || url.Contains("local"))
            {
                //ไม่ต้อง Login
            }
            else
            {
                //ดึงข้อมูล User เพื่อนำมาเช็คสถานะออนไลน์
                lvCookieUser = FncReadCookie("Login", "Username");

                //ถ้า Login ออนไลน์ไว้อยู่แล้วก็แสดงข้อมูลต่อได้เลย ถ้าไม่ ให้ Login ใหม่
                lvOnline = GsysSQL.fncCheckOnlineStatus(lvCookieUser);

                if (lvOnline != "")
                {
                    string lvDateNow = Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy"));
                    string lvTimeNow = DateTime.Now.ToString("HHmmss");

                    //ถ้าออนไลน์ให้บันทึก LastUpdate ไปใหม่
                    string lvSQL = "Update SysLoginTable set L_Update = '" + lvDateNow + lvTimeNow + "' Where L_UserName = '" + lvCookieUser + "' ";
                    string lvResault = GsysSQL.fncExecuteQueryData(lvSQL);
                }
                else
                {
                    //MessageboxAlert("ไม่พบข้อมูลผู้ใช้ของท่าน กรุณาเข้าสู่ระบบใหม่อีกครั้ง");

                    //สร้าง Cookie ส่งข้อมูล Url
                    FncCreateCookie("Url", "LastUrl", url);

                    //ถ้าไม่ออนไลน์ให้ Login ใหม่
                    string lvUrlNew = "/LoginMonitor.aspx";// + "?LastUrl=" + url
                    Response.Redirect(lvUrlNew);
                }
            }
        }

        private void FncClearLogin()
        {
            string lvSQL = "";
            string lvResault = "";
            string lvDateNow = Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy"));
            string lvTimeNow = DateTime.Now.ToString("HHmmss");
            string lvDateDiff = Gstr.fncChangeTDate(DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy"));

            lvSQL = "Delete From SysLoginTable Where L_Update < '" + lvDateDiff + lvTimeNow + "' ";
            lvResault = GsysSQL.fncExecuteQueryData(lvSQL);
        }

        private string FncReadCookie(string lvKeys, string lvName)
        {
            string lvReturn = "Success";

            try
            {
                lvReturn = Request.Cookies[lvKeys][lvName];
            }
            catch (Exception ex)
            {
                lvReturn = ex.Message;
            }

            return lvReturn;
        }

        private void FncCreateCookie(string lvKeyName, string lvName, string lvData)
        {
            //*** Instance of the HttpCookies ***//
            HttpCookie newCookie = new HttpCookie(lvKeyName);
            newCookie[lvName] = lvData;
            newCookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(newCookie);
        }

        private void FncDeleteCookie(string lvKeyName)
        {
            HttpCookie delCookie1;
            delCookie1 = new HttpCookie(lvKeyName);
            delCookie1.Expires = DateTime.Now.AddDays(-1D);
            Response.Cookies.Add(delCookie1);
        }

        private void MessageboxAlert(string lvMessage)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + lvMessage + "');", true);
        }

        private void LoadData()
        {
            string lvData = "";

            DataTable DT1 = new DataTable();
            DT1.Columns.Add("Q_Date", typeof(string));
            DT1.Columns.Add("Q_CarA", typeof(string));
            DT1.Columns.Add("Q_CarB", typeof(string));
            DT1.Columns.Add("Q_CarAB", typeof(string));
            DT1.Columns.Add("Q_AvgCaneA", typeof(string));
            DT1.Columns.Add("Q_SumA", typeof(string));
            DT1.Columns.Add("Q_AvgCaneB", typeof(string));
            DT1.Columns.Add("Q_SumB", typeof(string));
            DT1.Columns.Add("Q_AvgCaneAB", typeof(string));
            DT1.Columns.Add("Q_SumAB", typeof(string));

            DT1.Columns.Add("Q_AvgFCaneA", typeof(string));//ไฟไฟม้
            DT1.Columns.Add("Q_AvgSCaneA", typeof(string));//อ้อยสด

            DT1.Columns.Add("Q_SumFA", typeof(string));//ไฟไฟม้
            DT1.Columns.Add("Q_SumSA", typeof(string));//อ้อยสด

            DT1.Columns.Add("Q_AvgFCaneB", typeof(string));//ไฟไฟม้
            DT1.Columns.Add("Q_AvgSCaneB", typeof(string));//อ้อยสด

            DT1.Columns.Add("Q_SumFB", typeof(string));//ไฟไฟม้
            DT1.Columns.Add("Q_SumSB", typeof(string));//อ้อยสด
            
            DateTime DTS = DateTime.Parse(txtDateS.Text + " 00:00:00");
            DateTime DTE = DateTime.Parse(txtDateE.Text + " 00:00:00");
            TimeSpan DTDiff = DTE - DTS;

            int lvLoop = Gstr.fncToInt(DTDiff.TotalDays.ToString()) + 2; //เผื่อยอดยกมา
            for (int i = 0; i < lvLoop; i++)
            {
                string lvDateMain = DTS.ToString("dd/MM/yyyy");

                if (lvDateMain == "28/01/2564")
                {

                }

                DTS = DTS.AddDays(-1);
                string lvDateS = Gstr.fncChangeTDate(DTS.ToString("dd/MM/yyyy"));
                DTS = DTS.AddDays(1);
                string lvDateE = Gstr.fncChangeTDate(DTS.ToString("dd/MM/yyyy"));

                if (i == 0) //ยอดยกมา
                {
                    //หาจำนวนวัน

                    DateTime DTSBefore = DateTime.Parse("16/12/2021 00:00:00");
                    DateTime DTEBefore = DateTime.Parse(txtDateS.Text + " 00:00:00");

                    if (Gstr.fncToInt(DTEBefore.ToString("yyyy")) > 2500) DTEBefore = DTEBefore.AddYears(-543);
                    if (Gstr.fncToInt(DTEBefore.ToString("yyyy")) > 2500) DTEBefore = DTEBefore.AddYears(-543);

                    TimeSpan DTBDiff = DTEBefore - DTSBefore;
                    double lvDay = DTBDiff.TotalDays;

                    //ยกมาราง A
                    lvData = GsysSQL.fncGetCountCarAndCaneBefore("A", lvDateS);
                    string lvCountCarA = Gstr.fncToInt(GVar.gvCountCar).ToString("#,##0");
                    string lvSumCaneA = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgA = (Gstr.fncToDouble(lvSumCaneA) / (lvDay * 24)).ToString("#,##0.00");
                  
                    //ยกมาราง B
                    lvData = GsysSQL.fncGetCountCarAndCaneBefore("B", lvDateS);
                    string lvCountCarB = Gstr.fncToInt(GVar.gvCountCar).ToString("#,##0");
                    string lvSumCaneB = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgB = (Gstr.fncToDouble(lvSumCaneB) / (lvDay * 24)).ToString("#,##0.00");

                    string lvCountAB = (Gstr.fncToInt(lvCountCarA) + Gstr.fncToInt(lvCountCarB)).ToString("#,##0");
                    string lvSumAB = (Gstr.fncToDouble(lvSumCaneA) + Gstr.fncToDouble(lvSumCaneB)).ToString("#,##0.00");
                    string lvAvgAB = (Gstr.fncToDouble(lvSumAB) / (lvDay * 24)).ToString("#,##0.00");

                    //เก็บลง DataTable
                    DataRow workRow = DT1.NewRow();
                    workRow[0] = "ยอดยกมา " + lvDay + " วัน" ; //วันที่
                    workRow[1] = lvCountCarA; //รถ A
                    workRow[2] = lvCountCarB; //รถ B
                    workRow[3] = lvCountAB; //รวมรถ
                    workRow[4] = lvAvgA; //เฉลี่ย A
                    workRow[5] = lvSumCaneA; //สะสม A
                    workRow[6] = lvAvgB; //เฉลี่ย B
                    workRow[7] = lvSumCaneB; //สะสม B
                    workRow[8] = lvAvgAB; //เฉลี่ยรวม
                    workRow[9] = lvSumAB; //สะสมรวม          
                    DT1.Rows.Add(workRow);
                }
                else
                {
                    //ราง A
                    lvData = GsysSQL.fncGetCountCarAndCane("A", lvDateS, lvDateE);
                    string lvCountCarA = GVar.gvCountCar;
                    string lvSumCaneA = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgA = (Gstr.fncToDouble(lvSumCaneA) / 24).ToString("#,##0.00");

                    //ไฟไหม้A
                    lvData = GsysSQL.fncGetCountCarAndCaneAF("A", lvDateS, lvDateE);
                    string lvCountCarFA = Gstr.fncToInt(GVar.gvCountCarFA).ToString("#,##0");
                    string lvSumCaneFA = Gstr.fncToDouble(GVar.gvSumCaneFA).ToString("#,##0.00");
                    string lvAvgFA = (Gstr.fncToDouble(lvSumCaneFA) /  24).ToString("#,##0.00");

                    //สด
                    lvData = GsysSQL.fncGetCountCarAndCaneAS("A", lvDateS, lvDateE);
                    string lvCountCarSA = Gstr.fncToInt(GVar.gvCountCarSA).ToString("#,##0");
                    string lvSumCaneSA = Gstr.fncToDouble(GVar.gvSumCaneSA).ToString("#,##0.00");
                    string lvAvgSA = (Gstr.fncToDouble(lvSumCaneSA) / 24).ToString("#,##0.00");

                    //ราง B
                    lvData = GsysSQL.fncGetCountCarAndCane("B", lvDateS, lvDateE);
                    string lvCountCarB = GVar.gvCountCar;
                    string lvSumCaneB = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgB = (Gstr.fncToDouble(lvSumCaneB) / 24).ToString("#,##0.00");


                    //ไฟไหม้B
                    lvData = GsysSQL.fncGetCountCarAndCaneAF("B", lvDateS, lvDateE);
                    string lvCountCarFB = Gstr.fncToInt(GVar.gvCountCarFA).ToString("#,##0");
                    string lvSumCaneFB = Gstr.fncToDouble(GVar.gvSumCaneFA).ToString("#,##0.00");
                    string lvAvgFB = (Gstr.fncToDouble(lvSumCaneFB) /  24).ToString("#,##0.00");

                    //สดB
                    lvData = GsysSQL.fncGetCountCarAndCaneAS("B", lvDateS, lvDateE);
                    string lvCountCarSB = Gstr.fncToInt(GVar.gvCountCarSA).ToString("#,##0");
                    string lvSumCaneSB = Gstr.fncToDouble(GVar.gvSumCaneSA).ToString("#,##0.00");
                    string lvAvgSB = (Gstr.fncToDouble(lvSumCaneSB) / 24).ToString("#,##0.00");



                    string lvCountAB = (Gstr.fncToInt(lvCountCarA) + Gstr.fncToInt(lvCountCarB)).ToString("#,##0");
                    string lvSumAB = (Gstr.fncToDouble(lvSumCaneA) + Gstr.fncToDouble(lvSumCaneB)).ToString("#,##0.00");
                    string lvAvgAB = (Gstr.fncToDouble(lvSumAB) / 24).ToString("#,##0.00");

                    //เก็บลง DataTable
                    DataRow workRow = DT1.NewRow();
                    workRow[0] = lvDateMain; //วันที่
                    workRow[1] = lvCountCarA; //รถ A
                    workRow[2] = lvCountCarB; //รถ B
                    workRow[3] = lvCountAB; //รวมรถ
                    workRow[4] = lvAvgA; //เฉลี่ย A
                    workRow[5] = lvSumCaneA; //สะสม A
                    workRow[6] = lvAvgB; //เฉลี่ย B
                    workRow[7] = lvSumCaneB; //สะสม B
                    workRow[8] = lvAvgAB; //เฉลี่ย รวม
                    workRow[9] = lvSumAB; //สะสมรวม

                    workRow[10] = lvAvgFA; //เฉลี่ยไฟไฟม้ A
                    workRow[11] = lvAvgSA; //เฉลี่ยสด A
                    workRow[12] = lvSumCaneFA; //สะสม ไฟไหม้A
                    workRow[13] = lvSumCaneSA; //สะสม สด A

                    workRow[14] = lvAvgFB; //เฉลี่ยไฟไฟม้ B
                    workRow[15] = lvAvgSB; //เฉลี่ยสด B
                    workRow[16] = lvSumCaneFB; //สะสม B
                    workRow[17] = lvSumCaneSB; //สะสม B
                    DT1.Rows.Add(workRow);
                  
                    // + 1 วัน
                    DTS = DTS.AddDays(1);
                }
            }

            //ลง Grid
            ASPxGridView1.DataSource = DT1;
            ASPxGridView1.DataBind();

            DT1.Dispose();
        }

        private void LoadDataDetail()
        {
            DataTable DT1 = new DataTable();
            DT1.Columns.Add("Q_Date", typeof(string));
            DT1.Columns.Add("Q_CarA", typeof(string));
            DT1.Columns.Add("Q_CarB", typeof(string));
            DT1.Columns.Add("Q_CarAB", typeof(string));
            DT1.Columns.Add("Q_AvgCaneA", typeof(string));
            DT1.Columns.Add("Q_SumA", typeof(string));
            DT1.Columns.Add("Q_AvgCaneB", typeof(string));
            DT1.Columns.Add("Q_SumB", typeof(string));
            DT1.Columns.Add("Q_AvgCaneAB", typeof(string));
            DT1.Columns.Add("Q_SumAB", typeof(string));
            DT1.Columns.Add("Q_CarCount", typeof(string));
            DT1.Columns.Add("C_Carnum", typeof(string));

            string[] lvKaALL = new string[] { "15.01-16.00", "16.01-17.00", "17.01-18.00", "18.01-19.00", "19.01-20.00", "20.01-21.00", "21.01-22.00", "22.01-23.00", "23.01-00.00", "00.01-01.00", "01.01-02.00", "02.01-03.00", "03.01-04.00", "04.01-05.00", "05.01-06.00", "06.01-07.00", "07.01-08.00", "08.01-09.00", "09.01-10.00", "10.01-11.00", "11.01-12.00", "12.01-13.00", "13.01-14.00", "14.01-15.00" };

            //เช็ครูปแบบวันที่
            DateTime DTChk = DateTime.Parse(Gstr.Dateformatting(txtDate1.Text + " 00:00:00"));
            //เช็คปี
            if (DTChk.Year > 2500) DTChk = DTChk.AddYears(-543); //รอบ 1
            if (DTChk.Year > 2500) DTChk = DTChk.AddYears(-543); //รอบ 2
            //ลบ 1 วัน ตามเงือนไข
            DTChk = DTChk.AddDays(-1);

            string lvDateS = Gstr.fncChangeTDate(DTChk.ToString("dd/MM/yyyy"));
            string lvDateE = lvDateS;
            string lvDateFix = Gstr.fncChangeSDate(lvDateS);

            //ถ้าเป็นวันปัจจุบัน Status = ''
            string lvDateChk = Gstr.fncChangeTDate(Gstr.Dateformatting(txtDate1.Text));
            string lvDateNow = Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy"));

            string lvCloseStatus = "1";
            if (lvDateChk == lvDateNow) lvCloseStatus = "";

            double lvTotalA = 0;
            double lvTotalB = 0;
            double lvTotalAB = 0;
            //string lvDateE = DateTime.Parse(txtDate1.Text + " 00:00:00").AddDays(1).ToString("dd/MM/yyyy");
            //lvDateE = Gstr.fncChangeTDate(lvDateE);

            for (int i = 0; i < lvKaALL.Count(); i++)
            {
                //ภ้าข้ามวัน
                if (lvKaALL[i] == "23.01-00.00")
                {
                    DateTime DT = DateTime.Parse(lvDateFix + " 00:00:00");
                    DT = DT.AddDays(1);

                    lvDateE = Gstr.fncChangeTDate(DT.ToString("dd/MM/yyyy"));
                    //lvDateE = DT.ToString("yyyyMMdd");
                }
                else if (lvKaALL[i] == "00.01-01.00" || lvKaALL[i] == "01.01-02.00" || lvKaALL[i] == "02.01-03.00" || lvKaALL[i] == "03.01-04.00" || lvKaALL[i] == "04.01-05.00" || lvKaALL[i] == "05.01-06.00" || lvKaALL[i] == "06.01-07.00")
                {
                    DateTime DT = DateTime.Parse(lvDateFix + " 00:00:00");
                    DT = DT.AddDays(1);

                    lvDateS = Gstr.fncChangeTDate(DT.ToString("dd/MM/yyyy"));
                    lvDateE = lvDateS;
                }

                string[] lvArr = lvKaALL[i].Split('-');
                string lvTimeS = FncChangeFormatTime(lvArr[0], false);
                string lvTimeE = FncChangeFormatTime(lvArr[1], true);

                GVar.gvsumrangCarA = "";
                GVar.gvsumrangCarB = "";

                //--A
                GsysSQL.fncGetDataCane("A", "1','17','11','5','2','18','12','6", lvDateS, lvDateE, lvTimeS, lvTimeE, lvCloseStatus);
                string lvCountCarA = GVar.gvDataCount;
                //GVar.gvsumrangCarA = GVar.gvDataCount;
                string lvSumCaneA = GVar.gvDataSum;
                //string lvAvgA = (Gstr.fncToDouble(lvSumCaneA) / 24).ToString("#,##0.00");
                lvTotalA = lvTotalA + Gstr.fncToDouble(lvSumCaneA);

                //--B
                GsysSQL.fncGetDataCane("B", "1','17','11','5','2','18','12','6", lvDateS, lvDateE, lvTimeS, lvTimeE, lvCloseStatus);
                string lvCountCarB = GVar.gvDataCount;
               // GVar.gvsumrangCarB = GVar.gvDataCount;
                string lvSumCaneB = GVar.gvDataSum;
                //string lvAvgB = (Gstr.fncToDouble(lvSumCaneB) / 24).ToString("#,##0.00");
                lvTotalB = lvTotalB + Gstr.fncToDouble(lvSumCaneB);

                //--Sum AB
                string lvCountAB = (Gstr.fncToInt(lvCountCarA) + Gstr.fncToInt(lvCountCarB)).ToString("#,##0");
                string lvSumAB = (Gstr.fncToDouble(lvSumCaneA) + Gstr.fncToDouble(lvSumCaneB)).ToString("#,##0.00");
                //string lvAvgAB = (Gstr.fncToDouble(lvSumAB) / 24).ToString("#,##0.00");
                lvTotalAB = lvTotalAB + Gstr.fncToDouble(lvSumAB);

                GVar.gvsumrangA ="";
                GVar.gvsumrangB = "";

               

                string lvHideTotalA = "-";
                if (Gstr.fncToInt(lvSumCaneA) > 0) lvHideTotalA = FncCheckZeroTXT(lvTotalA.ToString("#,##0.00"), "-");
                string lvHideTotalB = "-";
                if (Gstr.fncToInt(lvSumCaneB) > 0) lvHideTotalB = FncCheckZeroTXT(lvTotalB.ToString("#,##0.00"), "-");
                string lvHideTotalAB = "-";
                if (Gstr.fncToInt(lvSumAB) > 0) lvHideTotalAB = lvTotalAB.ToString("#,##0.00");

                GVar.gvsumrangA = lvHideTotalA;
                GVar.gvsumrangB = lvHideTotalB;

                GVar.gvsumrangCarA = lvCountCarA;
                GVar.gvsumrangCarB = lvCountCarB;


                //จำนวนรถรอคิว
                int lvCarAll = GsysSQL.fncGetCarCountByDate(lvDateE, lvTimeE, "Q");
                int lvCarSub = GsysSQL.fncGetCarCountByDate(lvDateE, lvTimeE, "W");
                int lvCarNet = lvCarSub - lvCarAll;



                //จำนวนรถรายชัวโมง
                string lvdatecarnum = Gstr.fncChangeTDate(Gstr.Dateformatting(txtDate1.Text));
                string Carnum = GsysSQL.fncGetCarCarnumDate(lvdatecarnum, lvKaALL[i]);
                if (Carnum == "0")
                {
                    Carnum = "";
                }

                //เก็บลง DataTable
                DataRow workRow = DT1.NewRow();
                workRow[0] = lvKaALL[i]; //วันที่
                workRow[1] = FncCheckZeroTXT(lvCountCarA, "-"); //รถ A
                workRow[2] = FncCheckZeroTXT(lvCountCarB, "-"); //รถ B
                workRow[3] = FncCheckZeroTXT(lvCountAB, "-"); //รวมรถ
                workRow[4] = FncCheckZeroTXT(lvSumCaneA, "-"); //ยอด A
                workRow[5] = lvHideTotalA; //สะสม A
                workRow[6] = FncCheckZeroTXT(lvSumCaneB, "-"); //ยอด B
                workRow[7] = lvHideTotalB; //สะสม B
                workRow[8] = FncCheckZeroTXT(lvSumAB, "-"); //ยอด รวม
                workRow[9] = lvHideTotalAB; //สะสมรวม
                workRow[10] = lvCarNet; //สะสมรวม
                workRow[11] = Carnum; //รถรอคิวรายวัน 
                DT1.Rows.Add(workRow);
            }

            
            //ลง Grid
            ASPxGridView2.DataSource = DT1;
            ASPxGridView2.DataBind();

            DT1.Dispose();
        }

        private string FncCheckZeroTXT(string lvTXT,string lvSyntax)
        {
            string lvReturn = "";

            if (Gstr.fncToInt(lvTXT) == 0)
            {
                lvTXT = lvSyntax;
            }

            lvReturn = lvTXT;

            return lvReturn;
        }

        private string FncChangeFormatTime(string lvData, bool lvTEnd)
        {
            string lvReturn = "";

            if (lvTEnd)
                lvData = lvData + ".59";
            else
                lvData = lvData + ".00";

            lvData = lvData.Replace('.', ':');

            lvReturn = lvData;

            return lvReturn;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void ASPxGridView1_PageIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void btnSearch1_Click(object sender, EventArgs e)
        {
            LoadDataDetail();
        }

        protected void ASPxFormLayout1_E1_Click(object sender, EventArgs e)
        {
            LoadData();
            string lvFileName = "PivotData-" + DateTime.Now.ToString("yyyyMMdd") + ".xls";
            string uploadDirectory = Server.MapPath("/Export");
            string lvPathFile = uploadDirectory + "\\" + lvFileName;
            if (File.Exists(lvPathFile))
            {
                File.Delete(lvPathFile);
            }
            CsvExportOptionsEx options;
            options = new CsvExportOptionsEx()
            {
                ExportType = ExportType.WYSIWYG,
                TextExportMode = TextExportMode.Text
            };

            ASPxGridViewExporter1.WriteXlsToResponse("รายงานอ้อยเข้าหีบรายวัน");

            MessageboxAlert("Export Complete");
        }

        protected void ASPxGridViewExporter1_Init(object sender, EventArgs e)
        {

        }

        private void LoadDatasum()
        {
            string lvData = "";
            DataTable DT3 = new DataTable();
            DT3.Columns.Add("Q_Date", typeof(string));                      
            DT3.Columns.Add("Q_SumFA", typeof(string));//ไฟไฟม้
            DT3.Columns.Add("Q_SumSA", typeof(string));//อ้อยสด       
            DT3.Columns.Add("Q_SumFB", typeof(string));//ไฟไฟม้
            DT3.Columns.Add("Q_SumSB", typeof(string));//อ้อยสด
            DT3.Columns.Add("Q_SumcaneFAB", typeof(string));//รวมอ้อยไฟไหม้ A+B
            DT3.Columns.Add("Q_SumcaneSAB", typeof(string));//รวมอ้อยสดไฟไหม้ A+B
            DT3.Columns.Add("Q_AvgFCaneAB", typeof(string));//%ไฟไฟม้ A+B
            DT3.Columns.Add("Q_AvgSCaneAB", typeof(string));//%อ้อยสด A+B
            DT3.Columns.Add("Sumdate", typeof(string)); //รวมรายวัน

            DateTime DTS = DateTime.Parse(txtDateS0.Text + " 00:00:00");
            DateTime DTE = DateTime.Parse(txtDateE0.Text + " 00:00:00");
            TimeSpan DTDiff = DTE - DTS;

            int lvLoop = Gstr.fncToInt(DTDiff.TotalDays.ToString()) + 2; //เผื่อยอดยกมา
            for (int i = 0; i < lvLoop; i++)
            {
                string lvDateMain = DTS.ToString("dd/MM/yyyy");

                DTS = DTS.AddDays(-1);
                string lvDateS = Gstr.fncChangeTDate(DTS.ToString("dd/MM/yyyy"));
                DTS = DTS.AddDays(1);
                string lvDateE = Gstr.fncChangeTDate(DTS.ToString("dd/MM/yyyy"));

                if (i == 0) //ยอดยกมา
                {
                    //หาจำนวนวัน

                    DateTime DTSBefore = DateTime.Parse("16/12/2021 00:00:00");
                    DateTime DTEBefore = DateTime.Parse(txtDateS0.Text + " 00:00:00");

                    if (Gstr.fncToInt(DTEBefore.ToString("yyyy")) > 2500) DTEBefore = DTEBefore.AddYears(-543);
                    if (Gstr.fncToInt(DTEBefore.ToString("yyyy")) > 2500) DTEBefore = DTEBefore.AddYears(-543);

                    TimeSpan DTBDiff = DTEBefore - DTSBefore;
                    double lvDay = DTBDiff.TotalDays;

                    //ยกมาราง A
                    lvData = GsysSQL.fncGetCountCarAndCaneBefore("A", lvDateS);
                    string lvCountCarA = Gstr.fncToInt(GVar.gvCountCar).ToString("#,##0");
                    string lvSumCaneA = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgA = (Gstr.fncToDouble(lvSumCaneA) / (lvDay * 24)).ToString("#,##0.00");

                    //ไฟไหม้A
                    lvData = GsysSQL.fncGetCountCarAndCaneBeforeFA("A", lvDateS);
                    string lvCountCarFA = Gstr.fncToInt(GVar.gvCountCarFA).ToString("#,##0");
                    string lvSumCaneFA = Gstr.fncToDouble(GVar.gvSumCaneFA).ToString("#,##0.00");
                    string lvAvgFA = (Gstr.fncToDouble(lvSumCaneFA) / (lvDay * 24)).ToString("#,##0.00");

                    //สดA
                    lvData = GsysSQL.fncGetCountCarAndCaneBeforeSA("A", lvDateS);
                    string lvCountCarSA = Gstr.fncToInt(GVar.gvCountCarSA).ToString("#,##0");
                    string lvSumCaneSA = Gstr.fncToDouble(GVar.gvSumCaneSA).ToString("#,##0.00");
                    string lvAvgSA = (Gstr.fncToDouble(lvSumCaneSA) / (lvDay * 24)).ToString("#,##0.00");

                    //ไฟไหม้B
                    lvData = GsysSQL.fncGetCountCarAndCaneBeforeFA("B", lvDateS);
                    string lvCountCarFB = Gstr.fncToInt(GVar.gvCountCarFB).ToString("#,##0");
                    string lvSumCaneFB = Gstr.fncToDouble(GVar.gvSumCaneFB).ToString("#,##0.00");
                    string lvAvgFB = (Gstr.fncToDouble(lvSumCaneFA) / (lvDay * 24)).ToString("#,##0.00");

                    //สดB
                    lvData = GsysSQL.fncGetCountCarAndCaneBeforeSA("B", lvDateS);
                    string lvCountCarSB = Gstr.fncToInt(GVar.gvCountCarSB).ToString("#,##0");
                    string lvSumCaneSB = Gstr.fncToDouble(GVar.gvSumCaneSB).ToString("#,##0.00");
                    string lvAvgSB = (Gstr.fncToDouble(lvSumCaneSA) / (lvDay * 24)).ToString("#,##0.00");
                   
                    //ยกมาราง B
                    lvData = GsysSQL.fncGetCountCarAndCaneBefore("B", lvDateS);
                    string lvCountCarB = Gstr.fncToInt(GVar.gvCountCar).ToString("#,##0");
                    string lvSumCaneB = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgB = (Gstr.fncToDouble(lvSumCaneB) / (lvDay * 24)).ToString("#,##0.00");

                    string lvCountAB = (Gstr.fncToInt(lvCountCarA) + Gstr.fncToInt(lvCountCarB)).ToString("#,##0");
                    string lvSumAB = (Gstr.fncToDouble(lvSumCaneA) + Gstr.fncToDouble(lvSumCaneB)).ToString("#,##0.00");
                    string lvAvgAB = (Gstr.fncToDouble(lvSumAB) / (lvDay * 24)).ToString("#,##0.00");

                    //สะสม
                    string lvSumCaneFAB = (Gstr.fncToDouble(lvSumCaneFA) + Gstr.fncToDouble(lvSumCaneFB)).ToString("#,##0.00");
                    string lvSumCaneSAB = (Gstr.fncToDouble(lvSumCaneSA) + Gstr.fncToDouble(lvSumCaneSB)).ToString("#,##0.00");

                    //   % สะสม 20
                    string lvAvgFAB = ((Gstr.fncToDouble(lvSumCaneFAB) / (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB)))*100).ToString("#,###0.00");
                    string lvAvgSAB = ((Gstr.fncToDouble(lvSumCaneSAB) / (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB)))*100).ToString("#,###0.00");

                    if (lvAvgFAB == "NaN")
                    {
                        lvAvgFAB = "0.00";
                    }
                    if (lvAvgSAB == "NaN")
                    {
                        lvAvgSAB = "0.00";
                    }

                    string lvsum = (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB)).ToString("#,###0.00");

                    DataRow workRow = DT3.NewRow();
                    workRow[0] = "ยอดยกมา " + lvDay + " วัน"; //วันที่                 
                    workRow[1] = lvSumCaneFA; //สะสมไฟไหม้ A 
                    workRow[2] = lvSumCaneSA; //สะสมสด A 
                    workRow[3] = lvSumCaneFB; //สะสมไฟ้ไหม้ B
                    workRow[4] = lvSumCaneSB; //สะสมสด B
                    workRow[5] = lvSumCaneFAB; //สะสมไฟไหม้ A+B                    
                    workRow[6] = lvSumCaneSAB; //สะสมสด A+B 
                    workRow[7] = lvAvgFAB; //เฉลี่ยไฟไฟม้ A+B
                    workRow[8] = lvAvgSAB; //เฉลี่ยสด A+B
                    workRow[9] = lvsum;//ยอดรวม
                    DT3.Rows.Add(workRow);                   
                }
                else
                {
                    
                    //ราง A
                    lvData = GsysSQL.fncGetCountCarAndCane("A", lvDateS, lvDateE);
                    string lvCountCarA = GVar.gvCountCar;
                    string lvSumCaneA = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgA = (Gstr.fncToDouble(lvSumCaneA) / 24).ToString("#,##0.00");

                    //ไฟไหม้A
                    lvData = GsysSQL.fncGetCountCarAndCaneAF("A", lvDateS, lvDateE);
                    string lvCountCarFA = Gstr.fncToInt(GVar.gvCountCarFA).ToString("#,##0");
                    string lvSumCaneFA = Gstr.fncToDouble(GVar.gvSumCaneFA).ToString("#,##0.00");
                    string lvAvgFA = (Gstr.fncToDouble(lvSumCaneFA) / 24).ToString("#,##0.00");

                    //สด
                    lvData = GsysSQL.fncGetCountCarAndCaneAS("A", lvDateS, lvDateE);
                    string lvCountCarSA = Gstr.fncToInt(GVar.gvCountCarSA).ToString("#,##0");
                    string lvSumCaneSA = Gstr.fncToDouble(GVar.gvSumCaneSA).ToString("#,##0.00");
                    string lvAvgSA = (Gstr.fncToDouble(lvSumCaneSA) / 24).ToString("#,##0.00");

                    //ราง B
                    lvData = GsysSQL.fncGetCountCarAndCane("B", lvDateS, lvDateE);
                    string lvCountCarB = GVar.gvCountCar;
                    string lvSumCaneB = Gstr.fncToDouble(GVar.gvSumCane).ToString("#,##0.00");
                    string lvAvgB = (Gstr.fncToDouble(lvSumCaneB) / 24).ToString("#,##0.00");


                    //ไฟไหม้B
                    lvData = GsysSQL.fncGetCountCarAndCaneAF("B", lvDateS, lvDateE);
                    string lvCountCarFB = Gstr.fncToInt(GVar.gvCountCarFB).ToString("#,##0");
                    string lvSumCaneFB = Gstr.fncToDouble(GVar.gvSumCaneFB).ToString("#,##0.00");
                    string lvAvgFB = (Gstr.fncToDouble(lvSumCaneFB) / 24).ToString("#,##0.00");

                    //สดB
                    lvData = GsysSQL.fncGetCountCarAndCaneAS("B", lvDateS, lvDateE);
                    string lvCountCarSB = Gstr.fncToInt(GVar.gvCountCarSB).ToString("#,##0");
                    string lvSumCaneSB = Gstr.fncToDouble(GVar.gvSumCaneSB).ToString("#,##0.00");
                    string lvAvgSB = (Gstr.fncToDouble(lvSumCaneSB) / 24).ToString("#,##0.00");

                    string lvCountAB = (Gstr.fncToInt(lvCountCarA) + Gstr.fncToInt(lvCountCarB)).ToString("#,##0");
                    string lvSumAB = (Gstr.fncToDouble(lvSumCaneA) + Gstr.fncToDouble(lvSumCaneB)).ToString("#,##0.00");
                    string lvAvgAB = (Gstr.fncToDouble(lvSumAB) / 24).ToString("#,##0.00");
                    //สะสม

                    string lvSumCaneFAB = (Gstr.fncToDouble(lvSumCaneFA) + Gstr.fncToDouble(lvSumCaneFB)).ToString("#,###0.00");
                    string lvSumCaneSAB = (Gstr.fncToDouble(lvSumCaneSA) +  Gstr.fncToDouble(lvSumCaneSB)).ToString("#,###0.00"); 

                    //% สะสม 
                    string lvAvgFAB = ((Gstr.fncToDouble(lvSumCaneFAB) / (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB))) * 100) .ToString("#,###0.00");
                    string lvAvgSAB= ((Gstr.fncToDouble(lvSumCaneSAB) / (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB))) * 100) .ToString("#,###0.00");
                    string LVsum = (Gstr.fncToDouble(lvSumCaneFAB) + Gstr.fncToDouble(lvSumCaneSAB)).ToString("#,###0.00");
                    if (lvAvgFAB == "NaN")
                    {
                        lvAvgFAB = "0.00";
                    }
                    if (lvAvgSAB == "NaN")
                    {
                        lvAvgSAB = "0.00";
                    }

                    //เก็บลง DataTable
                    DataRow workRow = DT3.NewRow();
                    workRow[0] = lvDateMain; //วันที่
                    workRow[1] = lvSumCaneFA; //สะสมไฟไหม้ A 
                    workRow[2] = lvSumCaneSA; //สะสมสด A 
                    workRow[3] = lvSumCaneFB; //สะสมไฟ้ไหม้ B
                    workRow[4] = lvSumCaneSB; //สะสมสด B
                    workRow[5] = lvSumCaneFAB; //สะสมไฟไหม้ A+B                                       
                    workRow[6] = lvSumCaneSAB; //สะสมสด A+B 

                    workRow[7] = lvAvgFAB; //เฉลี่ยไฟไฟม้ A+B
                    workRow[8] = lvAvgSAB; //เฉลี่ยสด A+B
                    workRow[9] = LVsum;

                    DT3.Rows.Add(workRow);

                    // + 1 วัน
                    DTS = DTS.AddDays(1);                   
                }

            }

            //DataTable DT3 = new DataTable();
            //ASPxGridView3.DataSource = DT3;
            //ASPxGridView3.DataBind();
            string SumFA = "";
            string SumSA = "";
            string SumFB = "";
            string SumSB = "";
            string SumcaneFAB = "";
            string SumcaneSAB = "";
            string lvSum = "";
            int temp = DT3.Rows.Count;   //always 0
            for (int i = 0; i < temp; i++)
            {            
               string lvField1 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumFA"].ToString()).ToString("#,###0.00");
                string lvField2 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumSA"].ToString()).ToString("#,###0.00");
                string lvField3 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumFB"].ToString()).ToString("#,###0.00");
                string lvField4 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumSB"].ToString()).ToString("#,###0.00");
                string lvField5 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumcaneFAB"].ToString()).ToString("#,###0.00");
                string lvField6 = Gstr.fncToDouble(DT3.Rows[i]["Q_SumcaneSAB"].ToString()).ToString("#,###0.00");
                string lvField7 = Gstr.fncToDouble(DT3.Rows[i]["Sumdate"].ToString()).ToString("#,###0.00");
                if (lvField1 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField1).ToString("#,###0.00");

                   SumFA =  (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumFA)).ToString("#,###0.00");
                }
                if (lvField2 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField2).ToString("#,###0.00");

                    SumSA = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumSA)).ToString("#,###0.00");
                }
                if (lvField3 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField3).ToString("#,###0.00");

                    SumFB = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumFB)).ToString("#,###0.00");
                }
                if (lvField4 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField4).ToString("#,###0.00");

                    SumSB = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumSB)).ToString("#,###0.00");
                }
                if (lvField5 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField5).ToString("#,###0.00");

                    SumcaneFAB = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumcaneFAB)).ToString("#,###0.00");
                }
                if (lvField6 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField6).ToString("#,###0.00");

                    SumcaneSAB = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(SumcaneSAB)).ToString("#,###0.00");
                }
                if (lvField7 != "")
                {
                    string caneRailA = Gstr.fncToDouble(lvField7).ToString("#,###0.00");

                    lvSum = (Gstr.fncToDouble(caneRailA) + Gstr.fncToDouble(lvSum)).ToString("#,###0.00");
                }
            }

            DataRow workRow1 = DT3.NewRow();
            workRow1[0] = "รวม";
            workRow1[1] = SumFA; //สะสมไฟไหม้ A 
            workRow1[2] = SumSA; //สะสมสด A 
            workRow1[3] = SumFB; //สะสมไฟ้ไหม้ B
            workRow1[4] = SumSB; //สะสมสด B

            workRow1[5] = SumcaneFAB ; //สะสมไฟไหม้ A+B                                       
            workRow1[6] = SumcaneSAB; //สะสมสด A+B 
            workRow1[9] = lvSum;

            string agvcaneF = ((Gstr.fncToDouble(SumcaneFAB) / (Gstr.fncToDouble(SumcaneFAB) + Gstr.fncToDouble(SumcaneSAB))) * 100).ToString("#,###0.00");
            string agvcaneS = ((Gstr.fncToDouble(SumcaneSAB) / (Gstr.fncToDouble(SumcaneFAB) + Gstr.fncToDouble(SumcaneSAB))) * 100).ToString("#,###0.00");
     
            if (agvcaneF == "NaN")
            {
                agvcaneF = "0.00";
            }
            if (agvcaneS == "NaN")
            {
                agvcaneS = "0.00";
            }

            workRow1[7] = agvcaneF;
            workRow1[8] = agvcaneS;
           

            DT3.Rows.Add(workRow1);

            // ลง Grid
            ASPxGridView3.DataSource = DT3;
            ASPxGridView3.DataBind();
         
            DT3.Dispose();
        }

        protected void btnSearch2_Click(object sender, EventArgs e)
        {
            LoadDatasum();
        }

        protected void ASPxGridView3_DataBound(object sender, EventArgs e)
        {

        }
      
        protected void ASPxFormLayout1_E2_Click(object sender, EventArgs e)
        {
            
        }      

        protected void ASPxFormL_Click(object sender, EventArgs e)
        {
            LoadDatasum();

            string lvFileName = "PivotData-" + DateTime.Now.ToString("yyyyMMdd") + ".xls";
            string uploadDirectory = Server.MapPath("/Export");
            string lvPathFile = uploadDirectory + "\\" + lvFileName;
            //if (File.Exists(lvPathFile))
            //{
            //    File.Delete(lvPathFile);
            //}
            CsvExportOptionsEx Gridoptions;
            Gridoptions = new CsvExportOptionsEx()
            {
                ExportType = ExportType.WYSIWYG,
                TextExportMode = TextExportMode.Text
            };

            ASPxGridViewExporter3.WriteXlsToResponse(DateTime.Now.ToString("dd/MM/yyyy") +"รายงานอ้อยสด อ้อยไฟไหม้.xls",true);

            MessageboxAlert("Export Complete");
        }

        protected void ASPxGridViewExporter3_DataBinding(object sender, EventArgs e)
        {
            //LoadDatasum();
        }

        protected void ASPxGridViewExporter3_Load(object sender, EventArgs e)
        {
            //LoadDatasum();
        }

        protected void ASPxGridView2_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.VisibleIndex);
            string Date = ASPxGridView2.GetRowValues(index, "Q_Date").ToString();
            string AvgCaneA = ASPxGridView2.GetRowValues(index, "Q_AvgCaneA").ToString();
            string AvgCaneB = ASPxGridView2.GetRowValues(index, "Q_AvgCaneB").ToString();


            if (e.CommandArgs.CommandName == "A")
            {
                
                //ASPxPopupControl1.ShowOnPageLoad = true;
                ASPxPopupControl2.ShowOnPageLoad = true;
                DateTime.Now.ToString("dd/MM/yyyy");
                ASPxRoundPanel5.HeaderText = "วันที่ " + DateTime.Now.ToString("dd/MM/yyyy") + " " + "เวลา " + DateTime.Now.ToString("HH.00");

                T_Firecane.Text = GsysSQL.Firecane() + " " + "ตู้";
                T_Freshcane.Text = GsysSQL.Freshcane() + " " + "ตู้";
                T_CaneBox.Text = GsysSQL.CaneBox() + " " + "ตู้";
                T_Caneclean.Text = GsysSQL.Caneclean() + " " + "ตู้";
                T_CaneCAR.Text = GsysSQL.CaneCAR() + " " + "ตู้";
                T_CanTrailer.Text = GsysSQL.CanTrailer() + " " + "ตู้";
                sumRangnok.Text = (Gstr.fncToInt(GsysSQL.Firecane()) + Gstr.fncToInt(GsysSQL.Freshcane()) + Gstr.fncToInt(GsysSQL.CaneBox()) + Gstr.fncToInt(GsysSQL.Caneclean()) + Gstr.fncToInt(GsysSQL.CaneCAR()) + Gstr.fncToInt(GsysSQL.CanTrailer())).ToString() + " " + "ตู้";

                RangA.Text = GsysSQL.fncG21() + " " + "ตู้";
                RangB.Text = GsysSQL.fncG22() + " " + "ตู้";
                sumAB.Text = (Gstr.fncToInt(GsysSQL.fncG21()) + Gstr.fncToInt(GsysSQL.fncG22())).ToString() + " " + "ตู้";
                sumRangnokAB.Text = (Gstr.fncToInt(GsysSQL.fncG21()) + Gstr.fncToInt(GsysSQL.fncG22()) + Gstr.fncToInt(GsysSQL.Firecane()) + Gstr.fncToInt(GsysSQL.Freshcane()) + Gstr.fncToInt(GsysSQL.CaneBox()) + Gstr.fncToInt(GsysSQL.Caneclean()) + Gstr.fncToInt(GsysSQL.CaneCAR()) + Gstr.fncToInt(GsysSQL.CanTrailer())).ToString() + " " + "ตู้";


                Time.Text ="เวลา"+" "+ Date+" "+"หีบ";
                rangAton.Text = AvgCaneA+" "+"ตัน";
                rangBton.Text = AvgCaneB+ " "+"ตัน";

                date.Text =  " " + DateTime.Now.ToString("dd/MM/yyyy");
                kpi.Text = "25,000";
                DateTime StartDate = Convert.ToDateTime("15/12/2563");
                DateTime EndDate = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
                string datesum = (EndDate - StartDate).ToString();
                string[] lvDate = datesum.Split('.');
                kpaP.Text= (Gstr.fncToInt(lvDate[0])*25000).ToString("#,###");
                Actuallyborn.Text = (Gstr.fncToInt(GsysSQL.fncG34())+ Gstr.fncToInt(GsysSQL.fncG35())).ToString("#,###");
                cumulative.Text= GsysSQL.fncG41();
                Difference.Text = (25000 - Gstr.fncToInt(Actuallyborn.Text)).ToString("#,###");
                cumulativeD.Text = (Gstr.fncToInt(kpaP.Text) - Gstr.fncToInt(GsysSQL.fncG41())).ToString("#,###");

                T_Firecane0.Text = GsysSQL.Firecane() + " " + "ตู้";
                T_Freshcane0.Text = GsysSQL.Freshcane() + " " + "ตู้";
                T_CaneBox0.Text = GsysSQL.CaneBox() + " " + "ตู้";
                T_Caneclean0.Text = GsysSQL.Caneclean() + " " + "ตู้";
                T_CaneCAR0.Text = GsysSQL.CaneCAR() + " " + "ตู้";
                T_CanTrailer0.Text = GsysSQL.CanTrailer() + " " + "ตู้";
                sumRangnok0.Text = (Gstr.fncToInt(GsysSQL.Firecane()) + Gstr.fncToInt(GsysSQL.Freshcane()) + Gstr.fncToInt(GsysSQL.CaneBox()) + Gstr.fncToInt(GsysSQL.Caneclean()) + Gstr.fncToInt(GsysSQL.CaneCAR()) + Gstr.fncToInt(GsysSQL.CanTrailer())).ToString() + " " + "ตู้";

                RangA0.Text = GsysSQL.fncG21() + " " + "ตู้";
                RangB0.Text = GsysSQL.fncG22() + " " + "ตู้";
                sumAB0.Text = (Gstr.fncToInt(GsysSQL.fncG21()) + Gstr.fncToInt(GsysSQL.fncG22())).ToString() + " " + "ตู้";
                sumRangnokAB0.Text = (Gstr.fncToInt(GsysSQL.fncG21()) + Gstr.fncToInt(GsysSQL.fncG22()) + Gstr.fncToInt(GsysSQL.Firecane()) + Gstr.fncToInt(GsysSQL.Freshcane()) + Gstr.fncToInt(GsysSQL.CaneBox()) + Gstr.fncToInt(GsysSQL.Caneclean()) + Gstr.fncToInt(GsysSQL.CaneCAR()) + Gstr.fncToInt(GsysSQL.CanTrailer())).ToString() + " " + "ตู้";

                string lvDateChk = Gstr.fncChangeTDate(txtDate1.Text);
                string lvDateNow = Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy"));
                string lvCloseStatus = "1";
                if (lvDateChk == lvDateNow) lvCloseStatus = "";
                string   lvDateS = Gstr.fncChangeTDate(DateTime.Now.ToString("dd/MM/yyyy"));
                string   lvDateE = lvDateS;

                string[] lvArr = Date.Split('-');
                string lvTimeS = FncChangeFormatTime(lvArr[0], false);
                string lvTimeE = FncChangeFormatTime(lvArr[1], true);


                GsysSQL.fncGetDataCane("A", "1','17','11','5','2','18','12','6", lvDateS, lvDateE, lvTimeS, lvTimeE, lvCloseStatus);
                string lvCountCarA = GVar.gvDataCount;
                GsysSQL.fncGetDataCane("B", "1','17','11','5','2','18','12','6", lvDateS, lvDateE, lvTimeS, lvTimeE, lvCloseStatus);
                string lvCountCarB = GVar.gvDataCount;

                ASPxFormLayout5_E5.Text = "เวลา" + " " + Date + " " + "หีบ";
                rangAton0.Text = AvgCaneA + " " + "ตัน";
                ASPxFormLayout5_E6.Text = lvCountCarA;
                rangBton0.Text = AvgCaneB + " " + "ตัน";
                ASPxFormLayout5_E7.Text = lvCountCarB;


                date0.Text ="ณ. วันที่ "+ " " + DateTime.Now.ToString("dd/MM/yyyy");
                kpi0.Text = "25,000";
                DateTime StartDate0 = Convert.ToDateTime("15/12/2563");
                DateTime EndDate0 = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
                string datesum0 = (EndDate - StartDate).ToString();
                string[] lvDate0 = datesum.Split('.');
                kpaP0.Text = (Gstr.fncToInt(lvDate[0]) * 25000).ToString("#,###");
                Actuallyborn0.Text = (Gstr.fncToInt(GsysSQL.fncG34()) + Gstr.fncToInt(GsysSQL.fncG35())).ToString("#,###");
                cumulative0.Text = GsysSQL.fncG41();
                Difference0.Text = (25000 - Gstr.fncToInt(Actuallyborn0.Text)).ToString("#,###");
                cumulativeD0.Text = (Gstr.fncToInt(kpaP0.Text) - Gstr.fncToInt(GsysSQL.fncG41())).ToString("#,###");
            }
        }

        protected void txtDateS_ButtonClick(object source, ButtonEditClickEventArgs e)
        {
            DateTime DTS = DateTime.Parse(txtDateS.Text + " 00:00:00");
            if (Gstr.fncToInt(DTS.ToString("yyyy")) < 2000) DTS = DTS.AddYears(+543);
        }

        protected void txtDateE_ButtonClick(object source, ButtonEditClickEventArgs e)
        {
            DateTime DTS = DateTime.Parse(txtDateE.Text + " 00:00:00");
            if (Gstr.fncToInt(DTS.ToString("yyyy")) < 2000) DTS = DTS.AddYears(+543);
        }
    }
}