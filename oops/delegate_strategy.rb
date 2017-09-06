class Formatter
  def output_report(title, text)
    raise 'Abstract method in called'
  end
end

class HTMLFormatter < Formatter
  def output_report(title, text)
    "This is a html formatter, #{title} & #{text}"
  end
end

class PlainTextFormatter < Formatter
  def output_report(title, text)
    "This is a plain text formatter, #{title} & #{text}"
  end
end

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

report = Report.new(HTMLFormatter.new)
p report.output_report

text_report = Report.new(PlainTextFormatter.new)
p text_report.output_report
