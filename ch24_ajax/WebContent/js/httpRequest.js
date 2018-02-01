/** *  */
var httpRequest = null;//전역변수
	/* xmlHttpRequest객체 구하는 함수 */
function getHttpRequest(){
	  if(window.ActiveXObject){//IE이면
		  try{
			  return new ActiveXObject("Msxml2.XMLHTTP");
		  }catch(e){
			  return new ActiveXObject("Microsoft.XMLHTTP");
		  }
	  }	else{
		  return new XMLHttpRequest();//IE가 아니면
	  }
	}
//sendRequest(경로,전송파라미터,콜백함수,전송방식)
function sendRequest(url,params,callback,method){
	httpRequest = getHttpRequest();
	var httpMethod = method?method:'GET';//아규먼트로 받은 method가 있으면 해당 메소드 없으면 GET(default)
	if(httpMethod!='GET' && httpMethod !='POST' ){
		httpMethod ='GET';
	}
	var httpParams=(params==null||params=='')?null:params;
	var httpUrl = url;
	if(httpMethod=='GET' && httpParams !=null){
		httpUrl = httpUrl + "?" +httpParams;
	}
	httpRequest.open(httpMethod, httpUrl,true);//httpRequest open()메소드
	httpRequest.setRequestHeader(
	'Content-type','application/x-www-form-urlencoded'		
	);//head정보 세팅
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod=='POST'?httpParams:null);	
}

function log(msg){
	var con = document.getElementById("console");
	if(msg!=null)
		con.innerHTML +=msg+"<br>";
}
