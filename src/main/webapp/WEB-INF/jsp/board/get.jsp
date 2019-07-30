<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">


<div class="row">
  <div class="col-lg-12">
      <h1 class="page-header" name="tableName" value="<c:out value="${boardName}" />"><c:out value="${boardName}" /></h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <div class="form-group">
<%--          <label>Bno</label>--%>
            <span name='bno' readonly="readonly" style="font-weight:lighter">
                <c:out value="# ${board.bno }"/>
            </span>
        </div>

        <div class="form-group">
<%--          <label>Title</label> <input class="form-control" name='title'--%>
<%--            value='<c:out value="${board.title }"/>' readonly="readonly">--%>
             <h2 name='title' readonly="readonly">
                <c:out value="${board.title }"/>
            </h2>
        </div>

        <hr/>

        <div class="form-group">
<%--          <label>Text area</label>--%>
<%--          <textarea class="form-control" rows="3" name='contents'--%>
<%--            readonly="readonly"><c:out value="${board.contents}" /></textarea>--%>

            <article name="contents" readonly="readonly">
                <c:out value="${board.contents}" />
            </article>
        </div>



<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/board/list">List</a></button> --%>


<!-- <button data-oper='modify' class="btn btn-default">Modify</button> -->


<sec:authentication property="principal" var="pinfo"/>

<sec:authorize access="isAuthenticated()">


    <input type="hidden" id="curuser" value="${pinfo.username}" />

    <c:if test="${pinfo.username eq board.writer}">

      <button data-oper='modify' class="btn btn-default">Modify</button>

  </c:if>
</sec:authorize>

<button data-oper='list' class="btn btn-info">List</button>

<buttom id="like" data-oper='like' class="btn btn-default" style="background-color: red">좋아요 0</buttom>


<%--  <div>--%>
<%--      <div class="w3-border w3-center w3-padding">--%>
<%--              추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />--%>
<%--              <i class="fa fa-heart" style="font-size:16px;color:red"></i>--%>
<%--              <span class="rec_count"></span>--%>
<%--              <button class="w3-button w3-black w3-round" id="rec_update">--%>
<%--                  <i class="fa fa-heart" style="font-size:16px;color:red"></i>--%>
<%--                  &nbsp;<span class="rec_count"></span>--%>
<%--              </button>--%>
<%--      </div>--%>
<%--  </div>--%>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>

<form id='operForm' action="/board/modify" method="get">

  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

</form>

<%--  <sec:authentication property="principal" var="pinfo"/>--%>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
</div>

<style>
    .uploadResult {
        width:100%;
        background-color: gray;
    }
    .uploadResult ul{
        display:flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }
    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        text-align: center;
    }
    .uploadResult ul li img{
        width: 100px;
    }
    .uploadResult ul li span {
        color:white;
    }
    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top:0%;
        width:100%;
        height:100%;
        background-color: gray;
        z-index: 100;
        background:rgba(255,255,255,0.5);
    }
    .bigPicture {
        position: relative;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        width:600px;
    }

</style>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Files</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class='uploadResult'>
                    <ul>
                    </ul>
                </div>
            </div>
            <!--  end panel-body -->
        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->



<div class='row'>

  <div class="col-lg-12">

       <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i> Reply
           <sec:authorize access="isAuthenticated()">
           <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
           </sec:authorize>
        </div>

      <!-- /.panel-heading -->
      <div class="panel-body">

        <ul class="chat">
            <!-- start reply -->
            <li class="left clearfix" data-rno='12'>
                <div>
                    <div class="header">
                        <strong class="primary-font">user00</strong>
                        <small class="pull-right text-muted">2018-01-01 13:13</small>
                    </div>
                    <p>good job!</p>
                </div>
            </li>
            <!-- end reply -->
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>
    </div>
  </div>
  <!-- ./ end row -->
