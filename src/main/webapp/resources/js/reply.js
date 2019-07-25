console.log("Reply Module");

var replyService= (function(){

    function add(reply, callback, error) {
        console.log("add reply...............");

        $.ajax({
            type : 'post',
            url : '/replies/new',
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }

    function likeadd(like_info, callback,error){
    	console.log("like add ");

    	$.ajax({
			type:'post',
			url : '/like/new',
			data : JSON.stringify(like_info),
			contentType:"application/json; charset=utf-8",
			success : function (results, status, xhr) {
				if (callback){
					callback(results);
				}
			},
			error : function (xhr, status, er) {
				if (error){
					error(er);
				}
			}
		})
	}

    function getLikeCount(bno, callback, error){
    	$.getJSON("/like/"+bno,
			function (data) {
				// if (callback()){
					callback(data.total);
				// }
		}).fail(function (xhr, status, err) {
			if (error){
				error();
			}
		})

	}

	function checkLikeDuplicate(like_info, callback, error) {

    	$.getJSON("/like/"+ like_info.bno + "/" + like_info.userid,
			function (data) {
				if (callback){
					callback(data.total);
				}
			}).fail(function (xhr, status, err) {
			if (error){
				error();
			}
		})

	}

	function getList(param, callback, error) {

		var bno = param.bno;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + bno + "/" + page,
			function(data) {
				if (callback) {
					//callback(data); // 댓글 목록만 가져오는 경우
					callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
				}
			}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function cancelLikeButton(like_info, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/like/' + like_info.bno + "/" + like_info.userid,
			data:  JSON.stringify(like_info),
			contentType: "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {

				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(rno, replyer, callback, error) {

		console.log("--------------------------------------");
		console.log(JSON.stringify({rno:rno, replyer:replyer}));

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,

			data:  JSON.stringify({rno:rno, replyer:replyer}),

			contentType: "application/json; charset=utf-8",

			success : function(deleteResult, status, xhr) {

				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(reply, callback, error) {

		console.log("RNO: " + reply.rno);

		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

    function get(rno, callback, error) {

    		$.get("/replies/" + rno, function(result) {

    			if (callback) {
    				callback(result);
    			}

    		}).fail(function(xhr, status, err) {
    			if (error) {
    				error();
    			}
    		});
    	}

	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);

		console.log(timeValue);

		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
	};

    // function modfiyLike(like_info){
	//
    // 	console.log("Like bno ; "+like_info.bno);
	//
    // 	$.ajax({
	// 		type:'post',
	// 		url : "/like/"+like_info.bno,
	// 		data : JSON.stringify(like_info),
	// 		contentType:"application/json; charset=utf-8",
	// 		success :function (){
	// 			recCount(like_info.bno);
	// 		},
	// 		error : function(xhr, status, er) {
	// 			if (error) {
	// 				error(er);
	// 			}
	// 		}
	// 	})
	// }

	function recCount(bno) {
		$.get("/like/" + bno , function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};

	return {add:add,
			likeadd : likeadd,
			cancelLikeButton : cancelLikeButton,
			checkLikeDuplicate : checkLikeDuplicate,
            getList:getList,
            remove:remove,
            update:update,
            get:get,
            displayTime:displayTime,
			getLikeCount:getLikeCount
            };
})();