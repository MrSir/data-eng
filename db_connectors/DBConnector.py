import pandas as pd
from sqlalchemy import create_engine


class DBConnector:
    """
    DBConnector - a helper class that will establish the connection to a given database and expose methods that will
    allow for the execution of queries on that database
    Attributes
    ----------
    connect_url : str
        The connection url that would be passed to SQL Alchemy's create_engine() method in order to establish the
        connection
    connect_args : dict
        The dictionary with additional connection variables for more explicit parameter setting
    Methods
    -------
    create_engine()
        Creates an SQL Alchemy connection and returns it
    read_sql(query: str)
        Executes the provided query and returns the results as a pandas DataFrame.
    read_sql_file(path: str)
        Reads the query from the provided file and executes it. Then returns the result as a pandas DataFrame
    """

    def __init__(self, connect_url: str, connect_args: dict):
        self.connect_url = connect_url
        self.connect_args = connect_args

    def create_engine(self):
        return create_engine(self.connect_url, connect_args=self.connect_args)

    def read_sql(self, query: str) -> pd.DataFrame:
        engine = self.create_engine()
        results = pd.read_sql(query, engine)

        return results

    def read_sql_file(self, path: str) -> pd.DataFrame:
        with open(path, 'r') as file:
            return self.read_sql(file.read())