</div>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label>
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>
              <div class="form-group">
                <label>Replyer</label>
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label>
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>

            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function() {

    var bnoValue='<c:out value="${board.bno}"/>';
    var replyUL=$(".chat");

    showList(1);

    function showList(page){
        console.log("show list " + page);
        replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {

        console.log("list: " + list);
        // console.log(list[0]);
        // console.log(list[0].replyDate);

        if (page == -1){
            pageNum=Math.ceil(replyCnt/10.0);
            showList(pageNum);
            return;
        }

         var str="";

         if(list == null || list.length == 0){
            replyUL.html("");
            return;
         }

         // for (var i = 0, len = list.length || 0; i < len; i++) {
         //   str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
         //   str +="  <div><div class='header'><strong class='primary-font'>"
        	//    +list[i].replyer+"</strong>";
         //   str +="    <small class='pull-right text-muted'>"
         //       +replyService.displayTime(list[i].replyDate)+"</small></div>";
         //   //replyService.displayTime(list[i].replyDate)
         //   str +="    <p>"+list[i].reply+"</p></div></li>";
         // }

            for (var i = 0, len = list.length || 0; i < len; i++) {
                str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                str +="  <div><div class='header'><strong class='primary-font'>["
                    +list[i].rno+"] "+list[i].replyer+"</strong>";
                str +="    <small class='pull-right text-muted'>"
                    +replyService.displayTime(list[i].replydate)+"</small></div>";
                str +="    <p>"+list[i].reply+"</p></div></li>";
            }

         replyUL.html(str);

         showReplyPage(replyCnt);

       });//end function
     }//end showLis

    showLikeCount();

    function showLikeCount(){
        replyService.getLikeCount(bnoValue, function(total){
            console.log("좋아요 number : "+total);

            $("#like").html("좋아요 "+total);


        })
    }

     var modal = $(".modal");
     var modalInputReply = modal.find("input[name='reply']");
     var modalInputReplyer = modal.find("input[name='replyer']");
     var modalInputReplyDate = modal.find("input[name='replyDate']");

     var modalModBtn = $("#modalModBtn");
     var modalRemoveBtn = $("#modalRemoveBtn");
     var modalRegisterBtn = $("#modalRegisterBtn");



    var csrfHeaderName ="${_csrf.headerName}";
    var csrfTokenValue="${_csrf.token}";

     $("#addReplyBtn").on("click", function(e){

         modal.find("input").val("");
         modal.find("input[name='replyer']").val(replyer);
         modalInputReplyDate.closest("div").hide();
         modal.find("button[id !='modalCloseBtn']").hide();

         modalRegisterBtn.show();

         $(".modal").modal("show");

     });

     var curuser=$('#curuser').val();

    $("#like").on("click", function(e){

        var like_info = {
            bno: bnoValue,
            userid:curuser
        };

        if (!curuser){
            alert("로그인을 해주세요.");
            return ;
        }

        replyService.checkLikeDuplicate(like_info, function (result) {
            console.log("result result : "+result);

            if (result>0){
                replyService.cancelLikeButton(like_info, function (result) {
                    alert("추천을 취소하였습니다.");
                    showLikeCount();
                    return ;
                })
            }else {
                replyService.likeadd(like_info, function (result) {
                    alert("추천하였습니다.");

                    showLikeCount();
                })
            }
        })
    });


    modalRegisterBtn.on("click",function(e){

       var reply = {
             reply: modalInputReply.val(),
             replyer:modalInputReplyer.val(),
             bno:bnoValue
           };
       replyService.add(reply, function(result){

         alert(result);

         modal.find("input").val("");
         modal.modal("hide");

         // showList(1);
         showList(-1);

       });

     });

    modalRemoveBtn.on("click", function (e){

        var rno = modal.data("rno");

        console.log("RNO: " + rno);
        console.log("REPLYER: " + replyer);

        if(!replyer){
            alert("로그인후 삭제가 가능합니다.");
            modal.modal("hide");
            return;
        }

        var originalReplyer = modalInputReplyer.val();

        console.log("Original Replyer: " + originalReplyer);

        if(replyer  != originalReplyer){

            alert("자신이 작성한 댓글만 삭제가 가능합니다.");
            modal.modal("hide");
            return;

        }

        replyService.remove(rno, originalReplyer, function(result){

            alert(result);
            modal.modal("hide");
            showList(pageNum);

        });

    });

   $(".chat").on("click", "li", function(e){

     var rno = $(this).data("rno");

     replyService.get(rno, function(reply){

       modalInputReply.val(reply.reply);
       modalInputReplyer.val(reply.replyer);
       modalInputReplyDate.val(replyService.displayTime( reply.replydate))
       .attr("readonly","readonly");
       modal.data("rno", reply.rno);

       modal.find("button[id !='modalCloseBtn']").hide();
       modalModBtn.show();
       modalRemoveBtn.show();

       $(".modal").modal("show");

     });
   });


   var pageNum = 1;
   var replyPageFooter = $(".panel-footer");

   function showReplyPage(replyCnt){

     var endNum = Math.ceil(pageNum / 10.0) * 10;
     var startNum = endNum - 9;

     var prev = startNum != 1;
     var next = false;

     if(endNum * 10 >= replyCnt){
       endNum = Math.ceil(replyCnt/10.0);
     }

     if(endNum * 10 < replyCnt){
       next = true;
     }

     var str = "<ul class='pagination pull-right'>";

     if(prev){
       str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
     }

     for(var i = startNum ; i <= endNum; i++){

       var active = pageNum == i? "active":"";

       str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
     }

     if(next){
       str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
     }

     str += "</ul></div>";

     console.log(str);

     replyPageFooter.html(str);
   }

    replyPageFooter.on("click","li a", function(e){
          e.preventDefault();
          console.log("page click");

          var targetPageNum = $(this).attr("href");

          console.log("targetPageNum: " + targetPageNum);

          pageNum = targetPageNum;

          showList(pageNum);
        });

    var replyer = null;

    <sec:authorize access="isAuthenticated()">

    replyer = '<sec:authentication property="principal.username"/>';

    </sec:authorize>


    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });


    modalModBtn.on("click", function(e){

        var originalReplyer = modalInputReplyer.val();

        var reply = {rno:modal.data("rno"),
                    reply: modalInputReply.val(),
                    replyer:originalReplyer};

        if(!replyer){
            alert("로그인후 수정이 가능합니다.");
            modal.modal("hide");
            return;
        }

        console.log("Original Replyer: " + originalReplyer);

        if(replyer  != originalReplyer){

            alert("자신이 작성한 댓글만 수정이 가능합니다.");
            modal.modal("hide");
            return;

        }

        replyService.update(reply, function(result){

            alert(result);
            modal.modal("hide");
            showList(pageNum);

        });

    });


  var operForm = $("#operForm");

  $("button[data-oper='modify']").on("click", function(e){

    operForm.attr("action","/board/modify").submit();

  });

  $("button[data-oper='list']").on("click", function(e){

    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();

  });

  //   $("button[data-oper='list']").on("click", function(e){
  //    alert("123");
  // });


    // $("#like").on("click", function(e){
    //
    //     alert("123");
    //
    // });

});
</script>

