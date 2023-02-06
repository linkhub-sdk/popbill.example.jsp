<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.CBIssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
    /*
     * 작성된 (부분)취소 현금영수증 데이터를 팝빌에 저장과 동시에 발행하여 "발행완료" 상태로 처리합니다.
     * - 취소 현금영수증의 금액은 원본 금액을 넘을 수 없습니다.
     * - 현금영수증 국세청 전송 정책 [https://developers.popbill.com/guide/cashbill/java/introduction/policy-of-send-to-nts]
     * - 취소 현금영수증 발행 시 구매자 메일주소로 발행 안내 베일이 전송되니 유의하시기 바랍니다.
     * - https://developers.popbill.com/reference/cashbill/java/api/issue#RevokeRegistIssue
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 현금영수증 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    String mgtKey = "20220217-JSP006";

    // 원본 현금영수증 국세청 승인번호 - 상태확인(getInfo API) 함수를 통해 confirmNum 값 기재
    String orgConfirmNum = "TB0000387";

    // 원본 현금영수증 거래일자 - 상태확인(getInfo API) 함수를 통해 tradeDate 값 기재
    String orgTradeDate = "20220217";

    // 안내 문자 전송여부 , true / false 중 택 1
    // └ true = 전송 , false = 미전송
    // └ 원본 현금영수증의 구매자(고객)의 휴대폰번호 문자 전송
    Boolean smssendYN = false;

    // 발행메모
    String memo = "";

    // 현금영수증 취소유형 , true / false 중 택 1
    // └ true = 부분 취소 , false = 전체 취소
    // └ 미입력시 기본값 false 처리
    Boolean isPartCancel = true;

    // 취소사유 , 1 / 2 / 3 중 택 1
    // └ 1 = 거래취소 , 2 = 오류발급취소 , 3 = 기타
    // └ 미입력시 기본값 1 처리
    Integer cancelType = 1;

    // [취소] 공급가액
    // - 현금영수증 취소유형이 true 인 경우 취소할 공급가액 입력
    // - 현금영수증 취소유형이 false 인 경우 미입력
    String supplyCost = "3000";

    // [취소] 부가세
    // - 현금영수증 취소유형이 true 인 경우 취소할 부가세 입력
    // - 현금영수증 취소유형이 false 인 경우 미입력
    String tax = "300";

    // [취소] 봉사료
    // - 현금영수증 취소유형이 true 인 경우 취소할 봉사료 입력
    // - 현금영수증 취소유형이 false 인 경우 미입력
    String serviceFee = "0";

    // [취소] 거래금액 (공급가액+부가세+봉사료)
    // - 현금영수증 취소유형이 true 인 경우 취소할 거래금액 입력
    // - 현금영수증 취소유형이 false 인 경우 미입력
    String totalAmount = "3300";

    CBIssueResponse CheckResponse = null;

    try {

        CheckResponse = cashbillService.revokeRegistIssue(testCorpNum, mgtKey, orgConfirmNum, orgTradeDate, smssendYN,
                memo, isPartCancel, cancelType, supplyCost, tax, serviceFee, totalAmount);

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
                <legend>(부분)취소현금영수증 즉시발행</legend>
                <ul>
                    <li>Response.code : <%=CheckResponse.getCode()%></li>
                    <li>Response.message : <%=CheckResponse.getMessage()%></li>
                    <li>Response.confirmNum : <%=CheckResponse.getConfirmNum()%></li>
                    <li>Response.tradeDate : <%=CheckResponse.getTradeDate()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
