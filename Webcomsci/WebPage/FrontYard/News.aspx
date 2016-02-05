<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Webcomsci.News" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style17
        {
            width: 25px;
            height: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="Stylesheet" href="../../css/skins/slideshow.css" />
     <div class="main" align="center">

        <div class="rss-container">

            <div id="slideshow" class="rs-slideshow">
                <div class="slide-container">
                    <img src="../../image/slideshow/11.png" />
                    <%--<div class="slide-caption">
							<p>Here's an HTML caption (slide 1). <a href="#">This is a link</a> and <b>this is bold.</b></p>
						</div>--%>
                </div>
                <ol class="slides">
                    <li>
                        <a href="../../image/slideshow/11.png">This is the first slide</a>
                        <%--<div class="caption">
								<p>Here's an HTML caption (slide 1). <a href="#">This is a link</a> and <b>this is bold.</b></p>
							</div>--%>
						</li>
                    <li>
                        < <a href="../../image/slideshow/12.png"
                            data-link-to="http://reallysimpleworks.com">This is the second slide</a>
                        <%--<div class="caption">
								<p>Here's an HTML caption (slide 2). <a href="#">This is a link</a> and <b>this is bold.</b></p>
							</div>--%>
						</li>
                    <li>
                        < <a href="../../image/slideshow/13.png"
                            title="This is the third slide">This is the third slide</a>
                        <%--<div class="caption">
								<p>Here's an HTML caption (slide 3). <a href="#">This is a link</a> and <b>this is bold.</b></p>
							</div>--%>
						</li>
                    <li>
                         <a href="../../image/slideshow/14.png"
                            title="This is the third slide">This is the third slide</a>
                        <%--<div class="caption">
								<p>Here's an HTML caption (slide 3). <a href="#">This is a link</a> and <b>this is bold.</b></p>
							</div>--%>
						</li>
                </ol>
            </div>





        </div>




    </div>
		
		

<script src="../../js/jquery.rs.slideshow.js"></script>
	<script src="../../js/html-captions-bootstrap.js"></script>

    <br />

    <div style="padding-right: 30px; padding-left: 20px">
    <span class="style7"><span class="fontWhite">• ประกาศ รายวิชาที่เปิดเพิ่มของนักศึกษาหลักสูตรเทียบโอน ประจำภาคเรียนที่ 2/2555</span>
    <span class="fontYellow">คณะบริหารธุรกิจและเทคโนโลยีสารสนเทศ [07 พย. 2555] </span></span>
    <img alt="" class="style17" src="../../image/New.gif" /><br />
   <span class="style7"><span class="fontWhite">• ประกาศ รับสมัครคัดเลือกบุคคลกรเพื่อบรรจุและแต่งตั้งเป็นลูกจ้างชั่วคราว</span>
    <span class="fontYellow">งานบุคลากร [07 พย. 2555] 
    <img alt="" class="style17" src="../../image/New.gif" /></span><br />
    <span class="fontWhite">
    • ผู้สำเร็จการศึกษา ประจำปีการศึกษา ๒๕๕๔ ที่ยังไม่ได้กรอก ระบบภาวะการมีงานทำของบัณฑิต </span>
    <span class="fontYellow">เเผนกเเนะเเนว 
    <br />
    [05 พย. 2555] 
    <img alt="" class="style17" src="../../image/New.gif" /></span></span><br />
     <span class="fontWhite">•  ประกาศ รายชื่อผู้ผ่านการสอบคัดเลือกพนักงานราชการ</span><span 
        class="fontYellow">งานบุคลากร [02 พย. 2555] 
    <img alt="" class="style17" src="../../image/New.gif" /></span><br />
        <span class="fontWhite">•  ประกาศ รับสมัครบุคคลเข้าสอบแข่งขันเพื่อนบรรจุเป็นพนักงานในสถาบันอุดมศึกษา </span>
        <span class="fontYellow">งานบุคลากร [02 พย. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">รายชื่อและตารางเวลารถ ไป-กลับ E-Tech</span>
        <span class="fontYellow">คณะบริหารธุรกิจและเทคโนโลยีสารสนเทศ [02 พย. 2555] 
    <img alt="" class="style17" src="../../image/New.gif" /></span><br />
        <span class="fontWhite">•  ประกาศ นักศึกษาเงินกู้กยศ. การกรอกข้อมูลบันทึกค่าเล่าเรียนปีการศึกษาที่2/2555 </span>
        <span class="fontYellow">แผนกบริการและสวัสดิการนักศึกษา [31 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ผู้สำเร็จการศึกษา ประจำปีการศึกษา ๒๕๕๔ ให้ดาวน์โหลดแบบแบบสอบถามความคิดเห็นผู้ใช้บัญฑิตเกี่ยวกับลักษณะของบัญฑิต ให้ผู้ประกอบการหรือนายจ้างประเมิน และส่งไปรษณีย์ มาที่ แผนกแนะแนว</span>
        <span class="fontYellow">แผนกแนะแนวการศึกษาและอาชีพ 
    <br />
    [25 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  รับสมัครนักศึกษาโควตา ประจำปีการศึกษา 2556</span>
        <span class="fontYellow">แผนกทะเบียน [24 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ประกาศเรื่อง เอกสารการมอบตัวของนักศึกษาที่เข้าศึกษา ปี 2554 (ซึ่งเอกสารไม่ครบ)</span>
        <span class="fontYellow">แผนกทะเบียน [22 ตค. 2555]</span><img alt="" 
        class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ประกาศ นักศึกษาหลักสูตรเทียบโอน ที่ประสงค์จะลงทะเบียนเรียนในรายวิชาที่ไม่เปิดในภาคเรียนที่ 2/2555</span>
        <span class="fontYellow">ประกาศ นักศึกษาหลักสูตรเทียบโอน ที่ประสงค์จะลงทะเบียนเรียนในรายวิชาที่ไม่เปิดในภาคเรียนที่ 2/2555 คณะบริหารธุรกิจและเทคโนโลยีสารสนเทศ [22 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  นักศึกษาเงินกู้ กยศ.</span>
        <span class="fontYellow">งานพัฒนานักศึกษา [22 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ประกาศมหาวิทยาลัยเทคโนโลยีราชมงคลตะวันออกเรื่องพิธีพระราชทานปริญญาบัตร </span>
        <span class="fontYellow">งานกิจการนักศึกษา [11 ตค. 2555]</span>
        <br />
        <span class="fontWhite">•  บัญชีรายชื่อนักศึกษาวิชาทหารเเละผลการสอบ</span>
        <span class="fontYellow">งานพัฒนานักศึกษา [10 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  รับสมัครบุคคลเพื่อเลือกสรรมาเป็นพนักงานราชการทั่วไป</span>
        <span class="fontYellow">เเผนกบุคลากร [04 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  รับสมัครคัดเลือกบุคคลเพื่อบรรจุเเละเเต่งตั้งเป็นลูกจ้างชั่วคราว</span>
        <span class="fontYellow">เเผนกบุคลากร [04 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ขยายระยะเวลารับสมัครคัดเลือกบุคคลเพื่อบรรจุเเละเเต่งตั้งเป็นลูกจ้างชั่วคราว</span>
        <span class="fontYellow">เเผนกบุคลากร [04 ตค. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  นักศึกษาที่รับชุดครุยที่ตึก 8 ชั้น 4 เเล้วให้ซื้อเครื่องหมายบัณฑิต</span>
        <span class="fontYellow">เเผนกสารบรรณ [28 กย. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ประกาศเรื่อง ตารางสอบปลายภาคเรียนที่ 1/2555 (สำหรับอาจารย์/เจ้าหน้าที่/นักศึกษา) </span>
        <span class="fontYellow">สำนักงานส่งเสริมวิชาการและงานทะเบียน [27 กย. 2555]</span>
        <img alt="" class="style17" src="../../image/New.gif" /><br />
        <span class="fontWhite">•  ประกาศเรื่อง หลักเกณฑ์และแนวทางปฏิบัติในการขอรับการสนับสนุนเงินอุดหนุนทางการศึกษา สำหรับคนพิการในระดับอุดมศึกษา </span>
        <span class="fontYellow">แผนกทะเบียน [27 กย. 2555] 
    <img alt="" class="style17" src="../../image/New.gif" /></span><br />
    </div>

</asp:Content>
