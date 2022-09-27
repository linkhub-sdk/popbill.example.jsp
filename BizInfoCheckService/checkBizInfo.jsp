<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/main.css"
	media="screen" />
<title>기업정보조회 SDK JSP Example.</title>
</head>

<%@ include file="common.jsp"%>
<%@page import="com.popbill.api.BizCheckInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
/*
 * 사업자번호 1건에 대한 기업정보를 확인합니다.
 * - https://docs.popbill.com/bizinfocheck/java/api#CheckBizInfo
 */

BizCheckInfo bizInfo = null;

// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
String testCorpNum = "1234567890";

// 조회할 사업자번호
String CorpNum = "6798700433";

try {
    bizInfo = bizInfoCheckService.CheckBizInfo(testCorpNum, CorpNum);
} catch (PopbillException pe) {
    // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
    // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
    throw pe;
}
%>

<body>
	<div id="content">
		<p class="heading1">기업정보조회 API SDK - JSP Example.</p>
		<br />
		<fieldset class="fieldset1">
			<legend>기업정보조회 결과</legend>
			<ul>
				<li>corpNum (사업자번호) : <%=bizInfo.getCorpNum()%></li>
				<li>companyRegNum (법인번호): <%=bizInfo.getCompanyRegNum()%></li>
				<li>checkDT (확인일시) : <%=bizInfo.getCheckDT()%></li>
				<li>corpName (상호): <%=bizInfo.getCorpName()%></li>
				<li>corpCode (기업형태코드): <%=bizInfo.getCorpCode()%></li>
				<li>corpScaleCode (기업규모코드): <%=bizInfo.getCorpScaleCode()%></li>
				<li>personCorpCode (개인법인코드): <%=bizInfo.getPersonCorpCode()%></li>
				<li>headOfficeCode (본점지점코드) : <%=bizInfo.getHeadOfficeCode()%></li>
				<li>industryCode (산업코드) : <%=bizInfo.getIndustryCode()%></li>
				<li>establishCode (설립구분코드) : <%=bizInfo.getEstablishCode()%></li>
				<li>establishDate (설립일자) : <%=bizInfo.getEstablishDate()%></li>
				<li>CEOName (대표자명) : <%=bizInfo.getCEOName()%></li>
				<li>workPlaceCode (사업장구분코드): <%=bizInfo.getWorkPlaceCode()%></li>
				<li>addrCode (주소구분코드) : <%=bizInfo.getAddrCode()%></li>
				<li>zipCode (우편번호) : <%=bizInfo.getZipCode()%></li>
				<li>addr (주소) : <%=bizInfo.getAddr()%></li>
				<li>addrDetail (상세주소) : <%=bizInfo.getAddrDetail()%></li>
				<li>enAddr (영문주소) : <%=bizInfo.getEnAddr()%></li>
				<li>bizClass (업종) : <%=bizInfo.getBizClass()%></li>
				<li>bizType (업태) : <%=bizInfo.getBizType()%></li>
				<li>result (결과코드) : <%=bizInfo.getResult()%></li>
				<li>resultMessage (결과메시지) : <%=bizInfo.getResultMessage()%></li>
				<li>closeDownTaxType (사업자과세유형) : <%=bizInfo.getCloseDownTaxType()%></li>
				<li>closeDownTaxTypeDate (과세유형전환일자):<%=bizInfo.getCloseDownTaxTypeDate()%></li>
				<li>closeDownState (휴폐업상태) : <%=bizInfo.getCloseDownState()%></li>
				<li>closeDownStateDate (휴폐업일자) : <%=bizInfo.getCloseDownStateDate()%></li>
			</ul>

		</fieldset>
	</div>
</body>
</html>
