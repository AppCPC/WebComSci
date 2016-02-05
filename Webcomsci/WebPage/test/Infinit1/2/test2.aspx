<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="Webcomsci.WebPage.test.Infinit1._2.test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Overflow Example Infinite AJAX Scroll</title>
    <link rel="canonical" href="http://infiniteajaxscroll.com/examples/overflow.html" />
    <link rel="stylesheet" href="http://yandex.st/highlightjs/7.5/styles/default.min.css">
    <link rel="stylesheet" href="/css/a74406a.css" />
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
</head>
<body class="">
    <div id="container">
        <body>
            <form id="form1" runat="server">
            <div id="overflow" style="max-width: 400px; height: 300px; overflow-y: auto; border: solid 1px red;
                padding: 1em;">
                <div class="container">
                    <div class="item">
                        <strong>Item 1.1</strong>
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                            euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
                            minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
                            ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate
                            velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero
                            eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit
                            augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend
                            option congue nihil imperdiet doming id quod mazim placerat facer possim assum.
                            Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.
                            Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
                            Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                            Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit
                            litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem
                            modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                    </div>
                    <div class="item">
                        <strong>Item 1.2</strong>
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                            euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
                            minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
                            ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate
                            velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero
                            eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit
                            augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend
                            option congue nihil imperdiet doming id quod mazim placerat facer possim assum.
                            Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.
                            Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
                            Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                            Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit
                            litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem
                            modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                    </div>
                    <div class="item">
                        <strong>Item 1.3</strong>
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                            euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
                            minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
                            ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate
                            velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero
                            eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit
                            augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend
                            option congue nihil imperdiet doming id quod mazim placerat facer possim assum.
                            Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.
                            Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
                            Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                            Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit
                            litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem
                            modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                    </div>
                </div>
                <ul id="pagination">
                    <li><a href="../1/test1.htm">1</a></li>
                    <li class="next"><a href="../1/test2.htm">2</a></li>
                    <li><a href="../1/test3.htm">3</a></li>
                </ul>
            </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
            <script type="text/javascript" src="../1/jquery-ias.min.js"></script>
            <script type="text/javascript">
                var ias = $('#overflow').ias({
                    container: "#container",
                    item: ".item",
                    pagination: "#pagination",
                    next: ".next a",
                    delay: 1000
                });

                ias.extension(new IASSpinnerExtension());
                ias.extension(new IASNoneLeftExtension({ html: '<div style="text-align:center"><p><em>You reached the end!</em></p></div>' }));
            </script>
        </section>
    </div>
    <div id="root_footer">
    </div>
    </div>
    <script src="../1/ddd7e15.js" type="text/javascript"></script>
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
    </form>
</body>
</html>