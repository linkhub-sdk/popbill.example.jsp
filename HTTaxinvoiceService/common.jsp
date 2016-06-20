<%--
===================================================================================
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
*
* http://www.popbill.com
* Author : Jeong Yohan (code@linkhub.co.kr)
* Written : 2016-06-20
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="htTaxinvoiceService" scope="application" class="com.popbill.api.hometax.HTTaxinvoiceServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="htTaxinvoiceService" property="linkID" value="TESTER"/>

<%-- 발급받은 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="htTaxinvoiceService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- API요청 환경설정을 위한 설정값. true(테스트용), false(상업용)
     상업용으로 전환 시 false로 처리. --%>
<jsp:setProperty name="htTaxinvoiceService" property="test" value="true"/>
