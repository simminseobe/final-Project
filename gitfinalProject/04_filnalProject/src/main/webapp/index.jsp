<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <!doctype html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="cs2" onclick="allMenuClose();"></div>
<div id="all_menu" class="menu_all">
        <div class="menus clearfix">
            <div class="cols cols1">
                <dl>
                    <dt>예매</dt>
                    <dd>예매 안내</dd>
                    <dd><a href="/ticketing.do" style="color:#000000;">빠른 예매</a></dd>
                    <dd>상영시간표</dd>
                    <dd>예매 확인/취소</dd>
                    <dd>더 부티크 프라이빗 예매</dd>
                </dl>
                <dl>
                    <dt><a href="mega_movie.html">영화</a></dt>
                    <dd>박스오피스</dd>
                    <dd>최신개봉작</dd>
                    <dd>상영예정작</dd>
                    <dd>영화제</dd>
                    <dd>보고 싶은 영화</dd>
                    <dd>나의 무비스토리</dd>
                    <dd>무비포스트</dd>
                </dl>
            </div>
            <div class="cols cols2">
                <dl>
                    <dt>큐레이션</dt>
                    <dd>필름 소사이어티</dd>
                    <dd>클래식 소사이어티</dd>
                    <dd>프로젝트</dd>
                </dl>
                <dl>
                    <dt>영화관</dt>
                    <dd>영화관찾기</dd>
                    <dd>특별관 안내</dd>
                </dl>
                <dl>
                    <dt><a href="/allGiftList.do">스토어</a></dt>
                    <dd>메가티켓</dd>
                    <dd>메가찬스</dd>
                    <dd>스페셜굿즈/콤보</dd>
                </dl>
                <dl>
                    <dt>할인카드</dt>
                    <dd>할인 신용카드</dd>
                    <dd>할인 포인트카드</dd>
                    <dd>관람권/상품권</dd>
                </dl>
            </div>
            <div class="cols cols3">
                <dl>
                    <dt>이벤트</dt>
                    <dd>메가박스 이벤트</dd>
                    <dd>영화이벤트</dd>
                    <dd>제휴이벤트</dd>
                    <dd>영화관이벤트</dd>
                </dl>
                <dl>
                    <dt>멤버십</dt>
                    <dd>멤버십 안내</dd>
                    <dd>멤버십 카드 등록</dd>
                    <dd>VIP ZONE</dd>
                    <dd>스페셜 멤버십</dd>
                </dl>
                <dl>
                    <dt>나의 메가박스</dt>
                    <dd>멤버십 정보</dd>
                    <dd>예메 확인/취소</dd>
                    <dd>스토어 구매내역</dd>
                    <dd>나의 무비스토리</dd>
                    <dd>관람권/VIP쿠폰</dd>
                    <dd>회원정보수정</dd>
                    <dd>나의 문의 내역</dd>
                </dl>
            </div>
            <div class="cols cols4">
                <dl>
                    <dt>고객센터</dt>
                    <dd>자주 묻는 질문</dd>
                    <dd>공지사항</dd>
                    <dd>1:1 문의</dd>
                    <dd>단체관람/대관문의</dd>
                    <dd>분실물 문의/접수</dd>
                    <dd>메가박스 온라인 소개</dd>
                    <dd>스크린 수 배정에 관한 기준</dd>
                </dl>
                <dl>
                    <dt>회원서비스</dt>
                    <dd>회원가입</dd>
                    <dd>아이디/비밀번호 찾기</dd>
                    <dd>휴먼계정 복구신청</dd>
                    <dd>이용약관</dd>
                    <dd>개인정보 처리방침</dd>
                    <dd>회원 탈퇴</dd>
                </dl>
            </div>
            <div class="cols cols5 last">
            <dl>
                <dt>회사 소개</dt>
                <dd>메가박스 소개</dd>
                <dd>사회공헌</dd>
                <dd>홍보자료</dd>
                <dd>제휴/광고/부대사업문의</dd>
                <dd>온라인제보센터</dd>
                <dd>오시는 길</dd>
                <dd>IR자료</dd>
            </dl>
            <dl>
                <dt>인재 채용</dt>
                <dd>메가박스 HR</dd>
                <dd>채용안내</dd>
                <dd>Benefit</dd>
            </dl>
            <a href="#">고객만족도 조사<div>설문참여하기</div></a>
        </div>
    </div>
    <button type="button" onclick="allMenuClose();"></button>
