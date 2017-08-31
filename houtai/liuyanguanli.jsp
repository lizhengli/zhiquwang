<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/7/18
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色管理</title>
    <link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/material-design-iconic-font.min.css" rel="stylesheet"/>
    <link href="/css/bootstrap/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="/css/waves.min.css" rel="stylesheet"/>
    <link href="/css/jquery-confirm.min.css" rel="stylesheet"/>
    <link href="/css/select2.min.css" rel="stylesheet"/>
    <link href="/css/common.css" rel="stylesheet"/>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i>设置状态</a>
        <a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除留言</a>
    </div>
    <table id="table"></table>
</div>
<!-- 新增 -->
<div id="createDialog" class="crudDialog" hidden>
    <form onsubmit="return false">
        <div class="form-group">
            <select id="zhuangtai">
                <option value="1">请选择状态(默认发布)</option>
                <option value="0">审核中</option>
                <option value="1">已发布</option>
                <option value="2">已封禁</option>
            </select>
        </div>
    </form>
</div>
<script src="/js/jquery.1.12.4.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/bootstrap/bootstrap-table.min.js"></script>
<script src="/js/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="/js/waves.min.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/select2.min.js"></script>
<script src="/js/common.js"></script>
<script>
    var $table = $('#table');
    var servlet_url = "/zhiqu/liuyanservlet";
    $(function() {
        $(document).on('focus', 'input[type="text"]', function() {
            $(this).parent().find('label').addClass('active');
        }).on('blur', 'input[type="text"]', function() {
            if ($(this).val() == '') {
                $(this).parent().find('label').removeClass('active');
            }
        });
        // bootstrap table初始化
        // http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
        $table.bootstrapTable({
            url: servlet_url+'?m=getAll',
            height: getHeight(),
            striped: true,
            search: true,
            searchOnEnterKey: true,
            showRefresh: true,
            showToggle: true,
            showColumns: true,
            minimumCountColumns: 2,
            showPaginationSwitch: true,
            clickToSelect: true,
            detailView: true,
            detailFormatter: 'detailFormatter',
            pagination: true,
            paginationLoop: false,
            classes: 'table table-hover table-no-bordered',
            //sidePagination: 'server',
            //silentSort: false,
            smartDisplay: false,
            idField: 'id',
            sortName: 'id',
            sortOrder: 'desc',
            escape: true,
            searchOnEnterKey: true,
            idField: 'id',
            maintainSelected: true,
            toolbar: '#toolbar',
            columns: [
                {field: 'state', checkbox: true},
                {field: 'id', title: '编号', halign: 'center',align:"center"},
                {field: 'lxr', title: '联系人',halign: 'center',align:"center"},
                {field: 'tel', title: '电话', halign: 'center',align:"center"},
                {field: 'address', title: '地址',halign: 'center',align:"center"},
                {field: 'content', title: '留言内容',halign: 'center',align:"center",formatter:'timeFormatter'},
                {field:'title',title:'留言信息',halign: 'center',align:"center"},
                {field:'uid',title:'留言用户ID',halign: 'center',align:"center"},
                {field:'faburen',title:'发布信息人',halign:'center',align:"center"},
                {field:'ctime',title:'留言时间',halign:'center',align:'center',formatter:'statusFormatter'},
                {field:'status',title:'留言状态',halign:'cneter',align:'center'},
                {field: 'action', title: '操作', halign: 'center', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
            ]
        }).on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        });
    });
    function statusFormatter(value,row,index){
        //alert(JSON.stringify(row));
        if(row.status==0){
            return "审核中";
        }else if(row.status==1){
            return "已发布";
        }else if (row.status==2){
            return "封禁";
        }
    }
    function timeFormatter(value,row,index) {
        return new Date(row.ctime).format("yyyy-MM-dd hh:mm:ss");
    }
    function actionFormatter(value, row, index) {
        return [
            '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　',
            '<a class="edit ml10" href="javascript:void(0)" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
            '<a class="remove ml10" href="javascript:void(0)" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
        ].join('');
    }
    /*    var removeByUniqueId = 0;*/
    window.actionEvents = {
        'click .like': function (e, value, row, index) {
            alert('You click like icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
        },
        'click .remove': function (e, value, row, index) {
            removeByUniqueId = row.id;
            /*alert('You click remove icon, row: ' + JSON.stringify(row));*/
            $.confirm({
                title:"提示",
                content:"是否永久删除数据？",
                buttons:{
                    confirm:{
                        text:"确定",
                        action:function () {
                            //执行删除操作
                            $.post(servlet_url+"?m=delete",{'id':row.id},function (txt) {
                                $.alert(txt.message);
                                $table.bootstrapTable('refresh');
                            },"json");
                        }
                    },
                    cancle:{
                        text:"取消"
                    }
                }
            })
            console.log(value, row, index);
        }
    };
    var ht = $("#createDialog").html();
    function updateAction() {
        $("#createDialog").html("");
        var rows = $table.bootstrapTable('getSelections');
        if (rows.length == 0) {
            $.confirm({
                title: false,
                content: '请至少选择一条记录！',
                autoClose: 'cancel|3000',
                backgroundDismiss: true,
                buttons: {
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        } else {
            $.confirm({
                type: 'blue',
                animationSpeed: 300,
                title: '设置状态',
                content:ht,
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            var id = rows[0].id;
                            var status = $("#zhuangtai").val();
                            $.post(servlet_url+'?m=shenhe',{"id":id,"status":status},function(txt){
                                $.alert(txt.message)
                                $table.bootstrapTable('refresh');
                            },"JSON")

                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }

            });
        }
    }
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }
</script>
</body>
</html>
