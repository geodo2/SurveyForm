![header](https://capsule-render.vercel.app/api?type=Waving&color=auto&height=300&section=header&text=Chart.js&fontSize=90)

JSP를 활용한 설문조사 폼 제작 프로젝트를 하던 도중 설문 응답을 통계와 시각화를 해야하는 경우가 생겼습니다. 
<br>
이는 Chart.js를 통해 그래프 시각화를 구현할 수 있었습니다.

<div>
<img src="https://user-images.githubusercontent.com/94734394/210717505-35f57d66-9336-4272-a5f5-00381bf7e7c5.png"  width="400" height="200"/>

<img src="https://user-images.githubusercontent.com/94734394/210718074-8781cebe-d6ee-4a66-b48d-c1b56af7ed11.png"  width="400" height="200"/>
</div>
제가 사용한 chart js를 설명해보겠습니다.
<br>


## :one:Chart.js란?
chart.js는 웹 상에 차트를 그리는데 특화된 라이브러리입니다.  

해당 라이브러리를 이용해 Bar chart, Pie chart, Line chart, Bubble chart 다양한 차트를 손 쉽게 시각화 할 수 있습니다.   
라이브러리 사이트 주소:    
:blush:https://www.chartjs.org

## :two:기본 세팅
* npm
* Github release
* CDN   
JSP에서는 javascript를 추가할 수 있는 script 태그를 사용할 수 있었기 때문에 다른 방법을 사용할 필요 없이 간단한 CDN 방법을 사용하였습니다.   
우선 사용하기 전에 src import를 해주어야 합니다.  

현재 realease된 최신 버전   

          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>  
          
제가 사용한 버전    

          <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>   
저는 최신버전이 잘 돌아가지 않아 버전 조정을 했습니다. 
  
<b>데이터 베이스</b>
[데이터베이스 보기](https://github.com/soominkiminsoo/SurveyForm1/blob/712801d77cc69d13665eb9b10a81b2e6a7e250a0/database.md)
## :three:코드(HTML)
```
<canvas id="myChart<%=i%>" width="500vw" height="500vh"></canvas>
```
✔️:Point
* 크기 조정을 위해선 JS 측의 Option에 responsive: false을 추가하면 크기를 조절이 가능합니다.
* 크기는 반응형을 위해 vw,vh를 사용하였습니다.
* 제 문항 수에 따라 차트 개수가 달라지기 때문에 Java코드가 <%=i%>로 삽입이 되어있습니다. 제거하고 사용하면 됩니다.
## :four:코드(JS)
```
   <script>
	let myChart<%=i%> = document.getElementById('myChart'+<%=i%>).getContext('2d');
	var data_count=<%=checkbox_checked_count%>
	var colorList = ['#FF7B54', '#FFB26B', '#FFD56F', '#939B62', '#CFFDE1', '#68B984', '#3D5656', '#FFDDA6', '#61AE76', '#969191'];
	var option_count = <%=qs_checkbox%>
	let barchart<%=i%> =new Chart(myChart<%=i%>,{
	   type: 'pie',
	   
	   data : {
	      labels : option_count,
	      datasets:[{ 
	    	  
    	  backgroundColor: colorList,
          borderWidth: 0.5 ,
          borderColor: '#ddd',
	      data:data_count
	         
	      }]
	   },
		  options: {
			  responsive: false,
		        title: {
		            display: true,
		            text: '사용자 응답',
		            position: 'top',
		            fontSize: 25,
		            fontColor: '#111',
		            padding: 20
		        },
		        legend: {
		            display: true,
		            position: 'bottom',
		            labels: {
		            	fontSize: 20,
		     
		            	fontWeight: 800,
		                boxWidth: 20,
		                fontColor: '#111',
		                padding: 15
		            }
		        },
		    },
		    centerText: {
		        display: false,
		        text: ""
		    }
	})
	</script>
```
✔️:Point
* Html과 마찬가지로 Java코드가 <%=%>의 형태로 삽입이 되어있습니다.
* Type에 Bar, Pie, Line, Bubble 등등 파라미터를 다르게주면 다양한 형태의 차트가 형성됩니다. 
* labels, data, backgroundcolor의 파라미터로는 List형태를 삽입해야합니다. 저는 Java측에서    
  리스트 형태로 구현 및 저장을 했기에 script에 바로 사용이 가능했습니다.

