#encoding=utf-8
module Provider
    require_relative 'init'
    require_relative 'util'
    VAR_POOL = {

         index: lambda{  |params|
           latest_q = Question.find(1)
           hottest_q = Question.find(:all,
                                     :order=>'likes desc')
           var={
               latest_q: latest_q,
               hottest_q: hottest_q
           }
         },

         log_reg: lambda{  |params|

           session = params['session']
           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid
           }
         },

         q_list: lambda{ |params|

           session = params['session']
           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid,
           }
           if(is_valid)
             user_id = session[:current_userid]

             latest_q = Question.find(:all,
                                      :order=>'posedate desc')
             hottest_q = Question.find(:all,
                                       :order=>'likes desc')
             var.merge!(
                 latest_q: latest_q,
                 hottest_q: hottest_q,
                 is_valid: is_valid,
                 name: session[:current_uname]
             )
           end
           var
         },

         editor: lambda{ |params|
           var={}
         },

         ask_q: lambda{ |params|
           session = params['session']
           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid,
           }
           if(is_valid)
             user = User.find(session[:current_userid])
             points = user.point
             today_questionCount = Question.where("datediff(date(now()),date(posedate))=0 and uid=?",user.uid).length

             if(points < 10 and today_questionCount==1)
               var.merge!(able: false)
             elsif(points >= 10 and today_questionCount==3)
               var.merge!(able: false)
             else
               var.merge!(able: true)
             end

             tags = Tag.find(:all)
             session = params['session']
             name = session[:current_uname]
             is_valid = check_session(session, :current_userid)
             var.merge!(
                 tags: tags,
                 name: name
             )
           end
           var
         },

         detail_q: lambda{ |params|
           session = params['session']
           user_id = session[:current_userid]

           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid,
           }
           if(is_valid)
             qid = params['qid']

             #获得的具体信息
             question = Question.find(qid)
             ask_uid = question.uid
             title = question.title
             content = question.content
             likes = question.likes
             point = question.point

             q_tags = Qtag.where("qid=?",qid)
             tag_ids = []
             q_tags.each { |q_tag|
               tag_ids << q_tag.tid
             }
             tags = Tag.find(tag_ids)

             #获得回答的具体信息
             answers = Answer.where("qid=?",qid)
             ans_list = []
             i = 0;
             answers.each{ |answer|
               name =  User.find(answer.uid).name
               ans_list << {
                   user_id: answer.uid,
                   user_name: name,
                   answer: answer,
               }
               i = i+1
             }

             first_ans = ans_list[0]
             var.merge!(
                 user_id: user_id,
                 q_id: qid,
                 d_title: title,
                 d_content: content,
                 d_likes: likes,
                 d_point: point,
                 d_tags: tags,
                 d_answers: ans_list,
                 ans_num: i,       #获得回答的个数
                 first_ans: first_ans,
                 name: session[:current_uname],
                 ask_uid: ask_uid    #提出问题者
             )
           end
           var
         },

         personal: lambda{ |params|
            session = params['session']
            is_valid = check_session(session, :current_userid)
            var = {
                is_valid: is_valid,
            }
            if(is_valid)
              user_id = session[:current_userid]
              user = User.find(user_id)
              name = session[:current_uname]
              mail = user.mail
              point = user.point

              questions = Question.where("uid=?",user_id)

              answers = Answer.where("uid=?",user_id)
              ans_list = []
              answers.each{  |answer|
                ans_list << {
                    answer: answer,
                    q_title: Question.find(answer.qid).title,
                }
              }
              var.merge!(
                  uid: user_id,
                  name: name,
                  mail: mail,
                  point: point,
                  questions: questions,
                  ans_list: ans_list,
              )
            end
            var
         },

         relative_user: lambda{|params|
           session = params['session']
           name = session[:current_uname]
           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid,
           }
           if(is_valid)
             users = params['searched_users']
             var.merge!(
                 users: users,
                 name: name
             )
           end
           var
         },

         relative_q: lambda{|params|
           session = params['session']
           name = session[:current_uname]
           is_valid = check_session(session, :current_userid)
           var = {
               is_valid: is_valid,
           }
           if(is_valid)
             questions = params['searched_questions']
             var.merge!(
                 questions: questions,
                 name: name
             )
           end
           var
         }
    }

    #if the layout of page is not set here,
    #then it is set to default as layout.erb as its layout template
    LAYOUT = {
        :log_reg => :logLayout
    }

end