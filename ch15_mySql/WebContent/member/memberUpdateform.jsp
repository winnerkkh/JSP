<%@page import="model.Member"%>
<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
//세션 체크
String id = (String)session.getAttribute("id");

if(id==null|id.equals("")){
	out.print("<script>");
	out.print("alert('먼저 로그인 해주세요');");
	out.print("location.href='loginform.html';");
	out.print("</script>");
}else{
		//dao생성
  		MemberDao1 dao = new MemberDao1();	
	   //파라미터로 id값을 받음
		 String memberId = request.getParameter("id");
		 System.out.println("id="+memberId);
	    //회원id로 정보 얻어오기
	   Member member = dao.selectMemberInfo(memberId);
	    //request객체 속성저장
	    request.setAttribute("member", member);
	    String tel1 = member.getTel1();
	    String tel2 = member.getTel2();
	    String tel3 = member.getTel3();
	    String email = member.getEmail();
	    System.out.println("email="+email);
	    String emailId ="";
	    String emailD="";
	    if(email==null||email.equals("")){
	    	emailId = "";
	        emailD="";
	     }else{
	     emailId = email.substring(0,email.indexOf('@'));
	     emailD = email.substring(email.indexOf('@')+1);
	    }
	    //request객체 속성저장
	    request.setAttribute("tel1", tel1);
	    request.setAttribute("tel2", tel2);
	    request.setAttribute("tel3", tel3);
	    request.setAttribute("emailId", emailId);
	    request.setAttribute("emailD", emailD);
	    
 } 
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipno').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullRoadAddr;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }/* 우편번호 script끝 */
</script>
<script type="text/javascript">
 function chk(){
	 var id = document.getElementById('id');
	 var pwd = document.getElementById('password');
	 var pwd2 = document.getElementById('password2');
	 if(!id.value){ alert("ID를 입력하세요");
		 			id.focus();
		 			return false; }
	 if(!pwd.value){ alert("패스워드를 입력하세요");
		 			 pwd.focus();
		 			 return false; }
	 if(!pwd2.value){ alert("패스워드확인을 입력하세요");
		 			  pwd2.focus();
		 			  return false; }
	 if(pwd.value!=pwd2.value){
		 alert("입력값이 서로 다릅니다.");
		 pwd.value="";
		 pwd2.value="";
		 pwd.focus();
		 return false;
	 }
	 return true;
 }/* 패스워드 체크 끝 */
</script>
<script type="text/javascript">
function open_emailChk(){
	var emailId = document.getElementById('emailId').value;
	var emailD = document.getElementById('emailD').value;
	
	var email=emailId+"@"+emailD;
	
	if(emailId.length==0||emailD.length==0){
		alert("email을 입력하세요");
		document.getElementById('emailId').focus();
		return;
	}
	window.open("emailCheck.jsp?email="+email,
			                               "emailchk","height=100,width=450,resize=yes");
}/* email체크 script끝 */
</script>
<script type="text/javascript">
function sel(){
	var domain = document.getElementById('emailDomain').value;
	    document.getElementById('emailD').value = domain;
	    if(domain=='')
	    	document.getElementById('emailD').focus();
}/* email체크 script끝 */
</script>
<html><head>
<title>회원정보수정  화면</title>
</head>
<body>
<form action="memberUpdateProc.jsp" onsubmit="return chk()" name="frm" method="post">
	<table border=1 bgcolor="yellow">
	<tr>
	 <td>*ID:</td><td>
	           <input type="text" name="id" id="id"  value="${member.id}" 
	                                                                      readonly="readonly">
	</td>
	</tr>
	<tr><td>*PASSWORD</td>
	    <td><input type="password" name="password" id="password"></td>
	</tr>
	<tr><td>PASSWORD확인</td>
	    <td><input type="password" name="password2" id="password2"></td>
	</tr>
	<tr><td>*이름</td><td><input type="text" name="name" id="name" value="${member.name}"></td>
	</tr>
	<tr><td>생일</td><td><input type="date" name="birth" id="birth" value="${member.birth}"></td>
	</tr>
	<tr><td>*우편번호</td><td><input type="text" name="zipno" id="zipno" maxlength="7"  size=7 value="${member.zipno}">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
	</tr>
	<tr><td>*주소1</td><td><input type="text" name="address1" id="address1" maxlength=80 size="80" value="${member.address1}"></td>
	</tr>
	<tr><td>*주소2</td><td><input type="text" name="address2" id="address2" maxlength=50 size="50" value="${member.address2}"></td>
	</tr>
	<tr><td>tel</td><td><select name="tel1" id="tel1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
	                                    </select>-
	                                 <input type="text" name="tel2" id="tel2" size="4" maxlength="4" value="${tel2}">-
	                                 <input type="text" name="tel3" id="tel3" size="4" maxlength="4" value="${tel3}"></td>
	</tr>
	<tr><td>*email</td><td><input type="text" name="emailId" id="emailId" required value="${emailId}">@
	                                       <input type="text" name="emailD"  id="emailD" required value="${emailD}">
	                                       <select name="emailDomain" id="emailDomain" onchange="sel()">
	                                       	<option value="naver.com">naver.com</option>
	                                       	<option value="daum.net">daum.net</option>
	                                       	<option value="google.com">google.com</option>
	                                       	<option value="nate.com">nate.com</option>
	                                       	<option value="">직접입력</option>         
	                                       </select>	                                     
	<input type="button" name="isEmail" id="isEmail" value="EmailCheck" onclick="open_emailChk()"></td>
	</tr>
	<tr>
		<td colspan=2 align="center"><input type="submit" value="확인">
		                             <input type="reset" value="다시작성">
		 </td>
	</tr>
	</table>
</form>
</body>
</html>