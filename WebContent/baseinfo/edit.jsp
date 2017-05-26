<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户基本信息</title>
<link href="/tutors/css/bootstrap.min.css" rel="stylesheet">
<link href="/tutors/css/style.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/tutors/js/plugins/layui/css/layui.css">
<style type="text/css">
th span.right {
	float: right;
}
</style>
</head>
<body>
  <div class="wrapper wrapper-content">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>修改基本信息</h5>
          <div class="ibox-tools"></div>
        </div>
        <div class="" id="ibox-content">
          <form method="post"
            action="${pageContext.request.contextPath}/UpdateUser?action=updateInfo">
            <table id="layout1" class="table table-bordered">
              <tbody>
                <tr>
                  <td width="20%" height="25" align="right" class="EdtTbBack">姓名：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="name" value="${user.name }" class="form-control">
                  </td>
                  <td width="10%" rowspan="4" align="center" valign="middle"
                    style="position: relative;">

                    <c:choose>
                      <c:when test="${empty user.pic}">
                        <img id="headerImg" src=""
                          style="height: 100px; width: 80px; border-width: 0px;">
                        <div style="position: absolute; top: 190px;">
                          <input type="file" name="name" class="layui-upload-file"
                            accept="image/png,image/gif,image/jpeg">
                        </div>
                      </c:when>
                      <c:otherwise>
                        <img id="headerImg" src="/upload/${user.pic }"
                          style="height: 100px; width: 80px; border-width: 0px;">
                        <div style="position: absolute; top: 190px;">
                          <input type="file" class="layui-upload-file" name="name"
                            accept="image/png,image/gif,image/jpeg">
                        </div>
                      </c:otherwise>
                    </c:choose>
                    <input type="text" name="pic" value="${user.pic }" hidden="hidden" id="filename">

                  </td>

                </tr>
                <tr>
                  <td width="20%" align="right" class="EdtTbBack">性别：</td>
                  <td bgcolor="#FFFFFF">
                    <select name="sex" class="input-sm form-control">
                      <option value="男">男</option>
                      <option value="女">女</option>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">邮箱：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="email" name="email" value="${user.email }" class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">电话号码：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="tel" name="telephone" value="${user.telephone }"
                      class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">出生年月：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="date" name="birth" value="${user.birth }" class="form-control">

                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">民族：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="nation" value="${user.nation }" class="form-control">

                  </td>
                </tr>
                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">政治面貌：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="text" name="face" value="${user.face }" class="form-control">

                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">受聘学科：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="titleSubject" value="${user.titleSubject }"
                      class="form-control">
                  </td>
                </tr>

                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">职称：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="text" name="title" value="${user.title }" class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">学位：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="degree" value="${user.degree }" class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">学历：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="text" name="eduBackground" value="${user.eduBackground }"
                      class="form-control">

                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">毕业学校：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="graduatedSchool" value="${user.graduatedSchool }"
                      class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">毕业时间：</td>
                  <td width="33%" bgcolor="#FFFFFF">
                    <input type="date" name="graduatedTime" value="${user.graduatedTime }"
                      class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" align="right" class="EdtTbBack">毕业专业：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="graduatedMajor" value="${user.graduatedMajor }"
                      class="form-control">
                  </td>
                </tr>
                <tr>
                  <td width="14%" height="25" align="right" class="EdtTbBack">家庭住址：</td>
                  <td bgcolor="#FFFFFF">
                    <input type="text" name="address" value="${user.address }" class="form-control">
                  </td>

                </tr>
              </tbody>
            </table>
            <br />
            <button type="submit" class="btn btn-primary" style="margin: 0 auto">提交</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="/tutors/js/jquery.min.js"></script>
  <script type="text/javascript" src="/tutors/js/plugins/layui/layui.js"></script>
  <script>
	    var path;
	    layui.use('upload', function() {

		layui.upload({
		    url : '/tutors/UploadServlet',
		    success : function(src) {
			console.log(src.filename);
			$("#filename").val(src.filename);
			path = "/upload/" + src.filename;
			console.log("文件路径" + path);
			$("#headerImg").attr('src', path);
		    }
		});
	    });
	</script>
</body>
</html>