<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <base href="${basePath}">
    <meta charset="UTF-8">
    <title>ueditor demo</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "UEditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>

</head>

<body>



        <p id="testText"></p><br>
        <%--<input type="radio" name="ra"/>--%>
        <%--<input type="radio" name="ra"/>--%>
        <button name="submit" id="submit" onclick="test()">发布</button>
        <%--<input type="submit" name="submit" value="发布">--%>
        <%--<input type="reset" name="reset" value="取消">--%>


    <!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="UEditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="UEditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        //window.UEDITOR_HOME_URL = "../UEditor/";
        var ue = UE.getEditor('container');

            function test() {
                var content = ue.getContentTxt();
                console.log(content);
                $("#testText").html(content);
            }
           /* test()
        }*/

    </script>
</body>

</html>