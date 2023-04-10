/**
 * 
 */

function fileUpload() {
    const fileInput = $("#profile-file");
    fileInput.click();
}

$("#cancelBtn").on("click", function() {
    location.href="/";
});