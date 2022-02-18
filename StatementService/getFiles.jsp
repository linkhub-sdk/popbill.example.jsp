<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.AttachedFile"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 전자명세서에 첨부된 파일목록을 확인합니다.
         * - 응답항목 중 파일아이디(AttachedFile) 항목은 첨부파일 삭제(DeleteFile API) 함수 호출 시 이용할 수 있습니다.
     * - https://docs.popbill.com/statement/java/api#GetFiles
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 전자명세서 문서번호
    String mgtKey = "20210703-101";

    AttachedFile[] attachedFiles = null;

    try {

        attachedFiles = statementService.getFiles(testCorpNum, itemCode, mgtKey);

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
                <legend>전자명세서 첨부파일 목록확인</legend>

                <%
                    for(int i=0; i<attachedFiles.length; i++){
                        AttachedFile attachedFile = attachedFiles[i];
                %>

                <fieldset class="fieldset2">
                    <ul>
                        <li>serialNum (첨부파일 일련번호) : <%= attachedFile.getSerialNum() %> </li>
                        <li>attachedFile (파일아이디-첨부파일 삭제시 사용) : <%= attachedFile.getAttachedFile() %> </li>
                        <li>displayName (첨부파일명) : <%= attachedFile.getDisplayName() %></li>
                        <li>regDT (첨부일시) : <%= attachedFile.getRegDT() %></li>
                    </ul>
                </fieldset>

                <%
                    }
                %>

            </fieldset>
         </div>
    </body>
</html>
