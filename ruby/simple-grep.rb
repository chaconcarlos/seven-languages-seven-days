def print_help()
  puts "Usage: ruby simple-grep.rb [FILE_NAME] [TEXT]"
end

def print_results(results=[])
  unless results.empty?
    results.each do | line, content |
      puts "#{line}: #{content}"
    end
  else
    puts "No results found."
  end
end

def perform_search(filepath, text)
  puts "Searching for occurrences of \"#{text}\" in #{filepath}..."

  if File.exists?(filepath)
    results = {}

    begin
      File.readlines(filepath).each_with_index do | line_content, line_index |
        if line_content.match(text)
          results[line_index + 1] = line_content
        end
      end
    rescue => exception
      puts exception
    else
      print_results(results)
    end
  else
    puts "The file \"#{filepath}\" doesn't exist."
  end
end

unless ARGV.length < 2
  perform_search(ARGV[0], ARGV[1])
else
  print_help()
end