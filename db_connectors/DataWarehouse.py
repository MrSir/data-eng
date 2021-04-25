from dotenv import dotenv_values

from db_connectors.DBConnector import DBConnector


class DataWarehouse(DBConnector):
    def __init__(self):
        config = dotenv_values()

        connect_url = 'postgresql://' + config['DW_DB_HOST']
        connect_args = {
            'port': config['DW_DB_PORT'],
            'database': config['DW_DB_DATABASE'],
            'user': config['DW_DB_USER'],
            'password': config['DW_DB_PASSWORD']
        }

        DBConnector.__init__(self, connect_url, connect_args)

    def execute_sql(self, query: str):
        with self.create_engine().connect() as connection:
            connection.execute(query)

    def execute_sql_file(self, path: str):
        with open(path, 'r') as query:
            self.execute_sql(query.read())

    def drop_table(self, table: str):
        self.execute_sql('DROP TABLE IF EXISTS ' + table)
