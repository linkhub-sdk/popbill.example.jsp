<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.ContactInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
	 * - https://docs.popbill.com/accountcheck/java/api#GetContactInfo
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";
	
	String contactID = "testkorea";
	
	ContactInfo contactInfo = null;

	try {

		contactInfo = accountCheckService.getContactInfo(testCorpNum, contactID);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>담당자 정보 확인</legend>
				<ul>
					<li>id (아이디) : <%= contactInfo.getId()%></li>
					<li>personName (담당자 성명) : <%= contactInfo.getPersonName()%></li>
					<li>email (이메일) : <%= contactInfo.getEmail()%></li>
					<li>hp (휴대폰번호) : <%= contactInfo.getHp()%></li>
					<li>fax (팩스번호) : <%= contactInfo.getFax()%></li>
					<li>tel (연락처) : <%= contactInfo.getTel()%></li>
					<li>regDT (등록일시) : <%= contactInfo.getRegDT()%></li>
					<li>searchRole (담당자 권한) : <%= contactInfo.getSearchRole()%></li>
					<li>mgrYN (관리자 권한여부) : <%= contactInfo.getMgrYN()%></li>
					<li>state (상태) : <%= contactInfo.getState()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
