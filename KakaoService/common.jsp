<%--
===================================================================================
* 팝빌 카카오톡 API Java SDK JSP Example
*
* - JSP SDK 연동환경 설정방법 안내 : https://docs.popbill.com/kakao/tutorial/jsp
* - 업데이트 일자 : 2022-01-06
* - 연동 기술지원 연락처 : 1600-9854
* - 연동 기술지원 이메일 : code@linkhubcorp.com
*
* <테스트 연동개발 준비사항>
* 1) 34, 37번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    연동신청 시 메일로 발급받은 인증정보를 참조하여 변경합니다.
* 2) 발신번호 사전등록을 합니다. (등록방법은 사이트/API 두가지 방식이 있습니다.)
*    - 1. 팝빌 사이트 로그인 > [문자/팩스] > [카카오톡] > [발신번호 사전등록] 메뉴에서 등록
*    - 2. getSenderNumberMgtURL API를 통해 반환된 URL을 이용하여 발신번호 등록
* 3) 비즈니스 채널 등록 및 알림톡 템플릿을 신청합니다.
*    - 1. 비즈니스 채널 등록 (등록방법은 사이트/API 두가지 방식이 있습니다.)
*        └ 팝빌 사이트 로그인 [문자/팩스] > [카카오톡] > [카카오톡 관리] > '카카오톡 채널 관리' 메뉴에서 등록
*        └ GetPlusFriendMgtURL API 를 통해 반환된 URL을 이용하여 등록
*    - 2. 알림톡 템플릿 신청 (등록방법은 사이트/API 두가지 방식이 있습니다.)
*        └ 팝빌 사이트 로그인 [문자/팩스] > [카카오톡] > [카카오톡 관리] > '알림톡 템플릿 관리' 메뉴에서 등록
*        └ GetATSTemplateMgtURL API 를 통해 URL을 이용하여 등록
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="kakaoService" scope="application" class="com.popbill.api.kakao.KakaoServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="kakaoService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="kakaoService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="kakaoService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="kakaoService" property="IPRestrictOnOff" value="true"/>

<%-- UseStaticIP : 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="kakaoService" property="useStaticIP" value="false"/>

<%-- UseLocalTimeYN : 인증토큰정보 로컬서버 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="kakaoService" property="useLocalTimeYN" value="true"/>
