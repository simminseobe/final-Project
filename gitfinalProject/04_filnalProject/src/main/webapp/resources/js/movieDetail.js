
const moreBtn = document.querySelector("#more-btn");
moreBtn.addEventListener("click",function(){
    const importantInfoContent = document.querySelector(".importantInfo-content");
    importantInfoContent.style.height = "auto";
    this.remove();
});
/*별점표시*/
const stars = $(".modal>.modal_content>form>.star-wrap1>span");
stars.on("mouseover",function(){
    //별의 최초의 색상을 회색으로 해놓음
    //그래야 마우스를 치웠을때 회색으로 바뀜
    stars.css("color","lightgray");
    //인덱스를 구해서 마우스를 올린데만 색칠함
    const index = stars.index(this);
    for(let i =0; i<=index;i++){//마우스 올린 곳까지 색칠해야 하므로 <=
        stars.eq(i).css("color","gold");
    }
    $(".modalStar-result>#star-result").text(index+1);
    $(".modalStar-result>#star-result2").val(index+1);
});

/*모달수정 별점표시*/ 
const stars2 = $(".modal2>.modal_content2>form>.star-wrap1>span");
stars2.on("mouseover",function(){
    //별의 최초의 색상을 회색으로 해놓음
    //그래야 마우스를 치웠을때 회색으로 바뀜
    stars2.css("color","lightgray");
    //인덱스를 구해서 마우스를 올린데만 색칠함
    const index = stars2.index(this);
    for(let i =0; i<=index;i++){//마우스 올린 곳까지 색칠해야 하므로 <=
        stars2.eq(i).css("color","gold");
    }
    $(".modalStar-result2>#star-result4").text(index+1);
    $(".modalStar-result2>#star-result3").val(index+1);
});


$(function(){
    $(".moviePostImg").slice(0, 8).show(); // 최초 8개 선택
    $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
    e.preventDefault();
    $(".moviePostImg:hidden").slice(0, 8).show(); // 숨김 설정된 다음 4개를 선택하여 표시
    if($(".moviePostImg:hidden").length == 0){ // 숨겨진 .moviePostImg가 있는지 체크
    alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
    }
    });
    });

 $(".tabs>li").on("click", function(){
    $(".tabs>li").removeClass("active-tab");
    $(this).addClass("active-tab");
    const contents = $(".tabcontent");
    contents.hide();
    const index = $(".tabs>li").index(this);
    contents.eq(index).show();

 });
 $(".tabs>li").eq(0).click();




   
 $(".whiteLike").on("click",function(){
    const whiteLike = "img/like-24.png";
    const blackLike = "img/likeBlack-24.png";
    const current  = $(this).attr("src");
    if(current == whiteLike){
        $(this).attr("src",blackLike); 
        
    }else{
        $(this).attr("src",whiteLike);        
       
    }
});

$(".whiteLike2").on("click",function(){
    const whiteLike = "img/like-24.png";
    const blackLike = "img/likeBlack-24.png";
    const current  = $(this).attr("src");
    
    const reviewCommentNo=$("[name=reviewLikeReviewCommentNo]").val();
    const memberId=$("[name=reviewLikeMember]").val();
    
    if(current == whiteLike){
        $(this).attr("src",blackLike); 
     	/*$.ajax({
       		url : "/reviewLikeInsert.do",
       		type : "post",
       		data : {reviewCommentNo:reviewCommentNo,memberId:memberId}
       		success : function(data) {
				console.log(data+"성공");
			}
       	});//ajax끝*/
       
    }else{
        $(this).attr("src",whiteLike);        
       
    }
});


