<%--
===================================================================================
* 팝빌 휴폐업조회 API Java SDK JSP Example
*
* - JSP SDK 연동환경 설정방법 안내 : https://docs.popbill.com/closedown/tutorial/java#jsp
* - 업데이트 일자 : 2021-12-29
* - 연동 기술지원 연락처 : 1600-9854
* - 연동 기술지원 이메일 : code@linkhubcorp.com
*
* <테스트 연동개발 준비사항>
* 1) 24, 27번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    연동 신청시 메일로 발급받은 인증정보를 참조하여 변경합니다.
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="closedownService" scope="application" class="com.popbill.api.closedown.CloseDownServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="closedownService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="closedownService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="closedownService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="closedownService" property="IPRestrictOnOff" value="true"/>

<%-- UseStaticIP : 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="closedownService" property="useStaticIP" value="false"/>

<%-- UseLocalTimeYN : 인증토큰정보 로컬서버 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="closedownService" property="useLocalTimeYN" value="true"/>