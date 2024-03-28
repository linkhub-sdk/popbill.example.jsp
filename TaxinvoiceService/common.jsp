<%--
===================================================================================
* 팝빌 전자세금계산서 API Java SDK JSP Example
* JSP 연동 튜토리얼 안내 : https://developers.popbill.com/guide/taxinvoice/java/getting-started/tutorial?fwn=jsp
*
* 업데이트 일자 : 2024-03-28
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

*     공동인증서를 등록하는 API를 사용하는 경우, 통신구간 보안을 위한 암호화 정보
*     암호화 키 발급은 팝빌 파트너센터(1600-8536)로 문의하여 발급
*     - mlePublicKey : MLE(Message Level Encryption) 공개키
*     - mleKeyID : MLE 공개키 식별 아이디
*     - mleKeyName : MLE 공개키 식별 이름
* 3) 전자세금계산서 발행을 위해 공동인증서를 등록합니다.
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

<%-- 연동환경 설정, true-테스트, false-운영(Production), (기본값:true) --%>
<jsp:setProperty name="taxinvoiceService" property="test" value="true"/>

<%-- 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true) --%>
<jsp:setProperty name="taxinvoiceService" property="IPRestrictOnOff" value="true"/>

<%-- 통신 IP 고정, true-사용, false-미사용, (기본값:false) --%>
<jsp:setProperty name="taxinvoiceService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true) --%>
<jsp:setProperty name="taxinvoiceService" property="useLocalTimeYN" value="true"/>

<%-- MLE 공개키 --%>
<jsp:setProperty name="taxinvoiceService" property="mlePublicKey" value=""/>

<%-- MLE 공개키 아이디 --%>
<jsp:setProperty name="taxinvoiceService" property="mleKeyID" value=""/>

<%-- MLE 공개키 이름 --%>
<jsp:setProperty name="taxinvoiceService" property="mleKeyName" value=""/>