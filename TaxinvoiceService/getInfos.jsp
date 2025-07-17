<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceInfo"%>

<%
    /*
     * 다수건의 세금계산서 상태 및 요약 정보를 확인합니다. (1회 호출에 최대 1,000건 확인 가능)
     * 리턴값 TaxinvoiceInfo 의 변수 'stateCode'를 통해 세금계산서의 상태코드를 확인합니다. [참고] 팝빌 상태코드
     * - 세금계산서 상태코드 [https://developers.popbill.com/reference/taxinvoice/java/response-code#state-code]
     * - https://developers.popbill.com/reference/taxinvoice/java/api/info#GetInfos
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문서번호 유형 (SELL-매출, BUY-매입, TRUSTEE-위수탁)
    MgtKeyType keyType = MgtKeyType.SELL;

    // 문서번호 목록 (최대 1000건)
    String[] MgtKeyList = new String[]{"20250711-JSP001", "20250711-JSP002"};

    // 팝빌회원 아이디
    String UserID = "testkorea";

    TaxinvoiceInfo[] taxinvoiceInfos = null;

    try {

        taxinvoiceInfos = taxinvoiceService.getInfos(CorpNum, keyType, MgtKeyList, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>

    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                    <%
                        TaxinvoiceInfo taxinvoiceInfo = null;
                        for ( int i = 0; i < taxinvoiceInfos.length; i++ ) {
                            taxinvoiceInfo = taxinvoiceInfos[i];
                    %>
                        <fieldset class="fieldset2">
                            <legend>세금계산서 상세/요약 정보 [<%=i+1%>/<%=taxinvoiceInfos.length%>]</legend>
                            <ul>
                                <li>itemKey (팝빌에서 할당한 식별번호) : <%= taxinvoiceInfo.getItemKey()%></li>
                                <li>taxType (과세형태) : <%= taxinvoiceInfo.getTaxType()%></li>
                                <li>writeDate (작성일자) : <%= taxinvoiceInfo.getWriteDate()%></li>
                                <li>regDT (임시저장 일시) : <%= taxinvoiceInfo.getRegDT()%> </li>
                                <li>issueType (발행형태) : <%= taxinvoiceInfo.getIssueType() %></li>
                                <li>supplyCostTotal (공급가액 합계) : <%= taxinvoiceInfo.getSupplyCostTotal() %></li>
                                <li>taxTotal (세액 합계) : <%= taxinvoiceInfo.getTaxTotal() %></li>
                                <li>purposeType (영수/청구) : <%= taxinvoiceInfo.getPurposeType() %></li>
                                <li>issueDT (발행일시) : <%= taxinvoiceInfo.getIssueDT() %></li>
                                <li>lateIssueYN (지연발행 여부) : <%= taxinvoiceInfo.getLateIssueYN() %></li>
                                <li>openYN (개봉 여부) : <%= taxinvoiceInfo.isOpenYN() %></li>
                                <li>openDT (개봉일시) : <%= taxinvoiceInfo.getOpenDT() %></li>
                                <li>stateMemo (상태메모) : <%= taxinvoiceInfo.getStateMemo() %></li>
                                <li>stateCode (상태코드) : <%= taxinvoiceInfo.getStateCode() %></li>
                                <li>stateDT (상태 변경일시) : <%= taxinvoiceInfo.getStateDT() %></li>
                                <li>ntsconfirmNum (국세청승인번호) : <%= taxinvoiceInfo.getNTSConfirmNum() %></li>
                                <li>ntsresult (국세청 전송결과) : <%= taxinvoiceInfo.getNTSResult() %></li>
                                <li>ntssendDT (국세청 전송일시) : <%= taxinvoiceInfo.getNTSSendDT() %></li>
                                <li>ntsresultDT (국세청 결과 수신일시) : <%= taxinvoiceInfo.getNTSResultDT() %></li>
                                <li>ntssendErrCode (국세청 결과코드) : <%= taxinvoiceInfo.getNTSSendErrCode() %></li>
                                <li>modifyCode (수정세금계산서 발행시 입력한 사유코드) : <%= taxinvoiceInfo.getModifyCode() %></li>
                                <li>interOPYN (연동문서 여부) : <%= taxinvoiceInfo.getInterOPYN() %></li>

                                <li>invoicerCorpName (공급자 상호) : <%= taxinvoiceInfo.getInvoicerCorpName()%></li>
                                <li>invoicerCorpNum (공급자 사업자번호) : <%= taxinvoiceInfo.getInvoicerCorpNum() %> </li>
                                <li>invoicerMgtKey (공급자 문서번호) : <%= taxinvoiceInfo.getInvoicerMgtKey() %></li>
                                <li>invoicerPrintYN (공급자 인쇄여부) : <%= taxinvoiceInfo.isInvoicerPrintYN() %></li>

                                <li>invoiceeCorpName (공급받는자 상호) : <%= taxinvoiceInfo.getInvoiceeCorpName() %></li>
                                <li>invoiceeCorpNum (공급받는자 사업자번호) : <%= taxinvoiceInfo.getInvoiceeCorpNum() %></li>
                                <li>invoiceeMgtKey (공급받는자 문서번호) : <%= taxinvoiceInfo.getInvoiceeMgtKey() %> </li>
                                <li>invoiceePrintYN (공급받는자 인쇄여부) : <%= taxinvoiceInfo.isInvoiceePrintYN() %></li>
                                <li>closeDownState (공급받는자 휴폐업상태) : <%= taxinvoiceInfo.getCloseDownState() %></li>
                                <li>closeDownStateDate (공급받는자 휴폐업일자) : <%= taxinvoiceInfo.getCloseDownStateDate() %></li>

                                <li>trusteeCorpName (수탁자 상호) : <%= taxinvoiceInfo.getTrusteeCorpName() %></li>
                                <li>trusteeCorpNum (수탁자 사업자번호) : <%= taxinvoiceInfo.getTrusteeCorpNum() %></li>
                                <li>trusteeMgtKey (수탁자 문서번호) : <%= taxinvoiceInfo.getTrusteeMgtKey() %></li>
                                <li>trusteePrintYN (수탁자 인쇄여부) : <%= taxinvoiceInfo.isTrusteePrintYN() %></li>
                            </ul>
                        </fieldset>
                    <%
                        }
                    %>
            </fieldset>
        </div>
    </body>
</html>
