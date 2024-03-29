<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:59:"C:\wamp\www\2\public/../application/hr\view\User\index.html";i:1560388698;}*/ ?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/2/public/static/css/base.css" />
<link rel="stylesheet" href="/2/public/static/css/info-mgt.css" />
<link rel="stylesheet" href="/2/public/static/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
<style type='text/css'>
	table tr .num{ width:63px; text-align: center;}
	table tr .name{ width:63px; padding-left:17px;}
	table tr .nickname{ width:63px; padding-left:13px;}
	table tr .dept{ width:63px; padding-left:13px;}
	table tr .role{ width:63px; padding-left:13px;}
	table tr .sex{ width:63px; padding-left:13px;}
	table tr .birthday{ width:63px; padding-left:13px;}
	table tr .tel{ width:63px; padding-left:13px;}
	table tr .email{ width:63px; padding-left:13px;}
	table tr .ctime{ width:63px; padding-left:13px;}
	table tr .operate{ width:63px; padding-left:15px;}
	table tr .operate a{ color:#2c7bbc;}
	table tr .operate a:hover{ text-decoration:underline;}
</style>
</head>

<body>
<div class="title"><h2>信息管理</h2></div>
<div class="table-operate ue-clear">
	<a href="javascript:;" class="add">添加</a>
    <a href="javascript:;" class="del">删除</a>
    <a href="javascript:;" class="edit">编辑</a>
    <a href="javascript:;" class="count">统计</a>
    <a href="javascript:;" class="check">审核</a>
</div>
<div class="table-box">
	<table>
    	<thead>
        	<tr>
            	<th class="num">序号</th>
                <th class="name">姓名</th>
                <th class="nickname">昵称</th>
                <th class="dept">部门</th>
                <th class="role">角色</th>
                <th class="sex">性别</th>
                <th class="birthday">生日</th>
                <th class="tel">电话</th>
                <th class="email">邮箱</th>
                <th class="ctime">添加时间</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody>
        	<?php if(is_array($result) || $result instanceof \think\Collection || $result instanceof \think\Paginator): $i = 0; $__LIST__ = $result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?>
            <tr>
                <td class="num"><?php echo $row['user_id']; ?></th>
                <td class="name"><?php echo $row['user_name']; ?></th>
                <td class="nickname"><?php echo $row['user_nickname']; ?></th>
                <td class="dept"><?php echo $row['user_deptid']; ?></th>
                <td class="role"><?php echo $row['user_roleid']; ?></th>
                <td class="sex"><?php echo $row['user_sex']; ?></th>
                <td class="birthday"><?php echo $row['user_birthday']; ?></th>
                <th class="tel"><?php echo $row['user_tel']; ?></th>
                <th class="email"><?php echo $row['user_email']; ?></th>
                <th class="ctime"><?php echo $row['user_ctime']; ?></th>
                <th class="operate">
                    <a href="" class="edit">修改</a> | 
                    <a href="" class="edit">删除</a>
                </th>           
            </tr>
          <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
</div>
<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="/2/public/static/js/jquery.js"></script>
<script type="text/javascript" src="/2/public/static/js/common.js"></script>
<script type="text/javascript" src="/2/public/static/js/WdatePicker.js"></script>
<script type="text/javascript" src="/2/public/static/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").hide();
	$(this).siblings($(".select-list")).show();
	return false;
})
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})

$('.pagination').pagination(100,{
	callback: function(page){
		alert(page);	
	},
	display_msg: true,
	setPageNo: true
});

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>
