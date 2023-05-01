$(function(){
    $(".movie-list-set").slice(0, 8).show(); // 최초 8개 선택
    $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
    e.preventDefault();
    $(".movie-list-set:hidden").slice(0, 8).show(); // 숨김 설정된 다음 4개를 선택하여 표시
    if($(".movie-list-set:hidden").length == 0){ // 숨겨진 .moviePostImg가 있는지 체크
    alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
    }
    });
    });

$(".tabs>li").on("click",function(){
    $(".tabs>li").removeClass("active-tab");
    $(this).addClass("active-tab");
    
    const contents = $(".tabcontent");
    contents.hide();

    const span =$(".tabcontent1");
    span.hide();


    //요소배열.index(요소)요소배열중 요소가 몇번째인지 찾아줌
    const index = $(".tabs>li").index(this);
    contents.eq(index).show();
    span.eq(index).show();
});
$(".tabs>li").eq(0).click();

