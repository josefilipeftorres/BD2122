import warnings
warnings.filterwarnings("ignore", category=FutureWarning)
from flask import abort, render_template, Flask
import logging
import db

APP = Flask(__name__)

# Start page
@APP.route('/')
def index():
    stats = {}
    x = db.execute('SELECT COUNT(*) AS clients FROM CLIENTE').fetchone()
    stats.update(x)
    x = db.execute('SELECT COUNT(*) AS staff FROM FUNCIONARIO').fetchone()
    stats.update(x)
    x = db.execute('SELECT COUNT(*) AS gyms FROM ESPACO').fetchone()
    stats.update(x)
    x = db.execute('SELECT COUNT(*) AS suppliers FROM FORNECEDOR').fetchone()
    stats.update(x)
    logging.info(stats)
    return render_template('index.html',stats=stats)

# Initialize db
# It assumes a script called db.sql is stored in the sql folder
@APP.route('/init/')
def init():
    return render_template('init.html', init=db.init())

# Clientes
@APP.route('/clients/')
def list_clients():
    clients = db.execute(
        '''
        SELECT Codigo, Nome, COUNT(*) AS Gyms_attended
        FROM CLIENTE JOIN FREQUENTA ON (CLIENTE.Codigo = FREQUENTA.Cliente)
        GROUP BY Codigo, Nome
        ORDER BY Nome
        ''').fetchall()
    return render_template('clients-list.html', clients=clients) 

@APP.route('/clients/<int:id>/')
def get_client(id):
    client = db.execute(
        '''
        SELECT Codigo, Nome, Plano, DataNasc, Email, Treinador, Nutricionista
        FROM CLIENTE
        WHERE Codigo = %s
        ''', id).fetchone()
    
    if client is None:
        abort(404, 'Client id {} does not exits.'.format(id))
    
    coach={}
    if not (client['Treinador'] is None):
        coach = db.execute(
        '''
        SELECT Nome
        FROM FUNCIONARIO
        WHERE CodigoFunc = %s
        ''', client['Treinador']).fetchone()
    
    nutritionist={}
    if not (client['Nutricionista'] is None):
        nutritionist = db.execute(
        '''
        SELECT Nome
        FROM FUNCIONARIO
        WHERE CodigoFunc = %s
        ''', client['Nutricionista']).fetchone()
    
    return render_template('client.html', 
                client=client, coach=coach, nutritionist=nutritionist)

@APP.route('/clients/search/<expr>/')
def seach_client(expr):
    search = { 'expr': expr }
    expr = '%' + expr + '%'
    clients = db.execute(
      ''' 
      SELECT Codigo, Nome
      FROM CLIENTE 
      WHERE Nome LIKE %s
      ''', expr).fetchall()
    
    return render_template('client-search.html',
           search=search,clients=clients)

# Funcionarios
@APP.route('/staff/')
def list_staff():
    staff = db.execute(
        '''
        SELECT CodigoFunc, Cargo, Nome, Salario, DataNasc, Email
        FROM FUNCIONARIO
        ORDER BY Nome
        ''').fetchall()
    return render_template('staff-list.html', staff=staff)

@APP.route('/staff/<int:id>/')
def get_staff(id):
    staff = db.execute(
        '''
        SELECT CodigoFunc, Cargo, Nome, Salario, DataNasc, Email, Espaco, N.Num
        FROM FUNCIONARIO F JOIN NUM_TELEF_FUNCIONARIO N ON (F.CodigoFunc = N.Funcionario)
        WHERE CodigoFunc = %s
        ''', id).fetchone()
    
    if staff is None:
        abort(404, 'Staff id {} does not exits.'.format(id))

    
    gym ={}
    if not (staff['Espaco'] is None):
        gym = db.execute(
        '''
        SELECT Nome
        FROM ESPACO
        WHERE CodEspaco = %s
        ''', staff['Espaco']).fetchone()

    customersT = []
    customersT = db.execute(
        '''
        SELECT Codigo, Nome 
        FROM CLIENTE
        WHERE Treinador = %s
        ORDER BY Nome
        ''', id).fetchall()

    customersN = []
    customersN = db.execute(
        '''
        SELECT Codigo, Nome 
        FROM CLIENTE
        WHERE Nutricionista = %s
        ORDER BY Nome
        ''', id).fetchall()

    return render_template('staff.html', staff=staff, gym=gym, customersT=customersT, customersN=customersN)

@APP.route('/staff/search/<expr>/')
def search_staff(expr):
    search = { 'expr': expr }
    expr = '%' + expr + '%'
    staff = db.execute(
        ''' 
        SELECT CodigoFunc, Nome
        FROM FUNCIONARIO 
        WHERE Nome LIKE %s
        ''', expr).fetchall()

    return render_template('staff-search.html', search=search, staff=staff)

# Espaços
@APP.route('/gyms/')
def list_gyms():
    gyms = db.execute(
        '''
        SELECT E.CodEspaco, E.Nome, F.Nome AS FuncNome, N.Num FROM ESPACO E 
        JOIN FUNCIONARIO F ON (E.Gestor = F.CodigoFunc) 
        JOIN NUM_TELEF_FUNCIONARIO N ON (F.CodigoFunc = N.Funcionario) 
        ORDER BY E.CodEspaco;
        ''').fetchall()
    return render_template('gyms-list.html', gyms=gyms)

@APP.route('/gyms/<int:id>/')
def get_gym(id):
    gym = db.execute(
        '''
        SELECT CodEspaco, Nome, MRua, MNum, MCodPostal, MLocalidade, Gestor
        FROM ESPACO
        WHERE CodEspaco = %s
        ''', id).fetchone()
    
    if gym is None:
        abort(404, 'Gym {} does not exits.'.format(id))
    
    manager={}
    if not (gym['Gestor'] is None):
        manager = db.execute(
        '''
        SELECT Nome
        FROM FUNCIONARIO
        WHERE CodigoFunc = %s
        ''', gym['Gestor']).fetchone()
    
    staff = []
    staff = db.execute(
        '''
        SELECT CodigoFunc, Nome
        FROM FUNCIONARIO
        WHERE Espaco = %s
        ORDER BY Nome
        ''', id).fetchall()
    
    return render_template('gym.html', gym=gym, manager=manager, staff=staff)

# Fornecedores
@APP.route('/suppliers/')
def list_supplier():
    suppliers = db.execute(
        '''
        SELECT Fornecedor, COUNT(Fornecedor) AS N
        FROM FORNECE
        GROUP BY Fornecedor
        ORDER BY Fornecedor
        ''').fetchall()
    return render_template('suppliers-list.html', suppliers=suppliers)
