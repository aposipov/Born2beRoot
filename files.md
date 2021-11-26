# files for edit

`/etc/ssh/sshd_config`  
Port 4242  
PermitRootLogin: no  
  
`/etc/sudoers`  
Defaults  badpass_message="Your phrase"  
Defaults  passwd_tries=3  
Defaults  logfile=/var/log/sudo/sudo.log  
Defaults  log_input,log_output  
Defaults  iolog_dir="/var/log/sudo/"  
Defaults  requiretty  

`/etc/login.defs`  
PASS_MAX_DAYS 30  
PASS_MIN_DAYS 2  
PASS_WARN_AGE 7  
  
`/etc/pam.d/common-password`  
password        requisite	pam_pwquality.so retry=3 maxrepeat=3 minlen=10 dcredit=-1 ucredit=-1 difok=7 usercheck=1
password        requisite	pam_pwquality.so retry=3 maxrepeat=3 minlen=10 dcredit=-1 ucredit=-1 usercheck=1 enforce_for_root  
  
`/etc/systemd/logind.conf`
???  
NAutoVTs=8  
ReserveVT=8  

# hostname
`/etc/hostname`  
`/etc/hosts`  
