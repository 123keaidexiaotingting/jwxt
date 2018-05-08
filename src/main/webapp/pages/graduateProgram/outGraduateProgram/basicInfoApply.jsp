<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>毕业设计（包括实习）申请表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../../../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../../../css/font.css">
    <link rel="stylesheet" href="../../../lib/bootstrap/bootstrap.min.css">
    <script type="text/javascript" src="../../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../js/xadmin.js"></script>

    <%--s   bzy--%>
    <%@include file="/tag.jsp"%>
    <script type="text/javascript" src="../../../js/public/dateUtil.js"></script>
    <script type="text/javascript" src="../../../js/outsideGraduateDesiner/util.js"></script>
    <script type="text/javascript" src="../../../js/outsideGraduateDesiner/infoApplly.js"></script>
    <%--E   bzy--%>
</head>

<body>
<div class="x-body" style="margin:20px auto 50px auto; width:90%;">
    <button class="btn-primary btn" onclick="basicSave()">保存</button>
    <button class="btn-primary btn" onclick="basicCommit()">提交</button>
    <script>
    	//保存
    	function basicSave(){
    	    //alert("123");
            var outApplyID = getAddressParameter("id");
            //获取当前需要提交的值
            var receiveUnit = $("#receiveUnit").val();
            var applyReason = $("#applyreason").val();
            $.ajax({
                url:contextPath+"/baseInfo/saveBaseInfo.do",
                type:"post",
                data:{"outApplyID":outApplyID,
                    "receiveUnit":receiveUnit,
                    "applyReason":applyReason
                },
                dataType:"text",
                success:function(result){
                    layer.msg(result);
                },
                error:function () {
                    x_admin_close();
                    layer.msg("保存出错！！！")
                }
            });


    	}
    	//提交
    	function basicCommit(){
            var outApplyID = getAddressParameter("id");
            layer.confirm("您确定要提交此次申请吗？一旦提交将无法进行修改。",function(){
                $.ajax({
                    url:contextPath+"/baseInfo/commitInfo.do",
                    type:"post",
                    data:{"outApplyID":outApplyID},
                    datatype:"text",
                    success:function(result){
                        layer.msg(result);
                    },
                    error:function(){
                        alert("出错！！！");
                        x_admin_close();
                    }
                });
            })
    	}
    </script>
    		
    <form action="" class="layui-form" disabled="true">
    <table class="table table-bordered ">
        <caption style="text-align: center;">
        	<h1>太原科技大学计算机科学与技术学院</h1>
            <h3>学生校外毕业设计（包括实习）申请表</h3>
        </caption>
        <tbody>
        <tr>
            <td>学生姓名</td>
            <td>
                <input type="text" class="form-control" readonly="true" id="studentname" name="studentname">
            </td>
            <td>性别</td>
            <td>
                <input type="text" class="form-control" readonly="true" id="sex" name="sex">
                
            </td>
            <td>专业班级</td>
            <td>
                <input type="text" class="form-control" readonly="true" id="majorclass" name="majorclass">
            </td>
        </tr>
        <tr>
            <td>指导教师</td>
            <td>
                <input type="text" class="form-control" readonly="true" id="inteachername" name="inteachername">
            </td>
            <td>接收单位名称</td>
            <td colspan="3">
                <input type="text" name="receiveUnit" id ="receiveUnit" class="form-control"  name="receiceunit">
            </td>
        </tr>
        <tr id="student">
            <td>学生申请原因</td>
            <td colspan="3">
            	
                <textarea name="" cols="100" rows="4" class="form-control" id="applyreason" name="applyreason"></textarea>
            </td>
            <td>
            	<div style="height: 40px;">申请人签名</div>
            <hr />
            <div style="height: 10px;">申请时间</div>
                             
            </td>
            
            <td colspan="1">
            	<div style="height: 40px;">
            		<img src="../../../images/info.jpg" width="165px" height="50px" class="url" id="stusignurl" name="stusignurl"/>
            		<input onclick="studentSign()"  class="layui-btn" type="button" value="签名"></input>
            		
            	</div>
                <hr />
                <input type="datetime"  class="form-control applydate" id="stuapplydate" name="stuapplydate" readonly>
            </td>
            
        </tr>

        <!--家长意见-->
        <tr id="0">
            <td>家长意见</td>
            <td colspan="3">
            	<div>
            		<input type="radio" name="opinion" class="agree" value="1" title="同意"/>
            		<input type="radio" name="opinion" calss="disagree" value="0" title="不同意"/>
            	</div>
                <textarea name="" cols="100" rows="3" class="form-control advice"></textarea>
            </td>
            <td><div style="height: 40px;">家长签名</div>
            <hr />
            <div>签字时间</div>
            </td>
            <td colspan="1">
            	<div style="height: 40px;">
            		<img src="../../../images/info.jpg" width="170px" height="50px" class="url" name="parentsurl"/>
            		<%--<input onclick="testtest()" type="button" class="layui-btn"  style="float: right; width: 65px;" value="签名"></input>--%>
            	</div>
                <hr />
                <input type="datetime" readonly class="form-control applydate" name="parentsapplydate">
            </td>
            
        </tr>
        <!--指导教师意见-->
        <tr id="1">
            <td>指导教师意见</td>
            <td colspan="3">
            	<div>
            		<input type="radio" name="opinion1" class="agree" value="1" title="同意" />
            		<input type="radio" name="opinion1" class="disagree" value="0" title="不同意"/>
            	</div>
                <textarea name="" cols="100" rows="3" class="form-control advice"></textarea>
            </td>
            <td><div style="height: 50px;">指导教师签名</div>
            <hr />
            <div>签字时间</div>
                               
            </td>
            
            <td colspan="1">
            	<div style="height: 50px;">
            		<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
            		<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
            	</div>
                <hr />
                <input type="datetime"  readonly class="form-control applydate">
            </td>
            
        </tr>
        <!--学生部门意见-->
        <tr id="2">
            <td>学生部门意见</td>
            <td colspan="3">
            	<div>
            		<input type="radio" name="opinion2" class="agree" value="" title="同意"/>
            		<input type="radio" name="opinion2" class="disagree" value="" title="不同意"/>
            	</div>
                <textarea name="" cols="100" rows="3" class="form-control advice"></textarea>
            </td>
            <td><div style="height: 50px;">主管书记签名</div>
            <hr />
            <div>签字时间</div>
                               
            </td>
            
            <td colspan="1">    
            	<div style="height: 50px;">
            		<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
            		<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
            	</div>
                <hr />
                <input type="datetime" readonly class="form-control applydate">
            </td>
            
        </tr>
        <!--教研室意见-->
        <tr id="3">
            <td>教研室意见</td>
            <td colspan="3">
            	<div>
            		<input type="radio" name="opinion3" class="agree" value="1" title="同意"/>
            		<input type="radio" name="opinion3" class="disagree" value="0" title="不同意"/>
            	</div>
                <textarea name="" cols="100" rows="3" class="form-control advice"></textarea>
            </td>
            <td><div style="height: 50px;">教研室主任签名</div>
            <hr />
            <div>签字时间</div>
                               
            </td>
            
            <td colspan="1">    
            	<div style="height: 50px;">
            		<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
            		<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
            	</div>
                <hr />
                <input type="datetime"  readonly class="form-control applydate">
            </td>
            
        </tr>
        <!--计算机学院意见-->
        <tr id="4">
            <td>计算机学院意见</td>
            <td colspan="3">
            	<div>
            		<input type="radio" name="opinion4" class="agree" value="" title="同意"/>
            		<input type="radio" name="opinion4" class="disagree" value="" title="不同意"/>
            	</div>
                <textarea name="" cols="100" rows="3" class="form-control advice"></textarea>
            </td>
            <td><div style="height: 50px;">主管院长签名</div>
            <hr />
            <div>签字时间</div>
                               
            </td>
            
            <td colspan="1">    
            	<div style="height: 50px;">
            		<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
            		<%--<button type="button" class="layui-btn" id="test1" style="float: right;">签名</button>--%>
            	</div>
                <hr />
                <input type="datetime"  readonly class="form-control applydate">
            </td>
        </tr>
        </tbody>
    </table>
    <span>说明：一式两份，一份装订入学生毕业设计（论文）内，一份交学院（直属系）。</span>
</form>
</div>
</body>

</html>