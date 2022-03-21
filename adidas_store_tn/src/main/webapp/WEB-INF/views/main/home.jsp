<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/home.css">
</head>
<body>
	<div class="body">
		<!-- 상단 화면 -->
		<div class="top">
			<div class="top-container">
				<div class="video-box">
					<video loop autoplay muted src="https://brand.assets.adidas.com/video/upload/q_auto,vc_auto/video/upload/global%20brand%20publishing/Horizontal/SS22%20IIN/horizontal-concepts-ss22-IIN-launch-hp-mh-large-d.mp4"></video>
				</div>
				<div class="top-content-box">
					<div class="top-content">
							<h2>FIND YOUR I'MPOSSIBLE</h2>
							<div class="content">무엇이 가능하고 불가능한지 설명할 필요 없어. 우리의 가능성은 우리가 잘 아니까.</div>
							<div class="content-btn-box">
							</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 중단 카테고리 화면 -->
		<div class="middle-category">
			<div class="middle-category-container">
				<div class="middle-category-box">
					<div class="middle-gender">
						<span class="gender">WOMEN</span>
						<img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/koKR/Images/updated_gender_women_dt_tcm215-636701.jpg">
					</div>
					<div class="middle-gender">
						<span class="gender">MAN</span>
						<img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/koKR/Images/updated_gender_men_dt_tcm215-636698.jpg">
					</div>
					<div class="middle-gender">
						<span class="gender">KIDS</span>
						<img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/koKR/Images/updated_gender_kids_dt_tcm215-636695.jpg">
					</div>
				</div>
			</div>
		</div>
		<!-- 중단 카테고리 클릭 화면 -->
		<div class="middle-category-click">
			<div class="middle-category-click-container">
				<!-- 성별선택 -->
				<div class="select-gender-box">
					<button type="button" class="btn btn-WOMEN selected">WOMEN</button>
					<button type="button" class="btn btn-MAN">MAN</button>
					<button type="button" class="btn btn-KIDS">KIDS</button>
				</div>
				<!-- 카테고리 리스트 -->
				<div class="select-category-box">
					<div class="select-category-list-container">
						<!-- Women-카테고리 -->
						<div class="select-category-list-box WOMEN">
							<c:forEach var="goods" items="${womenList}">
								<!-- 카테고리 -->
								<div class="select-category-item-box start">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=${goods.gd_ca_num}&se_sub_num=${goods.gd_sub_num}" class="select-category-item">
										<span class="select-category-img-box">
											<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
										</span>
										<span class="select-category-name">${goods.gd_name}</span>
									</a>
								</div>
							</c:forEach>
						</div>
						<!-- Man-카테고리 -->
						<div class="select-category-list-box MAN">
							<c:forEach var="goods" items="${manList}">
								<!-- 카테고리 -->
								<div class="select-category-item-box start">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=${goods.gd_ca_num}&se_sub_num=${goods.gd_sub_num}" class="select-category-item">
										<span class="select-category-img-box">
											<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
										</span>
										<span class="select-category-name">${goods.gd_name}</span>
									</a>
								</div>
							</c:forEach>
						</div>
						<!-- Kids-카테고리 -->
						<div class="select-category-list-box KIDS">
							<c:forEach var="goods" items="${kidsList}">
								<!-- 카테고리 -->
								<div class="select-category-item-box start">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=${goods.gd_ca_num}&se_sub_num=${goods.gd_sub_num}" class="select-category-item">
										<span class="select-category-img-box">
											<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
										</span>
										<span class="select-category-name">${goods.gd_name}</span>
									</a>
								</div>
							</c:forEach>
						</div>
						<!-- 이전, 다음 버튼 -->
						<div class="select-category-btn-box">
							<button type="button" class="btn btn-prev"><i class="icon-left"></i></button>
							<button type="button" class="btn btn-next"><i class="icon-right"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 신상품 -->
		<div class="new-goods">
			<div class="new-goods-container">
				<div class="new-goods-text-box">
					<div class="new-goods-text">
						<h3>신상품</h3>
					</div>
					<div class="new-goods-all">
						<a href="<%=request.getContextPath()%>/goods/list?se_new=on" class="btn btn-all">전체 보기</a>
					</div>
				</div>
				<div class="new-goods-list-box">
					<div class="new-goods-list-container">
						<!-- 신상품 리스트 -->
						<div class="new-goods-list">
							<!-- 신상품 아이템 -->
							<c:forEach var="goods" items="${newList}">
								<div class="new-goods-item-box">
									<a href="<%=request.getContextPath()%>/goods/detail?gd_num=${goods.gd_num}" class="new-goods-item">
										<span class="goods-item-img-box">
											<input type="hidden" name="gd_num" value="${goods.gd_num}">
											<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
											<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
										</span>
										<span class="goods-item-text-box">
											<span class="goods-item-name">${goods.gd_name}</span>
											<span class="goods-item-price">${goods.gd_price}</span>
										</span>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="new-goods-btn-box">
							<button type="button" class="btn btn-prev"><i class="icon-left"></i></button>
							<button type="button" class="btn btn-next"><i class="icon-right"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 화면 -->
		<div class="bottom">
			<div class="bottom-container">
				<div class="bottom-content-container">
					<div class="bottom-content-box">
						<div class="bottom-content1">
							<h2>1949년부터, 스토리와 스타일, 스포츠를 이끌다</h2>
							<div>
								스포츠는 건강을 지키며, 내면을 밝혀주고, 우리를 하나로 이어줍니다. 아디다스는 스포츠를 통해 세상을 바꿀 수있다고 믿습니다. 세계무대를 빛내는 스포츠 선수에서, 평범한 사람들의 일상에 이르기까지, 우리는 최상의 테크놀로지로 최상의 퍼포먼스를 선사합니다. 러닝에서 바스켓볼, 축구, 피트니스까지. 아디다스와 함께 새로운 나의 모습을 만나보세요. 가끔은 도시를 벗어나 아웃도어를 즐기고, 요가를 통해공동체와 하나가 되어보세요. 3-스트라이프의 헤리티지는 문화로까지 이어집니다. 스포츠는 물론, 음악과 일상의 스트릿까지 말이죠. 휘슬이 울리기 직전의 출발선으로부터, 질주의 순간, 마지막 결승선까지. 아디다스는 모두를 위한 브랜드입니다. 스포츠와 당신의 삶, 그리고 세상을 바꿉니다.
								<br>
								<br>
								아디다스는 단순히 스포츠웨어와 운동복을 만드는 브랜드가 아닙니다. 우리는 업계를 선도하는 리더들과 파트너십을 맺고 세상에 없던 것들을 함께 창조합니다. 이를 통해 우리는 팬들이 원하는 스포츠 제품과 스타일을 제공하고 동시에 환경의 지속가능성을 지켜 나가고 있습니다. 아디다스는 크리에이터의 브랜드입니다. 게임의 판도를 바꾸고, 변화를 이끕니다. 그리고 우리는 우리가 지닌 영향력으로 세상을 어떻게 만들어 나갈지 고민합니다.
							</div>
						</div>
						<div class="bottom-content2">
							<h2>세상의 모든 스포츠를 포용하는 브랜드</h2>
							<div>
								아디다스는 모두의 스포츠 브랜드입니다. 새로움을 추구하는 크리에이터의 브랜드입니다. 관습에 도전하고, 새로운 룰을 만들며, 창조적인 파격을 거듭합니다. 우리는 단순한 스포츠 제품, 그 이상을 만듭니다. 결승선을 통과하는 그 순간까지 흔들림 없는 몰입과 의지, 승리의 정신을 추구합니다. 운동하는 여성들을 위해 브라와 타이츠를 만들며, 세상의 모든 스포츠와 모든 체형을 포용합니다. 새로움을 디자인하고, 혁신하고, 창조합니다. 그라운드에서 육상 트랙과 코트, 수영장에 이르기까지, 스포츠의 새로운 미래를 위한 실험을 반복합니다. NMD에서 파이어버드 트랙수트까지, 어제의 영감을 바탕으로 내일의 스트릿 트렌드를 생각해냅니다. 영원한 스트릿의 아이콘으로 자리 잡은 스탠 스미스와 슈퍼스타에서 볼 수 있듯이, 아디다스는 어제의 클래식에 오늘의 트렌드라는 새 생명을 불어넣는 브랜드입니다.
								<br>
								<br>							
								아디다스가 내놓는 컬렉션은 하이 패션과 퍼포먼스의 경계를 자유롭게 넘나듭니다. 아디다스 by 스텔라 맥카트니의 애슬레틱 컬렉션이 증명하듯 스튜디오와 스트릿 룩의 구분은 의미가 없습니다. 오리지널스의 라이프스타일 어패럴도 필요할 때면 언제든 운동복이 될 수 있습니다. 우리의 삶은 끊임없이 변화하고 있습니다. 일상의 모습도 하루가 다르게 바뀝니다. 아디다스의 디자인 철학은 이 세상의 끝없는 진화를 담고 있습니다.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 중단 카테고리 클릭 시 화면 전환
		$('.middle-gender').click(function(){
			var gender = $(this).children('.gender').text();		
			$('.middle-category').hide();
			$('.middle-category-click').show();
			$('.select-gender-box .btn-'+gender).click();
		})
		// 중단 카테고리 클릭화면 성별선택 
		$('.select-gender-box button').click(function(){
			var gender = $(this).text();
			$('.select-category-list-box').hide();
			$('.select-category-list-container .'+gender).css('display','flex');
			$('.select-gender-box button').each(function() {
				if($(this).hasClass('selected')){
					$(this).removeClass('selected');
				}
			});
			$(this).addClass('selected');
			$('.select-category-list-container .'+gender).css('margin-left', '0px');
			$('.select-category-list-container .'+gender).children().removeClass('start').removeClass('end');
			$('.select-category-list-container .'+gender).children().eq(0).addClass('start');
			$('.select-category-list-container .'+gender).children().eq(3).addClass('end');
			$('.select-category-btn-box .btn-prev').hide();
			$('.select-category-btn-box .btn-next').show();
		})
		// 중단 카테고리 다음버튼클릭
		$('.select-category-btn-box .btn-next').click(function(){
			var gender = $('.select-gender-box .selected').text();
			var cateNext = $('.select-category-list-container .'+gender+' .end').nextAll().length
			var cateNextMargin = (cateNext * 25)
			if(cateNext >= 4){
				$('.select-category-list-container .'+gender+'').animate({marginLeft : '-=100%'});
				$('.select-category-list-container .'+gender+' .end').nextAll().eq(3).addClass('end');
				$('.select-category-list-container .'+gender+' .end').first().removeClass('end');
				$('.select-category-list-container .'+gender+' .start').nextAll().eq(3).addClass('start');
				$('.select-category-list-container .'+gender+' .start').first().removeClass('start');
				$('.select-category-btn-box .btn-prev').show();
			}
			if(cateNext >= 1 && cateNext < 4){
				$('.select-category-list-container .'+gender+'').animate({marginLeft : '-='+cateNextMargin+'%'});
				$('.select-category-list-container .'+gender+' .end').nextAll().eq(cateNext -1).addClass('end');
				$('.select-category-list-container .'+gender+' .end').first().removeClass('end');
				$('.select-category-list-container .'+gender+' .start').nextAll().eq(cateNext -1).addClass('start');
				$('.select-category-list-container .'+gender+' .start').first().removeClass('start');
				$('.select-category-btn-box .btn-prev').show();
			}
			var cateNext = $('.select-category-list-container .'+gender+' .end').nextAll().length
			if(cateNext == 0){
				$('.select-category-btn-box .btn-next').hide();
			}
		});
		// 중단 카테고리 이전버튼클릭
		$('.select-category-btn-box .btn-prev').click(function(){
			var gender = $('.select-gender-box .selected').text();
			var catePrev = $('.select-category-list-container .'+gender+' .start').prevAll().length
			var catePrevMargin = (catePrev * 25)
			if(catePrev >= 4){
				$('.select-category-list-container .'+gender+'').animate({marginLeft : '+=100%'});
				$('.select-category-list-container .'+gender+' .end').prevAll().eq(3).addClass('end');
				$('.select-category-list-container .'+gender+' .end').last().removeClass('end');
				$('.select-category-list-container .'+gender+' .start').prevAll().eq(3).addClass('start');
				$('.select-category-list-container .'+gender+' .start').last().removeClass('start');
				$('.select-category-btn-box .btn-next').show();
			}
			if(catePrev >= 1 && catePrev < 4){
				$('.select-category-list-container .'+gender+'').animate({marginLeft : '+='+catePrevMargin+'%'});
				$('.select-category-list-container .'+gender+' .end').prevAll().eq(catePrev -1).addClass('end');
				$('.select-category-list-container .'+gender+' .end').last().removeClass('end');
				$('.select-category-list-container .'+gender+' .start').prevAll().eq(catePrev -1).addClass('start');
				$('.select-category-list-container .'+gender+' .start').last().removeClass('start');
				$('.select-category-btn-box .btn-next').show();
			}
			var catePrev = $('.select-category-list-container .'+gender+' .start').prevAll().length
			if(catePrev == 0){
				$('.select-category-btn-box .btn-prev').hide();
			}
		});
		// 전체보기 버튼 hover 
		$('.btn-all').hover(function(){
			$(this).css({backgroundColor : '#000', color : '#fff', textDecoration: 'none'});
		}, function(){
			$(this).css({backgroundColor : '#fff', color : '#000', textDecoration: 'underline'});
		})
		// 신상품 다음버튼클릭
		$('.new-goods .btn-next').click(function(){
			$('.new-goods-list').animate({marginLeft : '-=100%'});
			$(this).hide();
			$('.new-goods .btn-prev').show();
		});
		// 신상품 이전버튼클릭
		$('.new-goods .btn-prev').click(function(){
			$('.new-goods-list').animate({marginLeft : '+=100%'});
			$(this).hide();
			$('.new-goods .btn-next').show();
		});
		// 찜하기 클릭
		$('.btn-item-choice').click(function(e){
			e.preventDefault();
			if($(this).children().hasClass('icon-item-choice')){
				$(this).children().addClass('icon-item-choice-ing');
				$(this).children().removeClass('icon-item-choice');
				var ch_state = 1;
			}else{
				$(this).children().addClass('icon-item-choice');
				$(this).children().removeClass('icon-item-choice-ing');
				var ch_state = 0;
			}
			var ch_gd_num = $(this).siblings('[name=gd_num]').val();
			var ch_me_email = '${user.me_email}';
			var choice = {
				ch_state : ch_state,
				ch_gd_num : ch_gd_num,
				ch_me_email : ch_me_email
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(choice),
		        url: '<%=request.getContextPath()%>/choice/insert',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	
		        }
		    });
		})
		getChoiceState();
		//로그인한 유저의 찜상태 가져오기
		function getChoiceState() {
			$.ajax({
		        async:false,
		        type:'POST',
		        url:'<%=request.getContextPath()%>/choice/state',
		        dataType:"json",
		        success : function(res){
		        	var list = res.list
		        	if(list != null){
		        		for(choice of list){
							$('.new-goods-item-box [name=gd_num]').each(function() {
								if(choice.ch_state == 1){
									$('[value='+choice.ch_gd_num+']').siblings('.btn-item-choice').children().addClass('icon-item-choice-ing').removeClass('icon-item-choice');								
								}
							});
			        	}
		        	}
		        }
		    });
		}
		setComma();
		//콤마 찍기
		function setComma() {
			$('.goods-item-price').each(function() {
				var price = $(this).text();
				price = parseInt(price);
				var priceComma = price.toLocaleString('ko-KR');
				$(this).text(priceComma + '원');
			});
		}
	</script>
</body>
</html>