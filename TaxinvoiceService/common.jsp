<%--
===================================================================================
* 팝빌 전자세금계산서 API Java SDK JSP Example
*
* - JSP SDK 연동환경 설정방법 안내 : https://developers.popbill.com/guide/taxinvoice/java/getting-started/tutorial?fwn=jsp
* - 업데이트 일자 : 2023-07-06
* - 연동 기술지원 연락처 : 1600-9854
* - 연동 기술지원 이메일 : code@linkhubcorp.com
*
* <테스트 연동개발 준비사항>
* 1) 27, 30번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    연동신청 시 메일로 발급받은 인증정보를 참조하여 변경합니다.
* 2) 전자세금계산서 발행을 위해 공동인증서를 등록합니다.
*    - 팝빌사이트 로그인 > [전자세금계산서] > [환경설정] > [공동인증서 관리]
*    - 공동인증서 등록 팝업 URL (GetTaxCertURL API)을 이용하여 등록
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="taxinvoiceService" scope="application" class="com.popbill.api.taxinvoice.TaxinvoiceServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="taxinvoiceService" property="linkID" value="TESTER"/>

<%-- 비밀키 --%>
<jsp:setProperty name="taxinvoiceService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="taxinvoiceService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="taxinvoiceService" property="IPRestrictOnOff" value="true"/>

<%-- UseStaticIP : 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="taxinvoiceService" property="useStaticIP" value="false"/>

<%-- UseLocalTimeYN : 인증토큰정보 로컬서버 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="taxinvoiceService" property="useLocalTimeYN" value="true"/>
