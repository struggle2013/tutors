sdlx = {};
forms = [ "I1", "I2", "II1", "II2", "II3", "III1", "III2", "III3", "X"];

$(function() {
	
	
	/* 修正输入框末尾可能有不可见sb字符的问题 */
	$("input").blur(function(){
		x = $(this).val();
		$(this).val($.trim(x));
	});
	
	$("textarea").blur(function(){
		x = $(this).val();
		$(this).val($.trim(x));
	});
	
	
	

	$('#errorMessage').modal({
		keyboard : false
	});

	$("#btnSaveOnServer").click(function() {

		$.post('/DataServlet?action=save' + window.current, {
			data : JSON.stringify(sdlx[window.current])
		},"json");
	});

});

(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});
    while (length--) {
        method = methods[length];
        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());

Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	}
	if (/(y+)/.test(format))
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
	return format;
}