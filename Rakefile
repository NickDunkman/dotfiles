require 'rake'

class Array
  def not_contain(other_arr)
    unless other_arr.is_a? Array
      raise ArgumentError, "The argument must be an array"
    end
    
    select { |s| !other_arr.any? { |o| s[o] } }
  end
  def contain(other_arr)
    unless other_arr.is_a? Array
      raise ArgumentError, "The argument must be an array"
    end
    
    select { |s| other_arr.any? { |o| s[o] } }
  end
end

task :test do
  nickyd = 
  puts nickyd
end

desc "Hook our dotfiles into system-standard positions."
task :install do
  # run all install.sh files
  Dir.glob('**/install.sh').each do |installer|
    puts "running #{installer} ..."
    system("sh -c #{installer}")
  end

  # copy .symlink files into home directory
  skip_all = false
  overwrite_all = false
  backup_all = false
  Dir.glob('*/**{.symlink}').each do |linkable|
    overwrite = false
    backup = false

    file = File.basename(linkable).split('.')[0...-1].join('.')
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :default => 'install'