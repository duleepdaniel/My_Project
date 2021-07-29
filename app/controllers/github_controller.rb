class GithubController < ApplicationController
    before_action do
        BASE_URL = 'https://api.github.com/users/'
    end
    def home ;end

    def projects
        uri = URI(BASE_URL + params[:username] + "/repos")
        check_user ? @error = "User #{params[:username]} Does not Exist!" : get_response(uri)
    end

    def check_user
        response = JSON.parse(Net::HTTP.get( URI(BASE_URL + params[:username])))
        response.has_key?("message")
    end

    def top_10
        uri = URI("https://api.github.com/search/repositories?q=sort=stars&order=desc&per_page=10")
        get_response(uri, "items")
    end

    def ruby_top_10
        uri = URI("https://api.github.com/search/repositories?q=language:ruby&sort=stars&order=desc&per_page=10")
        get_response(uri, "items")
    end

    private
    require 'net/http'
    def get_response(url, *args)
        response = JSON.parse(Net::HTTP.get(url))
        collection = args.present? ? response[args.first] : response
        collection.each do |r|
            r.slice!("name","description")
        end
        @all = collection
    end
end
