function go_save() {
	var id = document.getElementById('id');
	
	if (id.value == "") {
		alert("아이디를 입력하여 주세요.");
		document.formm.id.focus();
	} else if (document.formm.id.value != document.formm.reid.value) {
		alert("중복확인을 클릭하여 주세요.");
		document.formm.id.focus();
	} else if (document.formm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.formm.pwd.focus();
	} else if ((document.formm.pwd.value != document.formm.pwdCheck.value)) {
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.pwd.focus();
	} else if (document.formm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.formm.name.focus();
	} else if (document.formm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.formm.email.focus();
	} else if (!checkPwdForm() || !checkEmail() || !checkPhone())
		return;
	/*else {
		document.formm.action = "join";
		document.formm.submit();
	}*/
}

function checkID() {

	var idCheck = /^[A-Za-z0-9+]*$/;
	var id = document.formm.id.value;
	var idLength = id.length;

	if (!idCheck.test(id) || idLength > 10 || idLength < 1) {
		alert("아이디가 올바르지 않습니다.\n아이디는 영문/숫자  10글자 이하 입니다.");
		document.formm.id.value = "";
		document.formm.id.focus();
		return false;
	}
	return true;
}

function checkPwdForm() {
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*\d).{2,10}$/;
	var pwd = document.formm.pwd.value;
	// alert(pwdCheck.test(pwd));
	if (!pwdCheck.test(pwd)) {
		alert("패스워드가 유효하지 않습니다.\n영문 숫자 조합 10자 이내 입니다.");
		document.formm.pwd.value = "";
		document.formm.pwdCheck.value = "";
		document.formm.pwd.focus();
		return false;
	}
	return true;
}

function checkEmail() {
	var email = document.formm.email.value;
	var emailCheck = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	if (!emailCheck.test(email)) {
		alert("이메일 형식이 아닙니다..");
		document.formm.email.value = "";
		document.formm.email.focus();
		return false;
	}
	return true;
}

function checkPhone() {
	var phone = document.formm.phone.value;
	var phoneCheck = /^[0-9]*$/;
	var phoneLength = phone.length;
	if (!phoneCheck.test(phone) || phoneLength > 11 || phoneLength < 10) {
		alert("전화번호는 10~11자리 숫자만 입력해 주세요.");
		document.formm.phone.value = "";
		document.formm.phone.focus();
		return false;
	}
	return true;
}

function idcheck() {
	var id = document.getElementById('id');
	if (id.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.formm.id.focus();
		return;
	}
	var url = "idCheckForm.did?id=" + id.value;
	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=200");
}

function post_zip() {
	var url = "findZipNum.did";
	window
			.open(
					url,
					"_blank_1",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
}

function go_next() {
	if (document.formm.okon1[0].checked == true) {
		document.formm.action = "joinForm.did";
		document.formm.submit();
	} else if (document.formm.okon1[1].checked == true) {
		alert('약관에 동의하셔야만 합니다.');
	}
}