</div>
<section id="banner">
    <h2 class="screen_out">상영 영화</h2>
    <nav class="banner_menu wrap clearfix">
        <div class="left">
            <button type="button" onclick="
                menuAll();
            ">전체메뉴</button>
            <ul>
            <li><a href="#">필름 소사이어티</a></li>
            <li><a href="#">클래식 소사이어티</a></li>
            </ul>
        </div>
        <div class="right">
            <ul>
	            <c:if test="${not empty sessionScope.m}">
	            	<li><a href="/adminCenter.do">고객센터</a></li>
	            </c:if>
                <c:choose>
                	<c:when test="${sessionScope.m.memberLevel eq 1}">
	                	<li><a href="/mypage.do">마이페이지</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberLevel eq 2}">
	                	<li><a href="/mypage.do">마이페이지</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberLevel eq 3}">
	                	<li><a href="/mypage.do">마이페이지</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberLevel eq 2 }">
	                	<li><a href="/mypage.do">마이페이지</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberLevel eq 3 }">
	                	<li><a href="/mypage.do">마이페이지</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberLevel eq 0 }">
                		<li><a href="/adminPage.do">관리자페이지</a>
                	</c:when>
                </c:choose>
            </ul>
            <button type="button" onclick="alert('준비중입니다.')">상영시간표</button>
            <button type="button" onclick="qTicketing();">빠른예매</button>
        </div>
    </nav>
    <div id="banner_wrap">
        <input type="radio" name="banner_radio" id="visual_banner1" checked>
        <input type="radio" name="banner_radio" id="visual_banner2">
        <input type="radio" name="banner_radio" id="visual_banner3">
        <ol class="visual">
            <li>
                <article>
                   <div class="banner_text">
                    <div>MovieIsland 오리지널 티켓</div>
                    <h2>&lt;이벤트&gt;을 잘 받는 방법</h2>
                    <div>5월 10일 (수) 멤버십 대상 한정수량 배포</div>
                    </div>
                </article>
            </li>
            <li>
                <article>
                   <div class="banner_text">
                    <div></div>
                    <h2 class="screen_out">북토크 in 시네마</h2>
                    <div></div>
                    </div>
                </article>
            </li>
            <li>
                <article>
                   <div class="banner_text">
                    <div></div>
                    <h2 class="screen_out">영화 대 영화</h2>
                    <div></div>
                    </div>
                </article>
            </li>
            </ol>
        <div class="visual_btns1">
            <label for="visual_banner1" class="visual_label1">1</label>
            <label for="visual_banner2" class="visual_label2">2</label>
            <label for="visual_banner3" class="visual_label3">3</label>
        </div>
        <div class="visual_btns2">
            <label for="visual_banner1" class="visual_label2_1">1</label>
            <label for="visual_banner2" class="visual_label2_2">2</label>
            <label for="visual_banner3" class="visual_label2_3">3</label>
        </div>
    </div>
</section>

