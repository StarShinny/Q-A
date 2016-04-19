require 'sinatra'
require 'erb'
require 'rdiscount'
Dir.chdir '../model/'
require_relative '../model/provider'
Dir.chdir '../controller/'
include Provider

routes = Config_loader::ROUTE
set :views, '../views'
use Rack::Session::Pool, :expire_after => 90000
    #2592000

set :public_folder, File.absolute_path('../static_files')

puts "Bundling route mapping..."

routes.each { |url, view|
    get url do
        params['searched_users'] = env['users']||[]
        params['searched_questions'] = env['questions']||[]
        params['session'] = session
        @_ = Provider::VAR_POOL[view.to_sym].call(params)

        puts "#{url.inspect}:#{@_[:is_valid]}"
        if !@_[:is_valid] && url != '/'
          status, headers, body = call env.merge("PATH_INFO" => '/')
          [status, headers, body.map()]
        elsif @_[:is_valid] && url == '/'
          status, headers, body = call env.merge("PATH_INFO" => '/q_list')
          [status, headers, body.map()]
        else
          if request.xhr?
            erb view.to_sym, layout: false
          else
            erb view.to_sym, layout: (Provider::LAYOUT[view.to_sym] || :layout)
          end
        end
    end
}

get %r{/([\w]+)\.(jpg|png|gif)}  do
    (file, exp) = params[:captures]
    file_name = "#{file}.#{exp}"
    if File.exists? file_name
        send_file file_name
    else
        pass
    end
end

#注册url请求映射行为
post '/log_in' do
  name = params[:userName]
  pwd = params[:password]
  users = User.where("name= ? and password= ? ",name,pwd)

  if users.length > 0
    current_user = users[0]
    session[:current_userid] = current_user.uid
    session[:current_uname] = current_user.name
    '/q_list'
  else
    'invalid'
  end
end

post '/action.do' do
  action = params[:action]

  if action == 'register'
      name = params[:regUserName]
      mail = params[:regMail]
      password = params[:regPassword]

      an_user = User.create(
          :name => name,
          :mail => mail,
          :password => password)
      current_user = an_user
      session[:current_userid] = current_user.uid
      session[:current_uname] = current_user.name

      redirect to('/q_list')
  elsif action == 'post_q'

      title = params[:title]
      content = params[:content]
      tags = params[:tags]
      points = params[:points] || 0

      #在Question中插入数据
      an_question = Question.create(
          :uid => session[:current_userid],
          :title => title,
          :content => content,
          :point => points
      )

      #在Qtags中插入数据
      qid = an_question.qid
      tagids = tags.split(/ /)

      for tid in tagids do
         an_qtag = Qtag.create(
            :qid => qid,
            :tid => tid,
         )
      end

      redirect to("/detail_q?qid=#{qid}")

  elsif action == 'post_ans'

      answer = params[:ans]
      qid = params[:qid]

      an_answer = Answer.create(
          :qid => qid,
          :content => answer,
          :uid => session[:current_userid],
      )

      return "/detail_q?qid=#{qid}"

  end

=begin
    an_question = Question.create(
      :title => title,
      :content => content,
      :point => points
    )
=end
end

get '/action.do' do
  action = params[:action]

  if action == 'checkRegUserExists'
    name = params[:validName]
    user = User.where("name = ?",name)
    if user.length > 0
      'exists'
    else
      'notExists'
    end

  elsif action == 'logout'
      session[:current_userid] = nil
      session[:current_uname] = nil
      redirect to("/")

  elsif action == 'like_q'

    question = Question.find(params[:qid])

    question.likes = question.likes + 1
    question.save

    return question.likes.to_s

  elsif action == 'like_ans'
    aid = params[:aid]
    qid = params[:qid]

    answer = Answer.where("aid = ? and qid = ?",aid,qid)[0]
    answer.likes = answer.likes + 1
    answer.save
    return answer.likes.to_s

  elsif action == 'adopt_ans'
    aid = params[:aid]
    qid = params[:qid]

    answer = Answer.where("aid = ? and qid = ?",aid,qid)[0]
    answer.adopted = 'true'
    answer.save

    question = Question.find(qid)
    point = question.point

    answer_userid = answer.uid
    user = User.find(answer_userid)
    user.point = user.point + point
    user.save

    return answer.adopted.to_s

  elsif action == 'search_user'
    users = User.where("name like '%#{params[:key]}%'")
    status, headers, body = call env.merge("PATH_INFO" => '/relative_user', "users" => users)
    [status, headers, body.map()]

  elsif action == 'search_question'
    questions = Question.where("title like '%#{params[:key]}%'")
        status, headers, body = call env.merge("PATH_INFO" => '/relative_q', "questions" => questions)
    [status, headers, body.map()]

  end
end

post '/index' do
    request.body.rewind  # 如果已经有人读了它
    #data = JSON.parse request.body.read
    #content = request.body.read
    #puts content
=begin
    puts request.form_data?
    puts request.media_type
    puts request.instance_variable_names
=end
    #puts request.env.keys
    form_data = request.env['rack.request.form_hash']
    current_dir = Dir.pwd
    img_url = ''
    form_data['files'].each { |file_info|
        file_name = file_info[:filename]
        file_type = file_info[:type]
        tmp_file = file_info[:tempfile]
        content = tmp_file.read
        img = File.open(file_name, 'wb') do |file|
            file.write content
        end
        img_url = '/' + file_name
    }
    img_url
end

=begin
status, headers, body = call env.merge("PATH_INFO" => '/bar')
[status, headers, body.map(&:upcase)]
=end

error do
    'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

not_found do
    #redirect 'wrong place, buddy'
    '404~~'
end