<script>
    $(document).ready(function(){

        var tableName = $('[name="tableName"]').attr("value");

        showCurrentBoard();

        console.log("table Name : " + tableName);

        function navBarColorChange(boardName){
            console.log("board name : "+boardName);
            var nav_bar = document.getElementById(boardName);
            nav_bar.style.textDecoration="underline";
            nav_bar.style.color="orange"
        }

        function showCurrentBoard(){
            if (tableName === "자유게시판"){
                navBarColorChange("freeBoard");
            }else if (tableName === "유머게시판"){
                navBarColorChange("humorBoard");
            }else {
                navBarColorChange("noticeBoard");
            }
        }




        (function () {
            var bno = '<c:out value="${board.bno}" />';

            $.getJSON("/board/getAttachList", {bno: bno}, function(arr){

                console.log(arr);

                var str = "";

                $(arr).each(function(i, attach){

                    //image type
                    if(attach.fileType){
                        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<img src='/display?fileName="+fileCallPath+"'>";
                        str += "</div>";
                        str +"</li>";
                    }else{

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<span> "+ attach.fileName+"</span><br/>";
                        str += "<img src='/resources/img/attach.png'></a>";
                        str += "</div>";
                        str +"</li>";
                    }
                });

                $(".uploadResult ul").html(str);


            });//end getjson
        })();

        $(".uploadResult").on("click","li", function(e){

            console.log("view image");

            var liObj = $(this);

            var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));

            if(liObj.data("type")){
                showImage(path.replace(new RegExp(/\\/g),"/"));
            }else {
                //download
                self.location ="/download?fileName="+path
            }


        });

        function showImage(fileCallPath){

            alert(fileCallPath);

            $(".bigPictureWrapper").css("display","flex").show();

            $(".bigPicture")
                .html("<img src='/display?fileName="+fileCallPath+"' >")
                .animate({width:'100%', height: '100%'}, 1000);
        }

        $(".bigPictureWrapper").on("click", function(e){
            $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
            setTimeout(function(){
                $('.bigPictureWrapper').hide();
            }, 1000);
        });

    })
</script>


<script>


</script>

<%@include file="../includes/footer.jsp"%>
