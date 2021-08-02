<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 계좌의 정액제 해지를 요청합니다.
     * - https://docs.popbill.com/easyfinbank/java/api#CloseBankAccount
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // [필수] 은행코드
    // 산업은행-0002 / 기업은행-0003 / 국민은행-0004 /수협은행-0007 / 농협은행-0011 / 우리은행-0020
    // SC은행-0023 / 대구은행-0031 / 부산은행-0032 / 광주은행-0034 / 제주은행-0035 / 전북은행-0037
    // 경남은행-0039 / 새마을금고-0045 / 신협은행-0048 / 우체국-0071 / KEB하나은행-0081 / 신한은행-0088 /씨티은행-0027
    String BankCode = "0020";

    // [필수] 계좌번호 하이픈('-') 제외
    String AccountNumber = "1002057875456";

    // [필수] 해지유형, “일반”, “중도” 중 선택 기재
    // 일반해지 – 이용중인 정액제 사용기간까지 이용후 정지
    // 중도해지 – 요청일 기준으로 정지, 정액제 잔여기간은 일할로 계산되어 포인트 환불 (무료 이용기간 중 중도해지 시 전액 환불)
    String CloseType = "중도";


    Response saveResponse = null;

    try {

        saveResponse = easyFinBankService.closeBankAccount(testCorpNum, BankCode, AccountNumber, CloseType);

    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response </p>
            <br/>
            <fieldset class="fieldset1">
                <legend>정액제 해지요청</legend>
                    <ul>
                        <li>Response.code : <%=saveResponse.getCode()%></li>
                        <li>Response.message : <%=saveResponse.getMessage()%></li>
                    </ul>
            </fieldset>
        </div>
    </body>
</html>
