# ls options:
# -A    do not list implied . and ..
# -l    use a long listing format
# -h    with -l and/or -s, print human readable sizes (e.g., 1K 234M 2G)
# -F    append indicator (one of */=>@|) to entries
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'

# Update your system and clean it
alias update-this-shit='sudo apt update && sudo apt upgrade && sudo apt full-upgrade && sudo apt autoremove'

# Maven
alias mci='mvnn clean install'
alias mcp='mvnn clean package'
alias mcv='mvnn clean verify'
alias mct='mvnn clean test'
alias mcr='mvnn clean spring-boot:run -Dspring.output.ansi.enabled=ALWAYS'

alias mvn-dep='mvnn -DprocessDependencyManagement=false versions:display-dependency-updates versions:display-property-updates'
alias mvn-mvnw="mvn -N io.takari:maven:wrapper -Dmaven=3.6.3"

# mvn
notified_maven() {
  if [[ -x ./mvnw ]]; then
    echo "/> Maven Wrapper"
    ./mvnw $@ -Dspring.output.ansi.enabled=ALWAYS
  else
    echo "/> Maven"
    mvn $@ -Dspring.output.ansi.enabled=ALWAYS
  fi

  if [[ $? -eq 0 ]]; then
    notify-send --icon=face-cool "`basename $(pwd)`: mvn $*" "Build SUCCESS"
  else
    notify-send --icon=face-crying "`basename $(pwd)`: mvn $*" "Build FAILED"
  fi
}
alias mvnn=notified_maven


# Git - fetch all repositories in current directory
refresh_all_repos() {

  count_all=0;
  count_up_to_date=0;
  count_updated=0;
  count_need_to_push=0;
  count_diverged=0;
  count_conflict=0;
  count_no_remote=0;

  for repo in $(find `pwd` -name .git -type d -prune -exec dirname {} \;)
  do
    echo -e "\n\033[38;5;246m ############# $repo \033[0m";
    count_all=$((count_all+1));

    /usr/bin/git -C $repo ls-remote --exit-code --quiet origin 2>&1 >/dev/null;
    NO_REMOTE=$?
    if [[ "NO_REMOTE" -ne 0 ]]; then
      echo -e "> No remote (origin)\n"
      count_no_remote=$((count_no_remote+1));
      continue;
    fi

    /usr/bin/git -C $repo remote update 2>&1 >/dev/null;
    ERROR=$?

    if [ "$ERROR" -eq 0 ]; then

      CURRENT_BRANCH=$(/usr/bin/git -C $repo rev-parse --abbrev-ref HEAD)
      if [[ "$CURRENT_BRANCH" != "master" ]]; then
        /usr/bin/git -C $repo checkout master
        echo -e "> Changed to master branch\n"
      fi

      LOCAL=$(/usr/bin/git -C $repo rev-parse @)
      REMOTE=$(/usr/bin/git -C $repo rev-parse @{u})
      BASE=$(/usr/bin/git -C $repo merge-base @ @{u})

      if [ $LOCAL = $REMOTE ]; then
        count_up_to_date=$((count_up_to_date+1));
        echo -e "\033[38;5;36m  👍 Already up to date \033[0m";
      elif [ $LOCAL = $BASE ]; then
        /usr/bin/git -C $repo fetch -p | awk '{ print "    " "\033[38;5;239m" $ "\033[0m" }';
        /usr/bin/git -C $repo rebase --autostash | awk '{ print "    " "\033[38;5;239m" $ "\033[0m" }';
        count_updated=$((count_updated+1));
        echo -e "\033[38;5;120m  ✓ Updated \033[0m";
      elif [ $REMOTE = $BASE ]; then
        count_need_to_push=$((count_need_to_push+1));
        echo -e "\033[38;5:124m  📌 Need to push \033[0m"
      else
        count_diverged=$((count_diverged+1));
        echo -e "\033[38;5;160m  🖓 Diverged \033[0m"
      fi
    else
      count_conflict=$((count_conflict+1));
      echo -e "\033[38;5;160m  ⚡ Failure \033[0m"
    fi
  done

  echo -e "\n\033[38;5;239m 📊 of ${count_all} Git Repos \033[0m"
  echo -e "\033[38;5;239m ${count_up_to_date} are up to date \033[0m"
  echo -e "\033[38;5;239m ${count_updated} were updated \033[0m"
  echo -e "\033[38;5;239m ${count_need_to_push} need a push \033[0m"
  echo -e "\033[38;5;239m ${count_diverged} are diverged \033[0m"
  echo -e "\033[38;5;239m ${count_conflict} have conflicts \033[0m"
  echo -e "\033[38;5;239m ${count_no_remote} have no remote \033[0m"
}
alias fetch-all=refresh_all_repos

