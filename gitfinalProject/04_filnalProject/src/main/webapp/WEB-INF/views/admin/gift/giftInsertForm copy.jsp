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
                <td><input type="file" name="productPhoto" accept=".jpg,.png,.jpeg" onchange="loadImg(this)" multiple></td>
            </tr>
            <tr>
                <th>이미지 미리보기</th>
                <td id="imgTd"></td>
            </tr>
            <tr>
                <th colspan="2"><button type="submit">submit</button></th>
            </tr>
        </table>
    </div>
    </form>

    
    <input type="file" id="file-input" multiple />
    <h3>업로드된 파일</h3>
    <ul id="sortable">
    </ul>


</div>
</div>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
    $(() => {
        $("#sortable").sortable({
            over: (e, ui) => {
                console.log(ui)
            },
            stop: e => {
                const fileInput = document.querySelector('#file-input');
                console.log(2)
            }
        });
        $("#sortable").disableSelection();
    })
    
    function loadImg(file) {
        //일단 다 비우고시작
        document.querySelector('#imgTd').replaceChildren()
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
            }
        }
    }

    // test
    const handler = {
            init() {
                const fileInput = document.querySelector('#file-input');
                const preview = document.querySelector('#sortable');
                fileInput.addEventListener('change', () => {  
                    console.dir(fileInput)                  
                    const files = Array.from(fileInput.files)
                    files.forEach(file => {
                        preview.innerHTML += '<li class="ui-state-default" id="'+file.lastModified+'"> '+file.name+'<button data-index='+file.lastModified+' class="file-remove">X</button> </li>'
                    });
                });
            },
            
            removeFile: () => {
                document.addEventListener('click', (e) => {
                    if(e.target.className !== 'file-remove') return;
                    const removeTargetId = e.target.dataset.index;
                    const removeTarget = document.getElementById(removeTargetId);
                    const files = document.querySelector('#file-input').files;
                    const dataTranster = new DataTransfer();

                    //document.querySelector('#file-input').files = Array.from(files).filter(file => file.lastModified !== removeTarget);


                    Array.from(files)
                        .filter(file => file.lastModified != removeTargetId)
                        .forEach(file => {
                        dataTranster.items.add(file);
                    });
        
                    document.querySelector('#file-input').files = dataTranster.files;
                    removeTarget.remove();
                })
            }
        }

        handler.init()
        handler.removeFile()
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />