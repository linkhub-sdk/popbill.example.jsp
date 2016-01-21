<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.ContactInfo"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	String testUserID = "testkorea";		// 연동회원 아이디	

	ContactInfo[] contactInfos = null;

	try {

		contactInfos = closedownService.listContact(testCorpNum, testUserID);

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
				<legend>담당자 목록 확인</legend>

					<%
						ContactInfo contactInfo = null;
						for(int i=0; i< contactInfos.length; i++){
							contactInfo = contactInfos[i];
					%>
					
						<fieldset class="fieldset2">
							<legend>ContactInfos <%=i+1%> / <%=contactInfos.length%></legend>
								<ul>	
									<li>id : <%= contactInfo.getId()%></li>
									<li>personName : <%= contactInfo.getPersonName()%></li>
									<li>email : <%= contactInfo.getEmail()%></li>
									<li>hp : <%= contactInfo.getHp()%></li>
									<li>fax : <%= contactInfo.getFax()%></li>
									<li>tel : <%= contactInfo.getTel()%></li>
									<li>regDT (등록일시): <%= contactInfo.getRegDT()%></li>
									<li>searchAllAllowYN (회사조회 권한여부): <%= contactInfo.getSearchAllAllowYN()%></li>
									<li>mgrYN (관리자 권한여부) : <%= contactInfo.getMgrYN()%></li>
				

								</ul>
						</fieldset>		
						
					<%			
						}
					%>

			</fieldset>
		 </div>
	</body>
</html>