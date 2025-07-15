<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTTaxinvoiceSummary"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 홈택스에서 수집된 전자세금계산서 매입/매출 내역의 합계정보를 제공합니다.
     * - 합계정보 - 수집 건수, 공급가액 합계, 세액 합계, 총계 (공급가액 합계+세액 합계)
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/search#Summary
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 작업아이디
    String jobID = "";

    // 세금계산서 문서형태 ("N" 와 "M" 중 선택, 다중 선택 가능)
    // └ N = 일반 , M = 수정
    // - 미입력 시 전체조회
    String[] Type = {"N", "M"};

    // 과세형태 ("T" , "N" , "Z" 중 선택, 다중 선택 가능)
    // └ T = 과세, N = 면세, Z = 영세
    // - 미입력 시 전체조회
    String[] TaxType = {"T", "Z", "N"};

    // 영수/청구 ("R" , "C", "N" 중 선택, 다중 선택 가능)
    // └ R = 영수, C = 청구, N = 없음
    // - 미입력 시 전체조회
    String[] PurposeType = {"R", "C", "N"};

    // 종사업장번호 유무 (null , "0" , "1" 중 택 1)
    // - null = 전체 , 0 = 없음, 1 = 있음
    String TaxRegIDYN = null;

    // 종사업장번호의 주체 ("S" , "B" , "T" 중 택 1)
    // └ S = 공급자 , B = 공급받는자 , T = 수탁자
    // - 미입력시 전체조회
    String TaxRegIDType = "S";

    // 종사업장번호
    // 다수기재시 콤마(",")로 구분하여 구성 ex ) "0001,0002"
    // - 미입력시 전체조회
    String TaxRegID = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 조회 검색어, 거래처 상호 / 사업자번호 (사업자) / 주민등록번호 (개인) / "9999999999999" (외국인) 중 검색하고자 하는 정보 입력
    // - 사업자번호 / 주민등록번호는 하이픈('-')을 제외한 숫자만 입력
    // - 미입력시 전체조회
    String searchString = "";

    HTTaxinvoiceSummary result = null;

    try {

        result = htTaxinvoiceService.summary(CorpNum, jobID, Type, TaxType, PurposeType,
                TaxRegIDYN, TaxRegIDType, TaxRegID, UserID, searchString);

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
                <li>count (수집 건수) : <%= result.getCount() %></li>
                <li>supplyCostTotal (공급가액 합계) : <%= result.getSupplyCostTotal() %></li>
                <li>taxTotal (세액 합계) : <%= result.getTaxTotal() %></li>
                <li>amountTotal (총계) : <%= result.getAmountTotal() %></li>
            </ul>
        </fieldset>
    </div>
    </body>
</html>
