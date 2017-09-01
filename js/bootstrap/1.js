function t(obj){
				var patt1 = new RegExp("[\u4e00-\u9fa5A-Za-z]");
				if(!patt1.test(obj.value)){
					document.getElementById("tag").style.display="block";
					document.getElementById("tag1").style.display="none";
				}else{
					document.getElementById("tag").style.display="none";
					document.getElementById("tag1").style.display="block";
				}
			}
			function t1(obj){
				var patt1 = new RegExp("[a-zA-Z]");
				if(!patt1.test(obj.value)){
					document.getElementById("tag2").style.display="block";
					document.getElementById("tag3").style.display="none";
				}
			}
			function t2(obj){
				var mimaa = document.getElementById("mm");
				var qmima = document.getElementById("qmm");
				var m = mm.value;
				var q = qmm.value;
				if(m==q){
					document.getElementById("tag5").style.display="block";
				}else{
					document.getElementById("tag4").style.display="block";
					document.getElementById("tag5").style.display="none";
				}
			}
			function t3(obj){
				var patt1 = new RegExp("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
				if(!patt1.test(obj.value)){
					document.getElementById("tag6").style.display="block";
					document.getElementById("tag7").style.display="none";
				}
			}
			function t4(obj){
				var patt1 = new RegExp("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
				if(!patt1.test(obj.value)){
					document.getElementById("tag8").style.display="block";
					document.getElementById("tag9").style.display="none";
				}
			}
			function t5(obj){
				var patt1 = new RegExp("^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$");
				if(!patt1.test(obj.value)){
					document.getElementById("tag10").style.display="block";
					document.getElementById("tag11").style.display="none";
				}
			}
//重置按钮		
function but(){
	location.reload(true);
}
//提交按钮
function tijiao(){
	
}
