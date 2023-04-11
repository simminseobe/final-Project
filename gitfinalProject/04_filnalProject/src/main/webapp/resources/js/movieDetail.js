
const moreBtn = document.querySelector("#more-btn");
moreBtn.addEventListener("click",function(){
    const importantInfoContent = document.querySelector(".importantInfo-content");
    importantInfoContent.style.height = "auto";
    this.remove();
});
/*별점표시*/
const stars = $(".modal>.modal_content>.star-wrap1>span");
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