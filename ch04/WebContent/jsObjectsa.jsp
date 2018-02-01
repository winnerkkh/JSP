<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 객체 -->
<script type="text/javascript">
	//책 정보를 객체로 정의
	var book = {
		title : "채식주의자",
		author : "한강",
		price : "12000"
	};//객체타입 선언
	document.write(book.title + '<br>');//객체명.속성명
	document.write(book.author + '<br>');//객체명.속성명
	document.write(book.price + '<br><hr>');//객체명.속성명

	//배열
	var bookArray = [
			[ [ 'title', '채식주의자' ], [ 'author', '한강' ], [ 'price', '12000' ] ],
			[ [ 'title', '종의 기원' ], [ 'author', '홍길동' ], [ 'price', '10000' ] ] ];//배열
	//출력
	document.write(bookArray[0][0][1] + '<br>');

	//배열과 객체의 혼용
	var bookObj = [ {
		title : "채식주의자",
		author : "한강",
		price : "12000"
		}, 
	{
		title : "종의 기원",
		author : "홍길동",
		price : "10000"
	} //객체 생성 
	];//배열 생성

	//출력
	document.write(bookObj[0].title + '<br><hr>');

	
	//오늘의 과제
	// 두번째 값을 "sm5" 로 변경, 전체 배열을 역순으로 출력하세요
	var car=['sonata','avante','matiz'];
	car[1]='sm5';
	
	document.write(car+ '<br>');
	document.write(car.reverse() + '<hr>');
	

	
	//Person 객체를 정의(속성, firsname: "길동",lastname:"홍") 
	//country 속성을  "korea"
	//결과
	//홍길동의 고향은 korea 입니다.	
	
	var person ={firstname:"길동", lastname:"홍"}
	person.country = "Korea";
	
	document.write(person.lastname + person.firstname + "의 "+ "고향은 "+ person.country +" 입니다" + "<hr>");

	

	
</script>

</head>
<body>

</body>
</html>