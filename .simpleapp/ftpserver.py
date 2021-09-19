import os, socket
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

print('WhiteDragon FTP Server')
print('')
def yes_or_no(question):
    reply = str(raw_input(question+'Deseas usar el puerto 8021? (y/n): ')).lower().strip()
    if reply[0] == 'y':
        FTP_PORT = 8021
    if reply[0] == 'n':
        FTP_PORT = raw_input("Escriba el puerto a usar: ")
    else:
        FTP_PORT = 8021

def yes_or_no(question):
    reply = str(raw_input(question+'Deseas usar el directorio standard? (y/n): ')).lower().strip()
    if reply[0] == 'y':
        FTP_DIRECTORY = os.getcwd()
    if reply[0] == 'n':
        FTP_DIRECTORY = raw_input("Escriba el directorio a usar: ")
    else:
        FTP_DIRECTORY = os.getcwd()


FTP_DIRECTORY = os.getcwd()

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
IP = s.getsockname()[0]
s.close()


print(f'DIRECCION: ftp://{IP}:{FTP_PORT}')
print(f'DIRECTORIO RAIZ: {FTP_DIRECTORY}')


authorizer = DummyAuthorizer()
authorizer.add_anonymous(FTP_DIRECTORY, perm='elradfmw')

handler = FTPHandler
handler.authorizer = authorizer
handler.banner = 'Termux FTP Server :D'
handler.passive_ports = range(50000, 55535)

address = ('', FTP_PORT)
server = FTPServer(address, handler)

server.max_cons = 256
server.max_cons_per_ip = 5

server.serve_forever()