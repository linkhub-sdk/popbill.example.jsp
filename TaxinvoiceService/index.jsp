<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 세금계산서 SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>정방행/역발행/위수탁발행</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkMgtKeyInUse.jsp">CheckMgtKeyInUse</a> - 문서번호 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registIssue.jsp">RegistIssue</a> - 즉시 발행</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/register.jsp">Register</a> - 임시저장</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/update.jsp">Update</a> - 수정</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/issue.jsp">Issue</a> - 발행</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelIssue.jsp">CancelIssue</a> - 발행취소</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/delete.jsp">Delete</a> - 삭제</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registRequest.jsp">RegistRequest</a> - [역발행] 즉시 요청</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/request.jsp">Request</a> - 역발행요청</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelRequest.jsp">CancelRequest</a> - 역발행요청 취소</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/refuse.jsp">Refuse</a> - 역발행요청 거부</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>국세청 즉시 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendToNTS.jsp">SendToNTS</a> - 국세청 즉시전송</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>세금계산서 정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfo.jsp">GetInfo</a> - 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfos.jsp">GetInfos</a> - 상태 대량 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getDetailInfo.jsp">GetDetailInfo</a> - 상세정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/search.jsp">Search</a> - 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getLogs.jsp">GetLogs</a> - 상태 변경이력 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getURL.jsp">GetURL</a> - 세금계산서 문서함 관련 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>세금계산서 보기/인쇄</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPopUpURL.jsp">GetPopUpURL</a> - 세금계산서 보기 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getViewURL.jsp">GetViewURL</a> - 세금계산서 보기 URL - 메뉴/버튼 제외</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPrintURL.jsp">GetPrintURL</a> - 세금계산서 인쇄 [공급자/공급받는자] URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEPrintURL.jsp">GetEPrintURL</a> - 세금계산서 인쇄 [공급받는자용] URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMassPrintURL.jsp">GetMassPrintURL</a> - 세금계산서 대량 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMailURL.jsp">GetMailURL</a> - 세금계산서 메일링크 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPDFURL.jsp">GetPDFURL</a> - 세금계산서 PDF 다운로드 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>부가기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getAccessURL.jsp">GetAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getSealURL.jsp"> GetSealURL</a> - 인감 및 첨부문서 등록 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachFile.jsp">AttachFile</a> - 첨부파일 추가</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/deleteFile.jsp">DeleteFile</a> - 첨부파일 삭제</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getFiles.jsp">GetFiles</a> - 첨부파일 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendEmail.jsp">SendEmail</a> - 메일 전송</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendSMS.jsp">SendSMS</a> - 문자 전송</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendFAX.jsp">SendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachStatement.jsp">AttachStatement</a> - 전자명세서 첨부</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/detachStatement.jsp">DetachStatement</a> - 전자명세서 첨부해제</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEmailPublicKeys.jsp">GetEmailPublicKeys</a> - 유통사업자 메일 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/assignMgtKey.jsp">AssignMgtKey</a> - 문서번호 할당</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/listEmailConfig.jsp">ListEmailConfig</a> - 세금계산서 알림메일 전송목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/updateEmailConfig.jsp">UpdateEmailConfig</a> - 세금계산서 알림메일 전송설정 수정</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>공인인증서 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getTaxCertURL.jsp">GetTaxCertURL</a> - 공인인증서 등록 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getCertificateExpireDate.jsp">GetCertificateExpireDate</a> - 공인인증서 만료일 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkCertValidation.jsp">CheckCertValidation</a> - 공인인증서 유효성 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getUnitCost.jsp">GetUnitCost</a> - 발행 단가 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkID.jsp">CheckID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registContact.jsp">RegistContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
