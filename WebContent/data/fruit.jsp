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
      <h1 class="my-form-group-label">近三年取得的主要科研成果</h1>
      <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
          <span class="glyphicon glyphicon-plus"></span> 增加
        </button>
        <a class="btn btn-default" href="/tutors/DataServlet?action=fruit">刷新</a>
      </div>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>成果名称</th>
            <th>成果鉴定、颁奖及采用部门</th>
            <th>时间</th>
            <th>本人排名</th>
            <th>是否是本校成果</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="vbody">
          <c:forEach var="fruit" items="${fruits }">
            <tr id="${fruit.id }">
              <td>${fruit.name }</td>
              <td>${fruit.address }</td>
              <td>${fruit.resultTime }</td>
              <td>${fruit.signatureOrder }</td>
              <td>${fruit.school}</td>
              <td>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                  onclick="editInfo('${fruit.id}',this)" data-target="#myModalUpdate">修改</button>
                <button type="button" class="btn btn-danger del" onclick="del('${fruit.id}')">
                  删除</button>

              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
            <h4 class="modal-title" id="modalI2Label">研究成果</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" id="dialogII"
              action="/tutors/DataServlet?action=save&param=fruit" method="post">
              <div class="form-group">
                <label for="wzmc" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" name="name" placeholder="名称"
                    style="width: 30em;">
                </div>
              </div>
              <div class="form-group">
                <label for="kwhymc" class="col-sm-2 control-label">成果鉴定、颁奖及采用部门</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" name="address" placeholder="成果鉴定、颁奖及采用部门"
                    style="width: 30em;">
                </div>
              </div>
              <div class="form-group">
                <label for="fbny" class="col-sm-2 control-label">时间</label>
                <div class="col-sm-10">
                  <div id="fbny1" class="input-append date">
                    <input type="date" class="form-control input-sm" name="resultTime"
                      value="2010-05-01" style="width: 30em;"> <span class="add-on"><i
                      class="icon-th"></i></span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label for="pm" class="col-sm-2 control-label">本人排序</label>
                <div class="col-sm-10">
                  <select class="form-control input-sm" name="signatureOrder" style="width: 14em;">
                    <option value="通讯作者">通讯作者</option>
                    <option value="第1作者">第1作者</option>
                    <option value="第2作者">第2作者</option>
                  </select>
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
            <h4 class="modal-title" id="modalI2Label">研究成果</h4>
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
                <label for="kwhymc" class="col-sm-2 control-label">成果鉴定、颁奖及采用部门</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" name="address" id="address"
                    placeholder="成果鉴定、颁奖及采用部门" style="width: 30em;" value="">
                </div>
              </div>
              <div class="form-group">
                <label for="fbny" class="col-sm-2 control-label">时间</label>
                <div class="col-sm-10">
                  <div id="fbny1" class="input-append date">
                    <input type="date" class="form-control input-sm" name="resultTime" id="resultTime"
                      value="" style="width: 30em;"> <span class="add-on"><i
                      class="icon-th"></i></span>
                  </div>
                </div>
              </div>
              
              <div class="form-group">
                <label for="pm" class="col-sm-2 control-label">本人排名</label>
                <div class="col-sm-10">
                  <select class="form-control input-sm" name="signatureOrder" style="width: 14em;"
                    id="signatureOrder">
                    <option value="通讯作者">通讯作者</option>
                    <option value="第1作者">第1作者</option>
                    <option value="第2作者">第2作者</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="wzmc" class="col-sm-2 control-label">是否为本校</label>
                <div class="col-sm-10">
                  <select class="form-control input-sm" name="school" style="width: 14em;"
                    id="school">
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

  </div>
  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/plugins/layer/layer.min.js"></script>
  <script>
	    function update() {
		var name = $("#myModalUpdate #name").val();
		var address = $("#myModalUpdate #address").val();
		var resultTime = $("#myModalUpdate #resultTime").val();
		
		var school = $("#myModalUpdate #school").val();
		var signatureOrder = $("#myModalUpdate #signatureOrder").val();
		var id = $("#myModalUpdate #id").val();
		$.ajax({
		    url : "/tutors/DataServlet?action=update&param=fruit",
		    type : "post",
		    data : {
			id : id,
			name : name,
			address : address,
			resultTime : resultTime,
			signatureOrder : signatureOrder,
			school : school,
		    },
		    success : function(data) {
			var paperTag = $("#" + id).children();
			paperTag[0].innerText = name;
			paperTag[1].innerText = address;
			paperTag[2].innerText = resultTime;

			paperTag[3].innerText = signatureOrder;
			paperTag[4].innerText = school;
			$("#myModalUpdate").modal("hide");
		    }
		});
	    }
	    function del(id) {
		var ok = confirm("你确定要删除吗?");
		if (ok) {
		    $.ajax({
			url : "/tutors/DataServlet?action=del&param=fruit",
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
		var address = paperTag[1].innerText;
		var resultTime = paperTag[2].innerText;
		var signatureOrder = paperTag[3].innerText;
		var school = paperTag[4].innerText;

		$("#myModalUpdate #name").val(name);
		$("#myModalUpdate #address").val(address);
		$("#myModalUpdate #resultTime").val(resultTime);
		$("#myModalUpdate #school").val(school);
		$("#myModalUpdate #signatureOrder").val(signatureOrder);
		$("#myModalUpdate #id").val(id);
	    }
	</script>
</body>
</html>