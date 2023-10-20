const fs = require('fs');
const os = require('os');
const path = require('path');
const { color } = require('./JS.Logging');

function resolvePath(p) {
  if (path.isAbsolute(p)) return p;
  if (p.startsWith('~/')) return path.resolve(os.homedir(), p.substr(2));
  return path.resolve(process.cwd(), p);
}

function ensureDir(dir) {
  dir = resolvePath(dir);
  if (!fs.existsSync(dir)) {
    console.log(`Creating ${color.path(dir)}`);
    fs.mkdirSync(dir, { recursive: true });
  }
}

module.exports = {
  resolvePath,
  ensureDir,
};
