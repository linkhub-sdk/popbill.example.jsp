<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CashbillInfo"%>
<%@page import="com.popbill.api.cashbill.CBSearchResult"%>

<%
    /*
     * 검색조건에 해당하는 현금영수증을 조회합니다. (최대 조회기간 : 6개월)
     * 현금영수증 상태코드 [https://developers.popbill.com/reference/cashbill/java/response-code]
     * - https://developers.popbill.com/reference/cashbill/java/api/info#Search
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 검색일자 유형 ("R" , "T" , "I" 중 택 1)
    // └ R = 등록일자 , T = 거래일자 , I = 발행일자
    String DType = "T";

    // 검색 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20250711";

    // 검색 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20250731";

    // 현금영수증 상태코드 (2,3번째 자리에 와일드카드(*) 사용 가능)
    // - 미입력시 전체조회
    String[] State = { "3**"};

    // 현금영수증 문서형태 ("N" , "C" 중 선택, 다중 선택 가능)
    // - N = 일반 현금영수증 , C = 취소 현금영수증
    // - 미입력시 전체조회
    String[] TradeType = { "N", "C" };

    // 거래구분 ("P" , "C" 중 선택, 다중 선택 가능)
    // - P = 소득공제용 , C = 지출증빙용
    // - 미입력시 전체조회
    String[] TradeUsage = { "P", "C" };

    // 거래유형 ("N" , "B" , "T" 중 선택, 다중 선택 가능)
    // - N = 일반 , B = 도서공연 , T = 대중교통
    // - 미입력시 전체조회
    String[] TradeOpt = { "N", "B", "T" };

    // 과세형태 ("T" , "N" 중 선택, 다중 선택 가능)
    // - T = 과세 , N = 비과세
    // - 미입력시 전체조회
    String[] TaxationType = { "T", "N" };

    // 조회 검색어(식별번호) (미기재시 전체조회)
    String QString = "";

    // 목록 페이지번호
    int Page = 1;

    // 페이지당 표시할 목록 건수, 최대 1000건
    int PerPage = 20;

    // 조회 기준일자 유형을 기준으로 하는 목록 정렬 방향, A-오름차순, D-내림차순
    String Order = "D";

    // 가맹점 종사업장번호
    // └ 다수건 검색시 콤마(",")로 구분. 예) "1234,1000"
    // └ 미입력시 전제조회
    String FranchiseTaxRegID = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    CBSearchResult searchResult = null;

    try {

        searchResult = cashbillService.search(CorpNum, DType, SDate, EDate, State,
                TradeType, TradeUsage, TaxationType, TradeOpt, QString, Page, PerPage, Order, FranchiseTaxRegID, UserID);

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
                <ul>
                    <li>code (응답코드) : <%= searchResult.getCode()%></li>
                    <li>message (응답메시지) : <%= searchResult.getMessage()%></li>
                    <li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
                    <li>perPage (페이지당 목록 건수) : <%= searchResult.getPerPage()%> </li>
                    <li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
                </ul>
                <%
                    CashbillInfo cashbillInfo = null;

                for ( int i = 0; i < searchResult.getList().size(); i++ ) {
                    cashbillInfo = searchResult.getList().get(i);
                %>
                <fieldset class="fieldset2">
                    <legend>현금영수증 상태/요약정보 [ <%=i+1%> / <%=searchResult.getList().size()%> ] </legend>
                    <ul>
                        <li>itemKey (팝빌에서 현금영수증 관리 목적으로 할당한 식별번호) : <%= cashbillInfo.getItemKey()%></li>
                        <li>mgtKey (문서번호) : <%= cashbillInfo.getMgtKey()%></li>
                        <li>tradeDate (거래일자) : <%= cashbillInfo.getTradeDate()%></li>
                        <li>tradeDT (거래일시) : <%= cashbillInfo.getTradeDT()%></li>
                        <li>tradeType (문서형태) : <%= cashbillInfo.getTradeType()%></li>
                        <li>tradeUsage (거래구분) : <%= cashbillInfo.getTradeUsage()%></li>
                        <li>tradeOpt (거래유형) : <%= cashbillInfo.getTradeOpt()%></li>
                        <li>taxationType (과세형태) : <%= cashbillInfo.getTaxationType()%></li>
                        <li>totalAmount (거래금액) : <%= cashbillInfo.getTotalAmount()%></li>
                        <li>supplyCost (공급가액) : <%= cashbillInfo.getSupplyCost()%></li>
                        <li>tax (부가세) : <%= cashbillInfo.getTax()%></li>
                        <li>serviceFee (봉사료) : <%= cashbillInfo.getServiceFee()%></li>
                        <li>issueDT (발행일시) : <%= cashbillInfo.getIssueDT()%></li>
                        <li>regDT (등록일시) : <%= cashbillInfo.getRegDT()%></li>
                        <li>stateCode (상태코드) : <%= cashbillInfo.getStateCode()%></li>
                        <li>stateDT (상태 변경일시) : <%= cashbillInfo.getStateDT()%></li>
                        <li>identityNum (식별번호) : <%= cashbillInfo.getIdentityNum()%></li>
                        <li>itemName (주문상품명) : <%= cashbillInfo.getItemName()%></li>
                        <li>orderNumber (주문번호) : <%= cashbillInfo.getOrderNumber()%></li>
                        <li>email (구매자 이메일) : <%= cashbillInfo.getEmail()%></li>
                        <li>hp (구매자 휴대폰) : <%= cashbillInfo.getHp()%></li>
                        <li>customerName (구매자(고객) 성명) : <%= cashbillInfo.getCustomerName()%></li>
                        <li>confirmNum (국세청승인번호) : <%= cashbillInfo.getConfirmNum()%></li>
                        <li>orgConfirmNum (당초 국세청승인번호) : <%= cashbillInfo.getOrgConfirmNum()%></li>
                        <li>orgTradeDate (당초 거래일자) : <%= cashbillInfo.getOrgTradeDate()%></li>
                        <li>ntssendDT (국세청 전송일시) : <%= cashbillInfo.getNtssendDT()%></li>
                        <li>ntsresultDT (국세청 처리결과 수신일시) : <%= cashbillInfo.getNtsresultDT()%></li>
                        <li>ntsresultCode (국세청 결과코드) : <%= cashbillInfo.getNtsresultCode()%></li>
                        <li>ntsresultMessage (국세청 결과메시지) : <%= cashbillInfo.getNtsresultMessage()%></li>
                        <li>printYN (인쇄여부) : <%= cashbillInfo.isPrintYN()%></li>
                        <li>interOPYN (연동문서 여부) : <%= cashbillInfo.isInterOPYN()%></li>
                    </ul>
                </fieldset>
                <%
                    }
                %>
            </fieldset>
        </div>
    </body>
</html>