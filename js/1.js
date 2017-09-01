function a(){
	$("#bone").slideToggle();
}
var qqq=false;
function b(){
	$("#bone1").slideToggle();
	if(qqq==false){
		qqq=true;
		document.getElementById("jian").style.display="block";
		document.getElementById("jia").style.display="none";
	}else if(qqq==true){
		document.getElementById("jian").style.display="none";
		document.getElementById("jia").style.display="block";
		qqq=false;
	}
}
var www=false;
function c(){
	$("#bone2").slideToggle();
	if(www==false){
		www=true;
		document.getElementById("jian1").style.display="block";
		document.getElementById("jia1").style.display="none";
	}else if(www==true){
		document.getElementById("jian1").style.display="none";
		document.getElementById("jia1").style.display="block";
		www=false;
	}
}
var eee=false;
function d(){
	$("#bone3").slideToggle();
	if(eee==false){
		eee=true;
		document.getElementById("jian2").style.display="block";
		document.getElementById("jia2").style.display="none";
	}else if(eee==true){
		document.getElementById("jian2").style.display="none";
		document.getElementById("jia2").style.display="block";
		eee=false;
	}
}
var rrr=false;
function e(){
	$("#bone4").slideToggle();
	if(rrr==false){
		rrr=true;
		document.getElementById("jian3").style.display="block";
		document.getElementById("jia3").style.display="none";
	}else if(rrr==true){
		document.getElementById("jian3").style.display="none";
		document.getElementById("jia3").style.display="block";
		rrr=false;
	}
}
function i(){
	$("#a000").show();
}
function j(){
	$("#a111").show();
}
function k(){
	$("#a222").show();
}
function l(){
	$("#a333").show();
}
function m(){
	$("#a444").show();
}
function n(){
	$("#a555").show();
}
function o(){
	$("#a666").show();
}
function p(){
	$("#a777").show();
}
function q(){
	$("#a888").show();
}
//右键
//首页
var menu = new BootstrapMenu('#a999', {
  actions: [{
      name: '关闭',
      onClick: function() {
      	
      }
    }, {
      name: '刷新',
      onClick: function() {
       /*location.reload(true);*/
	      var i = document.getElementById("cc");
		  i.src="shouye.html";
      }
    }, {
      name: '关闭其他',
      onClick: function() {
      	$("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
       	$("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
       	$("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        /*alert("6");*/
      }
  }]
});
//系统管理
var menu = new BootstrapMenu('#a000', {
  actions: [{
      name: '关闭',
      onClick: function() {
      $("#a000").hide();
      var i = document.getElementById("cc");
	  i.src="shouye.html";
      }
    }, {
      name: '刷新',
      onClick: function() {
       /*location.reload(true);*/
	      var i = document.getElementById("cc");
		  i.src="http://localhost:8080/chaxun/index.jsp";
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
      	$("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      	var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        /*alert("6");*/
      }
  }]
});
//组织管理
var menu = new BootstrapMenu('#a111', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a111").hide();
        var i = document.getElementById("cc");
	   i.src="shouye.html";
      }
    }, {
      name: '刷新',
      onClick: function() {
      /* location.reload(true);*/
	     var i = document.getElementById("cc");
		 i.src="http://jquery.cuishifeng.cn/";
      }
    }, {
      name: '关闭其他',
      onClick: function() {
       	$("#a000,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000").hide();
      }
  }]
});
//角色管理
var menu = new BootstrapMenu('#a222', {
  actions: [{
      name: '关闭',
      onClick: function() {
       $("#a222").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a333,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
         $("#a000,#a111").hide();
      }
  }]
});
//用户管理
var menu = new BootstrapMenu('#a333', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a333").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a444,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222").hide();
      }
  }]
});
//权限管理
var menu = new BootstrapMenu('#a444', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a444").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a555,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222,#a333").hide();
      }
  }]
});
//公共码表
var menu = new BootstrapMenu('#a555', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a555").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a666,#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444").hide();
      }
  }]
});
//回话管理
var menu = new BootstrapMenu('#a666', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a666").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a777,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a777,#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555").hide();
      }
  }]
});
//日志记录
var menu = new BootstrapMenu('#a777', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a777").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       location.reload(true);
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a888").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
        $("#a888").hide();
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666").hide();
      }
  }]
});
//类型管理
var menu = new BootstrapMenu('#a888', {
  actions: [{
      name: '关闭',
      onClick: function() {
        $("#a888").hide();
      }
    }, {
      name: '刷新',
      onClick: function() {
       
      }
    }, {
      name: '关闭其他',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777").hide();
      }
  }, {
      name: '关闭全部',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777,#a888").hide();
        var i = document.getElementById("cc");
	    i.src="shouye.html";
      }
  }, {
      name: '关闭右侧所有',
      onClick: function() {
       /* alert("5");*/
      }
  }, {
      name: '关闭左侧所有',
      onClick: function() {
        $("#a000,#a111,#a222,#a333,#a444,#a555,#a666,#a777").hide();
      }
  }]
});
var bb4 = true;
function d100(){
	var f = document.getElementById("d1_0");
	f.style.webkit="rotaZ(180deg)";
	f.style.moz="rotateZ(180deg)";
	f.style.o="rotateZ(180deg)";
	f.style.ms="rotateZ(180deg)";
	if(bb4==true){
		f.style.transform="rotateZ(180deg)";
		f.style.background="url(img/33.jpg)";
		bb4=false;
	}else if(bb4==false){
		f.style.transform="rotateZ(-0deg)";
		f.style.background="url(img/32.jpg)";
		bb4=true;
	}
}
function d10(){
	$("#b").slideToggle();
}
function a99(){
	var i = document.getElementById("cc");
	i.src="shouye.html";
}
function a00(){
	var i = document.getElementById("cc");
	i.src="http://localhost:8080/type/index.jsp";
}
function a777(){
    var i= document.getElementById("cc");
    i.src = "http://localhost:8080/type/yonghu.jsp";
}
function a11(){
	var i = document.getElementById("cc");
	i.src="http://jquery.cuishifeng.cn/";
}
function a88(){
	var i = document.getElementById("cc");//ifame的ID  cc
	i.src="http://localhost:8080/TypeServlet";
}
function a2222(){
    var i = document.getElementById("cc");//ifame的ID  cc
    i.src="http://localhost:8080/zhiqu/juseguanli.jsp";
}
function a3333(){
    var i = document.getElementById("cc");//ifame的ID  cc
    i.src="http://localhost:8080/zhiqu/quanxian.jsp";
}
