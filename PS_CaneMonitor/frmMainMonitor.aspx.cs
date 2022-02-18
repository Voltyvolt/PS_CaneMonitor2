using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_CaneMonitor
{
    public partial class frmMainMonitor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //บังคับให้ Login Web กรณีใช้งานจากภายนอก
                FncCheckLoginWeb();
            }

            //โหลดข้อมูลทั้งหมด
            LoadDataAll();

            //Update Clear ข้อมูลการ Login ถ้าไม่มีการใช้งาน 1 วัน.
            FncClearLogin();
        }

        private void FncCheckLoginWeb()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;

            string lvCookieUser = "";
            string lvOnline = "";

            //ถ้าขึ้นต้นด้วยไอพี ไม่ต้อง Login
            if (url.Contains("10.104.1.9") || url.Contains("localhost"))
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

        protected void ASPxFormLayout1_E35_TextChanged(object sender, EventArgs e)
        {

        }

        private void LoadDataAll()
        {
            #region//สรุปยอดหีบอ้อย ประจำวัน  
            ASPxRoundPanel4.HeaderText = "ยอดหีบอ้อย ประจำวัน ( " + DateTime.Now.ToString("dd/MM/yyyy") + " ) ตัดยอด 15:00 น. ";
            txtG31.Text = GsysSQL.fncG31(); //ราง A
            txtG34.Text = GsysSQL.fncG34(); //ตัน A
            txtG32.Text = GsysSQL.fncG32(); //ราง B
            txtG35.Text = GsysSQL.fncG35(); //ตัน B
            txtG33.Text = (Gstr.fncToInt(txtG31.Text) + Gstr.fncToInt(txtG32.Text)).ToString("#,##0"); //รวม     
            txtG36.Text = (Gstr.fncToDouble(txtG34.Text) + Gstr.fncToDouble(txtG35.Text)).ToString("#,##0.00"); //รวม     
            #endregion

            #region//สรุปยอดประจำวันรถชั่ง เข้า-ออก ลานใน
            txtG12.Text = GsysSQL.fncG12();
            txtG13.Text = GsysSQL.fncG13();
            txtG11.Text = (Gstr.fncToInt(txtG12.Text) + Gstr.fncToInt(txtG13.Text)).ToString("#,##0"); //รวม

            txtG14.Text = GsysSQL.fncG14();
            txtG15.Text = GsysSQL.fncG15();
            txtG16.Text = (Gstr.fncToInt(txtG14.Text) + Gstr.fncToInt(txtG15.Text)).ToString("#,##0"); //รวม
            #endregion

            #region//จำนวนรถอ้อย ลานนอก   
            txtG21.Text = GsysSQL.fncG21(); //ราง A
            txtG22.Text = GsysSQL.fncG22(); //ราง B
            txtG23.Text = (Gstr.fncToInt(txtG21.Text) + Gstr.fncToInt(txtG22.Text)).ToString("#,##0"); //รวม

            txtG24.Text = GsysSQL.fncG24(); //สิบล้อ พ่วง ไฟไหม้
            txtG25.Text = GsysSQL.fncG25(); //อ้อยกล่อง
            txtG26.Text = GsysSQL.fncG26(); //เทนเลอร์ ไฟไหม้
            txtG27.Text = GsysSQL.fncG27(); //สาวแต๋น ไฟไหม้
            txtNews1.Text = GsysSQL.fncNew1(); //หกล้อ ไฟไหม้
            
            txtF1.Text = GsysSQL.fncF1();//สิบล้ออ้อยสด
            txtF2.Text = GsysSQL.fncF2();//เทนเลอร์สดgeforce18652
            txtF3.Text = GsysSQL.fncF3();//สาวแต๋นสด
            txtNews2.Text = GsysSQL.fncNew2(); //หกล้อ สด

            //อ้อยกล่อง
            txt29.Text = GsysSQL.fnc29(); //สิบล้อ พ่วง
            txt31.Text = GsysSQL.fnc31(); //เทนเลอร์
            txt32.Text = GsysSQL.fnc32(); //สาวแต๋น
            txtNews3.Text = GsysSQL.fncNew3(); //หกล้อ กล่อง
            

            txtG28.Text = (Gstr.fncToInt(txtG24.Text) + Gstr.fncToInt(txtF1.Text) + Gstr.fncToInt(txt29.Text) +
                           Gstr.fncToInt(txtNews1.Text) + Gstr.fncToInt(txtNews2.Text) + Gstr.fncToInt(txtNews3.Text) +
                           Gstr.fncToInt(txtG26.Text) + Gstr.fncToInt(txtF2.Text) + Gstr.fncToInt(txt31.Text) + 
                           Gstr.fncToInt(txtG27.Text) + Gstr.fncToInt(txtF3.Text) + Gstr.fncToInt(txt32.Text)).ToString("#,##0");  //รวม
            txtG29.Text = (Gstr.fncToInt(txtG28.Text) + Gstr.fncToInt(txtG23.Text)).ToString("#,##0");

            
            if (Gstr.fncToInt(txtG35.Text) == 0) txtG32.Text = "";
            if (Gstr.fncToInt(txtG34.Text) == 0) txtG31.Text = "";
            if (Gstr.fncToInt(txtG36.Text) == 0) txtG33.Text = "";
            #endregion

            #region // จำนวนรถตัดโรงงาน ชาวไร่
            txt33.Text = GsysSQL.fnc33(); //รถอ้อยสด โรงงาน
            txt34.Text = GsysSQL.fnc34(); //รถอ้อยไฟไหม้ โรงงาน
            txt35.Text = (Gstr.fncToInt(txt33.Text) + Gstr.fncToInt(txt34.Text)).ToString("#,##0"); //รวมอ้อย โรงงาน
            
            txt36.Text = GsysSQL.fnc36(); //รถอ้อยสด ชาวไร่
            txt37.Text = GsysSQL.fnc37(); //รถอ้อยไฟไหม้ ชาวไร่
            txt38.Text = (Gstr.fncToInt(txt36.Text) + Gstr.fncToInt(txt37.Text)).ToString("#,##0"); //รวมอ้อย ชาวไร่

            txt39.Text = GsysSQL.fnc39(); //รถอ้อยสด นน. โรงงาน
            txt40.Text = GsysSQL.fnc40(); //รถอ้อยไฟไหม้ นน. โรงงาน
            txt41.Text = (Gstr.fncToDouble(txt39.Text) + Gstr.fncToDouble(txt40.Text)).ToString("#,##0.00"); //รวมอ้อย นน. โรงงาน

            txt42.Text = GsysSQL.fnc42(); //รถอ้อยสด นน. ชาวไร่
            txt43.Text = GsysSQL.fnc43(); //รถอ้อยไฟไหม้ นน. ชาวไร่
            txt44.Text = (Gstr.fncToDouble(txt42.Text) + Gstr.fncToDouble(txt43.Text)).ToString("#,##0.00"); //รวมอ้อย นน. ชาวไร่
            #endregion

            #region//สรุปยอดประจำฤดูกาลผลิต รถชั่ง เข้า-ออก (ลานใน)
            txtG44.Text = GsysSQL.fncG44(); //รวมรถสะสมทั้งหมด
            txtG41.Text = GsysSQL.fncG41(); //รวมอ้อยสะสมทั้งหมด
            txtG42.Text = GsysSQL.fncG42(); //รวมตัน อ้อยสด
            txtG43.Text = GsysSQL.fncG43(); //รวมตัน ไฟไหม้
            txtG45.Text = ((Gstr.fncToDouble(txtG42.Text) / Gstr.fncToDouble(txtG41.Text)) * 100).ToString("0.00"); //% อ้อยสด
            if (txtG45.Text == "NaN")
            {
                txtG45.Text = "0.00";
            }                          
            txtG46.Text = ((Gstr.fncToDouble(txtG43.Text) / Gstr.fncToDouble(txtG41.Text)) * 100).ToString("0.00"); //% ไฟไหม้
            if (txtG46.Text == "NaN")
            {
                txtG46.Text = "0.00";
            }

            #endregion

            #region//สรุปปริมาณรถตัดอ้อยโรงงาน
            txtG51.Text = GsysSQL.fncG51(); //รถอ้อยสด คัน
            txtG54.Text = GsysSQL.fncG54(); //รถอ้อยสด ตันอ้อย
            txtG52.Text = GsysSQL.fncG52(); //รถอ้อยไฟไหม้ คัน
            txtG55.Text = GsysSQL.fncG55(); //รถอ้อยไฟไหม้ ตันอ้อย
            txtG53.Text = (Gstr.fncToInt(txtG51.Text) + Gstr.fncToInt(txtG52.Text)).ToString("0"); //รวม คัน
            txtG56.Text = (Gstr.fncToDouble(txtG54.Text) + Gstr.fncToDouble(txtG55.Text)).ToString("#,##0.00"); //รวม ตัน
            #endregion

            #region//สรุปปริมาณรถตัดอ้อยชาวไร่
            txtG61.Text = GsysSQL.fncG61(); //รถอ้อยสด คัน
            txtG64.Text = GsysSQL.fncG64(); //รถอ้อยสด ตันอ้อย
            txtG62.Text = GsysSQL.fncG62(); //รถอ้อยไฟไหม้ คัน
            txtG65.Text = GsysSQL.fncG65(); //รถอ้อยไฟไหม้ ตันอ้อย
            txtG63.Text = (Gstr.fncToInt(txtG61.Text) + Gstr.fncToInt(txtG62.Text)).ToString("#,##0"); //รวม คัน
            txtG66.Text = (Gstr.fncToDouble(txtG64.Text) + Gstr.fncToDouble(txtG65.Text)).ToString("#,##0.00"); //รวม ตัน
            #endregion

            #region//รวมสะสมรถตัดทั้งหมด
            txtG71.Text = (Gstr.fncToInt(txtG51.Text) + Gstr.fncToInt(txtG61.Text)).ToString("#,##0"); //รถอ้อยสด คัน
            txtG72.Text = (Gstr.fncToInt(txtG52.Text) + Gstr.fncToInt(txtG62.Text)).ToString("#,##0"); //รถอ้อยไฟไหม้ คัน
            txtG73.Text = (Gstr.fncToInt(txtG71.Text) + Gstr.fncToInt(txtG72.Text)).ToString("#,##0"); //รวมรถ

            txtG74.Text = (Gstr.fncToDouble(txtG54.Text) + Gstr.fncToDouble(txtG64.Text)).ToString("#,##0.00"); //รวมอ้อยสด ตัน
            txtG75.Text = (Gstr.fncToDouble(txtG55.Text) + Gstr.fncToDouble(txtG65.Text)).ToString("#,##0.00"); //รวมอ้อยไฟไหม้ ตัน
            txtG76.Text = (Gstr.fncToDouble(txtG74.Text) + Gstr.fncToDouble(txtG75.Text)).ToString("#,##0.00"); //รวม ตัน
            #endregion


        }

        protected void TRefresh_Tick(object sender, EventArgs e)
        {
            LoadDataAll();
        }
    }
}