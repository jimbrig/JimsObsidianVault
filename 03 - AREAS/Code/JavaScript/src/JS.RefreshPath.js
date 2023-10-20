const cp = require('child_process');
const path = require('path');

const refreshPathVariable = () => {
  if (process.platform === 'win32') {
    const file = path.resolve(__dirname, 'lib/GetPath.bat');
    const output = cp.execFileSync(file);
    const pathOut = output.toString();
    process.env.PATH = pathOut;
  }
};

module.exports = {
  refreshPathVariable,
};
