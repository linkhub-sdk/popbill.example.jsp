<%--
===================================================================================
* 팝빌 문자 API Java SDK JSP Example
*
* - JSP SDK 연동환경 설정방법 안내 : http://http://blog.linkhub.co.kr/591/
* - 업데이트 일자 : 2019-02-27
* - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991~2
* - 연동 기술지원 이메일 : code@linkhub.co.kr
*
* <테스트 연동개발 준비사항>
* 1) 25, 28번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    링크허브 가입시 메일로 발급받은 인증정보를 참조하여 변경합니다.
* 2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입합니다.
* 3) 발신번호 사전등록을 합니다. (등록방법은 사이트/API 두가지 방식이 있습니다.)
*    - 1. 팝빌 사이트 로그인 > [문자/팩스] > [문자] > [발신번호 사전등록] 메뉴에서 등록
*    - 2. getSenderNumberMgtURL API를 통해 반환된 URL을 이용하여 발신번호 등록
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="messageService" scope="application" class="com.popbill.api.message.MessageServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="messageService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="messageService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="messageService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, ture-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="messageService" property="IPRestrictOnOff" value="true"/>
