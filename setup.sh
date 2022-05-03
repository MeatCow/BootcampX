# Regenerates the database
cat migrations/* seeds/* | sudo -u postgres psql -d bootcampx -1 -f -