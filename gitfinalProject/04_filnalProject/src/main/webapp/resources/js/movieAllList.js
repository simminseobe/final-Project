const moreBtn = document.querySelector("#more-btn");
moreBtn.addEventListener("click",function(){
    const activeMovieMore = document.querySelector(".active-movie-more");
    activeMovieMore.style.height = "auto";
    this.remove();
});