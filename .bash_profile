#
# ~/.profile
#

# Load environment variables
export $(envsubst < .env)

export PATH="/home/benito/.local/bin:$PATH"

