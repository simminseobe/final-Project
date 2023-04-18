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


window.addEventListener("load",function(){
    var section=this.document.querySelector(".moviePostSideAll");

    var imgs=section.querySelectorAll(".stillCutImg");
    var currentImg=section.querySelector(".current-img");

    for(var i=0; i<imgs.length;i++){
        imgs[i].onclick=function(e){
            currentImg.src=e.target.src;
        }
    }

});