<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户基本信息</title>
<link href="/tutors/css/bootstrap.min.css" rel="stylesheet">
<link href="/tutors/css/style.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <h5>基本信息</h5>
          <div class="ibox-tools"></div>
        </div>
        <div class="" id="ibox-content">
          <table id="layout1" class="table table-bordered">
            <tbody>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">姓名：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.name }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">性别：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.sex }</span>
                </td>
                <td width="10%" rowspan="4" align="center" valign="middle" bgcolor="#FFFFFF">
                  <c:choose>
                    <c:when test="${empty user.pic}">
                      <img id="Student11_Image1"  src=""
                        style="height: 100px; width: 80px; border-width: 0px;">
                    </c:when>
                    <c:otherwise>
                      <img id="Student11_Image1"  src="/upload/${user.pic }"
                        style="height: 100px; width: 80px; border-width: 0px;">
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">邮箱：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.email }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">电话号码：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.telephone }</span>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">出生年月：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.birth }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">民族：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.nation }</span>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">政治面貌：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.face }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">受聘学科：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.titleSubject }</span>
                </td>
              </tr>

            </tbody>
          </table>
          <table id="layout1" class="table table-bordered">
            <tbody>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">职称：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.title }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">学位：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.degree }</span>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">学历：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.eduBackground }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">毕业学校：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.graduatedSchool }</span>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">毕业时间：</td>
                <td width="33%" bgcolor="#FFFFFF">
                  <span>${user.graduatedTime }</span>
                </td>
                <td width="14%" align="right" class="EdtTbBack">毕业专业：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.graduatedMajor }</span>
                </td>
              </tr>
              <tr>
                <td width="14%" height="25" align="right" class="EdtTbBack">家庭住址：</td>
                <td bgcolor="#FFFFFF">
                  <span>${user.address }</span>
                </td>

              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>
</html>