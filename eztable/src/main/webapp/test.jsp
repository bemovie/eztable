<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>



<style>
#modalOpenButton, #modalCloseButton {
  cursor: pointer;
}

#modalContainer {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 300px;
  height: 150px;
  padding: 15px;
}

#modalContainer.hidden {
  display: none;
}
</style>

<style>
#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 300px;
  height: 150px;
  padding: 15px;
}
</style>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3deea4e437afacaccf5d342a0a21b891&libraries=services"></script>

<!-- 내 위치 가져오기 -->
<script>
function locationLoadSuccess(pos){
// 현재 위치 받아오기
var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

// 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
map.panTo(currentPos);

// 마커 생성
var marker = new kakao.maps.Marker({
    position: currentPos
});

// 기존에 마커가 있다면 제거
marker.setMap(null);
marker.setMap(map);
};

function locationLoadError(pos){
alert('위치 정보를 가져오는데 실패했습니다.');
};

//위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};
</script>
<!-- <script src="../resources/js/map.js"></script> -->   



</head>
<body>

<div id="modalContainer" class="hidden">
  <div id="modalContent">
    <p>모달 창 입니다.</p>
    <button id="modalCloseButton">닫기</button>
  </div>
</div>

<div id="map" style="width:500px;height:400px;"></div>



<!-- 카카오 지도 생성 -->
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>





<script>
function searchBtn() {
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// input에서 키워드 받음 
	var keyword = document.querySelector('#search').value;	
		
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(keyword, placesSearchCB, {
		radius : 2000,
		location: new kakao.maps.LatLng(37.566826, 126.9786567)
	});
};

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
		
        //if ( bounds =! null )
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
	
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    	
    	modal.classList.remove('hidden');
    	
        /*
    	// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent(
       		'<div style="padding:5px;font-size:12px;">' + place.place_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.road_address_name + place.phone + '</div><br><div style="padding:5px;font-size:12px;">' + place.phone + '</div>'
        );
        infowindow.open(map, marker);
        */
        
    });
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }            
}

</script>


<input id="search" value="" />
<input type="button" onclick="searchBtn()" value="검색"> 


<button type="button" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>

<button id="modalOpenButton">모달창 열기</button>




<script>
//const modalOpenButton = document.getElementById('modalOpenButton');
const modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

/*
modalOpenButton.addEventListener('click', () => {
  modal.classList.remove('hidden');
});
*/

modalCloseButton.addEventListener('click', () => {
  modal.classList.add('hidden');
});





</script>

</body>
</html>