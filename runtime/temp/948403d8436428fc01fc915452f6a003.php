<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"C:\wamp\www\2\public/../application/lsk\view\User\add.html";i:1560387981;}*/ ?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/2/public/static/css/base.css" />
<link rel="stylesheet" href="/2/public/static/css/info-reg.css" />

<title>移动办公自动化系统</title>
<style>
	.main p input {
		float:none;
	}
        .main p  span{
		float: none;
                margin-left: 5px;
	}
</style>
</head>

<body>
    <form method="post" action="<?php echo url('lsk/User/add'); ?>">
<div class="title"><h2>信息登记</h2></div>
<div class="main">
    <p class="short-input ue-clear">
    	<label>用户名：</label>
        <input type="text" name="username"  placeholder="用户名"
           data-rule="required:remote(/2/public/index.php/lsk/Validate/lsk_username)"
           data-rule-username="[/^[\w\d]{3,12}$/, '请输入 3-12 数字、字母、下划线']"
            data-tip="用户名不为空"
        />

    </p>
    <p class="short-input ue-clear">
    	<label>密码：</label>
        <input type="text" name="pwd" placeholder="密码" 
               data-rule="required;Password;length(4~16)" 
               data-tip="密码不为空"
               />
    </p>
    <p class="short-input ue-clear">
    	<label>密码确认：</label>
        <input type="text" name="pwdAgain" placeholder="密码确认" 
                data-rule="required;密码确认;match(密码)" 
                 data-tip="密码确认不为空"
               />
    </p>
    <p class="short-input ue-clear">
    	<label>所有者：</label>
        
        <input type="text" name="nickname" placeholder="昵称" 
                 data-rule="required;Nickname;请填写中文字符)" 
               data-tip="所有者不为空"
               />
    </p>
    <div class="short-input select ue-clear">
    	 <div class="select-wrap">
             <label>所属部门：</label>
            <select name="d_pid">
                <option value="0">顶级部门</option>
              <?php if(is_array($data) || $data instanceof \think\Collection || $data instanceof \think\Paginator): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dept): $mod = ($i % 2 );++$i;?>
                    <option value="<?php echo $dept['dept_id']; ?>"><?php echo str_repeat('+++',$dept['level']); ?><?php echo $dept['dept_name']; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </div>
    </div>
 <p class="short-input ue-clear">
    	<label>性别：</label>
        <input type="radio" name="sex" value="男" checked='checked' />男&nbsp;&nbsp;
		<input type="radio" name="sex" value="女" />女
    </p>
    <p class="short-input ue-clear">
    	<label>生日：</label>
        <input type="text" name="birthday" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请选择生日"
               
               />
    </p>
    <p class="short-input ue-clear">
    	<label>电话：</label>
        <input type="text" name="tel" placeholder="请输入电话" 
               data-rule="required;"
               data-tip="电话不能为空"
               />
    </p>
    <p class="short-input ue-clear">
    	<label>email：</label>
        <input type="text" name="email" placeholder="请输入邮箱"
               data-rule="required;email"
               />
    </p>
</div>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm">确定</a>
    <a href="javascript:;" class="clear">清空内容</a>
</div>
    </form>
</body>


<script type="text/javascript" src="/2/public/static/js/jquery.js"></script>
<script type="text/javascript" src="/2/public/static/js/common.js"></script>
<script type="text/javascript" src="/2/public/static/js/WdatePicker.js"></script>
<script src="https://cdn.jsdelivr.net/jquery/1.12.3/jquery.js"></script>
<script type="text/javascript" src="/2/public/static/validator/jquery.validator.js?local=zh-CN"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

$(".confirm").on("click",function(){
    $('form').submit();
});
showRemind('input[type=text], textarea','placeholder');
</script>
</html>
