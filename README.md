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



## 설문지 결과 및 통계 화면
프로그래밍적 요소를 넣어 사용자가 결과 화면을 구성할 수 있게끔 하였습니다. ( 현재 기획단계)
![image](https://user-images.githubusercontent.com/94734394/209276726-8128bf06-fc2b-4526-a7d6-781c5d172a9d.png)
![image](https://user-images.githubusercontent.com/94734394/209276757-a86d9575-7351-401c-8638-f66ee4cb1725.png)
질문 타입별로 다른 방식으로 Admin이 결과페이지를 설계할 수 있습니다.
![image](https://user-images.githubusercontent.com/94734394/209277005-93ec1251-559f-4821-a242-8e6adfc17882.png)

https://www.figma.com/file/9MwQ0w4LL7Csdo6zWw0YZQ/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC-%EC%84%9C%EB%B9%84%EC%8A%A4?t=ZZ8PO2NettXvVeEW-1(기획단계)
## 개선 방향 
## DATABASE
유저가 작성한 설문에 대한 데이터 베이스(survey_list,survey_question)와 설문 답변을 위한 데이터베이스(survey_answer)
![image](https://user-images.githubusercontent.com/94734394/206070159-bf697c9f-da1f-4f29-9fae-1885fa9bfae8.png)

JSP+ MySQL
