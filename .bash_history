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
l
alias l='ls -laskh'
l
l /opt/cribl/.git/refs/remotes/origin/leader.lock
l /opt/cribl/.git/refs/remotes/origin/leader 
l /opt/cribl/.git/refs/remotes/origin
cd /opt/cribl
l
pwd
cat /usr/local/sbin/gitsync.sh 
# Setup variables & functions
HOST='http://localhost:9000'
HOSTURI=$HOST'/api/v1'
# Get token from Cribl
TOKEN=$(curl -ks -X POST "$HOSTURI/auth/login" -H "accept: application/json" -H "Content-Type: application/json" -d "{\"username\":\"admin\",\"password\":\"Farkitall2\"}" | perl -pe 's/.*token":"(.*?)".*/\1/')
TIMESTART=$(date +"%s%3N")
CRIBL_HOME='/opt/cribl'
# Echo funciton
SAY () {   TIMENOW=$(date +"%s%3N");   ET=$((TIMENOW - TIMESTART));   echo -ne $(date +"%FT%T.%3N%z")" : [$ET ms] : $@\n"; }
# Curl GET
CCGET () {   curl -ks -X GET "$HOSTURI/$1" -H "accept: application/json" -H "Authorization: Bearer $TOKEN"; }
# Curl POST
CCPOST () {   curl -ks -X POST "$HOSTURI/$1" -H "accept: application/json" -H "Authorization: Bearer $TOKEN"; }
# Check current state (primary or standby)
SAY "INFO: Checking state of current host"
STATE="STANDBY"
#FMDNS=$(dig acpt-lnm-leader-01.cribl.acpt-lnm.aws.fanniemae.com +answer | egrep "^[^;].*IN\s+A\s+" | awk '{print $5;}')
#FMDNS=$(dig www.msn.com +answer | egrep "^[^;].*IN\s+A\s+" | awk '{print $5;}')
FMDNS=$(dig localhost +answer | egrep "^[^;].*IN\s+A\s+" | awk '{print $5;}')
SAY "INFO: FMDNS = $FMDNS"
IFLIST=$(ip a | grep "inet " | perl -pe 's/.*inet\s+(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\/.*/\1/')
IFS=$'\n'
for i in $IFLIST; do   if [[ $FMDNS == $i ]];   then     STATE="ACTIVE";   fi; done
SAY "INFO: Current state is - $STATE"
# Check that we have a valid token
if [ $(echo $TOKEN | egrep -c "^eyJ") -eq 0 ]; then
  SAY "ERROR: Unable to retrieve valid TOKEN ($TOKEN)";   exit 1; fi
# Check that Git remote is set up
cd /opt/cribl
if [ $(git remote get-url --push origin 2>&1 | grep -c 'No such remote') -gt 0 ]; then
  SAY "ERROR: No remote Git repository found";   exit 2; fi
### ACTIVE LEADER - PUSH CONFIG & STATE
  SAY "INFO: MODE = $STATE, pushing configs to remote repository"
# Get commit status
  RESULT=$(CCGET version/status)
  SAY "INFO: [CONFIGS] Commit Status: $RESULT"
# If there are commits waiting, send commit
  if [ $(echo $RESULT | wc -c) -ne 131 ];   then     SAY "INFO: [CONFIGS] Committing changes.";     RESULT=$(CCPOST version/commit);   fi
# Push to remote repo
  SAY "INFO: [CONFIGS] Pushing configs to Git remote repo"
  RESULT=$(CCPOST version/push)
  SAY "INFO: [CONFIGS] Git push results: $RESULT"
  SAY "INFO: [CONFIGS] Done with push"
cat /usr/local/sbin/gitsync.sh 
git remote get-url origin
git remote get-url origin
history | grep "remote add"
l
pwd
l
ll
ls -lash
source .bash
source .bashrc 
l
bash -l
