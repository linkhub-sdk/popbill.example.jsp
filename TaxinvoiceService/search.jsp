<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.TISearchResult"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceInfo"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
    /*
     * 검색조건에 해당하는 세금계산서를 조회합니다. (조회기간 단위 : 최대 6개월)
     * - https://docs.popbill.com/taxinvoice/java/api#Search
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 일자 유형 ("R" , "W" , "I" 중 택 1)
    // └ R = 등록일자 , W = 작성일자 , I = 발행일자
    String DType = "W";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20211201";

    // 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20220104";

    // 상태코드 배열 (2,3번째 자리에 와일드카드(*) 사용 가능)
    // - 미입력시 전체조회
    String[] State = {"3**", "6**"};

    // 문서 유형 배열 ("N" , "M" 중 선택, 다중 선택 가능)
    // - N = 일반 세금계산서 , M = 수정 세금계산서
    // - 미입력시 전체조회
    String[] Type = {"N", "M"};

    // 과세형태 배열 ("T" , "N" , "Z" 중 선택, 다중 선택 가능)
    // - T = 과세 , N = 면세 , Z = 영세
    // - 미입력시 전체조회
    String[] TaxType = {"T", "N", "Z"};

    // 발행형태 배열 ("N" , "R" , "T" 중 선택, 다중 선택 가능)
    // - N = 정발행 , R = 역발행 , T = 위수탁발행
    // - 미입력시 전체조회
    String[] IssueType = {"N", "R", "T"};

    // 등록유형 배열 ("P" , "H" 중 선택, 다중 선택 가능)
    // - P = 팝빌, H = 홈택스 또는 외부ASP
    // - 미입력시 전체조회
    String[] RegType = {"P", "H"};

    // 공급받는자 휴폐업상태 배열 ("N" , "0" , "1" , "2" , "3" , "4" 중 선택, 다중 선택 가능)
    // - N = 미확인 , 0 = 미등록 , 1 = 사업 , 2 = 폐업 , 3 = 휴업 , 4 = 확인실패
    // - 미입력시 전체조회
    String[] CloseDownState = {"N", "0", "1", "2", "3"};

    // 지연발행 여부 (null , true , false 중 택 1)
    // - null = 전체조회 , true = 지연발행 , false = 정상발행
    Boolean LateOnly = null;

    // 종사업장번호의 주체 ("S" , "B" , "T" 중 택 1)
    // └ S = 공급자 , B = 공급받는자 , T = 수탁자
    // - 미입력시 전체조회
    String TaxRegIDType = "S";

    // 종사업장번호
    // 다수기재시 콤마(",")로 구분하여 구성 ex ) "0001,0002"
    // - 미입력시 전체조회
    String TaxRegID = "";

    // 종사업장번호 유무 (null , "0" , "1" 중 택 1)
    // - null = 전체 , 0 = 없음, 1 = 있음
    String TaxRegIDYN = "";

    // 거래처 상호 / 사업자번호 (사업자) / 주민등록번호 (개인) / "9999999999999" (외국인) 중 검색하고자 하는 정보 입력
    // - 사업자번호 / 주민등록번호는 하이픈('-')을 제외한 숫자만 입력
    // - 미입력시 전체조회
    String QString = "";

    // 문서번호 또는 국세청 승인번호
    // - 미입력시 전체조회
    String MgtKey = "";

    // 페이지번호
    int Page = 1;

    // 페이지당 검색개수, 최대 1000건
    int PerPage = 30;

    // 정렬방향, A-오름차순, D-내림차순
    String Order = "D";

    // 연동문서 여부 (null , "0" , "1" 중 택 1)
    // - null = 전체조회 , 0 = 일반문서 , 1 = 연동문서
    // - 일반문서 : 세금계산서 작성 시 API가 아닌 팝빌 사이트를 통해 등록한 문서
    // - 연동문서 : 세금계산서 작성 시 API를 통해 등록한 문서
    String InterOPYN = "";

    TISearchResult searchResult = new TISearchResult();

    try {
        searchResult = taxinvoiceService.Search(testCorpNum, MgtKeyType.SELL, DType,
                SDate, EDate, State, Type, TaxType, IssueType, LateOnly, TaxRegIDType, TaxRegID,
                TaxRegIDYN, QString, Page, PerPage, Order, InterOPYN, RegType, CloseDownState, MgtKey);

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
                <legend>세금계산서 목록조회</legend>
                <ul>
                    <li>code (응답코드) : <%= searchResult.getCode()%></li>
                    <li>message (응답메시지) : <%= searchResult.getMessage()%></li>
                    <li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
                    <li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
                    <li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
                </ul>
                    <%
                        TaxinvoiceInfo taxinvoiceInfo = null;

                        for ( int i = 0; i< searchResult.getList().size(); i++ ) {
                            taxinvoiceInfo = searchResult.getList().get(i);
                    %>

                        <fieldset class="fieldset2">
                            <legend>세금계산서 상태/요약정보 [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
                                <ul>
                                    <li>itemKey (팝빌번호) : <%= taxinvoiceInfo.getItemKey()%></li>
                                    <li>taxType (과세형태) : <%= taxinvoiceInfo.getTaxType()%></li>
                                    <li>writeDate (작성일자) : <%= taxinvoiceInfo.getWriteDate()%></li>
                                    <li>supplyCostTotal (공급가액 합계) : <%= taxinvoiceInfo.getSupplyCostTotal() %></li>
                                    <li>taxTotal (세액 합계) : <%= taxinvoiceInfo.getTaxTotal() %></li>
                                    <li>regDT (임시저장 일자) : <%= taxinvoiceInfo.getRegDT()%> </li>
                                    <li>lateIssueYN (지연발행 여부) : <%= taxinvoiceInfo.getLateIssueYN() %></li>
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

                                    <li>purposeType (영수/청구) : <%= taxinvoiceInfo.getPurposeType() %></li>
                                    <li>modifyCode (수정사유코드) : <%= taxinvoiceInfo.getModifyCode() %></li>
                                    <li>issueType (발행형태) : <%= taxinvoiceInfo.getIssueType() %></li>
                                    <li>issueDT (발행일시) : <%= taxinvoiceInfo.getIssueDT() %></li>

                                    <li>stateCode (상태코드) : <%= taxinvoiceInfo.getStateCode() %></li>
                                    <li>stateDT (상태 변경일시) : <%= taxinvoiceInfo.getStateDT() %></li>
                                    <li>stateMemo (상태메모) : <%= taxinvoiceInfo.getStateMemo() %></li>
                                    <li>openYN (개봉 여부) : <%= taxinvoiceInfo.isOpenYN() %></li>
                                    <li>openDT (개봉 일시) : <%= taxinvoiceInfo.getOpenDT() %></li>
                                    <li>ntsresult (국세청 전송결과) : <%= taxinvoiceInfo.getNTSResult() %></li>
                                    <li>ntsconfirmNum (국세청 승인번호) : <%= taxinvoiceInfo.getNTSConfirmNum() %></li>
                                    <li>ntssendDT (국세청 전송일시) : <%= taxinvoiceInfo.getNTSSendDT() %></li>
                                    <li>ntsresultDT (국세청 결과 수신일시) : <%= taxinvoiceInfo.getNTSResultDT() %></li>
                                    <li>ntssendErrCode (전송실패 사유코드) : <%= taxinvoiceInfo.getNTSSendErrCode() %></li>
                                </ul>
                        </fieldset>
                    <%
                        }
                    %>
            </fieldset>
         </div>
    </body>
</html>
