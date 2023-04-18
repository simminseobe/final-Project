/**
 * 
 */
 
 $(".tabs>li").on("click", function() {
    $(".tabs>li").removeClass("active-tab");
    $(this).addClass("active-tab");
    const content = $(".tab-content");
    content.hide();

    const index = $(".tabs>li").index(this);
    content.eq(index).show();
});

$(".tabs>li").eq(0).click();