<%--
===================================================================================
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
*
* http://www.popbill.com
* Author : Jeong Yohan (yhjeong@linkhub.co.kr)
* Written : 2015-07-08
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
