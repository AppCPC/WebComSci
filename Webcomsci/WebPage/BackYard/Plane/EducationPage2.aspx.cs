using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class EducationPage2 : System.Web.UI.Page
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
            int num111 = 1;
            int num112 = 1;
            int num113 = 1;
            int num211 = 1;
            int num212 = 1;
            int num213 = 1;
            int num311 = 1;
            int num312 = 1;
            int num313 = 1;


            headterm113.Attributes["Class"] = "term";
            termname113.InnerHtml = "เทอม2";
            headterm223.Attributes["Class"] = "term";
            termname223.InnerHtml = "เทอม2";
            headterm333.Attributes["Class"] = "term";
            termname333.InnerHtml = "เทอม2";

            try
            {
                DataTable dtsubject = (DataTable)Session["gradeuser"];
                //   DataRow[] result = dtsubject.Select("year >= '1' AND year <= '3'");


                #region  จัดการผลการเรียนปี 1
                DataRow[] resultQueryYear1 = dtsubject.Select("year = '4'");

                foreach (DataRow row in resultQueryYear1)
                {
                    /***********นับจำนวนเทอมการศึกษา****************/
                    if ((row[0].ToString() + row[1].ToString()).Equals("43"))
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

                        if ((row[0].ToString() + row[1].ToString()).Equals("41"))
                        {

                            #region callstylesheet css tree  1/1

                            if (num111 == 1)
                            {
                                setColorTree(id111, subcode111, subName111, tt111, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 2)
                            {

                                setColorTree(id112, subcode112, subName112, tt112, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 3)
                            {
                                setColorTree(id113, subcode113, subName113, tt113, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 4)
                            {
                                setColorTree(id114, subcode114, subName114, tt114, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 5)
                            {

                                setColorTree(id115, subcode115, subName115, tt115, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 6)
                            {
                                setColorTree(id116, subcode116, subName116, tt116, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num111 == 7)
                            {
                                setColorTree(id117, subcode117, subName117, tt117, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num111 == 8)
                            {
                                setColorTree(id118, subcode118, subName118, tt118, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num111++;

                            #endregion

                        }

                        else if ((row[0].ToString() + row[1].ToString()).Equals("42"))
                        {

                            #region callstylesheet css tree  1/2

                            headterm112.Attributes["Class"] = "term";
                            termname112.InnerHtml = "เทอม2";


                            if (num112 == 1)
                            {
                                setColorTree(id121, subcode121, subName121, tt121, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num112 == 2)
                            {

                                setColorTree(id122, subcode122, subName122, tt122, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num112 == 3)
                            {
                                setColorTree(id123, subcode123, subName123, tt123, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num112 == 4)
                            {
                                setColorTree(id124, subcode124, subName124, tt124, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num112 == 5)
                            {
                                setColorTree(id125, subcode125, subName125, tt125, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num112 == 6)
                            {
                                setColorTree(id126, subcode126, subName126, tt126, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num112 == 7)
                            {
                                setColorTree(id127, subcode127, subName127, tt127, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num112 == 8)
                            {
                                setColorTree(id128, subcode128, subName128, tt128, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num112++;

                            #endregion

                        }
                        else
                        {

                            #region callstylesheet css tree  1/3

                            headterm113.Attributes["Class"] = "term";
                            termname113.InnerHtml = "เทอม3";


                            if (num113 == 1)
                            {
                                setColorTree(id131, subcode131, subName131, tt131, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 2)
                            {

                                setColorTree(id132, subcode132, subName132, tt132, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 3)
                            {
                                setColorTree(id133, subcode133, subName133, tt133, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 4)
                            {
                                setColorTree(id134, subcode134, subName134, tt134, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 5)
                            {

                                setColorTree(id135, subcode135, subName135, tt135, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 6)
                            {
                                setColorTree(id136, subcode136, subName136, tt136, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num113 == 7)
                            {
                                setColorTree(id137, subcode137, subName137, tt137, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num113 == 8)
                            {
                                setColorTree(id138, subcode138, subName138, tt138, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num113++;

                            #endregion
                        }

                    }
                    else
                    {


                        if ((row[0].ToString() + row[1].ToString()).Equals("41"))
                        {

                            #region callstylesheet css tree  1/1

                            if (num111 == 1)
                            {
                                setColorTree(id111, subcode111, subName111, tt111, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 2)
                            {

                                setColorTree(id112, subcode112, subName112, tt112, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 3)
                            {
                                setColorTree(id113, subcode113, subName113, tt113, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 4)
                            {
                                setColorTree(id114, subcode114, subName114, tt114, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 5)
                            {

                                setColorTree(id115, subcode115, subName115, tt115, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num111 == 6)
                            {
                                setColorTree(id116, subcode116, subName116, tt116, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num111 == 7)
                            {
                                setColorTree(id117, subcode117, subName117, tt117, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num111 == 8)
                            {
                                setColorTree(id118, subcode118, subName118, tt118, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num111++;

                            #endregion

                        }
                        else if ((row[0].ToString() + row[1].ToString()).Equals("42"))
                        {

                            #region callstylesheet css tree  1/2

                            headterm113.Attributes["Class"] = "term";
                            termname113.InnerHtml = "เทอม2";


                            if (num113 == 1)
                            {
                                setColorTree(id131, subcode131, subName131, tt131, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 2)
                            {

                                setColorTree(id132, subcode132, subName132, tt132, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 3)
                            {
                                setColorTree(id133, subcode133, subName133, tt133, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 4)
                            {
                                setColorTree(id134, subcode134, subName134, tt134, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 5)
                            {

                                setColorTree(id135, subcode135, subName135, tt135, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num113 == 6)
                            {
                                setColorTree(id136, subcode136, subName136, tt136, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num113 == 7)
                            {
                                setColorTree(id137, subcode137, subName137, tt137, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num113 == 8)
                            {
                                setColorTree(id138, subcode138, subName138, tt138, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num113++;

                            #endregion

                        }

                    }

                }
                #endregion


                #region  จัดการผลการเรียนปี 2
                DataRow[] resultQueryYear2 = dtsubject.Select("year = '5'");

                foreach (DataRow row in resultQueryYear2)
                {
                    if ((row[0].ToString() + row[1].ToString()).Equals("53"))
                    {
                        ilevel2++;
                        break;
                    }
                }


                foreach (DataRow row in resultQueryYear2)
                {


                    if ((row[0].ToString() + row[1].ToString()).Equals("51"))
                    {

                        #region callstylesheet css tree  2/1

                        if (num211 == 1)
                        {
                            setColorTree(id211, subcode211, subName211, tt211, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num211 == 2)
                        {

                            setColorTree(id212, subcode212, subName212, tt212, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num211 == 3)
                        {
                            setColorTree(id213, subcode213, subName213, tt213, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num211 == 4)
                        {
                            setColorTree(id214, subcode214, subName214, tt214, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num211 == 5)
                        {

                            setColorTree(id215, subcode215, subName215, tt215, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num211 == 6)
                        {
                            setColorTree(id216, subcode216, subName216, tt216, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num211 == 7)
                        {
                            setColorTree(id217, subcode217, subName217, tt217, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num211 == 8)
                        {
                            setColorTree(id218, subcode218, subName218, tt218, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num211++;

                        #endregion

                    }
                    if (ilevel2 > 0)
                    {
                        /**ตรวจสอบว่าค่าที่นับ จากการตรวจสอบเทอม 3 ด้านบน ***/

                        if ((row[0].ToString() + row[1].ToString()).Equals("52"))
                        {

                            #region callstylesheet css tree  5/2

                            headterm222.Attributes["Class"] = "term";
                            termname222.InnerHtml = "เทอม2";


                            if (num212 == 1)
                            {
                                setColorTree(id221, subcode221, subName221, tt221, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num212 == 2)
                            {

                                setColorTree(id222, subcode222, subName222, tt222, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num212 == 3)
                            {
                                setColorTree(id223, subcode223, subName223, tt223, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num212 == 4)
                            {
                                setColorTree(id224, subcode224, subName224, tt224, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num212 == 5)
                            {
                                setColorTree(id225, subcode225, subName225, tt225, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num212 == 6)
                            {
                                setColorTree(id226, subcode226, subName226, tt226, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num212 == 7)
                            {
                                setColorTree(id227, subcode227, subName227, tt227, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num212 == 8)
                            {
                                setColorTree(id228, subcode228, subName228, tt228, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num212++;

                            #endregion

                        }
                        else if ((row[0].ToString() + row[1].ToString()).Equals("53"))
                        {

                            #region callstylesheet css tree  5/3

                            headterm223.Attributes["Class"] = "term";
                            termname223.InnerHtml = "เทอม3";


                            if (num213 == 1)
                            {
                                setColorTree(id231, subcode231, subName231, tt231, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num213 == 2)
                            {

                                setColorTree(id232, subcode232, subName232, tt232, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num213 == 3)
                            {
                                setColorTree(id233, subcode233, subName233, tt233, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num213 == 4)
                            {
                                setColorTree(id234, subcode234, subName234, tt234, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num213 == 5)
                            {

                                setColorTree(id235, subcode235, subName235, tt235, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num213 == 6)
                            {
                                setColorTree(id236, subcode236, subName236, tt236, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num213 == 7)
                            {
                                setColorTree(id237, subcode237, subName237, tt237, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num213 == 8)
                            {
                                setColorTree(id238, subcode238, subName238, tt238, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num213++;

                            #endregion
                        }

                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("52"))
                    {

                        #region callstylesheet css tree  5/2

                        headterm223.Attributes["Class"] = "term";
                        termname223.InnerHtml = "เทอม2";


                        if (num213 == 1)
                        {
                            setColorTree(id231, subcode231, subName231, tt231, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num213 == 2)
                        {

                            setColorTree(id232, subcode232, subName232, tt232, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num213 == 3)
                        {
                            setColorTree(id233, subcode233, subName233, tt233, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num213 == 4)
                        {
                            setColorTree(id234, subcode234, subName234, tt234, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num213 == 5)
                        {

                            setColorTree(id235, subcode235, subName235, tt235, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num213 == 6)
                        {
                            setColorTree(id236, subcode236, subName236, tt236, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num213 == 7)
                        {
                            setColorTree(id237, subcode237, subName237, tt237, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num213 == 8)
                        {
                            setColorTree(id238, subcode238, subName238, tt238, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num213++;

                        #endregion

                    }
                }
                #endregion

                #region  จัดการผลการเรียนปี 3
                DataRow[] resultQueryYear3 = dtsubject.Select("year = '6'");

                foreach (DataRow row in resultQueryYear3)
                {
                    if ((row[0].ToString() + row[1].ToString()).Equals("63"))
                    {
                        ilevel3++;
                    }

                }


                foreach (DataRow row in resultQueryYear3)
                {


                    if ((row[0].ToString() + row[1].ToString()).Equals("61"))
                    {

                        #region callstylesheet css tree  6/1

                        if (num311 == 1)
                        {
                            setColorTree(id311, subcode311, subName311, tt311, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num311 == 2)
                        {

                            setColorTree(id312, subcode312, subName312, tt312, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num311 == 3)
                        {
                            setColorTree(id313, subcode313, subName313, tt313, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num311 == 4)
                        {
                            setColorTree(id314, subcode314, subName314, tt314, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num311 == 5)
                        {

                            setColorTree(id315, subcode315, subName315, tt315, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num311 == 6)
                        {
                            setColorTree(id316, subcode316, subName316, tt316, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num311 == 7)
                        {
                            setColorTree(id317, subcode317, subName317, tt317, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num311 == 8)
                        {
                            setColorTree(id318, subcode318, subName318, tt318, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num311++;

                        #endregion

                    }
                    if (ilevel3 > 0)
                    {
                        /**ตรวจสอบว่าค่าที่นับ จากการตรวจสอบเทอม 3 ด้านบน ***/

                        if ((row[0].ToString() + row[1].ToString()).Equals("62"))
                        {

                            #region callstylesheet css tree  6/2

                            headterm322.Attributes["Class"] = "term";
                            termname322.InnerHtml = "เทอม2";


                            if (num312 == 1)
                            {
                                setColorTree(id321, subcode321, subName321, tt321, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num312 == 2)
                            {

                                setColorTree(id322, subcode322, subName322, tt322, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num312 == 3)
                            {
                                setColorTree(id323, subcode323, subName323, tt323, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num312 == 4)
                            {
                                setColorTree(id324, subcode324, subName324, tt324, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num312 == 5)
                            {
                                setColorTree(id325, subcode325, subName325, tt325, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num312 == 6)
                            {
                                setColorTree(id326, subcode326, subName326, tt326, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num312 == 7)
                            {
                                setColorTree(id327, subcode327, subName327, tt327, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num312 == 8)
                            {
                                setColorTree(id328, subcode328, subName328, tt328, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num312++;

                            #endregion

                        }
                        else if ((row[0].ToString() + row[1].ToString()).Equals("63"))
                        {

                            #region callstylesheet css tree  6/3

                            headterm333.Attributes["Class"] = "term";
                            termname333.InnerHtml = "เทอม3";


                            if (num313 == 1)
                            {
                                setColorTree(id331, subcode331, subName331, tt331, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num313 == 2)
                            {

                                setColorTree(id332, subcode332, subName332, tt232, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num313 == 3)
                            {
                                setColorTree(id333, subcode333, subName333, tt333, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num313 == 4)
                            {
                                setColorTree(id334, subcode334, subName334, tt334, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num313 == 5)
                            {

                                setColorTree(id335, subcode335, subName335, tt335, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            else if (num313 == 6)
                            {
                                setColorTree(id336, subcode336, subName336, tt336, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num313 == 7)
                            {
                                setColorTree(id337, subcode337, subName337, tt337, row[4].ToString(), row[2].ToString(), row[3].ToString());
                            }
                            else if (num313 == 8)
                            {
                                setColorTree(id338, subcode338, subName338, tt338, row[4].ToString(), row[2].ToString(), row[3].ToString());

                            }
                            num313++;

                            #endregion
                        }

                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("62"))
                    {

                        #region callstylesheet css tree  6/2

                        headterm333.Attributes["Class"] = "term";
                        termname333.InnerHtml = "เทอม2";



                        if (num313 == 1)
                        {
                            setColorTree(id331, subcode331, subName331, tt331, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num313 == 2)
                        {

                            setColorTree(id332, subcode332, subName332, tt232, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num313 == 3)
                        {
                            setColorTree(id333, subcode333, subName333, tt333, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num313 == 4)
                        {
                            setColorTree(id334, subcode334, subName334, tt334, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num313 == 5)
                        {

                            setColorTree(id335, subcode335, subName335, tt335, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        else if (num313 == 6)
                        {
                            setColorTree(id336, subcode336, subName336, tt336, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num313 == 7)
                        {
                            setColorTree(id337, subcode337, subName337, tt337, row[4].ToString(), row[2].ToString(), row[3].ToString());
                        }
                        else if (num313 == 8)
                        {
                            setColorTree(id338, subcode338, subName338, tt338, row[4].ToString(), row[2].ToString(), row[3].ToString());

                        }
                        num313++;

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

            #region เคลียค่า 111
            id111.Attributes["Class"] = "";
            subName111.Text = "";
            subcode111.Text = "";
            tt111.Visible = false;

            id112.Attributes["Class"] = "";
            subName112.Text = "";
            subcode112.Text = "";
            tt112.Visible = true;

            id113.Attributes["Class"] = "";
            subName113.Text = "";
            subcode113.Text = "";
            tt113.Visible = true;

            id114.Attributes["Class"] = "";
            subName114.Text = "";
            subcode114.Text = "";
            tt114.Visible = true;

            id115.Attributes["Class"] = "";
            subName115.Text = "";
            subcode115.Text = "";
            tt115.Visible = true;

            id116.Attributes["Class"] = "";
            subName116.Text = "";
            subcode116.Text = "";
            tt116.Visible = true;

            id117.Attributes["Class"] = "";
            subName117.Text = "";
            subcode117.Text = "";
            tt117.Visible = true;

            id118.Attributes["Class"] = "";
            subName118.Text = "";
            subcode118.Text = "";
            tt118.Visible = true;
            #endregion


            #region เคลียค่า 121

            id121.Attributes["Class"] = "";
            subName121.Text = "";
            subcode121.Text = "";
            tt121.Visible = true;


            id122.Attributes["Class"] = "";
            subName122.Text = "";
            subcode122.Text = "";
            tt122.Visible = true;


            id123.Attributes["Class"] = "";
            subName123.Text = "";
            subcode123.Text = "";
            tt123.Visible = true;


            id124.Attributes["Class"] = "";
            subName124.Text = "";
            subcode124.Text = "";
            tt124.Visible = true;


            id125.Attributes["Class"] = "";
            subName125.Text = "";
            subcode125.Text = "";
            tt125.Visible = true;


            id126.Attributes["Class"] = "";
            subName126.Text = "";
            subcode126.Text = "";
            tt126.Visible = true;


            id127.Attributes["Class"] = "";
            subName127.Text = "";
            subcode127.Text = "";
            tt127.Visible = true;



            id128.Attributes["Class"] = "";
            subName128.Text = "";
            subcode128.Text = "";
            tt128.Visible = true;

            #endregion


            #region เคลียค่า 131

            id131.Attributes["Class"] = "";
            subName131.Text = "";
            subcode131.Text = "";
            tt131.Visible = true;


            id132.Attributes["Class"] = "";
            subName132.Text = "";
            subcode132.Text = "";
            tt132.Visible = true;


            id133.Attributes["Class"] = "";
            subName133.Text = "";
            subcode133.Text = "";
            tt133.Visible = true;


            id134.Attributes["Class"] = "";
            subName134.Text = "";
            subcode124.Text = "";
            tt134.Visible = true;


            id135.Attributes["Class"] = "";
            subName135.Text = "";
            subcode135.Text = "";
            tt135.Visible = true;


            id136.Attributes["Class"] = "";
            subName136.Text = "";
            subcode136.Text = "";
            tt136.Visible = true;


            id137.Attributes["Class"] = "";
            subName137.Text = "";
            subcode137.Text = "";
            tt137.Visible = true;



            id138.Attributes["Class"] = "";
            subName138.Text = "";
            subcode138.Text = "";
            tt138.Visible = true;

            #endregion



            #region เคลียค่า 211
            id211.Attributes["Class"] = "";
            subName211.Text = "";
            subcode211.Text = "";
            tt211.Visible = false;

            id212.Attributes["Class"] = "";
            subName212.Text = "";
            subcode212.Text = "";
            tt212.Visible = true;

            id213.Attributes["Class"] = "";
            subName213.Text = "";
            subcode213.Text = "";
            tt213.Visible = true;

            id214.Attributes["Class"] = "";
            subName214.Text = "";
            subcode214.Text = "";
            tt214.Visible = true;

            id215.Attributes["Class"] = "";
            subName215.Text = "";
            subcode215.Text = "";
            tt215.Visible = true;

            id216.Attributes["Class"] = "";
            subName216.Text = "";
            subcode216.Text = "";
            tt216.Visible = true;

            id217.Attributes["Class"] = "";
            subName217.Text = "";
            subcode217.Text = "";
            tt217.Visible = true;

            id218.Attributes["Class"] = "";
            subName218.Text = "";
            subcode218.Text = "";
            tt218.Visible = true;
            #endregion

            #region เคลียค่า 221

            id221.Attributes["Class"] = "";
            subName221.Text = "";
            subcode221.Text = "";
            tt221.Visible = true;


            id222.Attributes["Class"] = "";
            subName222.Text = "";
            subcode222.Text = "";
            tt222.Visible = true;


            id223.Attributes["Class"] = "";
            subName223.Text = "";
            subcode223.Text = "";
            tt223.Visible = true;


            id224.Attributes["Class"] = "";
            subName224.Text = "";
            subcode224.Text = "";
            tt224.Visible = true;


            id225.Attributes["Class"] = "";
            subName225.Text = "";
            subcode225.Text = "";
            tt225.Visible = true;


            id226.Attributes["Class"] = "";
            subName226.Text = "";
            subcode226.Text = "";
            tt226.Visible = true;


            id227.Attributes["Class"] = "";
            subName227.Text = "";
            subcode227.Text = "";
            tt227.Visible = true;



            id228.Attributes["Class"] = "";
            subName228.Text = "";
            subcode228.Text = "";
            tt228.Visible = true;

            #endregion

            #region เคลียค่า 231

            id231.Attributes["Class"] = "";
            subName231.Text = "";
            subcode231.Text = "";
            tt231.Visible = true;


            id232.Attributes["Class"] = "";
            subName232.Text = "";
            subcode232.Text = "";
            tt232.Visible = true;


            id233.Attributes["Class"] = "";
            subName233.Text = "";
            subcode233.Text = "";
            tt233.Visible = true;


            id234.Attributes["Class"] = "";
            subName234.Text = "";
            subcode224.Text = "";
            tt234.Visible = true;


            id235.Attributes["Class"] = "";
            subName235.Text = "";
            subcode235.Text = "";
            tt235.Visible = true;


            id236.Attributes["Class"] = "";
            subName236.Text = "";
            subcode236.Text = "";
            tt236.Visible = true;


            id237.Attributes["Class"] = "";
            subName237.Text = "";
            subcode237.Text = "";
            tt237.Visible = true;



            id238.Attributes["Class"] = "";
            subName238.Text = "";
            subcode238.Text = "";
            tt238.Visible = true;

            #endregion


            #region เคลียค่า 311
            id311.Attributes["Class"] = "";
            subName311.Text = "";
            subcode311.Text = "";
            tt311.Visible = false;

            id312.Attributes["Class"] = "";
            subName312.Text = "";
            subcode312.Text = "";
            tt312.Visible = true;

            id313.Attributes["Class"] = "";
            subName313.Text = "";
            subcode313.Text = "";
            tt313.Visible = true;

            id314.Attributes["Class"] = "";
            subName314.Text = "";
            subcode314.Text = "";
            tt314.Visible = true;

            id315.Attributes["Class"] = "";
            subName315.Text = "";
            subcode315.Text = "";
            tt315.Visible = true;

            id316.Attributes["Class"] = "";
            subName316.Text = "";
            subcode316.Text = "";
            tt316.Visible = true;

            id317.Attributes["Class"] = "";
            subName317.Text = "";
            subcode317.Text = "";
            tt317.Visible = true;

            id318.Attributes["Class"] = "";
            subName318.Text = "";
            subcode318.Text = "";
            tt318.Visible = true;
            #endregion

            #region เคลียค่า 321

            id321.Attributes["Class"] = "";
            subName321.Text = "";
            subcode321.Text = "";
            tt321.Visible = true;


            id322.Attributes["Class"] = "";
            subName322.Text = "";
            subcode322.Text = "";
            tt322.Visible = true;


            id323.Attributes["Class"] = "";
            subName323.Text = "";
            subcode323.Text = "";
            tt323.Visible = true;


            id324.Attributes["Class"] = "";
            subName324.Text = "";
            subcode324.Text = "";
            tt324.Visible = true;


            id325.Attributes["Class"] = "";
            subName325.Text = "";
            subcode325.Text = "";
            tt325.Visible = true;


            id326.Attributes["Class"] = "";
            subName326.Text = "";
            subcode326.Text = "";
            tt326.Visible = true;


            id327.Attributes["Class"] = "";
            subName327.Text = "";
            subcode327.Text = "";
            tt327.Visible = true;



            id328.Attributes["Class"] = "";
            subName328.Text = "";
            subcode328.Text = "";
            tt328.Visible = true;

            #endregion

            #region เคลียค่า 331

            id331.Attributes["Class"] = "";
            subName331.Text = "";
            subcode331.Text = "";
            tt331.Visible = true;


            id332.Attributes["Class"] = "";
            subName332.Text = "";
            subcode332.Text = "";
            tt332.Visible = true;


            id333.Attributes["Class"] = "";
            subName333.Text = "";
            subcode333.Text = "";
            tt333.Visible = true;


            id334.Attributes["Class"] = "";
            subName334.Text = "";
            subcode324.Text = "";
            tt334.Visible = true;


            id335.Attributes["Class"] = "";
            subName335.Text = "";
            subcode335.Text = "";
            tt335.Visible = true;


            id336.Attributes["Class"] = "";
            subName336.Text = "";
            subcode336.Text = "";
            tt336.Visible = true;


            id337.Attributes["Class"] = "";
            subName337.Text = "";
            subcode337.Text = "";
            tt337.Visible = true;



            id338.Attributes["Class"] = "";
            subName338.Text = "";
            subcode338.Text = "";
            tt338.Visible = true;

            #endregion




        }




    }
}