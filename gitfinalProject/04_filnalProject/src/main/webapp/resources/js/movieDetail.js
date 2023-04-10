
const moreBtn = document.querySelector("#more-btn");
moreBtn.addEventListener("click",function(){
    const importantInfoContent = document.querySelector(".importantInfo-content");
    importantInfoContent.style.height = "auto";
    this.remove();
});
