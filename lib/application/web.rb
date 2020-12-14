require_relative "../init"

require "sinatra"
require "csv"

require "application/helpers/view"

require "domain/pair"
require "domain/list"

require "domain/list_repository"

include Helpers::View

configure do
  set :views, "lib/views"
end

helpers do
  def stage_path
    stage = ENV["STAGE"]
    return if stage.nil? || stage.empty?

    "/#{stage}"
  end
end

get "/" do
  erb :index
end

post "/lists" do
  title = params[:title]

  file_content = params.dig(:pairs, :tempfile).read
  pairs = CSV.parse(file_content).map do |(question, answer)|
    Pair.new(question: question, answer: answer)
  end

  list = List.new(title: title, pairs: pairs)

  repository = ListRepository.new
  repository.save_list(list)

  redirect to("#{stage_path}/list/#{list.slug}")
end

get "/list/:slug" do
  repository = ListRepository.new
  @list = repository.find_list_by_slug(params[:slug])
  erb :list
end
