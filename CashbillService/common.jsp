<%--
===================================================================================
* 팝빌 현금영수증 API Java SDK JSP Example
* JSP 연동 튜토리얼 안내 : https://developers.popbill.com/guide/cashbill/java/getting-started/tutorial?fwn=jsp
*
* 업데이트 일자 : 2025-08-28
* 연동기술지원 연락처 : 1600-9854
* 연동기술지원 이메일 : code@linkhubcorp.com
*         
* <테스트 연동개발 준비사항>
* 1) API Key 변경 (연동신청 시 메일로 전달된 정보)
*     - LinkID : 링크허브에서 발급한 링크아이디
*     - SecretKey : 링크허브에서 발급한 비밀키
* 2) SDK 환경설정 옵션 설정
*     - IsTest : 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
*     - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
*     - UseStaticIP : 통신 IP 고정, true-사용, false-미사용, (기본값:false)
*     - UseLocalTimeYN : 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="cashbillService" scope="application" class="com.popbill.api.cashbill.CashbillServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="cashbillService" property="linkID" value="TESTER"/>

<%-- 비밀키 --%>
<jsp:setProperty name="cashbillService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정, true-테스트, false-운영(Production), (기본값:false) --%>
<jsp:setProperty name="cashbillService" property="test" value="true"/>

<%-- 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true) --%>
<jsp:setProperty name="cashbillService" property="IPRestrictOnOff" value="true"/>

<%-- 통신 IP 고정, true-사용, false-미사용, (기본값:false) --%>
<jsp:setProperty name="cashbillService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true) --%>
<jsp:setProperty name="cashbillService" property="useLocalTimeYN" value="true"/>