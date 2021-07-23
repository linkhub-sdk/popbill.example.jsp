<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>휴폐업조회 SDK JSP Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.CorpState"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 다수건의 사업자번호에 대한 휴폐업정보를 확인합니다. (최대 1,000건)
	 * - https://docs.popbill.com/closedown/java/api#CheckCorpNums
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 조회할 사업자번호 배열, 최대 1000건
	String[] corpNumList = new String[] {"1234567890", "6798700433", "401-03-94930"};

	CorpState[] corpStates = null;

	try {

		corpStates = closedownService.CheckCorpNum(testCorpNum, corpNumList);

	} catch (PopbillException pe){

		throw pe;
	}

%>

	<body>
		<div id="content">
			<p class="heading1">휴폐업조회 API SDK - JSP Example.</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>휴폐업조회 대량</legend>
				<br/>
        <p class="info"> state : null (알수없음), 0 (등록되지 않은 사업자번호), 1 (사업중), 2 (폐업), 3 (휴업)</p>
        <p class="info"> taxType : null (알수없음), 10 (일반과세자), 20 (면세과세자), 30 (간이과세자), 31 (간이과세자-세금계산서 발급사업자), 40 (비영리법인 또는 국가기관, 고유번호가 부여된 단체)</p>
			<%
				CorpState corpState = null;

				for ( int i = 0; i < corpStates.length; i++ ) {
					corpState = corpStates[i];
			%>
					<fieldset class ="fieldset2">
						<legend>휴폐업조회 결과 [<%=i+1%>]</legend>
						<ul>
							<li>corpNum (사업자번호) : <%=corpState.getCorpNum()%></li>
							<li>taxType (과세유형) : <%=corpState.getTaxType()%></li>
							<li>state (휴폐업 상태) : <%=corpState.getState()%></li>
							<li>stateDate (휴폐업일자) : <%=corpState.getStateDate()%></li>
							<li>typeDate (과세유형 전환일자) : <%=corpState.getTypeDate()%></li>
							<li>checkDate (확인일자) : <%=corpState.getCheckDate()%></li>
						</ul>
					</fieldset>
			<%
				}

			%>
			</fieldset>
			<br />
		</div>
	</body>
</html>
