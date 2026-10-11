import hashlib
import json
from pathlib import Path, PurePosixPath
import sys
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import install

class InstallerTests(unittest.TestCase):
    def test_os_python_paths(self):
        self.assertEqual(install.python_path('/tmp/amg', 'darwin').parts[-2:], ('bin','python'))
        self.assertEqual(install.python_path('/tmp/amg', 'win32').parts[-2:], ('Scripts','python.exe'))

    def test_mac_configuration(self):
        p=PurePosixPath('/Users/Student Name/AMG_MCP_Class/.venv/bin/python')
        config, toml=install.configurations(p,9987,'darwin')
        self.assertEqual(config['mcpServers']['AMG_MCP']['command'],str(p))
        self.assertIn('disabled_tools = ',toml)
        self.assertIn('td_simulate_key',toml)
        self.assertEqual(config['mcpServers']['AMG_MCP']['env']['TD_MCP_URL'],'http://127.0.0.1:9987/')

    def test_windows_configuration(self):
        _, toml=install.configurations('C:/Users/Student Name/.venv/Scripts/python.exe',9987,'win32')
        self.assertNotIn('disabled_tools',toml)

    def test_package_hashes(self):
        root=Path(__file__).resolve().parents[1]
        for line in (root/'SHA256SUMS').read_text(encoding='utf-8').splitlines():
            expected,name=line.split('  ',1)
            self.assertEqual(hashlib.sha256((root/name).read_bytes()).hexdigest(),expected,name)

if __name__=='__main__': unittest.main()
