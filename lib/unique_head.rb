# Unique header generation
require 'middleman-core/renderers/redcarpet'
require 'digest'
require 'erb'
require 'json'

class UniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML

  attr_accessor :input_params

  def initialize
    super
    @head_count = {}
    @input_params = loadJsonParams()
  end

  def header(text, header_level)
    friendly_text = text.gsub(/<[^<]+>/,"").parameterize
    if friendly_text.strip.length == 0
      # Looks like parameterize removed the whole thing! It removes many unicode
      # characters like Chinese and Russian. To get a unique URL, let's just
      # URI escape the whole header
      friendly_text = Digest::SHA1.hexdigest(text)[0,10]
    end
    @head_count[friendly_text] ||= 0
    @head_count[friendly_text] += 1
    if @head_count[friendly_text] > 1
      friendly_text += "-#{@head_count[friendly_text]}"
    end
    return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end

  def preprocess(full_document)
    full_document = super(full_document) if defined?(super)
    full_document = ERB.new(full_document).result(binding)
    return full_document
  end

  # Method used to load the API parameters and their descriptions
  def loadJsonParams()
    file = File.open(File.join(__dir__, "../source/includes/_api_inputs.json"))
    json = file.read
    parsed = JSON.parse(json)
    return parsed
  end

    # Method returning an api parameter with its type and description
    def getParameter(param, required, additional=nil)
      type = @input_params[param]["type"]
      description = @input_params[param]["description"]
      if required == "required"
        name = "**#{param}**"
      else
        name = "*#{param}*"
      end
      return " #{name} | #{type} | #{description} #{additional}"
    end
end
