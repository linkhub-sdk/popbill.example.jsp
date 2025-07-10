<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.StatementInfo"%>

<%
    /*
     * 다수건의 전자명세서 상태 및 요약정보 확인합니다. (1회 호출 시 최대 1,000건 확인 가능)
     * 전자명세서 상태코드 [https://developers.popbill.com/reference/statement/java/response-code#state-code]
     * - https://developers.popbill.com/reference/statement/java/api/info#GetInfos
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 전자명세서 문서번호 배열(최대 1000건)
    String[] MgtKeyList = new String[] {"20230102-JSP001", "20230102-JSP002"};

    // 팝빌회원 아이디
    String UserID = "testkorea";

    StatementInfo[] statementInfos = null;

    try {

        statementInfos = statementService.getInfos(testCorpNum, itemCode, MgtKeyList, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
    <div id="content">
        <p class="heading1">Response </p>
        <br/>
        <fieldset class="fieldset1">
            <legend><%=request.getRequestURI()%></legend>
            <%
                StatementInfo statementInfo = null;
                for(int i=0; i < statementInfos.length; i++){
                    statementInfo = statementInfos[i];
            %>
            <fieldset class="fieldset2">
                <legend>StatementInfo [ <%=i+1%> / <%=statementInfos.length%> ]</legend>
                <ul>
                    <li>itemCode (전자명세서 문서 유형) : <%= statementInfo.getItemCode()%></li>
                    <li>itemKey (팝빌번호) : <%= statementInfo.getItemKey()%></li>
                    <li>invoiceNum (팝빌 승인번호) : <%= statementInfo.getInvoiceNum()%></li>
                    <li>mgtKey (문서번호) : <%= statementInfo.getMgtKey()%></li>
                    <li>taxType (과세형태) : <%= statementInfo.getTaxType()%></li>
                    <li>writeDate (작성일자) : <%= statementInfo.getWriteDate()%></li>
                    <li>regDT (임시저장일시) : <%= statementInfo.getRegDT()%></li>
                    <li>senderCorpName (발신자 상호) : <%= statementInfo.getSenderCorpName()%></li>
                    <li>senderCorpNum (발신자 사업자번호) : <%= statementInfo.getSenderCorpNum()%></li>
                    <li>senderPrintYN (발신자 인쇄여부) : <%= statementInfo.isSenderPrintYN()%></li>
                    <li>receiverCorpName (수신자 상호) : <%= statementInfo.getReceiverCorpName()%></li>
                    <li>receiverCorpNum (수신자 사업자번호) : <%= statementInfo.getReceiverCorpNum()%></li>
                    <li>receiverPrintYN (수신자 인쇄여부) : <%= statementInfo.isReceiverPrintYN()%></li>
                    <li>supplyCostTotal (공급가액 합계) : <%= statementInfo.getSupplyCostTotal()%></li>
                    <li>taxTotal (세액 합계) : <%= statementInfo.getTaxTotal()%></li>
                    <li>purposeType (영수/청구) : <%= statementInfo.getPurposeType()%></li>
                    <li>issueDT (발행일시) : <%= statementInfo.getIssueDT()%></li>
                    <li>stateCode (상태코드) : <%= statementInfo.getStateCode()%></li>
                    <li>stateDT (상태 변경일시) : <%= statementInfo.getStateDT()%></li>
                    <li>stateMemo (상태메모) : <%= statementInfo.getStateMemo()%></li>
                    <li>openYN (개봉여부) : <%= statementInfo.isOpenYN()%></li>
                    <li>openDT (개봉 일시) : <%= statementInfo.getOpenDT()%></li>
                </ul>
            </fieldset>
            <%
                }
            %>
        </fieldset>
    </div>
    </body>
</html>
