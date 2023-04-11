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


   	function loadImg(file){
   		//일단 다 비우고시작
        //첨부파일이 여러 개 일 수 있어서 배열로 처리 됨
        console.log(file.files)
        //파일 개수가 0개가 아니고 && 첫 파일이 정상 파일이면
        
        if(file.files.length != 0 && file.files[0] != 0) {
            const fileReader = new FileReader();
            //선택한 파일 정보를 읽어 옴
            fileReader.readAsDataURL(file.files[0]);
            //파일 리더가 정보를 다 읽어오면 동작할 함수 (e 매개변수에 읽은 파일 정보 있음)
            fileReader.onload = function(e) {
                const testImg = $("#testImg");
                testImg.attr("src",e.target.result);
        	}
        }
   	}