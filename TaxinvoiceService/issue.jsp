<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.IssueResponse"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
    /*
     * "임시저장" 또는 "(역)발행대기" 상태의 세금계산서를 발행(전자서명)하며, "발행완료" 상태로 처리합니다. [참고] 팝빌 국세청 전송 정책
     * "발행완료"된 전자세금계산서는 국세청 전송 이전에 [CancelIssue – 발행취소] 함수로 국세청 신고 대상에서 제외할 수 있습니다.
     * 세금계산서 발행을 위해서 공급자의 인증서가 팝빌 인증서버에 사전등록 되어야 합니다.
     * - 위수탁발행의 경우, 수탁자의 인증서 등록이 필요합니다.
     * 세금계산서 발행시 포인트가 과금되며, 공급받는자에게 발행 메일이 발송됩니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/issue#Issue
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문서번호 유형 (SELL-매출, BUY-매입, TRUSTEE-위수탁)
    MgtKeyType keyType = MgtKeyType.SELL;

    // 파트너가 할당한 문서번호
    String mgtKey = "20250711-JSP002";

    // 세금계산서 상태 이력을 관리하기 위한 메모
    String memo = "발행 메모";

    // 세금계산서 발행 안내메일 제목
    String emailSubject = "";

    // 지연발행 가능여부 (true / false 중 택 1)
    // └ true = 가능 , false = 불가능
    // - 미입력 시 기본값 false 처리
    // - 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
    // - 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을 true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
    Boolean forceIssue = false;

    // 팝빌회원 아이디
    String UserID = "testkorea";

    IssueResponse CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.issue(CorpNum, keyType, mgtKey, memo, emailSubject, forceIssue, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }

%>
    <div id="content">
        <p class="heading1">Response</p>
        <br/>
        <fieldset class="fieldset1">
            <legend><%=request.getRequestURI()%></legend>
            <ul>
                <li>code (응답코드) : <%=CheckResponse.getCode()%></li>
                <li>message (응답메시지) : <%=CheckResponse.getMessage()%></li>
                <li>ntsConfirmNum (국세청승인번호) : <%=CheckResponse.getNtsConfirmNum()%></li>
            </ul>
        </fieldset>
    </div>
</html>