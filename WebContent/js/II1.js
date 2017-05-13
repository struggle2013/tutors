/**
 * Model and View For Info I3
 */
(function($){
  
  $("#fbny1").datepicker({autoclose:true, format:"yyyy-mm-dd", language:"zh-CN", startDate:"2014-06-01", endDate:"2017-05-31"});
  
  var IIModel = Backbone.Model.extend({
    defaults: {
      "fbny":"2014-06-01"
    }
  });
  $(".btnAdd").click(function(){
      
      $('#dialog').data('info', new IIModel());
      $('#dialog').modal('show');
  });
  var IICollect  = Backbone.Collection.extend({model: IIModel});
  
  var IIView = Backbone.View.extend({
    el: $('#view'),
    initialize: function() {
      this.render();
      this.listenTo(this.model, "update", this.render);
      this.listenTo(this.model, "change", this.render);
    },
    render: function() {
      var vbody = $("#vbody");
      vbody.html("");
    	
      var self = this;
      var size = this.model.length;
      for(var i=0; i<size; i++) {
    	  var infoi = this.model.models[i];
    	  
    	  var atr = $("<tr></tr>");
    	  $("<td><input type='checkbox' id='ckIRow'"+i+"></td>").appendTo(atr);
    	  $("<td>"+(i+1)+"</td>").appendTo(atr);
    	  $("<td>"+infoi.attributes.wzmc+"</td>").appendTo(atr);
    	  $("<td>"+infoi.attributes.kwhymc+"</td>").appendTo(atr);
    	  $("<td>"+infoi.attributes.fbny+"</td>").appendTo(atr);
    	  
    	  var jsqk = [];
    	  if($.trim(infoi.attributes.jsxt)!='') jsqk.push($.trim(infoi.attributes.jsxt));
    	  if($.trim(infoi.attributes.slhm)!='') jsqk.push($.trim(infoi.attributes.slhm));
    	  if($.trim(infoi.attributes.fq)!='') jsqk.push($.trim(infoi.attributes.fq));
    	  if($.trim(infoi.attributes.yxyz)!='') jsqk.push($.trim(infoi.attributes.yxyz));
    	  jsqk = jsqk.join(";");
    	  
    	  $("<td>"+jsqk+"</td>").appendTo(atr);
    	  $("<td>"+infoi.attributes.pm+"</td>").appendTo(atr);
          atr.appendTo(vbody);
      }
    },
    events: {
      "click .btnAdd": "showDialogForAdd",
      "click .btnMod": "showDialogForMod",
      "click .btnDel": "deleteItems"
    },
    showDialogForAdd: function() {
      var size = this.model.length;
      $('#dialog').data('info', new IIModel());
      $('#dialog').modal('show');
    },
    showDialogForMod: function() {
      var self = this;
      var size = this.model.length;
      var ckcnt = 0;
      var modifyAt = -1;
      for(var i=0; i<size; i++) {
        var tr = $(self.el).find('tbody tr').get(i);
        var tds = $(tr).children('td');
        var chk = ($(tds.get(0)).children("input:checkbox"))[0];
        if($(chk).is(":checked")) {modifyAt=i; ckcnt++;}
      }
      if(ckcnt==0) {
        $('#errorMessage .modal-body').html("请选择1条需要修改的记录。");
        $('#errorMessage').modal('show');
        return;
      }
      if(ckcnt>=2) {
        $('#errorMessage .modal-body').html("请只选择1条需要修改的记录。");
        $('#errorMessage').modal('show');
        return;
      }
    var info = this.model.at(modifyAt);
    $("#wzmc").val(info.attributes.wzmc);
    $("#kwhymc").val(info.attributes.kwhymc);
    $("#fbny").val(info.attributes.fbny);
    $("#jsxt").val(info.attributes.jsxt);
    $("#fq").val(info.attributes.fq);
    $("#yxyz").val(info.attributes.yxyz);
    $("#slhm").val(info.attributes.slhm);
    $("#pm").val(info.attributes.pm);
    $('#dialog').data('info', info);
    $('#dialog').modal('show');
    },
    deleteItems: function() {
      var self = this;
      var size = this.model.length;
      var ckcnt = 0;
      for(var i=size-1; i>=0; i--) {
        var tr = $(self.el).find('tbody tr').get(i);
        var tds = $(tr).children('td');
        var chk = ($(tds.get(0)).children("input:checkbox"))[0];
        if($(chk).is(":checked")) {
          this.model.remove(this.model.at(i));
      $(chk).prop("checked", false);
      ckcnt++;
        }
      }
      if(ckcnt==0) {
        $('#errorMessage .modal-body').html("请选择1条需要删除的记录。");
        $('#errorMessage').modal('show');
        return;
      }
    }
    
  });
  
  $.getJSON("/tutors/DataServlet?action=paper", function(resp){
	  sdlx.II1 = new IICollect(resp.data);
	  var infoIIView = new IIView({model: sdlx.II1});
  });
  
  $('#dialog').modal({keyboard: false}); 
  $('#dialog .btn-cancel').click(function(){
    $('#dialog').modal('hide');
  });
  $('#dialog .btn-ok').click(function(){
    $('#dialog').modal('hide');
    var info = $('#dialog').data('info');
    info.set({wzmc:$("#wzmc").val(), kwhymc:$("#kwhymc").val(), fbny:$("#fbny").val(), jsxt:$("#jsxt").val(), fq:$("#fq").val(),
      yxyz:$("#yxyz").val(), slhm:$("#slhm").val(), pm:$("#pm").val()});
    sdlx.II1.add([info], {merge: true});
    $('#dialog').data('info', null);
  });

})(jQuery);