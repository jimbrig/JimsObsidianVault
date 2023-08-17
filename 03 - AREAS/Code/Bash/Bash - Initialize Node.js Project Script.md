```bash
function init-project-nodejs {
	git init
	npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
	npx gitignore node
	npx covgen "$(npm get init.author.email)"
    npm init -y
    git add -A
    git commit -m "chore: Initialize Project"
	# gh repo create --source=. --public
}
```