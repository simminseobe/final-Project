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
                        <c:forEach items="${companyList}" var="company">
                            <option value="${company.companyName}">${company.companyName}</option>
                        </c:forEach>
                        <option value="SLAMDUNK">슬램덩크</option>
                        <option value="MARVLE">마블</option>
                        <option value="한국영화사">한국영화사</option>
                        <option value="guiter">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    상품 간단설명
                </th>
                <td>
                    <input type="text" name="simpleInfo">
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
                <td><input type="file" name="productPhoto" accept=".jpg,.png,.jpeg" id="file-input" multiple></td>
            </tr>
            <tr>
                <th>이미지 미리보기</th>
                <td id="imgTd">
                    <ul id="sortable">

                    </ul>
                </td>
            </tr>
            <tr>
                <th colspan="2"><button class="my-btn my-blue" type="submit">submit</button></th>
            </tr>
        </table>
    </div>
    </form>
    <!-- <input type="file" id="file-input" multiple /> -->
</div>
</div>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
    let img
    let index
    let array
    $(() => {
        $("#sortable").sortable({
            start: (e, ui) => {
                img = ''
                index = -1
                const files = document.querySelector('#file-input').files;
                //이동 시작과 동시에 실행
                const pickImgLi = ui.item[0]
                //정렬된 li의 값 배열
                const orderedLi = Object.values(document.querySelectorAll('.imgLi'))
                //선택한 객체의 시작 위치 index
                index = orderedLi.indexOf(pickImgLi)
                array = Array.from(files)
                img = array.splice(index,1)
                console.log(document.querySelector('#file-input').files)
                console.log(index)
            },
            change: ui => {
                // console.log(ui)
            },
            stop: (e, ui) => {
                //드래그 종료 시점에서 실행
                //선택한 객체
                const pickImgLi = ui.item[0]
                //정렬된 li의 값 배열
                const orderedLi = Object.values(document.querySelectorAll('.imgLi'))
                //선택한 객체가 이동한 위치 index
                index = orderedLi.indexOf(pickImgLi)
                array.splice(index,0,img[0])
                const dataTranster = new DataTransfer()
                array.forEach( file => {
                    dataTranster.items.add(file)
                })
                document.querySelector('#file-input').files = dataTranster.files
                // 이동 마친 filelist
                console.log(document.querySelector('#file-input').files)
                console.log(index)
                // 문제점 1. 사진이 파일리스트에 등록되어있는 순서대로
                // 미리보기에 등록되는게 아님.
                // 그래서 정렬 시 실제 이동하는 파일과,
                // 드래그 드랍으로 이동시키는 파일 미리보기가 일치하지 않으므로
                // 오류가 발생 .
                // 해결안 : 
                // 파일 미리보기가 파일리스트 index대로 출력될 수 있게
                // 수정할 필요가 있음
            }
        })
        $("#sortable").disableSelection()
    })
    //image handlering
    const handler = {
            init() {
                const fileInput = document.querySelector('#file-input');
                const preview = document.querySelector('#sortable');
                fileInput.addEventListener('change', () => {
                    //기존 이미지 삭제
                    document.querySelector('#sortable').replaceChildren()
                    const files = Array.from(fileInput.files)
                    files.forEach(file => {
                        const fileReader = new FileReader();
                        //선택한 파일 정보를 읽어 오는 작업, 동시에 읽어온 작업 끝나면 함수바로 실행 (e 매개변수에 읽은 파일 정보 있음)
                        fileReader.readAsDataURL(file);
                        fileReader.onload = e =>{
                            preview.innerHTML += '<li class="ui-state-default imgLi" id="'+file.lastModified+'"> '
                                                +'<img style="width:200px" src="'+e.target.result+'">'+
                                                //dataset 사용시 data-index -> dataset.index 
                                                '<button type="button" data-index='+file.lastModified+' class="file-remove">X</button></li>'
                        }
                    });
                });
            },
            removeFile: () => {
                document.addEventListener('click', (e) => {
                    if(e.target.className !== 'file-remove') return
                    const removeTargetId = e.target.dataset.index
                    const removeTarget = document.getElementById(removeTargetId)
                    const files = document.querySelector('#file-input').files
                    //file 객체는 그냥 수정이 불가능해서 아래처럼 바로 수정하려니까 안되더라
                    //document.querySelector('#file-input').files = Array.from(files).filter(file => file.lastModified !== removeTarget);
                    //so I used DataTransfer Object 
                    const dataTranster = new DataTransfer()
                    Array.from(files)
                        .filter(file => file.lastModified != removeTargetId)
                        .forEach(file => {
                        dataTranster.items.add(file);
                    })
                    document.querySelector('#file-input').files = dataTranster.files
                    removeTarget.remove()
                })
            }
        }

        handler.init()
        handler.removeFile()
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />