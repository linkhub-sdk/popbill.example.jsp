<%--
===================================================================================
* 팝빌 예금주조회 API Java SDK JSP Example
*
* - 업데이트 일자 : 2021-12-27
* - 연동 기술지원 연락처 : 1600-9854
* - 연동 기술지원 이메일 : code@linkhubcorp.com
*
* <테스트 연동개발 준비사항>
* 1) 25, 28번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    링크허브 가입시 메일로 발급받은 인증정보를 참조하여 변경합니다.
* 2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입합니다.
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>


<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="accountCheckService" scope="application" class="com.popbill.api.accountcheck.AccountCheckServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="accountCheckService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="accountCheckService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="accountCheckService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, ture-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="accountCheckService" property="IPRestrictOnOff" value="true"/>

<%-- UseStaticIP : 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="accountCheckService" property="useStaticIP" value="false"/>

<%-- UseLocalTimeYN : 인증토큰정보 로컬서버 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="accountCheckService" property="useLocalTimeYN" value="true"/>