<section id="movies">
    <h2 class="screen_out">영화정보</h2>
       <input type="radio" name="movie_radio" id="kategorie1" checked>
       <input type="radio" name="movie_radio" id="kategorie2">
       <input type="radio" name="movie_radio" id="kategorie3">
       <input type="radio" name="movie_radio" id="kategorie4">
    <dl class="wrap">
       <!--<div>전체보기</div> 추가 예정-->
       <dt>
       <label for="kategorie1" class="movie_label1">박스오피스</label>
       </dt>
       <dd>
           <div class="box_office">
               <ul class="clearfix">
                   <li>
                       <div class="thumb_movie1"></div>
                       <div class="info_movies">
                           <h3><span class="age_all"></span> <a href="#">슈퍼 마리오 브라..</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie2"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">드림</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie3"></div>
                       <div class="info_movies">
                           <h3><span class="age_19"></span> <a href="#">존윅4</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie4"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">스즈메의 문단속</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
               </ul>
           </div>
       </dd>
       <dt>
       <label for="kategorie2" class="movie_label2">최신개봉작</label>
       </dt>
       <dd>
           <div class="latest_release">
               <ul class="clearfix">
                   <li>
                       <div class="thumb_movie1"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">클로즈</a></h3>
                           <a href="#" onclick="alert('준비중입니다.')">상세정보</a>
                           <a href="#" onclick="alert('준비중입니다.')">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie2"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">리바운드</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie3"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">던전 앤 드래곤</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie4"></div>
                       <div class="info_movies">
                           <h3><span class="age_15"></span> <a href="#">분노의 질주: 라..</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
               </ul>
           </div>
       </dd>
       <dt>
       <label for="kategorie3" class="movie_label3">상영예정작</label>
       </dt>
       <dd>
           <div class="future_works">
               <ul>
                   <li>
                       <div class="thumb_movie1"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">가디언즈 오브 갤..</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie2"></div>
                       <div class="info_movies">
                           <h3><span class="age_all"></span> <a href="#">극장판 짱구는...</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie3"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">유량지구</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie4"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">롱디</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
               </ul>
           </div>
       </dd>
       <dt>
       <label for="kategorie4" class="movie_label4">큐레이션</label>
       </dt>
       <dd>
           <div class="curation">
               <ul>
                   <li>
                       <div class="thumb_movie1"></div>
                       <div class="info_movies">
                           <h3><span class="age_15"></span> <a href="#">무명</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie2"></div>
                       <div class="info_movies">
                           <h3><span class="age_all"></span> <a href="#">&#91;로열 발레&#93;신데렐..</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                        <div class="thumb_movie3"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">&#91;시네 마인드 런&#91;돈..</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
                   <li>
                       <div class="thumb_movie4"></div>
                       <div class="info_movies">
                           <h3><span class="age_12"></span> <a href="#">&#91;시네도슨트-그리..&#91;</a></h3>
                           <a href="#">상세정보</a>
                           <a href="#">예매하기</a>
                       </div>
                   </li>
               </ul>
           </div>
       </dd>
    </dl>
</section>

<section id="mega_event">
    <div class="wrap clearfix">
    <h2 class="bold">새로운 이벤트</h2>
        <article class="event_left">
        <h3 class="screen_out">이벤트</h3>
            <input type="radio" name="mega_event" id="mega_event1" checked>
            <input type="radio" name="mega_event" id="mega_event2">
            <input type="radio" name="mega_event" id="mega_event3">
            <input type="radio" name="mega_event" id="mega_event4">
            <input type="radio" name="mega_event" id="mega_event5">
            <div class="btn_event_slide">
                <label for="mega_event1" class="mega_label_1">btn</label>
                <label for="mega_event2" class="mega_label_2">btn</label>
                <label for="mega_event3" class="mega_label_3">btn</label>
                <label for="mega_event4" class="mega_label_4">btn</label>
                <label for="mega_event5" class="mega_label_5">btn</label>
            </div>
            <ul class="slide_event_page">
                <li class="now_event1">event image</li>
                <li class="now_event2">event image</li>
                <li class="now_event3">event image</li>
                <li class="now_event4">event image</li>
                <li class="now_event5">event image</li>
            </ul>
            <div class="post_event_page">
                <ul>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </article>
        <article class="event_right">
           <h3 class="screen_out">이벤트</h3>
            <div class="event_right_pt">event image</div>
        </article>
    </div>
</section>

<section id="mega_local">
    <div class="wrap">
        <h2 class="screen_out">메가박스 지점소식</h2>
        <div class="mega_point_event clearfix">
            <a href="#" class="local_slide clearfix">
                <div class="local_shop_event">지점 이벤트</div>
                <div class="local">강남</div>
                <div class="shop">강남대로(씨티)</div>
                <div class="event">#오픈 3주년 기념 #다드려요</div>
            </a>
            <a href="#" class="local_slide">
                <div class="local_shop_event">지점 이벤트</div>
                <div class="local">경기</div>
                <div class="shop">고양스타필드</div>
                <div class="event">#오픈 2주년 #야구팬분들주목!</div>
            </a>
            <a href="#" class="local_slide">
                <div class="local_shop_event">지점 이벤트</div>
                <div class="local">광주</div>
                <div class="shop">순천</div>
                <div class="event">#방학맞이 #저세상할인이벤트</div>
            </a>
        </div>
    </div>
</section>

