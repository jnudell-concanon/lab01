DESC=$(hostname)
export PS1="\[\e[01;32m\]\D{%m-%d %T}\[\e[m\] | [\[\e[01;35m\]\u\[\e[m\]\[\e[01;36m\]@\[\e[m\]\[\e[01;35m\]\h\[\e[m\]: \[\e[01;33m\]\w\[\e[m\]] (\[\e[01;m\]\!\[\e[m\]) | [\[\e[01;32m\] \$DESC\[\e[m\] ]\n\\$ "
# BASH Aliases:
alias l='ls -laskhF'
# Splunk aliases:
alias cds='cd /opt/splunkforwarder/etc'
alias esl='cd /opt/splunkforwarder/etc/system/local'
alias apps='cd /opt/splunkforwarder/etc/apps'
alias dapps='cd /opt/splunkforwarder/etc/deployment-apps'
alias scapps='cd /opt/splunkforwarder/etc/shcluster/apps'
alias master='cd /opt/splunkforwarder/etc/master-apps'
alias slave='cd /opt/splunkforwarder/etc/slave-apps'
alias spown='chown -R splunk:splunk /opt/splunkforwarder'
alias sptail='tail -f /opt/splunkforwarder/var/log/splunk/splunkd.log'
alias crown='chown -R cribl:cribl /opt/cribl'
alias cribl='sudo -u cribl /opt/cribl/bin/cribl'
alias cdc='cd /opt/cribl'
alias splunk='sudo -u splunk /opt/splunkforwarder/bin/splunk'
l
git status
git remote get-url origin
cribl status
cd /opt/cribl
git fetch
eval $(ssh-agent)
ssh -T git@github.com
vim ~/.ssh/config 
ssh -T git@github.com
cd /opt/cribl/.ssh/
l
ll
ls
ls -las
cp cribl_git id_rsa
l
ll
ls
ls -las
alias l='ls -lashk'
l
ssh -T git@github.com
cd ..
l
git fetch
vim .ssh/config 
