<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>예금주조회 SDK JSP Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.DepositorCheckInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 1건의 예금주실명을 조회합니다.
     * - https://docs.popbill.com/accountcheck/java/api#CheckDepositorInfo
     */

    DepositorCheckInfo depositorCheckInfo = null;

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    /*
     * 조회할 기관코드
     * - https://docs.popbill.com/accountcheck/?lang=java#BankCodeList
     */
    String BankCode = "";

    // 조회할 기관의 계좌번호 (하이픈 '-' 제외 8자리 이상 14자리 이하)
    String AccountNumber = "";

    // 등록번호 유형 ( P / B 중 택 1 , P = 개인, B = 사업자)
    String IdentityNumType ="";

    /*
     * 등록번호
     * - IdentityNumType 값이 "B" 인 경우 (사업자번호(10)자리 입력)
     * - IdentityNumType 값이 "P" 인 경우 (생년월일(6)자리 입력 (형식 : YYMMDD))
     * 하이픈 '-' 제외하고 입력
     */
    String IdentityNum = "";

    try{
        depositorCheckInfo = accountCheckService.CheckDepositorInfo(testCorpNum, BankCode, AccountNumber, IdentityNumType, IdentityNum);

    } catch (PopbillException pe){
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }

%>

    <body>
        <div id="content">
            <p class="heading1">예금주조회 API SDK - JSP Example.</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>에금주조회 결과</legend>
                <ul>
                    <li>bankCode (기관코드) : <%=depositorCheckInfo.getBankCode()%></li>
                    <li>accountNumber (계좌번호) : <%=depositorCheckInfo.getAccountNumber()%></li>
                    <li>accountName (예금주 성명) : <%=depositorCheckInfo.getAccountName()%></li>
                    <li>identityNumType (등록번호 유형) : <%=depositorCheckInfo.getIdentityNumType()%></li>
                    <li>identityNum (등록번호) : <%=depositorCheckInfo.getIdentityNum()%></li>
                    <li>checkDate (확인일시) : <%=depositorCheckInfo.getCheckDate()%></li>
                    <li>result (응답코드) : <%=depositorCheckInfo.getResult()%></li>
                    <li>resultMessage (응답메시지) : <%=depositorCheckInfo.getResultMessage()%></li>
                </ul>

            </fieldset>
        </div>
    </body>
</html>
