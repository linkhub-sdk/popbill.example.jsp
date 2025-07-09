<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
    /*
     * 전자명세서 1건의 상세정보 확인합니다.
     * - https://developers.popbill.com/reference/statement/java/api/info#GetDetailInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 전자명세서 문서번호
    String mgtKey = "20230102-JSP001";

    Statement statement = null;

    try {

        statement = statementService.getDetailInfo(testCorpNum, itemCode, mgtKey);

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
                <fieldset class="fieldset2">
                    <legend>StatementInfo</legend>
                    <ul>
                        <li>itemCode (전자명세서 문서 유형) : <%= statement.getItemCode()%></li>
                        <li>mgtKey (문서번호) : <%= statement.getMgtKey()%></li>
                        <li>invoiceNum (팝빌 승인번호) : <%= statement.getInvoiceNum()%></li>
                        <li>formCode (맞춤양식 코드) : <%= statement.getFormCode()%></li>
                        <li>writeDate (작성일자) : <%= statement.getWriteDate()%></li>
                        <li>taxType (과세형태) : <%= statement.getTaxType ()%></li>
                        <li>purposeType (영수/청구) : <%= statement.getPurposeType()%></li>
                        <li>serialNum (기재상 일련번호) : <%= statement.getSerialNum()%></li>
                        <li>taxTotal (세액 합계) : <%= statement.getTaxTotal()%></li>
                        <li>supplyCostTotal (공급가액 합계) : <%= statement.getSupplyCostTotal()%></li>
                        <li>totalAmount (합계금액) : <%= statement.getTotalAmount()%></li>
                        <li>remark1 (비고1) : <%= statement.getRemark1()%></li>
                        <li>remark2 (비고2) : <%= statement.getRemark2()%></li>
                        <li>remark3 (비고3) : <%= statement.getRemark3()%></li>

                        <li>senderCorpNum (발신자 사업자번호) : <%= statement.getSenderCorpNum()%></li>
                        <li>senderTaxRegID (발신자 종사업장 식별번호) : <%= statement.getSenderTaxRegID()%></li>
                        <li>senderCorpName (발신자 상호) : <%= statement.getSenderCEOName()%></li>
                        <li>senderCEOName (발신자 대표자성명) : <%= statement.getSenderCEOName()%></li>
                        <li>senderAddr (발신자 주소) : <%= statement.getSenderAddr()%></li>
                        <li>senderBizClass (발신자 종목) : <%= statement.getSenderBizClass()%></li>
                        <li>senderBizType (발신자 업태) : <%= statement.getSenderBizType()%></li>
                        <li>senderContactName (발신자 담당자성명) : <%= statement.getSenderContactName()%></li>
                        <li>senderTEL (발신자 연락처) : <%= statement.getSenderTEL()%></li>
                        <li>senderHP (발신자 휴대폰번호) : <%= statement.getSenderHP()%></li>
                        <li>senderEmail (발신자 메일주소) : <%= statement.getSenderEmail()%></li>

                        <li>receiverCorpNum (수신자 사업자번호) : <%= statement.getReceiverCorpNum()%></li>
                        <li>receiverTaxRegID (수신자 종사업장 식별번호) : <%= statement.getReceiverTaxRegID()%></li>
                        <li>receiverCorpName (수신자 상호) : <%= statement.getReceiverCorpName()%></li>
                        <li>receiverCEOName (수신자 대표자성명) : <%= statement.getReceiverCEOName()%></li>
                        <li>receiverAddr (수신자 주소) : <%= statement.getReceiverAddr()%></li>
                        <li>receiverBizClass (수신자 종목) : <%= statement.getReceiverBizClass()%></li>
                        <li>receiverBizType (수신자 업태) : <%= statement.getReceiverBizType()%></li>
                        <li>receiverContactName (수신자 성명) : <%= statement.getReceiverContactName()%></li>
                        <li>receiverTEL (수신자 연락처) : <%= statement.getReceiverTEL()%></li>
                        <li>receiverHP (수신자 휴대전화) : <%= statement.getReceiverHP()%></li>
                        <li>receiverEmail (수신자 메일주소) : <%= statement.getReceiverEmail()%></li>

                        <li>businessLicenseYN (사업자등록증 첨부여부) : <%= statement.getBusinessLicenseYN()%></li>
                        <li>bankBookYN (통장사본 첨부여부) : <%= statement.getBankBookYN()%></li>
                        <li>smssendYN (알림문자 전송여부) : <%= statement.getSmssendYN()%></li>

                        <fieldset class="fieldset3">
                            <legend>propertyBag</legend>
                            <ul>
                                <%
                                    if ( statement.getPropertyBag() != null ) {
                                        for(String key : statement.getPropertyBag().keySet()) {
                                %>
                                <li><%=key%> : <%=statement.getPropertyBag().get(key)%></li>
                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </fieldset>
                        <%
                            if(statement.getDetailList() != null){
                                for(int i=0; i<statement.getDetailList().size(); i++){
                                    StatementDetail detail = statement.getDetailList().get(i);
                        %>
                        <fieldset class="fieldset3">
                            <legend>detailList</legend>
                            <ul>
                                <li>SerialNum (일련번호) :  <%= detail.getSerialNum() %> </li>
                                <li>purchaseDT (거래일자) : <%= detail.getPurchaseDT() %> </li>
                                <li>itemName (품명) : <%=detail.getItemName() %></li>
                                <li>spec (규격) : <%=detail.getSpec() %></li>
                                <li>qty (수량) : <%=detail.getQty() %></li>
                                <li>unitCost (단가) : <%=detail.getUnitCost() %></li>
                                <li>supplyCost (공급가액) : <%=detail.getSupplyCost() %></li>
                                <li>tax (세액) : <%=detail.getTax() %></li>
                                <li>remark (비고) : <%=detail.getRemark() %></li>
                                <li>spare1 (여분1) : <%=detail.getSpare1() %></li>
                                <li>spare2 (여분2) : <%=detail.getSpare2() %></li>
                                <li>spare3 (여분3) : <%=detail.getSpare3() %></li>
                                <li>spare4 (여분4) : <%=detail.getSpare4() %></li>
                                <li>spare5 (여분5) : <%=detail.getSpare5() %></li>
                            </ul>
                        </fieldset>
                        <%
                                }
                            }
                        %>
                    </ul>
                </fieldset>
            </fieldset>
        </div>
    </body>
</html>
