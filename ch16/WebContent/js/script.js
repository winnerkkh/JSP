function writeSave(){
	if(document.writeForm.email.value==""){
		alert("email을 입력하세요");
		document.writeForm.email.focus();
		return false;
	}
	
	if(document.writeForm.writer.value==""){
		alert("작성자를 입력하세요");
		document.writeForm.writer.focus();
		return false;
	}
	if(document.writeForm.subject.value==""){
		alert("제목을 입력하세요");
		document.writeForm.subject.focus();
		return false;
	}
	if(document.writeForm.content.value==""){
		alert("내용을 입력하세요");
		document.writeForm.content.focus();
		return false;
	}
	if(document.writeForm.password.value==""){
		alert("패스워드를 입력하세요");
		document.writeForm.password.focus();
		return false;
	}
	if(document.writeForm.password1.value==""){
		alert("패스워드확인을 입력하세요");
		document.writeForm.password1.focus();
		return false;
	}
	if(document.writeForm.password.value!=document.writeForm.password1.value){
		alert("패스워드가 서로다릅니다. 입력하세요");
		document.writeForm.password.focus();
		document.writeForm.password.value="";
		document.writeForm.password1.value="";
		return false;
	}
	
	return true;
}