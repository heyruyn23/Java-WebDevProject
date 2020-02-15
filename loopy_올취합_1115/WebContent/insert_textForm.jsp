<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>Loopy - 게시글 업로드</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="/css/default.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link rel="stylesheet" href="css/tui-editor.min.css">
    <link rel="stylesheet" href="css/tui-editor-contents.min.css" />
    <style>
        html {
            overflow-y: scroll;
        }
        body {
            font-family: 'Nanum Gothic', sans-serif;
            color: #000;
        }
        #content {
            width: 1200px;
            margin: auto;
        }
        .metaField {
            position: relative;
            height: 150px;
            width: 1200px;
        }
        .boardArea {
            width: 150px;
            height: 50px;
            position: absolute;
            line-height: 50px;
        }
        .titleArea {
            width: 1050px;
            height: 50px;
            position: absolute;
            right: 0;
            line-height: 50px;
        }
        .traceArea {
            width: 1200px;
            height: 100px;
            position: absolute;
            bottom: 0;
        }
        #editSection {
            width: 1200px;
            /*height: 500px;*/
            /*background-color: blue;*/
        }
        .setTrace {
            resize: none;
            width: 1194px;
            height: 94px;
        }
        .btnBox {
            width: 1200px;
            height: 100px;
            line-height: 100px;
        }
        .btn {
            float: right;
            font-size: 20px;
            padding: 12px 20px;
            border-radius: 5px;
            margin: 15px;
        }
        #setTitle {
            width: 450px;
        }
        .traceArea {
            margin-bottom: 5px;
        }
        #uploadImage {
        	display: none;
        }
        #editSection .btn_image {
        	color: #565656;
        }
    </style>
</head>
<body>
    <div id="content">
        <form action="insert_text.jsp" method="post" id="insTxt">
            <fieldset>
                <legend class="screen_out">게시글 작성 폼</legend>
                <input type="hidden" name="contents" id="contents" />
                <div class="metaField">
                    <div class="boardArea">
                        <select name="boardType">
                            <option value="free">자유게시판</option>
                            <option value="lecture">강의게시판</option>
                            <option value="query">질문게시판</option>
                            <option value="inform">정보게시판</option>
                            <option value="review">리뷰게시판</option>
                            <option value="pr">홍보게시판</option>
                        </select>
                    </div>
                    <div class="titleArea">
                        <input id="setTitle" name ="txtTitle" placeholder="글 제목을 입력해주세요" />
                    </div>
                    <div class="traceArea">
                        <textarea name="trace" class="setTrace" placeholder="출처 입력"></textarea>
                    </div>
                </div><!-- .metaField -->
                <div id="editSection"></div>
                <div class="btnBox">
                    <button type="button" class="cancelBtn btn">취소</button>
                    <button class="submitBtn btn">완료</button>
                </div>
            </fieldset>
        </form>
        <input type="file" id="uploadImage" />
    </div><!-- #content -->
<script src="js/jquery.js"></script>
<!-- TOAST UI Editor -->
<script src="js/tui-code-snippet.min.js"></script>
<script src='js/markdown-it.js'></script>
<script src="js/to-mark.min.js"></script>
<script src="js/codemirror.js"></script>
<script src="js/highlight.js"></script>
<script src="js/squire-raw.js"></script>
<script src="js/tui-editor-Editor.js"></script>
<!-- TOAST UI Editor -->
<script>
	var editor = new tui.Editor({
	    el: document.querySelector("#editSection"),
	    initialEditType: 'wysiwyg',
	    previewStyle: 'vertical',
	    height: 600,
	    language:"ko_KR",
	    toolbarItems: [
	        'heading',
	        'hr',
	        'qoute',
	        'divider',
	        'bold',
	        'italic',
	        'strike',
	        'divider',
	        'ul',
	        'ol',
	        'table',
	        'divider',
	        'task',
	        'link'
	    ]
	});//editor
	
	var $uploadImage = $("#uploadImage");
	const toolbar = editor.getUI().getToolbar();
    var fileTypeExp = /^image\//;
    
    editor.eventManager.addEventType('imageEvent');
    editor.eventManager.listen('imageEvent', function () {
        $uploadImage.click();
    });
    toolbar.addButton({
        name: 'addImage',
        event: 'imageEvent',
        tooltip: '이미지 첨부',
        $el: $("<button>").attr("class","btn_image").html("<i class=\"fas fa-image\"></i>")
    });

    var $title = $("#setTitle");
    
    $("#insTxt").submit(function () {
        var content = editor.getValue();
        var title = $title.val();
        
        if(title.length==0) {
        	alert("제목을 입력해주세요.");
        	$title.focus();
        	return false;
        }
        if(content.length==0) {
        	alert("내용을 입력해주세요.");
        	return false;
        }
        $("#contents").val(content);
        return true;
    });//#insTxt.submit() end

    $uploadImage.change(function () {
        var file = this.files[0];
        if(file.size==0) {
            alert('제대로 된 파일을 선택해주세요.');
            return;
        }//if end
        if(!fileTypeExp.test(file.type)) {
            alert('이미지 파일만 선택 가능합니다.');
        }//if end
        var formData = new FormData();
        formData.append("uploadImg",file,file.name);
        formData.append("type","B");

        $.ajax({
            url: '/ajax/uploadImage.jsp',
            processData: false,
            contentType: false,
            data: formData,
            type: 'post',
            dataType: 'json',
            error: function (xhr,error,code) {
                console.log("에러 발생: " + code)
            },
            success: function (json) {
                var squireExt = editor.wwEditor.getEditor();
                squireExt.insertHTML("<img src='" + json.src + "'>");
            }//success() end
        });//$.ajax() end
    });//$uploadImage.change() end

    $(".cancelBtn").click(function () {
        alert("원래 있던 페이지로 이동")
    })//.cancelBtn.click() end
</script>
</body>
</html>