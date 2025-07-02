# 1. Test static files directly
echo "=== Testing Static Files Directly ==="
curl -s -I https://piggy-plays.netlify.app/gameliftstreams-1.0.0.js | head -n 5
echo "---"
curl -s -I https://piggy-plays.netlify.app/stream.js | head -n 5

# 2. Test if files return HTML instead of JS (redirect issue)
echo -e "\n=== Checking if JS files return HTML ==="
curl -s https://piggy-plays.netlify.app/gameliftstreams-1.0.0.js | head -n 3
echo "---"
curl -s https://piggy-plays.netlify.app/stream.js | head -n 3

# 3. Test with different paths
echo -e "\n=== Testing from /plays/piggy-road context ==="
curl -s -I https://piggy-plays.netlify.app/plays/piggy-road | grep -i location
curl -s https://piggy-plays.netlify.app/plays/piggy-road | grep -i "gameliftstreams-1.0.0.js"

# 4. Check what _redirects is doing
echo -e "\n=== Testing Netlify redirects behavior ==="
curl -s -I https://piggy-plays.netlify.app/_redirects

# 5. Test file existence
echo -e "\n=== Testing file responses ==="
curl -s -o /dev/null -w "gameliftstreams-1.0.0.js: %{http_code} %{content_type}\n" https://piggy-plays.netlify.app/gameliftstreams-1.0.0.js
curl -s -o /dev/null -w "stream.js: %{http_code} %{content_type}\n" https://piggy-plays.netlify.app/stream.js
curl -s -o /dev/null -w "utils.js: %{http_code} %{content_type}\n" https://piggy-plays.netlify.app/utils.js