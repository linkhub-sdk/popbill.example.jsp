<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />

		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>
		<div id="content">
			<p class="heading1">팝빌 세금계산서 SDK jsp Example.</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>
				<fieldset class="fieldset2">
					<legend>회원사 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/joinMember.jsp">joinMember</a> - 연동회원 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원 과금정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 로그인/포인트충전/공인인증서 등록 팝업 URL</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
					</ul>
				</fieldset>
			</fieldset>
			<br />
			<fieldset class="fieldset1">
				<legend>전자세금계산서 관련 API</legend>
				<fieldset class="fieldset2">
					<legend>등록/수정/확인/삭제</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 문서관리번호 등록/사용여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registIssue.jsp">registIssue</a> - 세금계산서 즉시발행</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/register.jsp">register</a> - 세금계산서 등록</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/update.jsp">update</a> - 세금계산서 수정</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/search.jsp">search</a> - 세금계산서 목록 조회</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfo.jsp">getInfo</a> - 세금계산서 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfos.jsp">getInfos</a> - 세금계산서 상태/요약 정보 확인 - 대량</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getDetailInfo.jsp">getDetailInfo</a> - 세금계산서 상세정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/delete.jsp">delete</a> - 세금계산서 삭제</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getLogs.jsp">getLogs</a> - 세금계산서 상태변경 이력 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachFile.jsp">attachFile</a> - 세금계산서 첨부파일 추가</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getFiles.jsp">getFiles</a> - 세금계산서 첨부파일 목록확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/deleteFile.jsp">deleteFile</a> - 세금계산서 첨부파일 삭제</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>처리 프로세스</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/send.jsp">send</a> - 세금계산서 발행예정</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelSend.jsp">cancelSend</a> - 세금계산서 발행예정 취소</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/accept.jsp">accept</a> - 발행예정 세금계산서 승인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/deny.jsp">deny</a> - 발행예정 세금계산서 거부</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/issue.jsp">issue</a> - 세금계산서 발행</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelIssue.jsp">cancelIssue</a> - 세금계산서 발행취소</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/request.jsp">request</a> - 세금계산서 역발행요청</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelRequest.jsp">cancelRequest</a> - 세금계산서 역발행요청 취소</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/refuse.jsp">refuse</a> - 역발행요청 거부</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendToNTS.jsp">sendToNTS</a> - 국세청 즉시전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>부가 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachStatement.jsp">attachStatement</a> - 전자명세서 첨부</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/detachStatement.jsp">detachStatement</a> - 전자명세서 첨부해제</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendEmail.jsp">sendEmail</a> - 이메일 재전송</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendSMS.jsp">sendSMS</a> - 안내문자 메시지 전송</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendFAX.jsp">sendFAX</a> - 세금계산서 팩스전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>팝빌 세금계산서 SSO URL 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getURL.jsp">getURL</a> - 세금계산서 관련 SSO URL</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPopUpURL.jsp">getPopUpURL</a> - 세금계산서 보기 팝업 URL</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPrintURL.jsp">getPrintURL</a> - 세금계산서 인쇄 팝업 URL</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMassPrintURL.jsp">getMassPrintURL</a> - 세금계산서 인쇄 팝업 URL - 대량</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEPrintURL.jsp">getEPrintURL</a> - 세금계산서 인쇄 팝업 URL - 공급받는자용</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMailURL.jsp">getMailURL</a> - 세금계산서 메일링크 URL</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getUnitCost.jsp">getUnitCost</a> - 세금계산서 발행단가 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getCertificateExpireDate.jsp">getCertificateExpireDate</a> - 공인인증서 만료일시 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEmailPublicKeys.jsp">getEmailPublicKeys</a> - 대용량 연계사업자 메일목록</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
