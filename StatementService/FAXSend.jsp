<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
    /*
     * 전자명세서를 팩스로 전송하는 함수로, 팝빌에 데이터를 저장하는 과정이 없습니다.
     * 팝빌 사이트 [ 팩스 > 결과 > 전송결과 ] 메뉴에서 전송결과를 확인할 수 있습니다.
     * - https://developers.popbill.com/reference/statement/java/api/etc#FAXSend
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 전자명세서 정보
    Statement statement = new Statement();

    // 전자명세서 문서 유형, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    statement.setItemCode((short) 121);

    // 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    statement.setMgtKey("20250711-JSP001");

    // 맞춤양식 코드, 미기재시 기본양식으로 처리
    statement.setFormCode("");

    // 작성일자, 형태 yyyyMMdd
    statement.setWriteDate("20250711");

    // 과세형태, {과세, 영세, 면세} 중 기재
    statement.setTaxType("과세");

    // 영수/청구, {영수, 청구, 없음} 중 기재
    statement.setPurposeType("영수");

    // 일련번호
    statement.setSerialNum("123");

    // 세액 합계
    statement.setTaxTotal("40000");

    // 공급가액 합계
    statement.setSupplyCostTotal("400000");

    // 합계금액. 공급가액 + 세액
    statement.setTotalAmount("440000");

    // 비고
    statement.setRemark1("비고1");
    statement.setRemark2("비고2");
    statement.setRemark3("비고3");

    /*********************************************************************
     *                                발신자 정보
     *********************************************************************/

    // 발신자 사업자번호
    statement.setSenderCorpNum("1234567890");

    // 발신자 종사업장 식별번호, 숫자 4자리, 필요시 기재
    statement.setSenderTaxRegID("");

    // 발신자 상호
    statement.setSenderCorpName("발신자 상호");

    // 발신자 대표자성명
    statement.setSenderCEOName("발신자 대표자성명");

    // 발신자 주소
    statement.setSenderAddr("발신자 주소");

    // 발신자 업태
    statement.setSenderBizType("업태");

    // 발신자 종목
    statement.setSenderBizClass("업종");

    // 발신자 성명
    statement.setSenderContactName("발신자 성명");

    // 발신자 부서명
    statement.setSenderDeptName("발신자 부서명");

    // 발신자 연락처
    statement.setSenderTEL("070-7070-0707");

    // 발신자 휴대전화
    statement.setSenderHP("010-000-2222");

    // 발신자 메일주소
    statement.setSenderEmail("test@test.com");

    // 발신자 팩스번호
    statement.setSenderFAX("");

    /*********************************************************************
     *                            수신자 정보
     *********************************************************************/

    // 수신자 사업자번호
    statement.setReceiverCorpNum("8888888888");

    // 수신자 종사업장 식별번호
    statement.setReceiverTaxRegID("");

    // 수신자 상호
    statement.setReceiverCorpName("수신자 상호");

    // 수신자 대표자성명
    statement.setReceiverCEOName("수신자 대표자성명");

    // 수신자 주소
    statement.setReceiverAddr("수신자 주소");

    // 수신자 업태
    statement.setReceiverBizType("수신자 업태");

    // 수신자 종목
    statement.setReceiverBizClass("수신자 종목");

    // 수신자 성명
    statement.setReceiverContactName("수신자 성명");

    // 수신자 부서명
    statement.setReceiverDeptName("수신자 부서명");

    // 수신자 연락처
    statement.setReceiverTEL("");

    // 수신자 휴대전화
    statement.setReceiverHP("");

    // 수신자 메일주소
    // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
    // 실제 거래처의 메일주소가 기재되지 않도록 주의
    statement.setReceiverEmail("");

    // 수신자 팩스번호
    statement.setReceiverFAX("");

    // 팝빌에 등록된 사업자등록증 첨부 여부 (true / false 중 택 1)
    // └ true = 첨부 , false = 미첨부(기본값)
    // - 팝빌 사이트 또는 인감 및 첨부문서 등록 팝업 URL (GetSealURL API) 함수를 이용하여 등록
    statement.setBusinessLicenseYN(false);

    // 팝빌에 등록된 통장사본 첨부 여부 (true / false 중 택 1)
    // └ true = 첨부 , false = 미첨부(기본값)
    // - 팝빌 사이트 또는 인감 및 첨부문서 등록 팝업 URL (GetSealURL API) 함수를 이용하여 등록
    statement.setBankBookYN(false);

    // 알림문자 전송 여부
    statement.setSmssendYN(false);

    // 추가속성
    // 전자명세서 종류별 추가할 속성을 "key", "value" 형식으로 값을 입력
    Map<String, String> propertyBag = new HashMap<String, String>();

    propertyBag.put("Balance", "15000");            // 전잔액
    propertyBag.put("Deposit", "5000");             // 입금액
    propertyBag.put("CBalance", "20000");           // 현잔액

    statement.setPropertyBag(propertyBag);

    /*********************************************************************
     *                            전자명세서 품목항목
     *********************************************************************/

    statement.setDetailList(new ArrayList<StatementDetail>());

    StatementDetail detail = new StatementDetail();    // 상세항목(품목) 배열

    detail.setSerialNum((short) 1);                    // 일련번호, 1부터 순차기재
    detail.setPurchaseDT("20250711");                  // 거래일자
    detail.setItemName("품명");                         // 품명
    detail.setSpec("규격");                             // 규격
    detail.setQty("1");                                // 수량
    detail.setUnit("200000");                          // 단가
    detail.setSupplyCost("200000");                    // 공급가액
    detail.setTax("20000");                            // 세액
    detail.setRemark("비고1");                          // 비고

    statement.getDetailList().add(detail);

    detail = new StatementDetail();                    // 상세항목(품목) 배열
    detail.setSerialNum((short) 2);                    // 일련번호 1부터 순차기재
    detail.setPurchaseDT("20250711");                  // 거래일자
    detail.setItemName("품명");                         // 품명
    detail.setSpec("규격");                             // 규격
    detail.setQty("1");                                // 수량
    detail.setUnit("200000");                          // 단가
    detail.setSupplyCost("200000");                    // 공급가액
    detail.setTax("20000");                            // 세액
    detail.setRemark("비고1");                          // 비고

    statement.getDetailList().add(detail);

    // 발신번호
    String sendNum = "07043042991";

    // 수신번호
    String receiveNum = "00111222";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    String receiptNum = null;

    try {

        receiptNum = statementService.FAXSend(CorpNum, statement, sendNum, receiveNum, UserID);

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
                <legend>전<%=request.getRequestURI()%></legend>
                <ul>
                    <li>receiptNum(팩스전송 접수번호) : <%=receiptNum%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
