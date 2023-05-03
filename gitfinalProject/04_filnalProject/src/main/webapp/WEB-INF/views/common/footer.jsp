<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id="mega_footer">
    <div class="wrap ft_color">
        <div class="footer_logo">
            <h2 class="bold">
                <a href="#">MovieIsland</a>
                <span>1544-0070</span><span class="ars">ARS</span>
            </h2>
        </div>
        <ul class="footer_menu">
            <li class="footer_company">회사소개</li>
            <li>채용정보</li>
            <li>제휴/광고/부대사업 문의</li>
            <li>이용약관</li>
            <li>개인정보 처리방침</li>
            <li>고객센터</li>
            <li>윤리경영</li>
        </ul>
        <div class="text1">
        서울 영등포구 선유동2로 57 이레빌딩 19F <br>
        대표자명 이민호 | 개인정보보호 책임자 경영지원실 실장 신혜진 <br>
        사업자등록번호 211-86-59478 | 통신판매업신고번호 제 833호    
        </div>
        <div class="logo_copy">
            <ul class="clearfix">
                <li><a href="#">twiter</a></li>
                <li><a href="#">facebook</a></li>
                <li><a href="#">instargram</a></li>
                <li><a href="#">google play</a></li>
                <li><a href="#">apple</a></li>
            </ul>
        </div>
        <!--logo copy-->
    </div>
    <!--wrap-->
    <script>
    	$(".menu a").on("click",function(){
    		const noClick = $(".sub-menu").prev();
    		$(".menu a").removeClass("on");
    		$(this).addClass("on");
    		if(noClick.hasClass("on")){
    			$(this).removeClass("on");
    			$(this).next().children().eq(0).children().eq(0).addClass("on");
    		}
    		
    	});
    </script>
</footer>
</body>
</html>

    