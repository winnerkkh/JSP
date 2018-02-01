<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 과제 
	promt로 숫자를 입력 받아서
	2~7 99단 출력
	for문을 이용한 구구단 출력
-->

</head>
<body>
	<h2 align=center>구구단 출력 프로그램</h2>


<!-- 	<script type="text/javascript">
		var inputNumber = parseInt(prompt('출력하시고 싶은 구구단 숫자를 입력하세요!'));
		alert(inputNumber + "단까지 출력 합니다 ");
		
		
		
		function multiplication(inputNumber) {

			for (var i = 2; i <= inputNumber; i++) {
				for (var j = 1; j <= 9; j++) {
					document.write(i + " x " + j + "=" + i * j + '<br>');
				}
				document.write('<br>');
			}
		}
		multiplication(inputNumber);
	</script> -->


<script type="text/javascript">
 /* do while문의 사용예  */
 do{
    var num = prompt('숫자 값을 입력하세요.');
 }while(isNaN(num));
 
 document.write('<table border=1 bgcolor="yellow">');
 document.write('<caption><h3>구구단</h3></caption>');
 document.write('<tr align=center bgcolor="orange">');
 for(var k=2;k<=num;k++){
   document.write('<td>'+k+'단'+'</td>');	  
 } 
 document.write('</tr>');
 
 for(var j=1;j<=9;j++){
 document.write('<tr>');
 	for(var i=2;i<=num;i++){
		document.write('<td>'+i+'x'+j+'='+i*j);
		document.write('</td>');
	 }
		document.write('</tr>');
 } 
 document.write('</table>');
 </script>

</body>
</html>