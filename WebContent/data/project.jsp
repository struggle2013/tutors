<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/tutors/css/bootstrap.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
  <div class="col-sm-10 col-sm-offset-1">

    <div id="view">
      <h1 class="my-form-group-label">正在承担的主要科研项目情况</h1>
      <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
          <span class="glyphicon glyphicon-plus"></span> 增加
        </button>

        <a class="btn btn-default" href="/tutors/DataServlet?action=project">刷新</a>

      </div>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>项目、课题名称 (编号、合同号)</th>
            <th>项目来源</th>
            <th>负责人</th>
            <th>起止时间</th>
            <th>经费总额</th>
            <th>本人可支 配经费数</th>
            <th>本人排名</th>
            <th>是否是本校成果</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="vbody">
          <c:forEach var="project" items="${projects }">
            <tr id="${project.id }">
              <td>${project.name }</td>
              <td>${project.projectSource }</td>
              <td>${project.personInCharge }</td>
              <td>${project.startTime }</td>
              <td>${project.fundAll }</td>
              <td>${project.myFund }</td>

              <td>${project.signatureOrder }</td>
              <td>${project.school}</td>
              <td>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                  data-target="#myModalUpdate" onclick="editInfo('${project.id}',this)">修改</button>
                <button type="button" class="btn btn-danger del" onclick="del('${project.id}')">
                  删除</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="modalI2Label">在研项目</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=save&param=project" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" placeholder="名称"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">项目来源</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="projectSource"
                  placeholder="项目来源" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">负责人</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="personInCharge"
                  placeholder="负责人" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">开始时间</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="date" class="form-control input-sm" name="startTime"
                    value="2010-07-01" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">经费总额</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="fundAll" id="fundAll"
                  value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">本人可支 配经费数</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="myFund" id="myFund"
                  value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">本人排名</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="signatureOrder"
                  placeholder="本人排名" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">是否为本校</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="school" style="width: 14em;">
                  <option value="是">是</option>
                  <option value="否">否</option>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal">取消</button>
              <button type="submit" class="btn btn-primary">保存</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
  <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="modalI2Label">在研项目</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=update&param=paper" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" id="name"
                  placeholder="名称" style="width: 30em;" value="">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">项目来源</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="projectSource"
                  id="projectSource" placeholder="项目来源" style="width: 30em;" value="">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">负责人</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="personInCharge"
                  id="personInCharge" placeholder="负责人" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">开始时间</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="date" class="form-control input-sm" name="startTime" id="startTime"
                    value="2010-07-01" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">经费总额</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="fundAll" id="fundAll"
                  value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">本人可支 配经费数</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="myFund" id="myFund"
                  value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">本人排名</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="signatureOrder"
                  id="signatureOrder" placeholder="本人排名" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">是否为本校</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="school" style="width: 14em;" id="school">
                  <option value="是">是</option>
                  <option value="否">否</option>
                </select>
              </div>
            </div>
            <input type="text" value="" style="display: none;" id="id">
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal">取消</button>
              <button type="button" class="btn btn-primary" onclick="update()">保存</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>


  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/plugins/layer/layer.min.js"></script>
  <script>
	    function update() {
		var name = $("#myModalUpdate #name").val();
		var projectSource = $("#myModalUpdate #projectSource").val();
		
		var personInCharge = $("#myModalUpdate #personInCharge").val();
		var startTime = $("#myModalUpdate #startTime").val();
		var fundAll = $("#myModalUpdate #fundAll").val();
		
		var myFund = $("#myModalUpdate #myFund").val();
		var school = $("#myModalUpdate #school").val();
		var signatureOrder = $("#myModalUpdate #signatureOrder").val();
		var id = $("#myModalUpdate #id").val();
		$.ajax({
		    url : "/tutors/DataServlet?action=update&param=project",
		    type : "post",
		    data : {
			id : id,
			name : name,
			projectSource : projectSource,
			personInCharge : personInCharge,
			startTime : startTime,
			fundAll : fundAll,
			
			signatureOrder : signatureOrder,
			myFund : myFund,
			school : school,
		    },
		    success : function(data) {
			var paperTag = $("#" + id).children();
			paperTag[0].innerText = name;
			paperTag[1].innerText = projectSource;
			paperTag[2].innerText = personInCharge;
			paperTag[3].innerText = startTime;
			paperTag[4].innerText = fundAll;
			paperTag[5].innerText = myFund;
			paperTag[6].innerText = signatureOrder;
			paperTag[7].innerText = school;
			
			$("#myModalUpdate").modal("hide");
		    }
		});
	    }
	    function del(id) {
		var ok = confirm("你确定要删除吗?");
		if (ok) {
		    $.ajax({
			url : "/tutors/DataServlet?action=del&param=project",
			type : "post",
			data : {
			    id : id
			},
			success : function(data) {
			    $("#" + id).remove();
			    console.log(data);
			}
		    });
		}
	    }

	    function editInfo(id, obj) {
		var paperTag = $("#" + id).children();
		var name = paperTag[0].innerText;
		var projectSource = paperTag[1].innerText;
		var personInCharge = paperTag[2].innerText;
		var startTime = paperTag[3].innerText;
		var fundAll = paperTag[4].innerText;
		var myFund = paperTag[5].innerText;
		var signatureOrder = paperTag[6].innerText;
		var school = paperTag[7].innerText;

		$("#myModalUpdate #name").val(name);
		$("#myModalUpdate #projectSource").val(projectSource);
		$("#myModalUpdate #personInCharge").val(personInCharge);
		$("#myModalUpdate #startTime").val(startTime);
		$("#myModalUpdate #fundAll").val(fundAll);
		$("#myModalUpdate #myFund").val(myFund);
		$("#myModalUpdate #signatureOrder").val(signatureOrder);
		$("#myModalUpdate #school").val(school);
		
		$("#myModalUpdate #id").val(id);
	    }
	</script>
</body>
</html>