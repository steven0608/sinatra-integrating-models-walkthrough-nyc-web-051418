require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @num_words=@analyzed_text.count_of_words
    @num_vowels=@analyzed_text.count_of_vowels
    @num_consonants=@analyzed_text.count_of_consonants
    @most_used_letter=@analyzed_text.most_used_letter.keys.first.upcase
    @used_times=@analyzed_text.most_used_letter.values.first
@page1="Number of Words: #{num_words}"
    erb :results
  end
end
