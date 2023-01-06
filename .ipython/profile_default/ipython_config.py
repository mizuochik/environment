c = get_config()

c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = [
    '%autoreload 3',
    'import re, os, math, datetime, asyncio, httpx, json, sys'
]
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.colors = 'NoColor'
