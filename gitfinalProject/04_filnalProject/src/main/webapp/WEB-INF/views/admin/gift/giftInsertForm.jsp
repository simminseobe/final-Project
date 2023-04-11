<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />
<div id="layoutSidenav">
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
<div id="admin-main-content">
    <h2 class="mb">메가 상품 등록</h2>
    <form action="/insertGift.do" method="post" enctype="multipart/form-data">
        <div class="input-form">
        <table id="giftInsertTable">
            <tr>
                <th>
                    상품 카테고리
                </th>
                <td>
                    <select name="pcNo" id="productCategory1" class="product-select">
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.pcNo}">${category.pcCategory}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    상품 명
                </th>
                <td>
                    <input type="text" name="productName">
                </td>
            </tr>
            <tr>
                <th>
                    상품가격
                </th>
                <td>
                    <input type="text" name="productPrice">
                </td>
            </tr>
            <tr>
                <th>
                    등록상태
                </th>
                <td>
                    <select name="productStatus" id="" class="product-select">
                        <option value="1">판매중</option>
                        <option value="2">상품준비중</option>
                        <option value="3">품절</option>
                        <option value="4">판매중지</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    배송
                </th>
                <td>
                    <select name="shipping" id="">
                        <option value="0">무료배송</option>
                        <option value="3000">3000 원</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <th>상품제조사</th>
                <!-- db에서 select 예정 -->
                <td>
                    <select name="productCompany">
                        <option value="SLAMDUNK">슬램덩크</option>
                        <option value="MARVLE">마블</option>
                        <option value="한국영화사">한국영화사</option>
                        <option value="guiter">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">상품상세설명</td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="productDetail" id="" cols="30" rows="10"></textarea>
                </td>
            </tr>
            <tr>
                <th>상품이미지업로드</th>
                <td><input type="file" name="imageFile" accept=".jpg,.png,.jpeg" onchange="loadImg(this)" multiple></td>
            </tr>
            <tr class="tr-1">
                <th class="td-2">이미지 미리보기</th>
                <td id="imgTd"></td>
            </tr>
        </table>
    </div>
    </form>


</div>
</div>

<script type="text/javascript">
    function loadImg(file) {
        //첨부파일이 여러 개 일 수 있어서 배열로 처리 됨
        //console.log(file.files);
        //파일 개수가 0개가 아니고 && 첫 파일이 정상 파일이면
        for(let i=0; i<file.files.length; i++) {
            if(file.files[i] != 0) {
                const fileReader = new FileReader();
                //선택한 파일 정보를 읽어 옴
                fileReader.readAsDataURL(file.files[i]);
                //파일 리더가 정보를 다 읽어오면 동작할 함수 (e 매개변수에 읽은 파일 정보 있음)
                fileReader.onload = function(e) {
                    const imgTd = $("#imgTd")
                    const divImg = $("<div>").addClass("img-viewer")
                    const img = $("<img>").css("width","200px").attr("src",e.target.result)
                    divImg.append(img)
                    imgTd.append(divImg)
                }
            }else {
                console.log(1)
            }
        }
        
    }
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />