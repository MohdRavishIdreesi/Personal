=========================================
JENKINS INSTALLATION ON UBUNTU / WSL - ALL COMMANDS
=========================================

1. Update System
-----------------------------------------
sudo apt update
sudo apt upgrade -y


2. Install Java (Required for Jenkins)
-----------------------------------------
sudo apt install fontconfig openjdk-21-jre -y


3. Verify Java Installation
-----------------------------------------
java -version


7. Install Jenkins
-----------------------------------------
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y


8. Start Jenkins Service
-----------------------------------------
sudo systemctl start jenkins


9. Enable Jenkins at Boot
-----------------------------------------
sudo systemctl enable jenkins


10. Check Jenkins Status
-----------------------------------------
sudo systemctl status jenkins


11. Open Jenkins Port (If Firewall Enabled)
-----------------------------------------
sudo ufw allow 8080
sudo ufw reload


12. Get Initial Admin Password
-----------------------------------------
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


13. Open Jenkins in Browser
-----------------------------------------
http://localhost:8080


14. Restart Jenkins
-----------------------------------------
sudo systemctl restart jenkins


15. Stop Jenkins
-----------------------------------------
sudo systemctl stop jenkins


16. Check Jenkins Version
-----------------------------------------
jenkins --version


17. Jenkins Logs
-----------------------------------------
sudo journalctl -u jenkins


18. Uninstall Jenkins (Optional)
-----------------------------------------
sudo apt remove jenkins -y

=========================================
END
=========================================


# default path of the jenkins home 
JENKINS_HOME=/var/lib/jenkins

# default path of the jenkins workspace
WORKSPACE=/var/lib/jenkins/workspace

