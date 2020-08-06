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
  `find . -name install.sh | while read installer ; do sh -c "${installer}" ; done`

  unless File.exists?("git/gitconfig.local.symlink")
    puts "What is your github author name?"
    git_authorname = STDIN.gets.chomp

    puts "What is your github author email?"
    git_authoremail = STDIN.gets.chomp

    `sed -e "s/AUTHORNAME/#{git_authorname}/g" -e "s/AUTHOREMAIL/#{git_authoremail}/g" git/gitconfig.local.symlink.template > git/gitconfig.local.symlink`
  end

  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
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