function fish_right_prompt
    set -l cwd
    set -l cwd_color (set_color blue)
    set -l symbol_color (set_color blue)

    #if git_is_repo
        #set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
        #set parent_root_folder (dirname $root_folder)
        #set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    #else
    #    set cwd (prompt_pwd)
    #end

    echo -n -s $cwd_color "$cwd"
    set_color --dim

    set -l S (math $CMD_DURATION/1000)
    set -l M (math $S/60)


    echo -n -s " "
    if test $M -gt 1
        echo -n -s $M m
    else if test $S -gt 1
        echo -n -s $S s
    else
        set_color -b white
        set_color cyan
        #echo -n -s $CMD_DURATION ms
        echo -n $CMD_DURATION ms
    end
    set_color normal
  
  set_color -b white  
  set_color black
  printf '[%s]' (date +%H:%M:%S)
  set_color normal
end
