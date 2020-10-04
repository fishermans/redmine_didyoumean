class SearchIssuesController < ApplicationController
  unloadable

  include RedmineDidYouMean

  if Rails::VERSION::MAJOR >= 5
    before_action :find_project, :get_query, :get_project_filter, :get_limit
  else
    before_filter :find_project, :get_query, :get_project_filter, :get_limit
  end


  def index
    get_results
    render :json => results_to_json
  end

end
