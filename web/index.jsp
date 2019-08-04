<%--
  Created by IntelliJ IDEA.
  User: 15651873068
  Date: 2019-7-21
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link rel="stylesheet" href="/WEB-INF/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="WEB-INF/bootstrap/bootstrap-theme.css">
    <script src="WEB-INF/bootstrap/jquery-3.3.1.min.js"></script>
    <script src="WEB-INF/bootstrap/bootstrap.min.js"></script>
    <style type="text/css">
        .fileinput-button {
            position: relative;
            display: inline-block;
            overflow: hidden;
        }

        .fileinput-button input {
            position: absolute;
            left: 0px;
            top: 0px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px;
        }


        .file_upload_box {
            display: inline-block;
            width: 200px;
            height: 60px;
            position: relative;
            overflow: hidden;
        }

        .file_upload_box input[type=file] {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            line-height: 60px;
            opacity: 0;
            cursor: pointer;
        }

        .file_upload_box span {
            display: inline-block;
            width: 100%;
            line-height: 45px;
            text-align: center;
            font-family: "Microsoft yahei";
            background-color: #f60;
            color: #FFF;
            font-weight: 700;
            text-decoration: none;
        }

    </style>

    <script type="text/javascript" charset="UTF-8">
        /**
         * 通用的打开下载对话框方法，没有测试过具体兼容性
         * @param url 下载地址，也可以是一个blob对象，必选
         * @param saveName 保存文件名，可选
         */
        function openDownloadDialog(url, saveName) {
            if (typeof url == 'object' && url instanceof Blob) {
                url = URL.createObjectURL(url); // 创建blob地址
            }
            var aLink = document.createElement('a');
            aLink.href = url;
            aLink.download = saveName || ''; // HTML5新增的属性，指定保存文件名，可以不要后缀，注意，file:///模式下不会生效
            var event;
            if (window.MouseEvent) event = new MouseEvent('click');
            else {
                event = document.createEvent('MouseEvents');
                event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
            }
            aLink.dispatchEvent(event);
        }

        function browseFolder(path) {
            try {
                var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
                var Shell = new ActiveXObject("Shell.Application");
                var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
                //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
                if (Folder != null) {
                    Folder = Folder.items(); // 返回 FolderItems 对象
                    Folder = Folder.item(); // 返回 Folderitem 对象
                    Folder = Folder.Path; // 返回路径
                    if (Folder.charAt(Folder.length - 1) != "\\") {
                        Folder = Folder + "\\";
                    }
                    document.getElementById(path).value = Folder;
                    return Folder;
                }
            } catch (e) {
                alert(e.message);
            }
        }


        var Downer = (function (files) {
            var h5Down = !/Trident|MSIE/.test(navigator.userAgent);

            function downloadFile(fileName, contentOrPath) {
                var aLink = document.createElement("a"),
                    evt = document.createEvent("HTMLEvents"),
                    isData = contentOrPath.slice(0, 5) === "data:",
                    isPath = contentOrPath.lastIndexOf(".") > -1;
// 初始化点击事件

                evt.initEvent("click");
                // 添加文件下载名

                aLink.download = fileName;
                // 如果是 path 或者 dataURL 直接赋值

                // 如果是 file 或者其他内容，使用 Blob 转换
                aLink.href = isPath || isData ? contentOrPath

                    : URL.createObjectURL(new Blob([contentOrPath]));
                aLink.dispatchEvent(evt);
            }

            function IEdownloadFile(fileName, contentOrPath, bool) {

                var isImg = contentOrPath.slice(0, 10) === "data:image",
                    ifr = document.createElement('iframe');
                ifr.style.display = 'none';

                ifr.src = contentOrPath;
                document.body.appendChild(ifr);
                isImg && ifr.contentWindow.document.write("<img src='" +

                    contentOrPath + "' />");
// 保存页面 -> 保存文件

                // alert(ifr.contentWindow.document.body.innerHTML)
                if (bool) {

                    ifr.contentWindow.document.execCommand('SaveAs', false, fileName);

                    document.body.removeChild(ifr);
                } else {

                    setTimeout(function () {

                        ifr.contentWindow.document.execCommand('SaveAs', false, fileName);

                        document.body.removeChild(ifr);
                    }, 0);

                }
            }

            function parseURL(str) {

                return str.lastIndexOf("/") > -1 ? str.slice(str.lastIndexOf("/") + 1) : str;

            }

            return function (files) {

                // 选择下载函数

                var downer = h5Down ? downloadFile : IEdownloadFile;
// 判断类型，处理下载文件名

                if (files instanceof Array) {

                    for (var i = 0, l = files.length; i < l; i++)
                        // bug 处理

                        downer(parseURL(files[i]), files[i], true);

                } else if (typeof files === "string") {
                    downer(parseURL(files), files);

                } else {

                    // 对象
                    for (var file in files) downer(file, files[file]);

                }
            }
        })();

        function down1() {

            Downer("../file/test.txt");

        }

        function down2() {

            Downer(["../file/test.txt", "../file/test.txt"]);

        }

        function down3() {

            Downer({

                "1.txt": "../file/test.txt",

                "2.jpg": "../file/test.jpg"

            });

        }

    </script>
    <title>启动页面</title>
</head>
<body>
<div align="center">
    <s:a action="hello">hello</s:a>
    <s:a action="showAllUser">showAllUser</s:a>
    <button class="btn btn-default" href="upload.html">上传按钮</button>
    <br>
    <span class="btn btn-success fileinput-button">
        <span>上传</span>
        <input type="file">
    </span>

    <br>
    <div class="file_upload_box">
          <span>
              <span>上传文件</span>
          <input type="file" name="file"/>
          <%--<a href="">上传文件</a>--%>
          </span>
    </div>

    <br>
    <input id="b" type="file" webkitdirectory>
    <br>
    <%--<a href="data:text/html;charset=utf-8,测试下载HTML" download="upload.html">下载HTML</a>--%>
    <button onclick="openDownloadDialog()">下载</button>
    <br>
    <input style="color: #2aabd2" type="button" value="下载" onclick="window.document.execCommand('Save as')"/>
    <br>
    <input type="button" value="选择" onclick="browseFolder('upload.html')">
    <br>
    <a href="javascript:" onclick="down1();return false;">单文件下载</a><br/><br/>
</div>
</body>
</html>
