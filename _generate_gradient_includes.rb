require 'pathname'
require 'date'

puts 'Generating gradient includes...'

# Define the directory path
gradients_dir = 'static/images/projects/sky-gradients'

# Get the list of files in the directory
filenames = Dir.entries(gradients_dir).select { |file| File.file?(File.join(gradients_dir, file)) && file.end_with?('.jpg') }   

file_records = filenames.map do |filename|
    parts = filename.gsub('.jpg', '').split('-')
    date = Date.iso8601(parts[0])
    season = parts[1].capitalize
    location = parts[2].gsub('+', ' ')

    {
        filename: filename,
        date: date,
        season: season,
        location: location,
        year: date.year
    }
end


files_by_year = file_records.group_by { |file| file[:year] }
years = files_by_year.keys.sort

puts(years.inspect)

File.open('_includes/projects/gradients.html', 'w') do |out|
    years.each do |year|
        files = files_by_year[year].sort_by {|f| f[:date] }

        out.puts "<div class=\"row\">"
        out.puts "<div class=\"one column year_label\"><h2>#{year}</h2></div>"
        out.puts '<div class="eleven columns images">'

        files.each do |file|
            alt = "#{file[:season]} Gradient #{file[:date].strftime('%Y-%m-%d')} #{file[:location]}"
            out.puts "  <a href=\"/static/images/projects/sky-gradients/#{file[:filename]}\" data-lightbox=\"sky-gradients\" data-title=\"#{alt}\">"
            out.puts "    <img class=\"thumbnail\" src=\"/static/images/projects/sky-gradients/thumbnails/#{file[:filename].gsub(".jpg", "-400.jpg")}\" alt=\"#{alt}\"/>"
            out.puts "  </a>"
        end

        out.puts '</div>'
        out.puts "</div>\n\n"
    end
end
