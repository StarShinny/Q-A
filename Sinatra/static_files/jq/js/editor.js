function obj(o){
	return document.getElementById(o);
}

function init_editor(){
	var editor = obj('editor');
	var defl_str = 'My answer is ...';
	
	editor.innerHTML = defl_str;
	
	editor.onblur = function(){
		$('#editor_bar').css('display', 'none');
		if(editor.innerHTML == ''){
			editor.innerHTML = defl_str;
		}
	};
	editor.onfocus = function(){
		$('#editor_bar').css('display', 'inline');
		if(editor.innerHTML == defl_str){
			editor.innerHTML = '';
		}
	}
	
	init_editor_action();
}

function init_editor_action(){
	ins_pic = obj('insert_pic_btn');
	post_ans = obj('post_answer_btn');
	
	ins_pic.onclick = function(){
		obj('fileupload').click();				
	};
	
	ins_pic.onblur = function(){
		obj('fileupload').style.display='none';
		obj('pbar').style.width = "0%";	
	};
	
	post_ans.onclick = function(){
		content = obj('editor').innerHTML;
		console.log(content);
	};
	
	
}

