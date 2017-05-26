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
  <div>
    <div class="col-sm-10 col-sm-offset-1">

      <div id="view">
        <h1 class="my-form-group-label">近三年发表的主要学术论文（2014.6.1-2017.5.31）</h1>
        <p class="text-warning">只填写第一、二作者或通讯作者发表的论文，学术论文为已正式刊出的论文，录用待发表的请不要填写。检索情况请填写：SCI、EI、SSCI、CSSCI。</p>
        <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
          <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
            <span class="glyphicon glyphicon-plus"></span> 增加
          </button>

          <a class="btn btn-default" href="/tutors/DataServlet?action=paper">刷新</a>

        </div>
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th>名称</th>
              <th>发表刊物或出版单位、卷、期及页码</th>
              <th>发表时间</th>
              <th>检索情况</th>
              <th>本人排序</th>
              <th>是否是本校</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody id="vbody">
            <c:forEach var="paper" items="${papers }">
              <tr id="${paper.id }">
                <td>${paper.name }</td>
                <td>${paper.publication }</td>
                <td>${paper.publicationTime }</td>
                <td>${paper.retrieval }</td>
                <td>${paper.signatureOrder }</td>
                <td>${paper.school}</td>
                <td colspan="2">
                  <a type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#myModalUpdate" onclick="editInfo('${paper.id}',this)"> 修改 </a>
                  <button type="button" class="btn btn-danger del" onclick="del('${paper.id}')">
                    删除</button>

                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
              <h4 class="modal-title" id="modalI2Label">发表论文</h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" id="dialogII"
                action="/tutors/DataServlet?action=save&param=paper" method="post">
                <div class="form-group">
                  <label for="wzmc" class="col-sm-2 control-label">名称</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control input-sm" name="name" placeholder="名称"
                      style="width: 30em;">
                  </div>
                </div>
                <div class="form-group">
                  <label for="kwhymc" class="col-sm-2 control-label">发表刊物或出版单位</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control input-sm" name="publication"
                      placeholder="刊物/会议名称，卷（期）号，会议地点" style="width: 30em;"> <span
                      id="helpBlock" class="help-block">请按以下格式填写：<br> 期刊：名称；卷（期）；ISSN号<br>
                      会议：名称；地点；
                    </span>
                  </div>
                </div>
                <div class="form-group">
                  <label for="fbny" class="col-sm-2 control-label">发表时间</label>
                  <div class="col-sm-10">
                    <div id="fbny1" class="input-append date">
                      <input type="date" class="form-control input-sm" name="publicationTime"
                        value="2010-05-01" style="width: 30em;"> <span class="add-on"><i
                        class="icon-th"></i></span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="jsxt" class="col-sm-2 control-label">检索系统</label>
                  <div class="col-sm-10">
                    <select class="form-control input-sm" name="retrieval" style="width: 8em;">
                      <option value=""></option>
                      <option value="EI">EI</option>
                      <option value="SCI">SCI</option>
                      <option value="SSCI">SSCI</option>
                      <option value="CSSCI">CSSCI</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="pm" class="col-sm-2 control-label">本人排序</label>
                  <div class="col-sm-10">
                    <select class="form-control input-sm" name="signatureOrder" style="width: 14em;">
                      <option value="通讯作者">通讯作者</option>
                      <option value="第1作者">第1作者</option>
                      <option value="第2作者（导师为1作）">第2作者（导师为1作）</option>
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
          <h4 class="modal-title" id="modalI2Label">修改论文</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=update&param=paper" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" id="name"
                  placeholder="名称" style="width: 30em;" value="协同过滤算法的研究与实现">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">发表刊物或出版单位</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="publication" id="publication"
                  placeholder="刊物/会议名称，卷（期）号，会议地点" style="width: 30em;" value="中国知网"> <span
                  id="helpBlock" class="help-block">请按以下格式填写：<br> 期刊：名称；卷（期）；ISSN号<br>
                  会议：名称；地点；
                </span>
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">发表时间</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="date" class="form-control input-sm" name="publicationTime"
                    id="publicationTime" value="2010-05-01" style="width: 30em;"> <span
                    class="add-on"><i class="icon-th"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">检索系统</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="retrieval" style="width: 8em;"
                  id="retrieval">
                  <option value=""></option>
                  <option value="EI">EI</option>
                  <option value="SCI">SCI</option>
                  <option value="SSCI">SSCI</option>
                  <option value="CSSCI">CSSCI</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">本人排序</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="signatureOrder" style="width: 14em;"
                  id="signatureOrder">
                  <option value="通讯作者">通讯作者</option>
                  <option value="第1作者">第1作者</option>
                  <option value="第2作者（导师为1作）">第2作者（导师为1作）</option>
                </select>
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
		var publication = $("#myModalUpdate #publication").val();
		var publicationTime = $("#myModalUpdate #publicationTime")
			.val();
		var retrieval = $("#myModalUpdate #retrieval").val();
		var school = $("#myModalUpdate #school").val();
		var signatureOrder = $("#myModalUpdate #signatureOrder").val();
		var id = $("#myModalUpdate #id").val();
		$.ajax({
		    url : "/tutors/DataServlet?action=update&param=paper",
		    type : "post",
		    data : {
			id : id,
			name : name,
			publication : publication,
			publicationTime : publicationTime,
			retrieval : retrieval,
			signatureOrder:signatureOrder,
			school : school,
		    },
		    success : function(data) {
			var paperTag = $("#" + id).children();
			paperTag[0].innerText = name;
			paperTag[1].innerText = publication;
			paperTag[2].innerText = publicationTime;
			paperTag[3].innerText = retrieval;
			paperTag[4].innerText = signatureOrder;
			paperTag[5].innerText = school;
			$("#myModalUpdate").modal("hide");
		    }
		});
	    }
	    function del(id) {
		var ok = confirm("你确定要删除吗?");
		if (ok) {
		    $.ajax({
			url : "/tutors/DataServlet?action=del&param=paper",
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
		var publication = paperTag[1].innerText;
		var publicationTime = paperTag[2].innerText;
		var retrieval = paperTag[3].innerText;
		var signatureOrder = paperTag[4].innerText;
		var school = paperTag[5].innerText;

		$("#myModalUpdate #name").val(name);
		$("#myModalUpdate #publication").val(publication);
		$("#myModalUpdate #publicationTime").val(publicationTime);
		$("#myModalUpdate #retrieval").val(retrieval);
		$("#myModalUpdate #school").val(school);
		$("#myModalUpdate #signatureOrder").val(signatureOrder);
		$("#myModalUpdate #id").val(id);
	    }
	</script>
</body>
</html>