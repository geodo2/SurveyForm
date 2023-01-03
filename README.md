# SurveyForm1


## 프로젝트 계획 이유
  기존 Survey 서비스 Google Form이나 MicroSoft survey을 분석 및 브레인 스토밍을 통해 개선 활용 방안을 구상하였고 해당 서비스에 조금 더 기술적인 개선의 여지를 찾아 다양한 시도를 해보기 위함.
  구상한 개선 아이디어는 다음과 같음.
  1.  자신이 응답한 설문을 시간이 지난 후에도 확인이 가능함.
  2.  설문 응시자에게 응답에 따른 다른 결과화면을 보여주는 것.
  3.  설문 서비스에 프로그래밍적 요소를 담아 기술적 개선 여지 발굴 가능성
  
## 프로젝트 Figma Design 
https://www.figma.com/file/9MwQ0w4LL7Csdo6zWw0YZQ?embed_host=notion&kind=&node-id=0%3A1&t=YO4wiZdihVIRZHGc-0&viewer=1
## 회원가입 및 로그인
회원가입 화면: 이메일 인증시스템 도입
![image](https://user-images.githubusercontent.com/94734394/204644510-cb89cb12-08bc-4b53-912d-6024dbd8256d.png)

로그인 화면
![image](https://user-images.githubusercontent.com/94734394/206069499-e7421c69-1603-45a9-ae1d-3bcc43385061.png)

## 메인화면 
만든 설문조사 page: 로그인된 사용자가 직접 제작한 설문조사 확인 가능
![image](https://user-images.githubusercontent.com/94734394/204643870-f8730f61-71ba-46be-b223-e5f5c15af1b9.png)
응답한 설문 page:유저가 응한 설문들을 모아볼 수 있음.
![image](https://user-images.githubusercontent.com/94734394/204643909-bab4f626-e974-4ed4-817c-a702d6907139.png)

## 설문지 제작화면 
설문은 세가지 질문 타입으로 질문을 생성가능합니다.( 단답형, 라디오형식, 체크박스형식)
![image](https://user-images.githubusercontent.com/94734394/209276905-6c811e93-add3-4cc1-bd22-cbdbbb8b8a18.png)



## 설문지 결과 (프로그래밍적 요소)
프로그래밍적 요소를 넣어 사용자가 결과 화면을 구성할 수 있게끔 하였습니다.
![image](https://user-images.githubusercontent.com/94734394/210292006-bc2e88fc-e196-4277-bb10-5a0a35942f73.png)
질문 타입별로 다른 방식으로 Admin이 결과페이지를 설계할 수 있습니다.

질문에 대한 프로그래밍적 요소를 밑의 예시처럼 사용이 가능합니다.
또한 기본적인 h1,p,br 과 같은 기본적인 태그로 결과페이지를 꾸밀 수 있습니다. 
![image](https://user-images.githubusercontent.com/94734394/210292806-cf3bae57-1ffe-4700-ad2d-2aa4c8b3ca95.png)




단답형의 경우 해당 응답자의 답변을 그대로 사용할 수 있고 Admin이 새로운 변수를 추가할 수 있습니다.
![image](https://user-images.githubusercontent.com/94734394/210292315-b5dc9cf9-72d8-424f-b77a-583c5ac9133f.png)
  

라디오의 경우 해당 응답자의 선택에 따른 변수들을 미리 설정이 가능합니다.  
![image](https://user-images.githubusercontent.com/94734394/210292269-b42664c0-e347-4766-9256-5340b46fb7dc.png)

체크박스의 경우 응답자가 체크한 답변 갯수에 따른 변수 설정이 가능합니다.
![image](https://user-images.githubusercontent.com/94734394/210292191-496ebadf-256a-4d6b-b489-89f65ede3c3a.png)



## 개선 방향 
## DATABASE
유저가 작성한 설문에 대한 데이터 베이스(survey_list,survey_question)와 설문 답변을 위한 데이터베이스(survey_answer)
![image](https://user-images.githubusercontent.com/94734394/206070159-bf697c9f-da1f-4f29-9fae-1885fa9bfae8.png)

JSP+ MySQL
