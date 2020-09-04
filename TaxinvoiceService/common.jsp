<%--
===================================================================================
* 팝빌 전자세금계산서 API Java SDK JSP Example
*
* - JSP SDK 연동환경 설정방법 안내 : https://docs.popbill.com/taxinvoice/tutorial/jsp
* - 업데이트 일자 : 2020-08-07
* - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991~2
* - 연동 기술지원 이메일 : code@linkhub.co.kr
*
* <테스트 연동개발 준비사항>
* 1) 28, 31번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
*    링크허브 가입시 메일로 발급받은 인증정보를 참조하여 변경합니다.
* 2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입합니다.
* 3) 전자세금계산서 발행을 위해 공인인증서를 등록합니다.
*    - 팝빌사이트 로그인 > [전자세금계산서] > [환경설정] > [공인인증서 관리]
*    - 공인인증서 등록 팝업 URL (GetTaxCertURL API)을 이용하여 등록
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

<%-- UseStaticIP : 팝빌 API 서비스 고정 IP 사용여부(GA), true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="taxinvoiceService" property="useStaticIP" value="false"/>

<%-- UseLocalTimeYN : 로컬 타임 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="taxinvoiceService" property="useLocalTimeYN" value="true"/>