<section id="mega_alliance">
    <div class="wrap clearfix">
        <h2 class="bold">제휴 이벤트</h2>
        <article class="alliance_event_left">
           <h3 class="screen_out">notice</h3>
            <div class="alliance_post_images">
                <ul class="clearfix">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </article>
        <article class="alliance_event_right">
           <h3 class="screen_out">notice</h3>
            <div class="alliance_long_images">
                <div class="static_long"></div>
            </div>
        </article>
    </div>
</section>

<section id="customer_service">
    <div class="wrap clearfix">
        <div class="notice">
            <h2 class="bold">공지사항</h2>
            <!--h2-->
            <input type="radio" name="notice_radio" id="all_notice_radio" checked>
            <input type="radio" name="notice_radio" id="cine_notice_radio">
            <!--radio-->
            <div class="notice_label">
            <label for="all_notice_radio" class="label_notice01">전체공지</label>
            <label for="cine_notice_radio" class="label_notice02">영화관 공지</label>
            </div>
            <!--label-->
            <article class="mega_notice">
                <div class="notice_01">
                    <h3><span>전체</span><span>2023.05.03</span></h3>
                    <span>&#91;공지&#93; 시스템 점검 안내</span>
                </div>
                <div class="notice_02">
                    <h3><span>전체</span><span>2023.05.03</span></h3>
                    <span>&#91;당첨안내&#93;&lt;'스즈메의 문단속' 개봉 기념 선물&gt;...</span>
                </div>
                <div class="notice_03">
                    <h3><span>전체</span><span>2023.05.03</span></h3>
                    <span>&#91;무대인사&#93;&lt;사자&gt; 2주차 (4/25~5/3...</span>
                </div>
                <div class="notice_04">
                    <h3><span>전체</span><span>2023.05.03</span></h3>
                    <span>&#91;무대인사&#93;&lt;엑시트&gt; 1주차 (4/10~5/1...</span>
                </div>
            </article>
            <!--notice_all-->
            <article class="cine_notice">
                <div class="notice_01">
                    <h3><span>동대문</span><span>2023.04.28</span></h3>
                    <span>&#91;동대문&#93; 무비올나잇패키지 재 오픈 안내</span>
                </div>
                <div class="notice_02">
                    <h3><span>강남대로(씨티)</span><span>2023.05.01</span></h3>
                    <span>&#91;강남대로(씨티)&#93;&lt;관람요금 조정 안내&gt;...</span>
                </div>
                <div class="notice_03">
                    <h3><span>상봉</span><span>2023.04.01</span></h3>
                    <span>&#91;상봉&#93;기계식 주차 타워 점검 안내</span>
                </div>
                <div class="notice_04">
                    <h3><span>상암</span><span>2023.04.28</span></h3>
                    <span>&#91;상암월드컵경기장&#93;K-리그 경기에 따른 주차...</span>
                </div>
            </article>
            <!--notice_cine-->
        </div>
        <!--notice-->
        <div class="discount">
            <h2 class="bold">메가박스 할인카드</h2>
            <div class="card">
                <div class="card_pt cd1"></div>
                <div class="card_info info_cd1">
                    <div>T멤버십 일반</div>
                    <div>영화2,000원 할인<br>(1일5매)</div>
                </div>
                <div class="card_pt cd2"></div>
                <div class="card_info info_cd1">
                    <div>LG U+</div>
                    <div>영화 1,000원 현장 할인<br>(1일 1회 / 월 4회)</div>
                </div>
                <div class="card_pt cd3"></div>
                <div class="card_info info_cd1">
                    <div>중앙멤버십</div>
                    <div>현장할인, 인터넷할인 <br>(연 24회)</div>
                </div>
            </div>
            <!--card-->
        </div>
        <!--discount-->
        <div class="service_center">
            <h2 class="bold">고객센터</h2>
            <div class="sr_img"></div>
        </div>
    </div>
    <!--wrap-->
</section>

<section id="ad_bottom">
    <h2 class="screen_out">광고배너</h2>
    <div class="wrap">
        <div class="ad_bt_img"><div></div></div>
    </div>
</section>

