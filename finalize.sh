ssh -o StrictHostKeyChecking=no 159.203.108.25 certbot certonly --standalone -d redteam.me --register-unsafely-without-email --agree-tos
ssh -o StrictHostKeyChecking=no 159.203.108.25 cat /root/dkim.txt
rm finalize.sh
ssh -o StrictHostKeyChecking=no 138.197.100.148 certbot certonly --standalone -d redteam.me --register-unsafely-without-email --agree-tos
ssh -o StrictHostKeyChecking=no 138.197.100.148 cat /root/dkim.txt
rm finalize.sh
