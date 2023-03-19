mkdir -p /etc/ssh-telegram-alert
cp scripts/telegram.sh  /etc/ssh-telegram-alert/telegram.sh
echo "session optional pam_exec.so type=open_session seteuid /etc/ssh-telegram-alert/telegram.sh" >>  "/etc/pam.d/sshd