<section id="mega_cinema">
    <div class="wrap clearfix">
        <h2 class="bold">메가박스 영화관 찾기</h2>
        <div class="mega_korea">
            <dl>
                <dt>서울</dt>
                <dd>강남</dd>
                <dd>강남대로(씨티)</dd>
                <dd>강동</dd>
                <dd>군자</dd>
                <dd>동대문</dd>
                <dd>마곡</dd>
                <dd>목동</dd>
                <dd>상봉</dd>
                <dd>상암월드컵경기장</dd>
                <dd>센트럴</dd>
                <dd>송파파크하비오</dd>
                <dd>신촌</dd>
                <dd>은평</dd>
                <dd>이수</dd>
                <dd>창동</dd>
                <dd>코엑스</dd>
                <dd>화곡</dd>
                <dd>ARRNINE</dd>
            </dl><!--서울-->
            <dl>
                <dt>경기</dt>
                <dd>고양스타필드</dd>
                <dd>김포한강신도시</dd>
                <dd>남양주</dd>
                <dd>동탄</dd>
                <dd>미사강변</dd>
                <dd>백석</dd>
                <dd>별내</dd>
                <dd>분당</dd>
                <dd>수원</dd>
                <dd>수원남문</dd>
                <dd>시흥배곧</dd>
                <dd>안산중앙</dd>
                <dd>양주</dd>
                <dd>영통</dd>
                <dd>오산</dd>
                <dd>용인테크노밸리</dd>
                <dd>의정부 민락</dd>
                <dd> 일산</dd>
                <dd>일산벨라시타</dd>
                <dd>킨텍스</dd>
                <dd>파주금촌</dd>
                <dd>파주운정</dd>
                <dd>파주출판도시</dd>
                <dd>평택</dd>
                <dd>하남스타필드</dd>
            </dl><!--경기-->
            <dl>
                <dt>인천</dt>
                <dd>검단</dd>
                <dd>송도</dd>
                <dd>영종</dd>
                <dd>인천논현</dd>
                <dd>청라</dd>
                <dd>청라지젤</dd>
            </dl><!--인천-->
            <dl>
                <dt>대전 | 세종 | 충청</dt>
                <dd>공주</dd>
                <dd>대전</dd>
                <dd>대전중앙로</dd>
                <dd>세종</dd>
                <dd>오창</dd>
                <dd>제천</dd>
                <dd>진천</dd>
                <dd>천안</dd>
                <dd>청주충북대</dd>
                <dd>충주</dd>
                <dd>홍성내포</dd>
            </dl><!--대전-->
            <dl>
                <dt>부산 | 경상</dt>
                <dd>거창</dd>
                <dd>경산하양</dd>
                <dd>경주</dd>
                <dd>구미강동</dd>
                <dd>김천</dd>
                <dd>남포항</dd>
                <dd>대구(칠성로)</dd>
                <dd>대구 신세계</dd>
                <dd>대구 이시아</dd>
                <dd>덕천</dd>
                <dd>마산</dd>
                <dd>문경</dd>
                <dd>부산극장</dd>
                <dd>부산대</dd>
                <dd>북대구(칠곡)</dd>
                <dd>사천</dd>
                <dd>삼천포</dd>
                <dd>양산</dd>
                <dd>양산라피에스타</dd>
                <dd>울산</dd>
                <dd>정관</dd>
                <dd>청원</dd>
                <dd>해운대(장산)</dd>
            </dl><!--부산-->
            <dl>
                <dt>광주 | 전라</dt>
                <dd>광주상무</dd>
                <dd>광주하남</dd>
                <dd>남원</dd>
                <dd>목포</dd>
                <dd>목포하당(포르모)</dd>
                <dd>송천</dd>
                <dd>순천</dd>
                <dd>여수</dd>
                <dd>여수웅천</dd>
                <dd>전대(광주)</dd>
                <dd>전주(객사)</dd>
                <dd>첨단(광주)</dd>
            </dl><!--광주-->
            <dl>
                <dt>강원</dt>
                <dd>남춘천</dd>
                <dd>속초</dd>
                <dd>원주</dd>
                <dd>원주센트럴</dd>
            </dl><!--강원-->
            <dl>
                <dt>제주</dt>
                <dd>제주</dd>
            </dl><!--제주-->
        </div>
        <!--mega korea-->
    </div>
</section>
<script src="/resources/js/common.js"></script>
<script>
	function qTicketing(){
		location.href = "/ticketing.do";
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>