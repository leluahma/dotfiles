git_bundles = [ 
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/scrooloose/nerdcommenter.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://git.wincent.com/command-t.git",
  #"git://github.com/rstacruz/sparkup.git",
  #"git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/edsono/vim-matchit.git",
  "git://github.com/cakebaker/scss-syntax.vim.git",
]

vim_org_scripts = [
  #["YankRing",      "13554",  "zip"],
  ["scratch",       "2050",   "plugin"],
  ["jquery",        "12276",  "syntax"]
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_files = [
    ".gitignore",
    "Makefile",
    "Rakefile",
    "Readme.*",
    ".bundle"

]
git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
  git_files.each do |file|
    FileUtils.rm_rf(File.join(dir, file))
  end
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

