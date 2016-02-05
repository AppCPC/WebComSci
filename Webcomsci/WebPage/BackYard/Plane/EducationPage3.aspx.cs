using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class EducationPage3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                clearValue();
                showTreevSubject();

            }

        }
        private void setColorTree(System.Web.UI.HtmlControls.HtmlGenericControl id, Label subcode, Label subName, System.Web.UI.HtmlControls.HtmlGenericControl tootip, string type, string code, string namethai)
        {
            switch (type)
            {
                case "P": id.Attributes["Class"] = "subject_green";
                    subcode.Text = code;
                    subName.Text = namethai;
                    tootip.Visible = true; break;

                case "F": id.Attributes["Class"] = "subject_red";
                    subcode.Text = code;
                    subName.Text = namethai;
                    tootip.Visible = true; break;

                case "FN": id.Attributes["Class"] = "term";
                    subcode.Text = code;
                    subName.Text = namethai;
                    tootip.Visible = true; break;


                case "W": id.Attributes["Class"] = "subject_orange";
                    subcode.Text = code;
                    subName.Text = namethai;
                    tootip.Visible = true; break;

                case "WN": id.Attributes["Class"] = "term";
                    subcode.Text = code;
                    subName.Text = namethai;
                    tootip.Visible = true; break;

            }
        }

        private int ilevel1 = 0;
        private int ilevel2 = 0;
        private int ilevel3 = 0;

        private void showTreevSubject()
        {
            int num711 = 1;
            int num712 = 1;
            int num713 = 1;
            int num811 = 1;
            int num812 = 1;
            int num813 = 1;


            headterm713.Attributes["Class"] = "term";
            termname713.InnerHtml = "เทอม2";
            headterm823.Attributes["Class"] = "term";
            termname823.InnerHtml = "เทอม2";
            try
            {
                DataTable dtsubject = (DataTable)Session["gradeuser"];
                //   DataRow[] result = dtsubject.Select("year >= '1' AND year <= '3'");


                #region  จัดการผลการเรียนปี 1
                DataRow[] resultQueryYear1 = dtsubject.Select("year = '7'");

                foreach (DataRow row in resultQueryYear1)
                {
                    /***********นับจำนวนเทอมการศึกษา****************/
                    if ((row[0].ToString() + row[1].ToString()).Equals("73"))
                    {
                        ilevel1 += 1;
                        break;
                    }
                }


                foreach (DataRow row in resultQueryYear1)
                {

                    if (Convert.ToInt32(ilevel1) > 0)
                    {
                        /**ตรวจสอบว่าค่าที่นับ จากการตรวจสอบเทอม 3 ด้านบน ***/

                        if ((row[0].ToString() + row[1].ToString()).Equals("71"))
                        {

                            #region callstylesheet css tree  7/1

                            if (num711 == 1)
                            {
                                setColorTree(id711, subcode711, subName711, tt711, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 2)
                            {

                                setColorTree(id712, subcode712, subName712, tt712, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 3)
                            {
                                setColorTree(id713, subcode713, subName713, tt713, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 4)
                            {
                                setColorTree(id714, subcode714, subName714, tt714, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 5)
                            {

                                setColorTree(id715, subcode715, subName715, tt715, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 6)
                            {
                                setColorTree(id716, subcode716, subName716, tt716, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num711 == 7)
                            {
                                setColorTree(id717, subcode717, subName717, tt717, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num711 == 8)
                            {
                                setColorTree(id718, subcode718, subName718, tt718, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num711++;

                            #endregion

                        }

                        else if ((row[0].ToString() + row[1].ToString()).Equals("72"))
                        {

                            #region callstylesheet css tree  7/2

                            headterm712.Attributes["Class"] = "term";
                            termname712.InnerHtml = "เทอม2";


                            if (num712 == 1)
                            {
                                setColorTree(id721, subcode721, subName721, tt721, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num712 == 2)
                            {

                                setColorTree(id722, subcode722, subName722, tt722, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num712 == 3)
                            {
                                setColorTree(id723, subcode723, subName723, tt723, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num712 == 4)
                            {
                                setColorTree(id724, subcode724, subName724, tt724, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num712 == 5)
                            {
                                setColorTree(id725, subcode725, subName725, tt725, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num712 == 6)
                            {
                                setColorTree(id726, subcode726, subName726, tt726, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num712 == 7)
                            {
                                setColorTree(id727, subcode727, subName727, tt727, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num712 == 8)
                            {
                                setColorTree(id728, subcode728, subName728, tt728, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num712++;

                            #endregion

                        }
                        else
                        {

                            #region callstylesheet css tree  7/3

                            headterm713.Attributes["Class"] = "term";
                            termname713.InnerHtml = "เทอม3";


                            if (num713 == 1)
                            {
                                setColorTree(id731, subcode731, subName731, tt731, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 2)
                            {

                                setColorTree(id732, subcode732, subName732, tt732, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 3)
                            {
                                setColorTree(id733, subcode733, subName733, tt733, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 4)
                            {
                                setColorTree(id734, subcode734, subName734, tt734, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 5)
                            {

                                setColorTree(id735, subcode735, subName735, tt735, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 6)
                            {
                                setColorTree(id736, subcode736, subName736, tt736, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num713 == 7)
                            {
                                setColorTree(id737, subcode737, subName737, tt737, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num713 == 8)
                            {
                                setColorTree(id738, subcode738, subName738, tt738, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num713++;

                            #endregion
                        }

                    }
                    else
                    {


                        if ((row[0].ToString() + row[1].ToString()).Equals("71"))
                        {

                            #region callstylesheet css tree 7/1

                            if (num711 == 1)
                            {
                                setColorTree(id711, subcode711, subName711, tt711, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 2)
                            {

                                setColorTree(id712, subcode712, subName712, tt712, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 3)
                            {
                                setColorTree(id713, subcode713, subName713, tt713, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 4)
                            {
                                setColorTree(id714, subcode714, subName714, tt714, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 5)
                            {

                                setColorTree(id715, subcode715, subName715, tt715, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num711 == 6)
                            {
                                setColorTree(id716, subcode716, subName716, tt716, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num711 == 7)
                            {
                                setColorTree(id717, subcode717, subName717, tt717, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num711 == 8)
                            {
                                setColorTree(id718, subcode718, subName718, tt718, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num711++;

                            #endregion

                        }
                        else if ((row[0].ToString() + row[1].ToString()).Equals("72"))
                        {

                            #region callstylesheet css tree  7/2

                            headterm713.Attributes["Class"] = "term";
                            termname713.InnerHtml = "เทอม2";


                            if (num713 == 1)
                            {
                                setColorTree(id731, subcode731, subName731, tt731, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 2)
                            {

                                setColorTree(id732, subcode732, subName732, tt732, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 3)
                            {
                                setColorTree(id733, subcode733, subName733, tt733, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 4)
                            {
                                setColorTree(id734, subcode734, subName734, tt734, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 5)
                            {

                                setColorTree(id735, subcode735, subName735, tt735, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num713 == 6)
                            {
                                setColorTree(id736, subcode736, subName736, tt736, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num713 == 7)
                            {
                                setColorTree(id737, subcode737, subName737, tt737, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num713 == 8)
                            {
                                setColorTree(id738, subcode738, subName738, tt738, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num713++;

                            #endregion

                        }

                    }

                }
                #endregion


                #region  จัดการผลการเรียนปี 8
                DataRow[] resultQueryYear2 = dtsubject.Select("year = '8'");

                foreach (DataRow row in resultQueryYear2)
                {
                    if ((row[0].ToString() + row[1].ToString()).Equals("83"))
                    {
                        ilevel2++;
                        break;
                    }
                }


                foreach (DataRow row in resultQueryYear2)
                {


                    if ((row[0].ToString() + row[1].ToString()).Equals("81"))
                    {

                        #region callstylesheet css tree  8/1

                        if (num811 == 1)
                        {
                            setColorTree(id811, subcode811, subName811, tt811, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num811 == 2)
                        {

                            setColorTree(id812, subcode812, subName812, tt812, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num811 == 3)
                        {
                            setColorTree(id813, subcode813, subName813, tt813, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num811 == 4)
                        {
                            setColorTree(id814, subcode814, subName814, tt814, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num811 == 5)
                        {

                            setColorTree(id815, subcode815, subName815, tt815, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num811 == 6)
                        {
                            setColorTree(id816, subcode816, subName816, tt816, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num811 == 7)
                        {
                            setColorTree(id817, subcode817, subName817, tt817, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num811 == 8)
                        {
                            setColorTree(id818, subcode818, subName818, tt818, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num811++;

                        #endregion

                    }
                    if (ilevel2 > 0)
                    {
                        /**ตรวจสอบว่าค่าที่นับ จากการตรวจสอบเทอม 3 ด้านบน ***/

                        if ((row[0].ToString() + row[1].ToString()).Equals("82"))
                        {

                            #region callstylesheet css tree  8/2

                            headterm822.Attributes["Class"] = "term";
                            termname822.InnerHtml = "เทอม2";


                            if (num812 == 1)
                            {
                                setColorTree(id821, subcode821, subName821, tt821, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num812 == 2)
                            {

                                setColorTree(id822, subcode822, subName822, tt822, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num812 == 3)
                            {
                                setColorTree(id823, subcode823, subName823, tt823, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num812 == 4)
                            {
                                setColorTree(id824, subcode824, subName824, tt824, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num812 == 5)
                            {
                                setColorTree(id825, subcode825, subName825, tt825, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num812 == 6)
                            {
                                setColorTree(id826, subcode826, subName826, tt826, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num812 == 7)
                            {
                                setColorTree(id827, subcode827, subName827, tt827, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num812 == 8)
                            {
                                setColorTree(id828, subcode828, subName828, tt828, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num812++;

                            #endregion

                        }
                        else if ((row[0].ToString() + row[1].ToString()).Equals("83"))
                        {

                            #region callstylesheet css tree  8/3

                            headterm823.Attributes["Class"] = "term";
                            termname823.InnerHtml = "เทอม3";


                            if (num813 == 1)
                            {
                                setColorTree(id831, subcode831, subName831, tt831, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num813 == 2)
                            {

                                setColorTree(id832, subcode832, subName832, tt832, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num813 == 3)
                            {
                                setColorTree(id833, subcode833, subName833, tt833, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num813 == 4)
                            {
                                setColorTree(id834, subcode834, subName834, tt834, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num813 == 5)
                            {

                                setColorTree(id835, subcode835, subName835, tt835, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num813 == 6)
                            {
                                setColorTree(id836, subcode836, subName836, tt836, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num813 == 7)
                            {
                                setColorTree(id837, subcode837, subName837, tt837, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num813 == 8)
                            {
                                setColorTree(id838, subcode838, subName838, tt838, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num813++;

                            #endregion
                        }

                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("82"))
                    {

                        #region callstylesheet css tree 8/2

                        headterm823.Attributes["Class"] = "term";
                        termname823.InnerHtml = "เทอม2";


                        if (num813 == 1)
                        {
                            setColorTree(id831, subcode831, subName831, tt831, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num813 == 2)
                        {

                            setColorTree(id832, subcode832, subName832, tt832, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num813 == 3)
                        {
                            setColorTree(id833, subcode833, subName833, tt833, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num813 == 4)
                        {
                            setColorTree(id834, subcode834, subName834, tt834, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num813 == 5)
                        {

                            setColorTree(id835, subcode835, subName835, tt835, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num813 == 6)
                        {
                            setColorTree(id836, subcode836, subName836, tt836, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num813 == 7)
                        {
                            setColorTree(id837, subcode837, subName837, tt837, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num813 == 8)
                        {
                            setColorTree(id838, subcode838, subName838, tt838, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num813++;

                        #endregion

                    }
                }
                #endregion

             
            }
            catch (Exception)
            {


            }

        }



        private void funclear(System.Web.UI.HtmlControls.HtmlGenericControl id, Label subcode, Label subName, System.Web.UI.HtmlControls.HtmlGenericControl tootip)
        {
            id.Attributes["Class"] = "";
            subcode.Text = "";
            subName.Text = "";
            tootip.Visible = true;
        }

        private void clearValue()
        {

            #region เคลียค่า 711
            id711.Attributes["Class"] = "";
            subName711.Text = "";
            subcode711.Text = "";
            tt711.Visible = false;

            id712.Attributes["Class"] = "";
            subName712.Text = "";
            subcode712.Text = "";
            tt712.Visible = true;

            id713.Attributes["Class"] = "";
            subName713.Text = "";
            subcode713.Text = "";
            tt713.Visible = true;

            id714.Attributes["Class"] = "";
            subName714.Text = "";
            subcode714.Text = "";
            tt714.Visible = true;

            id715.Attributes["Class"] = "";
            subName715.Text = "";
            subcode715.Text = "";
            tt715.Visible = true;

            id716.Attributes["Class"] = "";
            subName716.Text = "";
            subcode716.Text = "";
            tt716.Visible = true;

            id717.Attributes["Class"] = "";
            subName717.Text = "";
            subcode717.Text = "";
            tt717.Visible = true;

            id718.Attributes["Class"] = "";
            subName718.Text = "";
            subcode718.Text = "";
            tt718.Visible = true;
            #endregion


            #region เคลียค่า 721

            id721.Attributes["Class"] = "";
            subName721.Text = "";
            subcode721.Text = "";
            tt721.Visible = true;


            id722.Attributes["Class"] = "";
            subName722.Text = "";
            subcode722.Text = "";
            tt722.Visible = true;


            id723.Attributes["Class"] = "";
            subName723.Text = "";
            subcode723.Text = "";
            tt723.Visible = true;


            id724.Attributes["Class"] = "";
            subName724.Text = "";
            subcode724.Text = "";
            tt724.Visible = true;


            id725.Attributes["Class"] = "";
            subName725.Text = "";
            subcode725.Text = "";
            tt725.Visible = true;


            id726.Attributes["Class"] = "";
            subName726.Text = "";
            subcode726.Text = "";
            tt726.Visible = true;


            id727.Attributes["Class"] = "";
            subName727.Text = "";
            subcode727.Text = "";
            tt727.Visible = true;



            id728.Attributes["Class"] = "";
            subName728.Text = "";
            subcode728.Text = "";
            tt728.Visible = true;

            #endregion


            #region เคลียค่า 731

            id731.Attributes["Class"] = "";
            subName731.Text = "";
            subcode731.Text = "";
            tt731.Visible = true;


            id732.Attributes["Class"] = "";
            subName732.Text = "";
            subcode732.Text = "";
            tt732.Visible = true;


            id733.Attributes["Class"] = "";
            subName733.Text = "";
            subcode733.Text = "";
            tt733.Visible = true;


            id734.Attributes["Class"] = "";
            subName734.Text = "";
            subcode724.Text = "";
            tt734.Visible = true;


            id735.Attributes["Class"] = "";
            subName735.Text = "";
            subcode735.Text = "";
            tt735.Visible = true;


            id736.Attributes["Class"] = "";
            subName736.Text = "";
            subcode736.Text = "";
            tt736.Visible = true;


            id737.Attributes["Class"] = "";
            subName737.Text = "";
            subcode737.Text = "";
            tt737.Visible = true;



            id738.Attributes["Class"] = "";
            subName738.Text = "";
            subcode738.Text = "";
            tt738.Visible = true;

            #endregion



            #region เคลียค่า 811
            id811.Attributes["Class"] = "";
            subName811.Text = "";
            subcode811.Text = "";
            tt811.Visible = false;

            id812.Attributes["Class"] = "";
            subName812.Text = "";
            subcode812.Text = "";
            tt812.Visible = true;

            id813.Attributes["Class"] = "";
            subName813.Text = "";
            subcode813.Text = "";
            tt813.Visible = true;

            id814.Attributes["Class"] = "";
            subName814.Text = "";
            subcode814.Text = "";
            tt814.Visible = true;

            id815.Attributes["Class"] = "";
            subName815.Text = "";
            subcode815.Text = "";
            tt815.Visible = true;

            id816.Attributes["Class"] = "";
            subName816.Text = "";
            subcode816.Text = "";
            tt816.Visible = true;

            id817.Attributes["Class"] = "";
            subName817.Text = "";
            subcode817.Text = "";
            tt817.Visible = true;

            id818.Attributes["Class"] = "";
            subName818.Text = "";
            subcode818.Text = "";
            tt818.Visible = true;
            #endregion

            #region เคลียค่า 821

            id821.Attributes["Class"] = "";
            subName821.Text = "";
            subcode821.Text = "";
            tt821.Visible = true;


            id822.Attributes["Class"] = "";
            subName822.Text = "";
            subcode822.Text = "";
            tt822.Visible = true;


            id823.Attributes["Class"] = "";
            subName823.Text = "";
            subcode823.Text = "";
            tt823.Visible = true;


            id824.Attributes["Class"] = "";
            subName824.Text = "";
            subcode824.Text = "";
            tt824.Visible = true;


            id825.Attributes["Class"] = "";
            subName825.Text = "";
            subcode825.Text = "";
            tt825.Visible = true;


            id826.Attributes["Class"] = "";
            subName826.Text = "";
            subcode826.Text = "";
            tt826.Visible = true;


            id827.Attributes["Class"] = "";
            subName827.Text = "";
            subcode827.Text = "";
            tt827.Visible = true;



            id828.Attributes["Class"] = "";
            subName828.Text = "";
            subcode828.Text = "";
            tt828.Visible = true;

            #endregion

            #region เคลียค่า 831

            id831.Attributes["Class"] = "";
            subName831.Text = "";
            subcode831.Text = "";
            tt831.Visible = true;


            id832.Attributes["Class"] = "";
            subName832.Text = "";
            subcode832.Text = "";
            tt832.Visible = true;


            id833.Attributes["Class"] = "";
            subName833.Text = "";
            subcode833.Text = "";
            tt833.Visible = true;


            id834.Attributes["Class"] = "";
            subName834.Text = "";
            subcode824.Text = "";
            tt834.Visible = true;


            id835.Attributes["Class"] = "";
            subName835.Text = "";
            subcode835.Text = "";
            tt835.Visible = true;


            id836.Attributes["Class"] = "";
            subName836.Text = "";
            subcode836.Text = "";
            tt836.Visible = true;


            id837.Attributes["Class"] = "";
            subName837.Text = "";
            subcode837.Text = "";
            tt837.Visible = true;



            id838.Attributes["Class"] = "";
            subName838.Text = "";
            subcode838.Text = "";
            tt838.Visible = true;


            #endregion




        }




    }
}