<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testInfiniteScorebar.aspx.cs"
    Inherits="Webcomsci.WebPage.test.testInfiniteScorebar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Basic Example Infinite AJAX Scroll</title>
    <link rel="canonical" href="http://infiniteajaxscroll.com/examples/basic.html" />
    <link rel="stylesheet" href="http://yandex.st/highlightjs/7.5/styles/default.min.css">
    <link href="a74406a.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="container">
            <div id="main">
                <section id="content">
            <div class="page-header">
    <h1>Basic example</h1>
  </div>

  <div class="container">

    <div class="item">
      <strong>Item 1.1</strong>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
    </div>

    <div class="item">
      <strong>Item 1.2</strong>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
    </div>

    <div class="item">
      <strong>Item 1.3</strong>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
        <p>-------------------------------------------------------------</p>
    </div>
  </div>

  <ul id="pagination">
<%--          <li ><a href="/examples/overflow/page1.html">1</a></li>
          <li class="next"><a href="/examples/overflow/page2.html">2</a></li>
          <li ><a href="/examples/overflow/page3.html">3</a></li>
          <li ><a href="/examples/overflow/page4.html">4</a></li>--%>
           <li ><a href="test1.htm">1</a></li>
          <li class="next"><a href="test2.htm">2</a></li>
          <li ><a href="test3.htm">3</a></li>
      </ul>

 <script type="text/javascript" src="jquery.min.js"></script>

<script type="text/javascript" src="jquery-ias.min.js"></script>
  <script type="text/javascript">
      var ias = $.ias({
          container: "#container",
          item: ".item",
          pagination: "#pagination",
          next: ".next a"
      });

      ias.extension(new IASTriggerExtension({ offset: 2 }));
      ias.extension(new IASSpinnerExtension());
      ias.extension(new IASNoneLeftExtension({ html: '<div style="text-align:center"><p><em>You reached the end!</em></p></div>' }));
  </script>
        </section>
            </div>
            <div id="root_footer">
            </div>
        </div>
        <script src="ddd7e15.js" type="text/javascript"></script>
        <script type="text/javascript">
            var clicky_site_ids = clicky_site_ids || [];
            clicky_site_ids.push(100698863);
            (function () {
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = '//static.getclicky.com/js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(s);
            })();
        </script>
        <noscript>
            <p>
                <img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100698863ns.gif" /></p>
        </noscript>
        <script src="http://yandex.st/highlightjs/7.5/highlight.min.js"></script>
        <script>
            hljs.initHighlightingOnLoad();
        </script>
    </div>
    </form>
</body>
</html>