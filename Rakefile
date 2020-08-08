require 'rake'

desc "Run install.sh files"
task :installers do
  Dir.glob('**/install.sh').each do |installer|
    puts "running #{installer} ..."
    system("sh -c #{installer}")
  end
end

desc "Set Mac OS preferences"
task :preferences do
  puts "Setting Mac OS preferences ..."
  Dir.glob('**/defaults.sh').each do |defaulter|
    puts "    #{defaulter}"
    system("sh -c #{defaulter}")
  end
end

desc "Link dotfiles into the home directory"
task :symlinks do
  skip_all = false
  overwrite_all = false
  backup_all = false
  Dir.glob('*/**{.symlink}').each do |linkable|
    overwrite = false
    backup = false

    file = File.basename(linkable).split('.')[0...-1].join('.')
    target = "#{ENV["HOME"]}/.#{file}"
    source = `echo "$PWD/#{linkable}"`

    already_has_correct_linkage = false
    if File.symlink?(target)
      already_has_correct_linkage = source == `readlink #{target}`
    end

    if !already_has_correct_linkage && (File.exists?(target) || File.symlink?(target))
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

    unless already_has_correct_linkage
      `ln -s "#{source}" "#{target}"`
    end
  end
end

task :default => ["installers", "preferences", "symlinks"]