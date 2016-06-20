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
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkCorpIsMember.jsp">checkCorpIsMember</a> - 연동회원사 가입 여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/joinMember.jsp">joinMember</a> - 연동회원사 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원사 과금정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getBalance.jsp">getBalance</a> - 연동회원사 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
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
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 파트너 관리번호의 등록/사용여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/registIssue.jsp">registIssue</a> - 세금계산서 즉시발행</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/register.jsp">register</a> - 세금계산서 등록</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/update.jsp">update</a> - 세금계산서 수정</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/search.jsp">search</a> - 세금계산서 목록 조회</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfo.jsp">getInfo</a> - 세금계산서 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getInfos.jsp">getInfos</a> - 다량(최대 1000건)의 세금계산서 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getDetailInfo.jsp">getDetailInfo</a> - 세금계산서 상세 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/delete.jsp">delete</a> - 세금계산서 삭제</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getLogs.jsp">getLogs</a> - 세금계산서 문서이력 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachFile.jsp">attachFile</a> - 세금계산서 첨부파일 추가</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getFiles.jsp">getFiles</a> - 세금계산서 첨부파일 목록확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/deleteFile.jsp">deleteFile</a> - 세금계산서 첨부파일 1개 삭제</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>처리 프로세스</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/send.jsp">send</a> - 정발행/위수탁 세금계산서 발행예정 처리</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelSend.jsp">cancelSend</a> - 정발행/위수탁 세금계산서 발행예정 취소 처리</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/accept.jsp">accept</a> - 정발행/위수탁 세금계산서 발행예정에 대한 공급받는자의 승인 처리</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/deny.jsp">deny</a> - 정발행/위수탁 세금계산서 발행예정에 대한 공급받는자의 거부 처리</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/issue.jsp">issue</a> - 세금계산서 발행 처리</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelIssue.jsp">cancelIssue</a> - 세금계산서 발행취소 처리 (국세청 전송전까지만 취소 가능)</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/request.jsp">request</a> - 세금계산서 역)발행요청 처리.</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/cancelRequest.jsp">cancelRequest</a> - 세금계산서 역)발행요청 취소 처리.</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/refuse.jsp">refuse</a> - 세금계산서 역)발행요청에 대한 공급자의 발행거부 처리.</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendToNTS.jsp">sendToNTS</a> - 발행된 세금계산서의 국세청 즉시전송 요청.</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>부가 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/attachStatement.jsp">attachStatement</a> - 전자명세서 첨부</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/detachStatement.jsp">detachStatement</a> - 전자명세서 첨부해제</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendEmail.jsp">sendEmail</a> - 처리 프로세스에 대한 이메일 재전송 요청</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendEmail.jsp">sendEmail</a> - 처리 프로세스에 대한 이메일 재전송 요청</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendSMS.jsp">sendSMS</a> - 발행예정/발행/역)발행요청 에 대한 문자메시지 안내 재전송 요청.</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/sendFAX.jsp">sendFAX</a> - 세금계산서에 대한 팩스 전송 요청..</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>팝빌 세금계산서 SSO URL 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getURL.jsp">getURL</a> - 세금계산서 관련 SSO URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPopUpURL.jsp">getPopUpURL</a> - 해당 세금계산서의 팝빌 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getPrintURL.jsp">getPrintURL</a> - 해당 세금계산서의 팝빌 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMassPrintURL.jsp">getMassPrintURL</a> - 다량(최대100건)의 세금계산서 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEPrintURL.jsp">getEPrintURL</a> - 해당 세금계산서의 공급받는자용 팝빌 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getMailURL.jsp">getMailURL</a> - 해당 세금계산서의 전송메일상의 "보기" 버튼에 해당하는 URL 확인</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getUnitCost.jsp">getUnitCost</a> - 세금계산서 발행 단가 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getCertificateExpireDate.jsp">getCertificateExpireDate</a> - 연동회원이 등록한 공인인증서의 만료일시 확인</li>
						<li><a href="${pageContext.request.contextPath}/TaxinvoiceService/getEmailPublicKeys.jsp">getEmailPublicKeys</a> - Email 유통을 위한 대용량 연계사업자 이메일 목록 확인</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
