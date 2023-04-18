$(".stillCutBarBtn").on("click",function(){
    $(".stillCut").css("display","block");
    $(".previewCut").css("display","none");
    $(".myphotoCut").css("display","none");
});

$(".proviewBarBtn").on("click",function(){
    $(".previewCut").css("display","block");
    $(".stillCut").css("display","none");
    $(".myphotoCut").css("display","none");
});
$(".myPhotoBtn").on("click",function(){
    $(".previewCut").css("display","none");
    $(".stillCut").css("display","none");
    $(".myphotoCut").css("display","block");
});