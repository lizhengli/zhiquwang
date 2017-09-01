<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hai
  Date: 2017/6/26
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会话管理</title>

    <link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/material-design-iconic-font.min.css" rel="stylesheet"/>
    <link href="/css/bootstrap/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="/css/waves.min.css" rel="stylesheet"/>
    <link href="/css/jquery-confirm.min.css" rel="stylesheet"/>
    <link href="/css/select2.min.css" rel="stylesheet"/>

    <link href="/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/zTree_v3/css/zTreeStyle/zTreeStyle.css">
    <style>
    </style>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <%--<a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增用户</a>--%>
        <%--&lt;%&ndash;<a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑用户</a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除用户</a>&ndash;%&gt;--%>
        <%--<a class="waves-effect waves-button" href="javascript:;" onclick="createPer()"><i class="zmdi zmdi-plus"></i> 设置角色</a>--%>
    </div>
    <table id="table"></table>
</div>
<!-- 新增 -->
<div id="createDialog" class="crudDialog" hidden>
    <form>
        <div class="form-group">
            <select id="select1" class="form-control">
                <option value="-1">请选择账户状态</option>
                <option value="0">正常</option>
                <option value="1">冻结</option>
            </select>
        </div>
        <div class="form-group">
            <label for="input1">账户号：</label>
            <input id="input1" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="input2">密码：</label>
            <input id="input2" type="text" class="form-control">
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

<script src="/zTree_v3/js/jquery.ztree.all.min.js"></script>
<script src="/js/common.js"></script>
<script>
    var createDialog = $("#createDialog").html();
    var $table = $('#table');
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
            url: '/mangers/huihua?m=all',
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
            classes: 'table table-hover',
            //sidePagination: 'server',
            //silentSort: false,
            smartDisplay: false,
            idField: 'id',
            sortName: 'id',
            sortOrder: 'desc',
            escape: true,
            searchOnEnterKey: true,
            idField: 'systemId',
            maintainSelected: true,
            toolbar: '#toolbar',
            columns: [
                {field: 'state', checkbox: true},
                {field: 'id', title: '编号', sortable:true, align:"center"},
                {field: 'name', title: '备注', sortable:true, align:"center"},
                {field: 'ip', title: '用户IP', sortable:true, align:"center"},
//                {field: 'description', title: '描述', sortable:true, align:"center"},
                {field: 'sessionID', title: '用户标识', sortable:true, align:"center"},
                {field: 'date', title: '访问时间', sortable:true, align:"center"},
                {field: 'action', title: '操作', align:"center", formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
            ]
        }).on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        });
    });
    function actionFormatter(value, row, index) {
        return [
//            '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　',
            '<a class="edit ml10" href="javascript:void(0)" data-toggle="tooltip" title="修改备注"><i class="glyphicon glyphicon-edit"></i></a>　',
            '<a class="remove ml10" href="javascript:void(0)" data-toggle="tooltip" title="强制下线"><i class="glyphicon glyphicon-remove"></i></a>'
        ].join('');
    }

    window.actionEvents = {
        'click .like': function (e, value, row, index) {
            alert('You click like icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
        },
        'click .edit': function (e, value, row, index) {
//            alert('You click edit icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
            var htm ="<div id=\"bz\" class=\"crudDialog\" hidden>\n" +
                    "    <form>\n" +
                    "        <div class=\"form-group\">\n" +
                    "            <label for=\"beizhu\">修改备注：</label>\n" +
                    "            <input id=\"beizhu\" type=\"text\" class=\"form-control\" value=\""+row.name+"\"'>\n" +
                    "        </div>\n" +
                    "\n" +
                    "    </form>\n" +
                    "</div>";
            $.confirm({
                content: htm,
                title: '修改数据',
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            var name = $("#beizhu").val();
                            $.post("/mangers/huihua",{"m":"updateSave","id":row.id,"name":name},function (msg) {
                                $.alert(msg);
                                $table.bootstrapTable("refresh");
                            },"text");
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        },
        'click .remove': function (e, value, row, index) {
//            alert('You click remove icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
            $.confirm({
                type: 'dark',
                animationSpeed: 300,
                title: '提示：',
                content: '是否永久删除数据？',
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            $.confirm({
                                content: "确定要强制下线此用户？----"+row.name,
                                title: '提示',
                                buttons: {
                                    confirm: {
                                        text: '确认',
                                        btnClass: 'waves-effect waves-button',
                                        action: function () {
                                            var id = row.id;
                                            $.post("/mangers/huihua",{"m":"delete","id":id},function (msg) {
                                                $.alert(msg);
                                                $table.bootstrapTable("refresh");
                                            },"text");
                                        }
                                    },
                                    cancel: {
                                        text: '取消',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            });
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });

        }
    };
    // 新增
    function createAction() {
        $("#createDialog").html("");
        $.confirm({
            type: 'dark',
            animationSpeed: 300,
            title: '新增系统',
            content: createDialog,
            buttons: {
                confirm: {
                    text: '确认',
                    btnClass: 'waves-effect waves-button',
                    action: function () {
                        var status = $("#select1").val();
                        var username = $("#input1").val();
                        var password = $("#input2").val();
                        $.post("/admin/manage/adminUser",{"m":"add","username":username,"password":password,"status":status},function (msg) {
                            $.alert(msg);
                            $table.bootstrapTable("refresh");
                        },"text");
//                        $.alert('确认');
                    }
                },
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    }
    // 编辑
    function updateAction() {
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
                title: '编辑系统',
                content: $('#createDialog').html(),
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            $.alert('确认');
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
    // 删除
    function deleteAction() {
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
                type: 'red',
                animationSpeed: 300,
                title: false,
                content: '确认删除该系统吗？',
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            var ids = new Array();
                            for (var i in rows) {
                                ids.push(rows[i].systemId);
                            }
                            $.alert('删除：id=' + ids.join("-"));
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

    function createPer() {
        var rows = $table.bootstrapTable('getSelections');

        if (rows.length == 0||rows.length>1) {
            $.confirm({
                title: false,
                content: '请选择一条记录！',
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
            var ids = new Array();
            for (var i in rows) {
                ids.push(rows[i].id);
            }
            $.confirm({
                type: 'red',
                animationSpeed: 300,
                title: false,
                content: "url:/admin/manage/zTree?m=index&m2=roleZTree&id="+ids[0],
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            var rids = new Array();
                            var objs = zTreeObj.getCheckedNodes();
                            console.log(objs);
                            for(i=0;i<objs.length;i++){
                                if(objs[i].pId!=null){
                                    rids.push(objs[i].id);
                                }
                            }
                            $.post("/admin/manage/zTree?m=updateRole",{'id':ids[0],"rids":rids.join("-")},function () {

                            },'text');
//                            alert(pids.join("-"));
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
</script>
</body>
</html>