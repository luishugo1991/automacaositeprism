require 'report_builder'

time = Time.now.getutc
time.localtime

ReportBuilder.configure do |config|
    config.encoding = "utf-8"
    config.input_path = 'reports'
    config.report_path= 'reports/reports'
    config.report_types = [:html]
    config.report_title = 'Relatorio'
    config.color = 'green'
    config.include_images = true
    config.additional_css = 'css_report_builder.css'
    config.additional_info = {
        Browser: 'Chrome',
        'Projeto' => 'automação',
        'Data do Report' => "#{time.strftime('%d/%m/%Y')} - #{time.strftime('%k:%M')}"
    }

end
