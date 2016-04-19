window.log_reg = function(){
    $('#login_btn')[0].onclick = function(){
        $.post("/log_in",{userName: $('#userName')[0].value,password: $('#password')[0].value},function(data,textStatus){
            if(data == 'invalid'){
                $('#reminder')[0].style.display = 'inline';
            }else{
                document.location = data;
            }
        });
    }

    $('#register')[0].onclick = function(){
        if($('#pwd')[0].value != $('#pwd_confirm')[0].value){
            $('#pwd_confirm')[0].value = '';
            return false;
        }
        if($('#pwd')[0].value.length < 6){
            return false;
        }
    };

    $('#regUserName')[0].onblur = function(){
        if($('#regUserName')[0].value.length < 6){
            alert('用户名至少需要6位');
            $('#regUserName')[0].value = '';
            return;
        }else{
            $.get("/action.do?action=checkRegUserExists&validName=" + $('#regUserName')[0].value,
                function(data,textStatus){
                    if(data == 'exists'){
                        alert("用户名已存在");
                    }
                });
        }
    };
    //jquery .get .post方法适用于ajax.
};

window.create_hidden_node = function(name, value){
    var input_node = document.createElement('input');
    input_node.type = 'hidden';
    input_node.name = name;
    input_node.value = value;
    return input_node;
};

window.ask_q = function(){
    init_editor({
        'editor' : 'ask_q_editor',
        'defl_val' : '补充两句',
        'btn_bar' : 'ask_q_editor_bar',
        'pic_btn' : "ask_q_ins_pic_btn",
        'pst_btn' : "ask_q_pst_answer_btn",
        'upload_btn' : 'ask_q_fileupload'
    });

    window.move_tag = function(obj, id){
        var pid = obj.parentNode.id;
        obj.parentNode.removeChild(obj);
        obj.onclick=function(){
            move_tag(this,pid);
        };
        document.getElementById(id).appendChild(obj);
    };

    $('#ask_q_pst_answer_btn')[0].onclick = function(){
        //获得需要的data
        var title = $('#q_title')[0].innerText;
        var content = $('#ask_q_editor')[0].innerHTML;
        var tags = $('#tags_added')[0].childNodes;
        var points = $('#points')[0].value;

        if(title.length == 0){
            alert("题目名称不能为空");
            return false;
        }

        if(content == '补充两句'){
            content = '如题.';
        }

        var tag_ids = '';
        for(var i = 0; i < tags.length; i++){
            var id = tags[i].childNodes[1].innerText;
            tag_ids += id + ' ';
        }

        //创建隐藏表单，存放数据
        var form = document.createElement('form');
        form.method = 'post';
        form.name = 'qform';
        form.action = '/action.do';
        form.appendChild(create_hidden_node('action','post_q'));
        form.appendChild(create_hidden_node('title', title));
        form.appendChild(create_hidden_node('content',content));
        form.appendChild(create_hidden_node('tags',tag_ids));
        form.appendChild(create_hidden_node('points',points));
        form.submit();

    };
};

window.detail_q = function(){
    init_editor({
        'editor' : 'ans_q_editor',
        'defl_val' : '我来说两句',
        'btn_bar' : 'ans_q_editor_bar',
        'pic_btn' : "ans_ins_pic_btn",
        'pst_btn' : "pst_answer_btn",
        'upload_btn' : 'ans_fileupload'
    });

    //为各个“赞”按钮添加onclick
    function init_like_btn(like_btn, aid, like_ans_num){
        like_btn.onclick = function(){
            $.get("/action.do",{action: 'like_ans',qid: $('#qid')[0].value, aid: aid},function(data,textStatus){
                like_ans_num.innerText = data;
            });
        };
    }

    var like_btns = $('.like_ans_btn');
    var like_nums = $('.like_ans_num');
    for(var index = 0; index < like_btns.length; index++){
        var like_btn = like_btns[index];
        var like_ans_num = like_nums[index];
        var id = like_btn.id;
        init_like_btn(like_btn, id, like_ans_num);
    }

    //为各个“采纳”按钮添加onclick
    var adopt_btns = $('.adopt_btn');
    for(var index = 0; index < adopt_btns.length;index++){
        var adopt_btn = adopt_btns[index];
        var id = adopt_btn.id;
        adopt_ans(adopt_btn,id,adopt_btns);
    }

    function adopt_ans(adopt_btn,aid,adopt_btns){
        adopt_btn.onclick = function(){
            $.get("/action.do",{action: 'adopt_ans',qid: $('#qid')[0].value, aid: aid},function(data,textStatus){
                adopt_btn.innerText = '已采纳';
                adopt_btn.disabled = 'disabled';
                for(var i = 0;i < adopt_btns.length;i++){
                    if(adopt_btns[i].id != aid){
                        adopt_btns[i].style.display = 'none';
                    }
                }
            });
        }
    }

    $('#like_q_btn')[0].onclick = function(){
        var like_num = parseInt($('#like_q_nums')[0].innerText) + 1;
        $.get("/action.do",{action: 'like_q',qid: $('#qid')[0].value,liked_q: like_num},function(data,textStatus){
           $('#like_q_nums')[0].innerText = data;
        });
    };

    //使用Ajax，方法的三个参数分别为：url，传递的内容和回调函数
    $('#pst_answer_btn')[0].onclick = function(){
        var ans = $('#ans_q_editor')[0].innerHTML;
        $.post("/action.do",{action: 'post_ans',qid: $('#qid')[0].value,ans: ans}, function(data,textStatus){
            document.location = data;
        });
    };
};

window.q_list = function(){
    init_switch_tab(['latest_', 'hotest_']);

    $('#search_u_btn')[0].onclick = function(){
        var key = $('#keyValue')[0].value.trim();
        var form = document.createElement('form');
        form.method = 'get';
        form.action = '/action.do';
        form.appendChild(create_hidden_node('action','search_user'));
        form.appendChild(create_hidden_node('key', key));
        form.submit();
    }

    $('#search_q_btn')[0].onclick = function(){
        var key = $('#keyValue')[0].value.trim();
        var form = document.createElement('form');
        form.method = 'get';
        form.action = '/action.do';
        form.appendChild(create_hidden_node('action','search_question'));
        form.appendChild(create_hidden_node('key', key));
        form.submit();
    }
};

