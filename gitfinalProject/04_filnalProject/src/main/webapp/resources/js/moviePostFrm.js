$(".stillCutBarBtn").on("click",function(){
    $(".current-img").show();
    $(".postRightSideSel>video").hide();
    $(".stillCut").css("display","block");
    $(".previewCut").css("display","none");
    $(".myphotoCut").css("display","none");
});

$(".proviewBarBtn").on("click",function(){
    $(".current-img").hide();
    $(".postRightSideSel>video").show();
    $(".previewCut").css("display","block");
    $(".stillCut").css("display","none");
    $(".myphotoCut").css("display","none");
});
$(".myPhotoBtn").on("click",function(){
    $(".current-img").hide();
    $(".postRightSideSel>video").hide();
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

/*파일번호 넘겨주기 위함*/ 
$(".stillCutImg").on("click",function(){
    const movieFileNo=$(this).next().val();
   $("[name=movieFileNo]").val(movieFileNo);

  
});
/*비디오 번호 넘겨주기 위함*/ 
$(".previewCutVideo").on("click",function(){
    const movieVideoNo=$(this).next().val();
    console.log(movieVideoNo);
    $("[name=movieVideoNo]").val(movieVideoNo);
  
});

/* 등록버튼 눌렀을때 */
$(".postEnrolltBtn").on("click",function(){
    const movieFileNo=$("[name=movieFileNo]").val();
    const movieVideoNo=$("[name=movieVideoNo]").val();
    if(movieFileNo == ""  && movieVideoNo != "" ){
        $("[name=movieFileNo]").remove();
    }else if(movieVideoNo == "" && movieFileNo != ""){
        $("[name=movieVideoNo]").remove();
    }else if(movieVideoNo == "" && movieFileNo == ""){
        return false;
    }

});




window.addEventListener("load",function(){

    var section=this.document.querySelector(".moviePostSideAll");

    $(".previewCutVideo").on("click",function(){
        const video = $(this).clone().css("width","400px").css("height","252px");
        $(".postRightSideSel>video").remove();
        $(".postRightSideSel").append(video);
        
        

    });
   
});